<!-- markdownlint-disable MD033 MD041 -->
<!-- Compact corner glyph; theme-aware via <picture>. Judge on github.com. -->
<picture>
  <source media="(prefers-color-scheme: dark)"
          srcset="../assets/AOM-glyph-on-dark.png">
  <img align="right" width="96" alt="The Agentic Operating Model glyph"
       src="../assets/AOM-glyph-on-light.png">
</picture>
<!-- markdownlint-enable MD033 -->

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
- **demo-mcp-server.md** — Live MCP-server demo; two protocol-identical implementations under `mcp-demo-server/` (Node) and `mcp-demo-server-ps/` (PowerShell) (M4 / M8)
- **demo-ops-kerberos-lab.md** — Agentic operations against a live AutomatedLab + Hyper-V environment, with `ad-troubleshooting-lab/` deploy/break/fix scripts (M12)

### materials/
Handouts and reference materials for attendees.
- Quick reference cheat sheet
- Sample copilot instruction file templates
- Sample custom agent files
- Sample skill file
- **memory-bank-template/** — reusable Memory Bank scaffold to drop into any project (the same pattern this repo uses)
- **agentic-knowledge-work-patterns.md** — ten patterns extracted from a real multi-year tax case, applicable to legal, tax, consulting, research, and ops work
- **destructive-operations-guardrails.md** — take-home reference distilled from real 2026 incidents (PocketOS / Cursor / Claude / Railway, Replit) with a **six-layer defence-in-depth model** — layers 1–5 cover agent policy, tool approval, credential scope, backup independence, and rehearsed recovery; **Layer 6 covers architectural guardrails (GitOps + IaC)** with [DSC Community DscWorkshop](https://github.com/dsccommunity/DscWorkshop) (Datum + Sampler + DSC) as the canonical reference and Argo CD / Flux / Atlantis / Terraform Cloud / Bicep deployment stacks as same-shape patterns. Includes a pre-flight checklist for any agent with destructive capabilities
- Take-home resources

## Content Status

| Module | Topic | Status |
|--------|-------|--------|
| 01 | The AI Coding Revolution | ✅ Complete |
| 02 | What Makes Work Agentic | ✅ Complete |
| 03 | The Power of Context | ✅ Complete |
| 04 | Controlling AI Behavior | ✅ Complete |
| 05 | Self-Verification | ✅ Complete |
| 06 | *(reserved for future expansion)* | — |
| 07 | *(reserved for future expansion)* | — |
| 08 | Advanced Capabilities | ✅ Complete |
| 09 | When to Use (and When Not To) | ✅ Complete |
| 10 | Your Agentic Future | ✅ Complete |
| 11 | Beyond Code *(optional track)* | ✅ Complete |
| 12 | The Lab as the Agent's Sandbox *(optional track)* | ✅ Complete |