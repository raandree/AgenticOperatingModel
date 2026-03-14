# Active Context - Agentic Coding Presentation

## Current Focus

**Task**: Maintain and update comprehensive 2-4 hour agentic coding presentation
**Target Audience**: PowerShell Developers & DevOps Engineers
**Primary Tool**: GitHub Copilot Agent Mode (VS Code)
**GitHub Repository**: raandree/AgenticCoding (main branch)
**Last Updated**: 2026-03-09

## Agent & Instruction Configuration

### Active Agent Modes

| Mode | Purpose | Key Features |
|------|---------|-------------|
| **technical-writer** | Documentation & article creation | 7-phase workflow (Scope → Research → External Research → Outline → Content → Editing → Publication), citation requirements, quality gates, Memory Bank integration, subagent delegation, CRAAP source evaluation |
| *(default)* | General development | Standard Copilot Agent Mode |

### Instruction Files (12 total)

**MyCopilot** (OneDrive cross-machine sync, 11 files):
`powershell` · `pester` · `yaml` · `json` · `markdown` · `changelog` · `git` · `versioning` · `sampler` · `azurepipelines` · `csharp`

**VS Code Extension** (1 file, conditionally loaded):
- `azure.instructions.md` — loaded only for Azure-related requests (from `ms-azuretools.vscode-azure-github-copilot` extension)

### Available Skills (14 total)

**MyCopilot Skills** (10): `sampler-framework` · `sampler-migration` · `sampler-build-debug` · `pester-patterns` · `grammar-check` · `agent-customization` · `automatedlab-deployment` · `outlook-email-export` · `send-outlook-email` · `german-legal-research` · `german-employment-law`

**VS Code Extension Skills** (4): `summarize-github-issue-pr-notification` · `suggest-fix-issue` · `form-github-search-query` · `show-github-search-result`

### Memory Architecture

| Scope | Location | Purpose | Persistence |
|-------|----------|---------|-------------|
| **Memory Bank** | `.memory-bank/` (git-tracked) | Shared project context, teaching artifact | Across sessions, machines, and collaborators |
| **User memory** | `/memories/` | Personal learnings, terminal patterns | Across all workspaces (first 200 lines auto-loaded) |
| **Session memory** | `/memories/session/` | Task-specific notes | Current conversation only |
| **Repository memory** | `/memories/repo/` | Workspace-scoped facts | Local to workspace |

### Key Deferred Tools

`fetch_webpage` (web research for technical-writer mode) · `github_repo` · `get_changed_files` · `mcp_azure_mcp_search`

### Project Instruction Files

Previously in `.github/` (removed). Now loaded via MyCopilot OneDrive sync and VS Code `chat.*FilesLocations` settings. Project-specific samples remain in `content/materials/sample-copilot-instructions/`.

## Recent Changes

### 2026-03-14: Prompt Evolution demo + slide + cross-references
- Created `content/demos/demo-prompt-evolution.md` — 6-level prompt progression demo script
  - Same task ("PowerShell function comparing file sizes") through six increasingly effective prompts
  - Each level adds context, scope, and resource utilization (instructions, skills, agents, memory bank)
  - Includes teaching points, presenter talking points, execution options, troubleshooting
- Added Slide 4.19 (Prompt Evolution) to Module 4 with summary table + cross-reference
- Updated Module 4 speaker notes with demo tip for extended sessions
- Updated main demo script with cross-reference to prompt evolution demo
- Updated content README with demo listing
- Updated cheat sheet with Prompt Evolution Pattern quick-reference table
- Updated agenda with optional Prompt Evolution demo in Module 4 extended version

### 2026-03-09: Module 8 + sample templates + MARP update
- Module 8: Advanced Capabilities slides created (13 slides + speaker notes)
  - MCP architecture and configuration (slides 8.1-8.6)
  - Checkpoints and rollback (slides 8.7-8.8)
  - Multi-file operations (slide 8.9)
  - Agent types: local, background, cloud, third-party (slides 8.10-8.11)
  - Future trajectory (slide 8.12)
- Sample templates added (7 files):
  - 3x .instructions.md (testing, documentation, refactoring)
  - 3x .agent.md (code-reviewer, iac-engineer, security-reviewer)
  - 1x SKILL.md (sampler-build-debug)
- MARP presentation updated with 3 new Module 8 slides (22 → 25 slides)
- Technical-writer mode, MyCopilot instruction files, skills ecosystem documented

### 2026-03-07: Brainstorming notes integration
- Foundational vocabulary (Slide 2.0), token usage & cost (Slide 1.4a), agent security (Slide 9.8a), guiding principle (Slide 9.8b) added
- Cheat sheet expanded with Token/Cost, Security, Guiding Principle sections
- Agenda rebalanced for Module 2 and Module 9

### 2026-02-25: MyCopilot integration
- Skills, Prompts, Agent Handoffs slides added (4.10-4.12)
- Chat shortcuts, feature flags, OneDrive sync pattern added to cheat sheet and demos
- Richer agent examples with production-grade patterns

### 2026-02-24: Copilot pivot & landscape research
- Refocused from Cline to GitHub Copilot Agent Mode as primary demo tool
- Updated landscape: Cursor v2.5, Windsurf, Claude Code, MCP under Linux Foundation
- All 7 slide modules, demo script, cheat sheet refocused for Copilot

## Presenter Preparation (Next Steps)

- [ ] Customize speaker notes and contact info
- [ ] Prepare demo environment per demo script
- [ ] Practice timing with actual Copilot Agent Mode usage
- [ ] Test Copilot connectivity before session

## Working Assumptions

- Audience: Strong PowerShell, Git basics, some VS Code, likely used Copilot autocomplete
- Platform: Windows 11, PowerShell 7.x, Pester 5.x, stable internet
- Format: Live demo primary, slides for concepts, Q&A throughout
- Attendees may ask about Cursor/Windsurf/Claude Code — be prepared to compare

### Attendee Environment Variance
- Provide pre-session setup guide
- Have troubleshooting FAQ ready
- Consider DevContainer option
- Demo-first, follow-along optional

## Questions for User

Before finalizing agenda:
1. Confirmed duration (2 hours strict, or flexible to 4)?
2. In-person, virtual, or hybrid format?
3. Attendee hands-on exercises required or optional?
4. Should attendees have GitHub Copilot subscription?
5. Any specific PowerShell modules/scenarios to feature?
6. Recording planned?

## Session Context

### Current Task
Creating the agenda document based on Memory Bank content

### Key Constraints
- Must be practical and demo-heavy
- Must emphasize Git integration
- Must include automated testing
- Must be PowerShell/DevOps relevant
- Duration: 2-4 hours (flexible)

### Outputs Expected
1. Detailed agenda markdown file
2. Timing breakdown for each section
3. Demo descriptions per section
4. Break schedule