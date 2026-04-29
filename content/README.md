# Content

This folder contains all presentation content, demos, and supporting materials.

## Subfolders

### slides/
Detailed presenter content with speaker notes, diagrams, and expanded explanations.
- Numbered by module sequence (01, 02, 03, etc.)
- Each file contains a **Version Guide** table at the top showing which slides to present for each version (1h, 2h, 4h)
- Use as **reference during presentation**

### pptx/
MARP-formatted slides ready for PowerPoint conversion.
- Condensed content suitable for projection
- What **audience sees on screen**
- See [README-how-to-create-pptx.md](pptx/README-how-to-create-pptx.md) for conversion instructions

### demos/
Live demonstration scripts and instructions.
- Step-by-step demo guidance
- Troubleshooting tips
- Fallback options if demos fail
- **demo-script-main.md** — Primary end-to-end agentic workflow demo
- **demo-prompt-evolution.md** — Six-level prompt quality progression demo
- **demo-corpus-analysis.md** — Synthetic 17-minute knowledge-work demo (M11)
- **demo-tax-case-study.md** — Anonymised real multi-year German tax case; full-scale companion to the corpus demo (M11, hand-out variant for non-technical audiences)

### materials/
Handouts and reference materials for attendees.
- Quick reference cheat sheet
- Sample copilot instruction file templates
- Sample custom agent files
- Sample skill file
- **agentic-knowledge-work-patterns.md** — ten patterns extracted from a real multi-year tax case, applicable to legal, tax, consulting, research, and ops work
- **destructive-operations-guardrails.md** — take-home reference distilled from real 2026 incidents (PocketOS / Cursor / Claude / Railway, Replit) with a **six-layer defence-in-depth model** — layers 1–5 cover agent policy, tool approval, credential scope, backup independence, and rehearsed recovery; **Layer 6 covers architectural guardrails (GitOps + IaC)** with [DSC Community DscWorkshop](https://github.com/dsccommunity/DscWorkshop) (Datum + Sampler + DSC) as the canonical reference and Argo CD / Flux / Atlantis / Terraform Cloud / Bicep deployment stacks as same-shape patterns. Includes a pre-flight checklist for any agent with destructive capabilities
- Take-home resources

## Content Status

| Module | Topic | Status |
|--------|-------|--------|
| 01 | AI Coding Revolution | ✅ Complete |
| 02 | What Makes Coding Agentic | ✅ Complete |
| 03 | Power of Context | ✅ Complete |
| 04 | Controlling AI Behavior | ✅ Complete |
| 05 | Self-Verification | ✅ Complete |
| 06 | Copilot Agent Mode Overview | ⏳ Optional |
| 07 | Live Demo | ✅ Demo script ready |
| 08 | Advanced Capabilities | ✅ Complete |
| 09 | When to Use | ✅ Complete |
| 10 | Your Agentic Future | ✅ Complete |