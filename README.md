# Agentic Coding: AI That Actually Codes

A presentation/workshop on agentic coding for PowerShell developers and DevOps engineers, available in **1-hour**, **2-hour**, and **4-hour** formats.

## Overview

Learn how AI agents go beyond code suggestions to autonomously write, test, and iterate on code. This workshop covers the paradigm shift from "AI that suggests" to "AI that acts."

## Session Formats

| Version | Duration | Best For |
|---------|----------|----------|
| [**1-Hour**](versions/1h/) | 60 min | Conference talks, executive briefings |
| [**2-Hour**](versions/2h/) | 120 min | Meetups, team introductions |
| [**4-Hour**](versions/4h/) | 240 min | Full workshops, deep dives |

See [versions/](versions/) for detailed agendas and presenter guides for each format.

## Key Topics

1. **What Makes Coding Agentic** - Understanding the agentic loop
2. **The Power of Context** - Why Git matters for AI
3. **Controlling AI Behavior** - Instruction files, custom agents, skills
4. **Self-Verification** - AI that tests its own code
5. **Advanced Capabilities** - MCP, checkpoints, agent types *(4h only)*
6. **Practical Application** - Live demos with Copilot Agent Mode

## Target Audience

- PowerShell developers
- DevOps engineers
- Anyone interested in AI-assisted development

## Quick Start

1. Pick a version: [1h](versions/1h/agenda.md) · [2h](versions/2h/agenda.md) · [4h](versions/4h/agenda.md)
2. Explore [slide content](content/slides/) for detailed presenter notes
3. Check [demo scripts](content/demos/) for live demonstration guidance
4. Use [MARP slides](content/pptx/) for the actual presentation

## Project Structure

```
├── versions/            # Version-specific agendas & presenter guides
│   ├── 1h/              #   1-hour "Paradigm Shift" format
│   ├── 2h/              #   2-hour "Core Concepts + Demo" format
│   └── 4h/              #   4-hour "Full Workshop" format
├── content/             # Shared content (single source of truth)
│   ├── slides/          #   Detailed presenter content (Modules 1-5, 8-10)
│   ├── demos/           #   Demo scripts and instructions
│   ├── materials/       #   Handouts, cheat sheets, sample templates
│   └── pptx/            #   MARP slides for PowerPoint conversion
├── agenda/              # Legacy agenda (redirects to versions/)
├── .memory-bank/        # Project context files
└── .vscode/             # Workspace settings
```

### Content Architecture

All slide content, demo scripts, and materials live in `content/` — the **single source of truth**. The `versions/` folders contain only agenda and timing differences. When you update a module in `content/slides/`, all three versions get the update automatically.

## Converting to PowerPoint

```bash
npm install -g @marp-team/marp-cli
marp content/pptx/agentic-coding-presentation.md --pptx -o presentation.pptx
```

## License

[Add your license here]

## Author

[Your name and contact]