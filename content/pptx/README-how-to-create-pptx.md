# How to Convert to PowerPoint

## Step 1: Generate Version-Specific MARP Files

The presentation comes in three versions, all generated from a single source file.

```powershell
# Generate all three versions
.\Build-MarpVersions.ps1

# Or generate a specific version
.\Build-MarpVersions.ps1 -Version 1h
.\Build-MarpVersions.ps1 -Version 2h
.\Build-MarpVersions.ps1 -Version 4h
```

This produces:

| Output File | Version | Slides |
|-------------|---------|--------|
| `marp-1h-keynote.md` | 1-hour keynote | ~25 slides |
| `marp-2h-standard.md` | 2-hour standard | ~45 slides |
| `marp-4h-workshop.md` | 4-hour workshop | ~81 slides (all) |

> **Source file**: `../slides/marp-presentation.md` — edit only this file.
> Each slide has a `<!-- version: 1h 2h 4h -->` tag controlling which versions include it.
> The generated files have these tags stripped — they're clean MARP ready for projection.

## Step 2: Convert to PowerPoint (MARP)

### Using the Export Script (Recommended)

The `Export-MarpToPptx.ps1` script handles the full workflow: builds version files,
fixes emoji rendering issues (Twemoji CDN images break in offline PPTX export),
and runs Marp CLI.

```powershell
# Prerequisites: install Marp CLI
npm install -g @marp-team/marp-cli

# Export all versions to PPTX
.\Export-MarpToPptx.ps1

# Export a specific version
.\Export-MarpToPptx.ps1 -Version 2h

# Export to PDF instead
.\Export-MarpToPptx.ps1 -Pdf

# Skip rebuilding version files (if already up to date)
.\Export-MarpToPptx.ps1 -SkipBuild
```

> **Emoji fix**: Marp converts Unicode emoji (❌ ✅ ⚠️) to Twemoji `<img>` tags
> that reference a CDN. During PPTX export, Chromium renders slides offline and
> these remote images break. The script replaces emoji with styled HTML `<span>`
> elements using non-emoji Unicode characters (✗ ✓ ⚠) — only outside code blocks.

### Using MARP CLI Directly

```bash
# Install MARP CLI
npm install -g @marp-team/marp-cli

# Convert the version you need (emoji may appear broken — use the script above)
marp marp-2h-standard.md --html --pptx -o agentic-operating-model-2h.pptx

# Or convert to PDF
marp marp-2h-standard.md --html --pdf -o agentic-operating-model-2h.pdf

# Convert all three at once
marp marp-1h-keynote.md --html --pptx -o agentic-operating-model-1h.pptx
marp marp-2h-standard.md --html --pptx -o agentic-operating-model-2h.pptx
marp marp-4h-workshop.md --html --pptx -o agentic-operating-model-4h.pptx
```

### Using MARP VS Code Extension

1. Install "Marp for VS Code" extension
2. Open the version-specific file (e.g., `marp-2h-standard.md`)
3. Click the Marp icon in the editor
4. Select "Export Slide Deck" → Choose PPTX

---

## Step 3: Detect Slide Overflow (recommended after edits)

Marp **silently clips** any content that does not fit inside the 1280x720 slide
frame. Tables, code blocks, and long paragraphs can disappear without any
warning in the PPTX, PDF, or PNG output. To catch this before publishing:

```powershell
# Quickest: just check overflow on the current md sources
.\Test-SlideOverflow.ps1 -Version 4h -SkipBuild

# Full workflow: rebuild version files, then check
.\Test-SlideOverflow.ps1 -Version all

# Generate an HTML side-by-side review report (source markdown <-> rendered slide)
.\Test-SlideOverflow.ps1 -Version 4h -SkipBuild -Report

# Or chain everything into the build
.\Build-MarpVersions.ps1 -CheckOverflow
.\Build-MarpVersions.ps1 -Report                # implies -CheckOverflow + PNG export
```

**How it works:**

1. Marp CLI renders the deck to a single HTML file (each slide is an `<svg
   data-marpit-svg viewBox="0 0 1280 720">` containing a `<section>`).
