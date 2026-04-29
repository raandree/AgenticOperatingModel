# The Agentic Operating Model *(Code, Operations, Research, and Correspondence)*

A presentation/workshop on **agentic knowledge work** — for developers, DevOps engineers, system engineers, and research/analyst-style knowledge workers.
Available in three versions: **1-hour keynote**, **2-hour standard**, and **4-hour workshop** — all sharing the same module content.

## Overview

Learn how AI agents go beyond code suggestions to autonomously write, test, and iterate on artefacts — and how the **same operating model** applies to infrastructure runbooks, incident analyses, research synthesis, and legal/business correspondence.

> **This is not a PowerShell training. It is not even a coding training. It is a training about a new working model — versioned, agent-assisted knowledge work — that applies to code, infrastructure, research, and legal/business work alike. Coding is one instance of the pattern, not the pattern itself.**

## Three-Version Architecture

| Version | Duration | Slides | Slide deck (PPTX) | Best For |
|---------|----------|-------:|-------------------|----------|
| **1h Keynote** | 60 min | 28 | [agentic-operating-model-1h.pptx](content/pptx/agentic-operating-model-1h.pptx) | Conference talks, meetups, lunch & learns |
| **2h Standard** | 120 min | 65 | [agentic-operating-model-2h.pptx](content/pptx/agentic-operating-model-2h.pptx) | Team briefings, customer presentations |
| **4h Workshop** | ~4.5h | 120 | [agentic-operating-model-4h.pptx](content/pptx/agentic-operating-model-4h.pptx) | Practitioner deep dives, hands-on workshops |

All versions share a single set of module content. See the [presentation agenda](agenda/presentation-agenda.md) for the full version matrix and slide inclusion guide.

> 📥 **Just want to present?** Download the PPTX for your slot length above and open it in PowerPoint — no build step required. To customize, edit the source under [content/slides/](content/slides/) and re-run [content/pptx/Build-MarpVersions.ps1](content/pptx/Build-MarpVersions.ps1) with `-ExportPptx`.

## Key Topics

1. **What Makes Coding Agentic** - Understanding the agentic loop
2. **The Power of Context** - Why Git matters for AI
3. **Controlling AI Behavior** - Instruction files, custom agents, skills
4. **Self-Verification** - AI that tests its own code
5. **Advanced Capabilities** - MCP, checkpoints, agent types
6. **Practical Application** - Live demos with Copilot Agent Mode
7. **Agentic Work Beyond Code** *(M11, optional)* - Same loop, different deliverable
8. **The Lab as the Agent's Sandbox** *(M12, optional)* - AutomatedLab + Hyper-V for safe agentic operations

## Target Audience

This training addresses four overlapping profiles:

| Profile | Primary deliverable | Training hook |
|---------|---------------------|---------------|
| **Developer** | Code | "AI that codes" |
| **DevOps / SRE** | Pipelines, IaC, runbooks | "AI that operates" |
| **System engineer** | Configuration, validation, evidence | "AI that tests on real OS — in a lab" |
| **Research / knowledge worker** | Documents, analyses, correspondence | "AI that reasons over your corpus — with a diff" |

All four share the same core modules (M01–M10). The system-engineer and knowledge-worker tracks add **M11 + M12** and two dedicated demos. See [agenda/presentation-agenda.md](agenda/presentation-agenda.md#audience-profiles).

> **Note on numbering**: Slide files are numbered 01, 02, 03, 04, 05, 08, 09, 10, 11, 12 (M06 and M07 are reserved slots for future expansion). The 10 core modules are M01–M05 + M08–M10.

## Quick Start

1. Review the [presentation agenda](agenda/presentation-agenda.md) — choose your version (1h, 2h, or 4h)
2. Download the matching pre-built PPTX from the [Three-Version Architecture](#three-version-architecture) table above
3. Explore [slide content](content/slides/) for detailed presenter notes (see Version Guide tables)
4. Check [demo scripts](content/demos/) for live demonstration guidance
5. Open the PPTX in PowerPoint and present — no build step required (see [Rebuilding the Decks](#rebuilding-the-decks-optional) only if you customize the source)

## Project Structure

```
├── README.md             # This file
├── LICENSE               # MIT
├── CHANGELOG.md          # Release history (Keep a Changelog format)
├── agenda/               # Session agenda, version matrix, timing
├── content/
│   ├── slides/          # Source content (single source of truth)
│   │   ├── 01-10.md     # Core modules
│   │   ├── 11-beyond-code.md       # Agentic work beyond code (optional track)
│   │   ├── 12-lab-as-sandbox.md    # AutomatedLab + agentic ops (optional track)
│   │   └── marp-presentation.md  # MARP source (tagged with versions)
│   ├── demos/           # Demo scripts and instructions
│   │   ├── demo-script-main.md           # Core synthesis demo
│   │   ├── demo-ops-kerberos-lab.md      # M12: agentic ops against a live lab
│   │   └── demo-corpus-analysis.md       # M11: email corpus → timeline → letter
│   ├── materials/       # Handouts, cheat sheets, sample templates
│   │   └── memory-bank-template/  # Reusable memory-bank scaffold (drop into any project)
│   └── pptx/            # Build script + generated MARP decks + exported PPTX
│       ├── Build-MarpVersions.ps1  # Generates 3 version files
│       ├── marp-1h-keynote.md      # Generated — do not edit
│       ├── marp-2h-standard.md     # Generated — do not edit
│       └── marp-4h-workshop.md     # Generated — do not edit
├── docs/research/        # Background research (e.g., toolset assessment)
├── .memory-bank/         # Project context files
└── .vscode/              # Workspace settings
```

## Rebuilding the Decks (optional)

The pre-built `.pptx` files above are regenerated whenever slide content changes — you only need this section if you customize the source under [content/slides/](content/slides/).

```powershell
# Generate all three Marp source files and export PPTX in one go
cd content/pptx
.\Build-MarpVersions.ps1 -Version all -ExportPptx
```

Requires Node.js + the Marp CLI (`npm install -g @marp-team/marp-cli`). See [content/pptx/README-how-to-create-pptx.md](content/pptx/README-how-to-create-pptx.md) for details and HTML/PDF export options.

## License

MIT — see [LICENSE](LICENSE).

## Author

Raimund Andree — <https://github.com/raandree/AgenticOperatingModel>