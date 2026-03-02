# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Changed

- **Integrated MyCopilot project patterns into presentation content**
  - Module 4: Added 4 new slides (Skills, Prompts, Agent Handoffs, Complete Customization Ecosystem)
  - Module 4: Enhanced custom agent examples with production-grade patterns (model, handoffs, subagents, zero-confirmation)
  - Module 4: Renumbered slides 4.10–4.18 to accommodate new content, updated timing to 30–35 min
  - Module 10: Added cross-machine sync slide with OneDrive pattern and setup script
  - Module 10: Updated getting started checklist with VS Code feature flags
  - Module 10: Updated key takeaways to include skills, prompts, and handoffs
  - Module 10: Updated sample template library with prompt and skill examples
  - Demo script: Added "Demo Part 6 (Bonus)" covering skills, prompts, and cross-machine sync
  - Demo script: Added recommended VS Code settings to setup checklist
  - Demo script: Updated timing table for 4-hour version (35–42 min)
  - Cheat sheet: Added Chat Shortcuts table (`/agents`, `/instructions`, `/skills`, `/prompts`)
  - Cheat sheet: Added Recommended VS Code Settings table (4 feature flags)
  - Cheat sheet: Expanded Key Concepts with Skills, Prompt Files, Agent Handoffs
  - Cheat sheet: Expanded Customization Ecosystem to 6-type table with cross-machine sync example

### Removed

- `.clinerules/` directory (Cline-specific configuration files)
- `.github/chatmodes/` directory (deprecated chatmode format)
- `.github/instructions/` directory (moved to personal MyCopilot sync)
- `.github/prompts/` directory (moved to personal MyCopilot sync)
- `content/materials/sample-clinerules/` directory
  - `.github/chatmodes/README.md`: Added migration notice and `.agent.md` format guide
- **Pivoted primary demo tool from Cline to GitHub Copilot Agent Mode**
  - All 7 slide modules refocused for Copilot as primary tool
  - Module 4 (Controlling AI Behavior) major refactor: 5 instruction file types, custom agents, org policies
  - Module 10 (Your Agentic Future) major refactor: Copilot resources, getting started guide, agent templates
  - Demo script updated for Copilot Agent Mode workflow (setup, file names, narration, troubleshooting)
  - Cheat sheet refocused: Copilot Agent Mode Quick Reference, instruction file ecosystem, resources
  - All `.clinerules` references updated to `copilot-instructions.md` across all files
  - All "Cline" demo references updated to "Copilot Agent Mode"
- Updated Module 1 slides with current agentic coding landscape (Feb 2026)
  - Added Windsurf, Claude Code to tool mentions
  - Updated timeline to reflect Wave 3 starting 2025
  - Updated technology advances (1M+ token context, MCP as standard, cloud agents)
  - Added enterprise adoption data (NVIDIA, Salesforce, Fortune 500)
- Updated Module 10 slides with current resources and future outlook
  - Added comprehensive resource links for all major agentic tools
  - Updated future outlook to reflect features already shipped (cloud agents, subagents, agentic CI/CD)
- Updated cheat sheet with current tool ecosystem and instruction file comparison
- Updated techContext.md with current AI models, competitor tools, Copilot instruction hierarchy
- Updated all memory bank files to reflect Copilot as primary tool

### Added

- Sample `copilot-instructions.md` file for PowerShell module projects
- Sample `powershell.instructions.md` file with pattern-matched `applyTo` frontmatter
- Sample `pester-test-writer.agent.md` custom agent file with YAML tools configuration
- New `content/materials/sample-copilot-instructions/` directory with 3 sample files
- Copilot instruction file ecosystem table (5 file types: copilot-instructions.md, .instructions.md, .agent.md, AGENTS.md, CLAUDE.md)
- Custom agent examples with YAML frontmatter (name, description, tools, handoffs)
- Organization-level instruction sharing documentation
- `/init` command reference for auto-generating instructions
- Agentic coding landscape research findings (Feb 24, 2026)
- Current AI model reference (Claude Opus 4.6, GPT-5.3-Codex, Gemini 3.1 Pro)
- Initial presentation structure and content
- Module slides 1-5, 9-10 covering core agentic coding concepts
- Main demo script with troubleshooting guide
- MARP slide deck for PowerPoint conversion
- Quick reference cheat sheet for attendees
- Project-specific instruction files
- Comprehensive documentation in memory-bank/

### Deprecated

- *(No current deprecations)*

### Documentation

- Root README.md with project overview
- Folder README files explaining directory purposes
- Presentation agenda with timing estimates

## [0.1.0] - 2026-02-02

### Added
- Initial project creation
- Memory bank structure
- Basic agenda outline

[Unreleased]: https://github.com/raandree/AgenticCoding/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/raandree/AgenticCoding/releases/tag/v0.1.0