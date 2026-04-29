#!/usr/bin/env node
// overflow-check.mjs
// Detects content overflow in a Marp-rendered HTML file using Puppeteer.
//
// Usage:
//   node overflow-check.mjs <marp-html-file> [--json]
//
// Marp wraps each slide in <svg data-marpit-svg viewBox="0 0 W H"> with a
// <foreignObject> containing the <section>. If section.scrollHeight exceeds
// the viewBox height, the content is silently clipped in PPTX/PDF/PNG output.
//
// Output (default): pretty text report on stdout.
// Output (--json): JSON array on stdout (one entry per slide).
// Exit code: 0 = no overflow; 1 = at least one slide overflows; 2 = error.

import { resolve } from 'node:path';
import { existsSync } from 'node:fs';
import { pathToFileURL } from 'node:url';

const args = process.argv.slice(2);
if (args.length < 1) {
    console.error('Usage: node overflow-check.mjs <marp-html-file> [--json]');
    process.exit(2);
}

const jsonMode = args.includes('--json');
const htmlArg = args.find(a => !a.startsWith('--'));
const htmlPath = resolve(htmlArg);

if (!existsSync(htmlPath)) {
    console.error(`File not found: ${htmlPath}`);
    process.exit(2);
}

let puppeteer;
try {
    puppeteer = (await import('puppeteer')).default;
} catch (err) {
    console.error('puppeteer is not installed. Run: npm install (in the pptx folder)');
    console.error(err.message);
    process.exit(2);
}

const browser = await puppeteer.launch({
    headless: 'new',
    args: ['--no-sandbox', '--disable-setuid-sandbox', '--allow-file-access-from-files']
});

let exitCode = 0;
try {
    const page = await browser.newPage();
    await page.setViewport({ width: 1600, height: 900, deviceScaleFactor: 1 });
    await page.goto(pathToFileURL(htmlPath).href, { waitUntil: 'networkidle0', timeout: 60_000 });

    // Give web fonts and Marp's own layout a moment to settle.
    await page.evaluate(async () => {
        if (document.fonts && document.fonts.ready) {
            await document.fonts.ready;
        }
    });

    const results = await page.evaluate(() => {
        const sections = Array.from(document.querySelectorAll('section'));
        return sections.map((section, idx) => {
            const svg = section.closest('svg[data-marpit-svg]');
            let frameWidth = 1280;
            let frameHeight = 720;
            if (svg) {
                const vb = svg.getAttribute('viewBox');
                if (vb) {
                    const parts = vb.split(/\s+/).map(Number);
                    if (parts.length === 4) {
                        frameWidth = parts[2];
                        frameHeight = parts[3];
                    }
                }
            }

            // scrollHeight measures full content, including overflow that is
            // clipped by overflow:hidden. clientHeight is the visible area.
            const contentHeight = section.scrollHeight;
            const contentWidth = section.scrollWidth;
            const overflowY = Math.max(0, contentHeight - frameHeight);
            const overflowX = Math.max(0, contentWidth - frameWidth);

            const titleEl = section.querySelector('h1, h2, h3');
            const title = titleEl ? titleEl.textContent.replace(/\s+/g, ' ').trim() : '';

            return {
                slide: idx + 1,
                title,
                frameWidth,
                frameHeight,
                contentWidth,
                contentHeight,
                overflowX,
                overflowY,
                fillRatio: Number((contentHeight / frameHeight).toFixed(3)),
                overflows: overflowX > 1 || overflowY > 1
            };
        });
    });

    const overflowing = results.filter(r => r.overflows);
    if (overflowing.length > 0) {
        exitCode = 1;
    }

    if (jsonMode) {
        process.stdout.write(JSON.stringify(results, null, 2));
    } else {
        const ok = results.length - overflowing.length;
        console.log(`Checked ${results.length} slides: ${ok} fit, ${overflowing.length} overflow`);
        if (overflowing.length > 0) {
            console.log('');
            for (const o of overflowing) {
                const titlePart = o.title ? ` — "${o.title}"` : '';
                console.log(`  Slide ${o.slide}${titlePart}`);
                console.log(`      frame: ${o.frameWidth}x${o.frameHeight}, content: ${o.contentWidth}x${o.contentHeight}, overflow: y=${o.overflowY}px, x=${o.overflowX}px (fill=${o.fillRatio})`);
            }
        }
    }
} catch (err) {
    console.error('Overflow check failed:', err.message);
    exitCode = 2;
} finally {
    await browser.close();
}

process.exit(exitCode);