2. A small Node helper (`overflow-check.mjs`) loads the HTML in headless
   Chromium via Puppeteer and compares each section's `scrollHeight` to the
   viewBox height. Anything taller is being clipped.
3. The script reports per-slide overflow in pixels and exits with code `1` if
   any slide overflows — useful as a pre-commit / CI gate.
4. With `-Report`, an HTML file `slide-review-<ver>.html` is produced that
   shows, for every slide, the source markdown next to the rendered PNG with
   an OVERFLOW / fits badge. Open it in a browser and scroll through; the
   sticky toolbar links jump straight to the offending slides.

**First run only**: `Test-SlideOverflow.ps1` runs `npm install` in this folder
to pull Puppeteer (downloads ~150 MB Chromium). Subsequent runs are fast.
The `node_modules/` folder and `_overflow_*.html` / `slide-review-*.html`
artifacts are gitignored.

**Fixing overflow:**

| Severity (`fillRatio`) | Suggested fix |
|------------------------|---------------|
| 1.00–1.05 | Add `<!-- _class: dense -->` at the top of the slide (smaller font) |
| 1.05–1.20 | Trim 1–2 list items, shorten code block, or split into two slides |
| > 1.20 | Split the slide; the content is meaningfully larger than one frame |

The `dense` class is defined in the source frontmatter at
`../slides/marp-presentation.md` (look for `section.dense { font-size: 20px; ... }`).

---

## Option 2: Pandoc

```bash
# Install Pandoc (if not installed)
# Windows: choco install pandoc
# Mac: brew install pandoc

# Convert markdown to PPTX
pandoc agentic-operating-model-presentation.md -o agentic-operating-model.pptx
```

---

## Option 3: Manual in PowerPoint

1. Open PowerPoint
2. Create new presentation
3. Use the markdown content as guide
4. Copy text slide-by-slide
5. Each `---` in the markdown = new slide

---

## Option 4: Google Slides

1. Go to Google Slides
2. Create new presentation
3. Use markdown as content guide
4. Download as .pptx when done

---

## Option 5: Online Converters

- **Slidev**: https://sli.dev (modern alternative)
- **reveal.js**: Can export to PDF
- **Canva**: Import text, apply templates

---

## Slide Structure

The MARP file contains **25 slides**:

| # | Topic |
|---|-------|
| 1 | Title slide |
| 2 | Audience poll |
| 3 | AI evolution (3 waves) |
| 4 | Why agentic coding is possible |
| 5 | Today's journey overview |
| 6 | What is an agent |
| 7 | Traditional vs Agentic AI |
| 8 | The Agentic Loop |
| 9 | Your role changes |
| 10 | Why Git matters |
| 11 | Git provides context + traceability |
| 12 | Instruction files (copilot-instructions.md) |
| 13 | Before/after copilot-instructions.md |
| 14 | Self-verification |
| 15 | When to use agentic coding |
| 16 | Decision framework |
| 17 | Human role remains |
| 18 | Key takeaways |
| 19 | MCP — Universal Connector |
| 20 | Checkpoints & Rollback |
| 21 | Agent Types |
| 22 | Getting started |
| 23 | You + AI equation |
| 24 | Thank you |
| 25 | Questions |

---

## Customization Tips

After converting to PPTX:

1. **Apply your company template** - Slide Master in PowerPoint
2. **Add your logo** - Insert on Slide Master for all slides
3. **Update colors** - Match your brand
4. **Add speaker notes** - Reference the detailed markdown files in `content/slides/`
5. **Insert diagrams** - The ASCII diagrams can be replaced with proper graphics
6. **Add transitions** - Subtle fade transitions work well

---

## For Live Demo Slides

During the live demo portions, you can:
- Show VS Code directly (no slide needed)
- Use a "DEMO" title slide to transition
- Or split screen: slides + VS Code

---

## Quick Commands

```bash
# MARP to PPTX
marp agentic-operating-model-presentation.md --pptx -o agentic-operating-model.pptx

# MARP to PDF  
marp agentic-operating-model-presentation.md --pdf -o agentic-operating-model.pdf

# MARP to HTML (for browser presentation)
marp agentic-operating-model-presentation.md -o agentic-operating-model.html
