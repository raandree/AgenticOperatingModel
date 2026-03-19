# Progress - Agentic Coding Presentation

## Current Status

**Phase**: Content Complete — Three Version Architecture
**Started**: 2026-02-02
**Last Updated**: 2026-03-11
**GitHub Repository**: raandree/AgenticCoding (main branch)
**Status**: All three versions (1h, 2h, 4h) structured and ready for review

## Completed

### Three-Version Architecture ✅ (2026-03-11)
- [x] Created `versions/` folder with `1h/`, `2h/`, `4h/` subfolders
- [x] 1-hour agenda with per-module presenter guide (versions/1h/agenda.md)
- [x] 2-hour agenda with per-module presenter guide (versions/2h/agenda.md)
- [x] 4-hour agenda with per-module presenter guide (versions/4h/agenda.md)
- [x] README for each version explaining scope and module selection
- [x] Versions overview README with module map and shared content architecture
- [x] Root README updated with version picker, new project structure
- [x] Old agenda/ folder updated to redirect to versions/
- [x] content/README.md updated to document single-source-of-truth architecture
- [x] Memory bank updated (activeContext.md, progress.md)

### Agent Infrastructure ✅ (2026-03-09)
- [x] Technical-writer agent mode configured (7-phase documentation workflow)
- [x] MyCopilot instruction files (11 pattern-matched .instructions.md files on OneDrive)
- [x] Skills ecosystem configured (sampler-framework, pester-patterns, grammar-check, agent-customization, etc.)
- [x] Cross-machine sync via VS Code `chat.*FilesLocations` settings
- [x] Project .github/ instruction files migrated to personal MyCopilot sync
- [x] Memory bank updated with agent mode and instruction documentation

### Brainstorming Notes Integration ✅ (2026-03-07)
- [x] Foundational vocabulary slide (Slide 2.0) added to Module 2
- [x] Token usage & cost slide (Slide 1.4a) added to Module 1
- [x] Agent security & boundaries slide (Slide 9.8a) added to Module 9
- [x] Guiding principle "Know what you are doing" slide (Slide 9.8b) added to Module 9
- [x] Complementary tools (Warp, GitHub Copilot CLI, Zed) added to Module 10 and cheat sheet
- [x] Cheat sheet expanded with Token/Cost, Security, Guiding Principle sections and 6 new glossary terms
- [x] Agenda updated with vocabulary, security, and guiding principle sections
- [x] Speaker notes enriched for Modules 1 and 9
- [x] Memory bank updated (activeContext.md, progress.md)

### Memory Bank ✅ (Updated 2026-03-09)
- [x] `projectbrief.md` - Core focus on agentic coding paradigm
- [x] `productContext.md` - Audience analysis and learning journey
- [x] `techContext.md` - Technology stack, instruction files, agent modes, memory architecture
- [x] `systemPatterns.md` - Presentation, demo, and workflow patterns (8 + 9 patterns)
- [x] `progress.md` - Status tracking (this file)
- [x] `activeContext.md` - Working context, agent configuration, condensed to < 200 lines
- [x] `README.md` - Memory Bank documentation with VS Code memory relationship
- [x] `promptHistory.md` - Append-only writing task log (trim > 90 days)

### Agenda ✅
- [x] `agenda/presentation-agenda.md` - Comprehensive 2-4 hour agenda

### Slide Content ✅ (Updated 2026-02-25)
- [x] Module 1: The AI Coding Revolution (10 min) - **Updated with current landscape**
- [x] Module 2: What Makes Coding Agentic (25-30 min) - **Refocused to Copilot**
- [x] Module 3: The Power of Context (20-25 min) - **Refocused to Copilot**
- [x] Module 4: Controlling AI Behavior (30-35 min) - **Expanded: Skills, Prompts, Handoffs, richer agents**
- [x] Module 5: Self-Verification (20-25 min) - **Refocused to Copilot**
- [x] Module 8: Advanced Capabilities (25 min) - **NEW: MCP, checkpoints, agent types**
- [x] Module 9: When to Use (15-20 min) - **Refocused to Copilot**
- [x] Module 10: Your Agentic Future (10-15 min) - **Added OneDrive sync, feature flags, updated takeaways**

### Demo Materials ✅ (Updated 2026-02-25)
- [x] Main demo script with talking points - **Added bonus Skills/Prompts/Sync demo section**
- [x] Sample copilot-instructions.md file
- [x] Sample .instructions.md file (pattern-matched)
- [x] Sample .agent.md file (custom agent)
- [x] Troubleshooting guide

### Supporting Materials ✅ (Updated 2026-03-09)
- [x] Sample copilot-instructions.md for PowerShell module development
- [x] Sample .instructions.md for PowerShell files
- [x] Sample .instructions.md for testing (Pester test files)
- [x] Sample .instructions.md for documentation (Markdown files)
- [x] Sample .instructions.md for refactoring
- [x] Sample .agent.md for Pester test writer
- [x] Sample .agent.md for code reviewer (with handoff)
- [x] Sample .agent.md for IaC engineer (DSC, Bicep, Terraform)
- [x] Sample .agent.md for security reviewer (OWASP, CWE references)
- [x] Sample SKILL.md for build debugging
- [x] Quick reference cheat sheet - **Added chat shortcuts, feature flags, expanded ecosystem**
- [x] MARP slide deck updated with Module 8 (MCP, checkpoints, agent types)

