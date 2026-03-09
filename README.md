# Agentic Coding: AI That Actually Codes

A 2-4 hour presentation/workshop on agentic coding for PowerShell developers and DevOps engineers.

## Overview

Learn how AI agents go beyond code suggestions to autonomously write, test, and iterate on code. This workshop covers the paradigm shift from "AI that suggests" to "AI that acts."

## Key Topics

1. **What Makes Coding Agentic** - Understanding the agentic loop
2. **The Power of Context** - Why Git matters for AI
3. **Controlling AI Behavior** - Instruction files, custom agents, skills
4. **Self-Verification** - AI that tests its own code
5. **Advanced Capabilities** - MCP, checkpoints, agent types
6. **Practical Application** - Live demos with Copilot Agent Mode

## Target Audience

- PowerShell developers
- DevOps engineers
- Anyone interested in AI-assisted development

## Quick Start

1. Review the [presentation agenda](agenda/presentation-agenda.md)
2. Explore [slide content](content/slides/) for detailed presenter notes
3. Check [demo scripts](content/demos/) for live demonstration guidance
4. Use [MARP slides](content/pptx/) for the actual presentation

## Project Structure

```
├── agenda/              # Session agenda and timing
├── content/
│   ├── slides/          # Detailed presenter content (Modules 1-5, 8-10)
│   ├── demos/           # Demo scripts and instructions
│   ├── materials/       # Handouts, cheat sheets, sample templates
│   └── pptx/            # MARP slides for PowerPoint conversion
├── .memory-bank/        # Project context files
└── .vscode/             # Workspace settings
```

## Converting to PowerPoint

```bash
npm install -g @marp-team/marp-cli
marp content/pptx/agentic-coding-presentation.md --pptx -o presentation.pptx
```

## License

[Add your license here]

## Author

[Your name and contact]