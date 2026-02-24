# Active Context - Agentic Coding Presentation

## Current Focus

**Task**: Maintain and update comprehensive 2-4 hour agentic coding presentation
**Target Audience**: PowerShell Developers & DevOps Engineers
**Primary Tool**: GitHub Copilot Agent Mode (VS Code)
**Last Updated**: 2026-02-24

## Recent Decisions

### Copilot Pivot (2026-02-24)
Refocused entire presentation from Cline to GitHub Copilot Agent Mode as the primary demo tool. Copilot has feature parity with all competitors and the richest instruction file ecosystem (5 file types vs Cline's 1, plus org-level sharing).

### Landscape Research Update (2026-02-24)
Conducted comprehensive web research to update the project with the current state of the agentic coding landscape. Major findings and updates applied across slides, tech context, and materials.

### Key Landscape Changes Discovered (Feb 2026)

#### GitHub Copilot Agent Mode (Primary Demo Tool)
- **Built into VS Code** - no separate extension needed
- **4 Agent Types**: Local (Agent/Plan/Ask), Background (worktree), Cloud (Coding Agent), Third-party
- **5 Instruction File Types**: copilot-instructions.md, .instructions.md (pattern-matched), .agent.md (custom agents), AGENTS.md (cross-tool), CLAUDE.md (compatible)
- **Custom Agents**: `.agent.md` files with YAML frontmatter (name, description, tools, handoffs)
- **Agent Handoffs**: Sequential workflows between agents with pre-filled prompts
- **Tool Sets**: `.jsonc` files grouping tools for specific workflows
- **Terminal Sandboxing**: File system + network access controls
- **Organization Policies**: Org-level instruction sharing across repos
- **`/init` Command**: Auto-generate instructions from codebase
- **MCP Server Support**: Model Context Protocol for external tools
- **Copilot Coding Agent**: Autonomous cloud agent that creates PRs via GitHub Actions

#### Alternative Tools (Referenced, Not Primary)
- **Cline** (v3.67+, 58K+ stars): Open-source VS Code extension with .clinerules
- **Cursor** (v2.5): Standalone IDE with Cloud Agents, Plugins
- **Windsurf**: Cascade agent, 1M+ users
- **Claude Code**: Multi-surface agentic tool with CLAUDE.md

#### Model Context Protocol (MCP)
- Now under **Linux Foundation** (LF Projects, LLC)
- Universal standard - adopted by all major tools
- GitHub MCP Server for Agentic Workflows

#### Key AI Models Available (Feb 2026)
- Claude Opus 4.6 / Sonnet 4.6 (Anthropic) - up to 1M context on Vertex
- GPT-5.3-Codex (OpenAI)
- Gemini 3.1 Pro (Google)
- GLM-5 (ZAI), MiniMax M2.5
- Grok Code (xAI), Composer 1.5 (Cursor)

### Memory Bank Structure (2026-02-02)
Created foundational Memory Bank with:
- `projectbrief.md` - Core requirements and objectives
- `productContext.md` - Audience analysis and learning journey
- `techContext.md` - Technology stack and dependencies
- `systemPatterns.md` - Presentation and coding patterns
- `progress.md` - Status tracking and resource inventory
- `activeContext.md` - Working context (this file)

### Key Topics Identified
1. **User-Specified (Must Include)**:
   - Git as context provider for AI
   - Git for traceability of AI changes
   - Agent definitions and configuration
   - Instruction files (copilot-instructions.md, .instructions.md, .agent.md)
   - Automated testing for self-verification

2. **Additional Topics for PowerShell/DevOps Audience**:
   - Pester integration patterns
   - PSScriptAnalyzer with AI
   - Module development workflows
   - CI/CD pipeline compatibility
   - Infrastructure as Code (Bicep/ARM)
   - Secret management awareness
   - Cross-platform PowerShell considerations

3. **New Topics From Research (Feb 2026)**:
   - Copilot custom agents (.agent.md) with tools and handoffs
   - Organization-level instruction sharing
   - Instruction file ecosystem comparison across tools
   - MCP as universal standard under Linux Foundation
   - Cloud agents vs local agents trade-offs
   - Multi-agent and subagent patterns

## Immediate Next Steps

1. **Research Phase** (Completed 2026-02-24)
   - [x] Research Copilot Agent Mode documentation for latest features
   - [x] Identify additional relevant topics for audience
   - [x] Document best practices and patterns
   - [x] Research competitor landscape (Cline, Cursor, Windsurf, Claude Code)
   - [x] Research GitHub Copilot Agent Mode and Coding Agent
   - [x] Research MCP developments
   - [x] Update slides and materials with findings
   - [x] Pivot all content from Cline to Copilot as primary tool

2. **Content Review** (Completed 2026-02-24)
   - [x] Review all content for accuracy with updated landscape
   - [x] Update all slides for Copilot focus
   - [x] Update demo script for Copilot workflow
   - [x] Update cheat sheet with Copilot instructions
   - [x] Create sample Copilot instruction files

3. **Presenter Preparation** (Next)
   - [ ] Customize speaker notes and contact info
   - [ ] Prepare demo environment per demo script
   - [ ] Practice timing with actual Copilot Agent Mode usage
   - [ ] Test Copilot connectivity before session

## Working Assumptions

### Presentation Format
- Primary: Live demonstration with VS Code + Copilot Agent Mode
- Supporting: Slides for concepts and diagrams
- Interactive: Q&A encouraged throughout
- Hands-on: At least one attendee exercise
- Note: Attendees may ask about Cline/Cursor/Windsurf/Claude Code - be prepared to compare

### Audience Assumptions
- Strong PowerShell scripting skills
- Familiar with Git basics (commit, push, pull, branch)
- Some VS Code experience
- Likely already using GitHub Copilot (autocomplete/chat)
- May have heard of Cursor, Windsurf, Claude Code
- DevOps/automation mindset
- Windows-primary but cross-platform aware

### Technical Assumptions
- All demos on Windows 11
- PowerShell 7.x for cross-platform compatibility
- Pester 5.x for testing demonstrations
- GitHub Copilot with active subscription
- Stable internet for Copilot during demos

## Research Completed

### Copilot-Specific (Completed 2026-02-24)
- [x] Local agents: Agent, Plan, Ask modes
- [x] Background agents: Copilot CLI, worktree-based
- [x] Cloud agents: Copilot Coding Agent for PR creation
- [x] Instruction file ecosystem (5 file types)
- [x] Custom agents (.agent.md) with tools and handoffs
- [x] Organization-level instruction sharing
- [x] MCP server support in VS Code
- [x] `/init` command for auto-generating instructions

### Competitor Landscape (Completed 2026-02-24)
- [x] GitHub Copilot Agent Mode (Local/Background/Cloud/Third-party)
- [x] GitHub Copilot Coding Agent (autonomous PR creation)
- [x] GitHub Agentic Workflows (Markdown CI/CD)
- [x] Cursor v2.5 (Cloud Agents, Plugins, Subagents)
- [x] Windsurf/Cascade (1M+ users, Cognition)
- [x] Claude Code (multi-surface agentic tool)

### AI Models (Completed 2026-02-24)
- [x] Claude Opus 4.6 / Sonnet 4.6
- [x] GPT-5.3-Codex
- [x] Gemini 3.1 Pro
- [x] GLM-5, MiniMax M2.5, Grok Code

## Potential Demo Scenarios

### Demo 1: Module from Scratch (20-30 min)
- Empty repo → Full module with tests
- Shows: Context, generation, testing, iteration
- Uses: Copilot Agent Mode to create all files

### Demo 2: Add Feature to Existing Module (15-20 min)
- Existing module → New function
- Shows: Pattern recognition, consistency
- Uses: Copilot reads existing patterns

### Demo 3: Debug and Fix (10-15 min)
- Failing tests → Working code
- Shows: Analysis, problem solving
- Uses: Ask mode for analysis, Agent mode for fixes

### Demo 4: Documentation Generation (10-15 min)
- Undocumented code → Full docs
- Shows: Code understanding, help generation
- Uses: Custom documentation agent (.agent.md)

### Demo 5: IaC with Bicep (Optional, 15-20 min)
- Request infrastructure → Bicep template
- Shows: Cross-language, DevOps application

## Risk Mitigation Notes

### Live Demo Backup Plans
- Pre-record key demos as fallback
- Have completed code checkpoints ready
- Test all demos morning-of session
- Prepare offline-capable examples

### Timing Flexibility
- Mark optional sections clearly
- Prepare natural stopping points
- Have "if time permits" bonus content
- Build in buffer for Q&A

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