# How to Convert to PowerPoint

## Option 1: MARP (Recommended) 

The file `agentic-coding-presentation.md` is in MARP format - the easiest way to create PowerPoint from Markdown.

### Using MARP CLI

```bash
# Install MARP CLI
npm install -g @marp-team/marp-cli

# Convert to PowerPoint
marp agentic-coding-presentation.md --pptx -o agentic-coding.pptx

# Or convert to PDF
marp agentic-coding-presentation.md --pdf -o agentic-coding.pdf
```

### Using MARP VS Code Extension

1. Install "Marp for VS Code" extension
2. Open `agentic-coding-presentation.md`
3. Click the Marp icon in the editor
4. Select "Export Slide Deck" → Choose PPTX

---

## Option 2: Pandoc

```bash
# Install Pandoc (if not installed)
# Windows: choco install pandoc
# Mac: brew install pandoc

# Convert markdown to PPTX
pandoc agentic-coding-presentation.md -o agentic-coding.pptx
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
marp agentic-coding-presentation.md --pptx -o agentic-coding.pptx

# MARP to PDF  
marp agentic-coding-presentation.md --pdf -o agentic-coding.pdf

# MARP to HTML (for browser presentation)
marp agentic-coding-presentation.md -o agentic-coding.html