### Research ✅ (Completed 2026-02-24)
- [x] GitHub Copilot Agent Mode (Local/Background/Cloud/Third-party)
- [x] GitHub Copilot Coding Agent (autonomous PR creation, Windows support)
- [x] Copilot instruction file ecosystem (5 file types)
- [x] Custom agents (.agent.md) with tools and handoffs
- [x] Cursor v2.5 (alternative tool reference)
- [x] Windsurf/Cascade (alternative tool reference)
- [x] Claude Code (alternative tool reference)
- [x] GitHub Agentic Workflows (Markdown-based CI/CD, technical preview)
- [x] MCP under Linux Foundation, universal standard
- [x] Current AI models: Claude Opus 4.6, GPT-5.3-Codex, Gemini 3.1 Pro

## Content Structure

```
AgenticCoding/
├── .memory-bank/               # Project context files
├── versions/                   # Version-specific agendas & presenter guides
│   ├── README.md               #   Overview & module map
│   ├── 1h/                     #   1-hour "Paradigm Shift"
│   │   ├── README.md
│   │   └── agenda.md
│   ├── 2h/                     #   2-hour "Core Concepts + Demo"
│   │   ├── README.md
│   │   └── agenda.md
│   └── 4h/                     #   4-hour "Full Workshop"
│       ├── README.md
│       └── agenda.md
├── agenda/                     # Legacy (redirects to versions/)
│   └── presentation-agenda.md
└── content/                    # Shared content (single source of truth)
    ├── slides/
    │   ├── 01-ai-coding-revolution.md
    │   ├── 02-what-is-agentic.md
    │   ├── 03-power-of-context.md
    │   ├── 04-controlling-ai-behavior.md
    │   ├── 05-self-verification.md
    │   ├── 08-advanced-capabilities.md
    │   ├── 09-when-to-use.md
    │   └── 10-your-agentic-future.md
    ├── demos/
    │   └── demo-script-main.md
    ├── pptx/
    │   ├── agentic-coding-presentation.md
    │   └── README-how-to-create-pptx.md
    └── materials/
        ├── cheat-sheet.md
        └── sample-copilot-instructions/
            ├── copilot-instructions.md
            ├── powershell.instructions.md
            ├── testing.instructions.md
            ├── documentation.instructions.md
            ├── refactoring.instructions.md
            ├── pester-test-writer.agent.md
            ├── code-reviewer.agent.md
            ├── iac-engineer.agent.md
            ├── security-reviewer.agent.md
            └── sample-skill/
                └── SKILL.md
```

## What's Ready

| Item | Status | Notes |
|------|--------|-------|
| 1-Hour Agenda | ✅ Ready | Condensed core concepts, no break |
| 2-Hour Agenda | ✅ Ready | Core concepts + synthesis demo |
| 4-Hour Agenda | ✅ Ready | Full workshop with all modules |
| All Core Slides | ✅ Updated | Modules 1-5, 8-10 (Copilot-focused) |
| Main Demo Script | ✅ Updated | Copilot Agent Mode workflow |
| Sample Copilot Instructions | ✅ Ready | 10 sample files (instructions, agents, skill) |
| Cheat Sheet | ✅ Updated | Refocused on Copilot |
| Landscape Research | ✅ Complete | Copilot primary, alternatives referenced |
| Agent Infrastructure | ✅ Configured | Technical-writer mode, MyCopilot instructions, skills |
| Version Architecture | ✅ Complete | Shared content, version-specific agendas |

## Optional: Still Could Create

These are optional additions if time permits:

- [x] Module 8 slides: Advanced Capabilities (MCP, checkpoints)
- [x] Sample `SKILL.md` file for presentation materials
- [x] Additional .instructions.md templates (testing, documentation, refactoring)
- [x] Additional .agent.md templates (code review, IaC, security)
- [x] Slide deck conversion to PowerPoint/Google Slides (MARP updated with Module 8)
- [ ] Pre-recorded backup demo video
- [ ] Setup checklist for attendees

## Key Decisions Made

1. **Focus**: Agentic coding paradigm, NOT PowerShell training
2. **Structure**: Concept → Demo → Practice pattern
3. **Core Message**: "AI that acts, not just suggests"
4. **Primary Tool**: GitHub Copilot Agent Mode (built into VS Code)
5. **Emphasis Areas**:
   - Git for context and traceability
   - Instruction files for consistency
   - Automated testing for self-verification
   - Human judgment remains essential

## Next Steps for Presenter

1. **Review all content** for accuracy and tone
2. **Customize** speaker notes and contact info
3. **Prepare demo environment** per demo script
4. **Practice** timing with actual Copilot Agent Mode usage
5. **Test** Copilot connectivity before session
6. **Create** backup recordings if desired

## File Summary

| Category | Files | Total Est. Words |
|----------|-------|------------------|
| Memory Bank | 6 files | ~3,000 |
| Agenda | 1 file | ~2,500 |
| Slides | 8 modules | ~9,500 |
| Demo Script | 1 file | ~1,500 |
| Materials | 9 files | ~2,500 |
| **Total** | **25 files** | **~19,000 words** |