# Technical Context - Agentic Coding Presentation

## Technology Stack

### Primary Tools

#### GitHub Copilot Agent Mode (Built into VS Code)
- **Purpose**: AI coding agent built into VS Code
- **Key Features**:
  - **Local Agents**: Agent (autonomous), Plan (planning), Ask (read-only)
  - **Background Agents**: Run in separate worktree via Copilot CLI
  - **Cloud Agents**: Copilot Coding Agent creates PRs via GitHub Actions
  - **Third-party Agents**: Extensions providing custom agentic capabilities
  - Agent handoffs and subagents
  - Custom agents via `.agent.md` files with YAML frontmatter
  - Instruction files: `copilot-instructions.md`, `.instructions.md`, `AGENTS.md`
  - MCP (Model Context Protocol) server support
  - Tool sets for workflow-specific tool grouping
  - Terminal sandboxing (file system + network access controls)
  - Organization-level instruction sharing
  - `/init` command for auto-generating instructions from codebase
  - Cross-tool compatibility with `AGENTS.md` and `CLAUDE.md`

#### Git
- **Purpose**: Version control and AI context provider
- **Key Concepts for Presentation**:
  - Repository structure as context
  - Commit history for traceability
  - Branch strategies for AI work
  - `.gitignore` for AI-aware exclusions
  - Diff viewing for change verification

#### PowerShell
- **Purpose**: Primary scripting language for demos
- **Key Aspects**:
  - PowerShell 7.x (cross-platform)
  - Module development patterns
  - Pester testing framework
  - PSScriptAnalyzer for linting
  - Comment-based help

### Supporting Tools

#### Pester (Testing Framework)
- **Purpose**: Unit/integration testing for PowerShell
- **Integration Points**:
  - AI-generated test scaffolding
  - Test-driven development with AI
  - Automated test execution for verification

#### PSScriptAnalyzer
- **Purpose**: Static analysis and linting
- **Integration Points**:
  - AI respects linting rules
  - Custom rules in instruction files
  - Automated quality checks

#### VS Code
- **Purpose**: Development environment
- **Key Extensions**:
  - GitHub Copilot (built-in agent mode)
  - PowerShell Extension
  - GitLens (optional)
  - Pester Test Explorer (optional)

## Technical Concepts to Cover

### Agentic Coding Fundamentals

```
┌─────────────────────────────────────────────────────────────┐
│                    AGENTIC CODING LOOP                      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   ┌──────────┐    ┌──────────┐    ┌──────────┐             │
│   │  PLAN    │───▶│  EXECUTE │───▶│  VERIFY  │             │
│   │          │    │          │    │          │             │
│   │ Analyze  │    │ Write    │    │ Test     │             │
│   │ Design   │    │ Modify   │    │ Lint     │             │
│   │ Strategy │    │ Create   │    │ Review   │             │
│   └──────────┘    └──────────┘    └──────────┘             │
│        ▲                               │                    │
│        │         ┌──────────┐          │                    │
│        └─────────│  ITERATE │◀─────────┘                    │
│                  │          │                               │
│                  │ Refine   │                               │
│                  │ Fix      │                               │
│                  │ Improve  │                               │
│                  └──────────┘                               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Git Context Model

```
┌─────────────────────────────────────────────────────────────┐
│                    GIT AS AI CONTEXT                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Repository Structure          │  AI Understanding          │
│  ─────────────────────         │  ─────────────────────     │
│  📁 project/                   │                            │
│  ├── 📁 src/                   │  "Core source code"        │
│  │   ├── 📄 Module.psm1        │  "Main module file"        │
│  │   └── 📁 Private/           │  "Internal functions"      │
│  ├── 📁 tests/                 │  "Pester tests"            │
│  ├── 📁 docs/                  │  "Documentation"           │
│  ├── 📄 .github/             │  "My instructions"        │
│  │   └── copilot-              │                            │
│  │       instructions.md       │                            │
│  ├── 📄 .gitignore             │  "What to exclude"         │
│  └── 📄 README.md              │  "Project overview"        │
│                                                             │
│  Commit History                │  AI Understanding          │
│  ─────────────────────         │  ─────────────────────     │
│  abc123: "Add auth module"     │  "Recent auth work"        │
│  def456: "Fix token refresh"   │  "Known issue area"        │
│  ghi789: "Add Pester tests"    │  "Testing patterns"        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Instruction File Hierarchy

```
┌─────────────────────────────────────────────────────────────┐
│           COPILOT INSTRUCTION FILE HIERARCHY                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Priority   │  Location                    │  Purpose       │
│  ─────────  │  ────────────────────         │  ──────────    │
│  1 (High)   │  Personal settings           │  User prefs    │
│             │  (VS Code settings)           │  & defaults    │
│                                                             │
│  2 (Medium) │  .github/                     │  Project-      │
│             │  ├── copilot-instructions.md  │  specific      │
│             │  ├── instructions/*.md        │  rules &       │
│             │  └── agents/*.agent.md        │  personas      │
│                                                             │
│  3 (Low)    │  Organization policies        │  Org-wide      │
│             │  (GitHub org settings)        │  standards     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## Demo Environment Requirements

### Minimum Setup
- VS Code (latest, 1.109+)
- GitHub Copilot extension (with active subscription)
- PowerShell 7.x
- Git
- Pester 5.x

### Recommended Additional Tools
- Windows Terminal
- PSScriptAnalyzer
- GitLens extension
- Oh-My-Posh (for terminal aesthetics)

### Alternative/Complementary Agentic Tools (Feb 2026)
- **Cline** (v3.67+, 58K+ stars) - Open-source VS Code extension, Enterprise edition, Skills & Subagents
- **Cursor** (v2.5) - Standalone IDE with Cloud Agents, Plugins, Async Subagents
- **Windsurf** (by Cognition) - Cascade agent, 1M+ users, JetBrains plugin
- **Claude Code** (Anthropic) - Terminal CLI, VS Code, Desktop app, Web, JetBrains
- **GitHub Agentic Workflows** - Markdown-based CI/CD automation (technical preview)

## Code Examples Reference

### PowerShell Module Structure (Demo Project)
```
DemoModule/
├── DemoModule.psd1          # Module manifest
├── DemoModule.psm1          # Root module
├── Public/                  # Exported functions
│   ├── Get-DemoData.ps1
│   └── Set-DemoConfig.ps1
├── Private/                 # Internal functions
│   └── Initialize-Demo.ps1
├── Tests/
│   ├── Get-DemoData.Tests.ps1
│   └── Set-DemoConfig.Tests.ps1
├── .github/
│   └── copilot-instructions.md  # Copilot instructions
├── .gitignore
└── README.md
```

### Sample copilot-instructions.md Content
```markdown
# DemoModule Development Rules

## Code Style
- Use approved verbs for function names (Get, Set, New, Remove, etc.)
- Follow PowerShell best practices from PSScriptAnalyzer
- Include comment-based help for all public functions
- Use parameter validation attributes

## Testing Requirements
- Every public function must have Pester tests
- Tests must cover success and error paths
- Use mocking for external dependencies
- Target 80% code coverage minimum

## Git Practices
- Commit after each logical change
- Use conventional commit messages
- Never commit secrets or credentials
```

## Technical Dependencies

| Component | Version | Purpose |
|-----------|---------|---------|
| PowerShell | 7.4+ | Cross-platform scripting |
| Pester | 5.5+ | Testing framework |
| PSScriptAnalyzer | 1.21+ | Linting |
| Git | 2.40+ | Version control |
| VS Code | 1.109+ | IDE |
| GitHub Copilot | Active subscription | AI agent (primary demo tool) |

## API/LLM Considerations

### Supported Providers (for Copilot)
- GitHub Copilot uses GitHub-hosted models
- Model selection available for Business/Enterprise plans
- Available models include Claude, GPT, Gemini families
- No separate API key required - uses GitHub authentication

### Key Models (Feb 2026)
| Model | Provider | Strengths |
|-------|----------|----------|
| Claude Opus 4.6 | Anthropic | Best reasoning, 1M context on Vertex |
| Claude Sonnet 4.6 | Anthropic | Fast coding, good balance |
| GPT-5.3-Codex | OpenAI | Strong code generation |
| Gemini 3.1 Pro | Google | Large context, competitive |
| Grok Code | xAI | Available in Cursor |
| Composer 1.5 | Cursor | Cursor-exclusive model |

### Cost Considerations for Presentation
- GitHub Copilot subscription required (Individual, Business, or Enterprise)
- Business/Enterprise plans offer model selection and org-level policies
- No per-token billing - included in subscription
- Enterprise plan adds audit logs, IP indemnity, org instructions

### Instruction File Ecosystem (Feb 2026)

#### GitHub Copilot (Primary - Richest Ecosystem)
| File | Scope | Purpose |
|------|-------|---------|
| `.github/copilot-instructions.md` | All chat requests | Always-on project rules |
| `.github/instructions/*.instructions.md` | Pattern-matched files | File-type specific rules |
| `.github/agents/*.agent.md` | Per-agent persona | Custom agents with tools, handoffs, model preferences |
| `.github/skills/*/SKILL.md` | Auto-detected | Domain knowledge loaded when relevant (USE FOR/DO NOT USE FOR triggers) |
| `.github/prompts/*.prompt.md` | On-demand `/slash` commands | Reusable task templates |
| `AGENTS.md` | Cross-tool | Works with Copilot + Claude Code |
| `CLAUDE.md` | Cross-tool | Claude Code compatible |

#### Cross-Machine Sync Settings
| Setting | Purpose |
|---------|----------|
| `chat.agentFilesLocations` | Additional agent file directories (e.g., OneDrive) |
| `chat.instructionsFilesLocations` | Additional instruction file directories |
| `chat.agentSkillsLocations` | Additional skill directories |
| `chat.promptFilesLocations` | Additional prompt file directories |

#### Recommended Feature Flags
| Setting | Value | Purpose |
|---------|-------|---------|
| `chat.includeApplyingInstructions` | `true` | Auto-apply .instructions.md when applyTo glob matches |
| `chat.includeReferencedInstructions` | `true` | Follow Markdown links in instruction files |
| `github.copilot.chat.agent.thinkingTool` | `true` | Enable reasoning tool for complex problems |
| `github.copilot.chat.search.semanticTextResults` | `true` | Improve search with semantic matching |

#### Chat Shortcuts
| Command | Action |
|---------|--------|
| `/init` | Generate workspace instructions from codebase |
| `/agents` | Configure Custom Agents menu |
| `/instructions` | Configure Instructions and Rules menu |
| `/skills` | Configure Skills menu |
| `/prompts` | Configure Prompt Files menu |

#### Other Tools
| Tool | Instruction File | Scope |
|------|-------------------|-------|
| Claude Code | `CLAUDE.md` | Project-level instructions |
| Cursor | `.cursor/rules/` directory | Project-level rules |
| Windsurf | Memories + Rules system | Project-level context |

### MyCopilot Cross-Machine Instruction Infrastructure

Project instruction files have been moved from `.github/` to a personal **MyCopilot** directory on OneDrive (`~/OneDrive/MyCopilot/`), enabling cross-machine sync. VS Code loads these via `chat.*FilesLocations` settings.

#### Directory Structure
```
~/OneDrive/MyCopilot/
├── Instructions/          # Pattern-matched .instructions.md files (11 files)
│   ├── powershell.instructions.md    # *.ps1, *.psm1, *.psd1
│   ├── pester.instructions.md        # *.Tests.ps1
│   ├── yaml.instructions.md          # *.yml, *.yaml
│   ├── json.instructions.md          # *.json, *.jsonc
│   ├── markdown.instructions.md      # *.md
│   ├── changelog.instructions.md     # CHANGELOG.md, HISTORY.md, etc.
│   ├── git.instructions.md           # .gitconfig, .gitignore, .gitattributes
│   ├── versioning.instructions.md    # GitVersion.yml, *.psd1, CHANGELOG.md
│   ├── sampler.instructions.md       # build.yaml, build.ps1, RequiredModules.psd1
│   ├── azurepipelines.instructions.md # azure-pipelines*.yml
│   └── csharp.instructions.md        # *.cs, *.csx
└── Skills/                # Domain knowledge skills (SKILL.md files)
    ├── sampler-framework/
    ├── sampler-migration/
    ├── sampler-build-debug/
    ├── pester-patterns/
    ├── grammar-check/
    ├── agent-customization/          # copilot-skill:// URI
    ├── automatedlab-deployment/
    ├── outlook-email-export/
    └── send-outlook-email/
```

#### VS Code Settings for Cross-Machine Sync
```jsonc
{
  "chat.instructionsFilesLocations": ["~/OneDrive/MyCopilot/Instructions"],
  "chat.agentSkillsLocations": ["~/OneDrive/MyCopilot/Skills"],
  "chat.agentFilesLocations": ["~/OneDrive/MyCopilot/Agents"],
  "chat.promptFilesLocations": ["~/OneDrive/MyCopilot/Prompts"]
}
```

### Azure Instruction (VS Code Extension)

The `azure.instructions.md` file from the `ms-azuretools.vscode-azure-github-copilot` extension is conditionally loaded only when Azure is explicitly mentioned. It provides Azure code generation best practices, deployment guidance, and Azure Functions patterns. Not part of MyCopilot — injected automatically by the extension.

### Agent Modes

The project leverages VS Code agent modes for specialized workflows:

| Mode | Purpose | Key Features |
|------|---------|-------------|
| **technical-writer** | Documentation & article creation | 7-phase workflow (Scope → Research → External Research → Outline → Content → Editing → Publication), citation requirements, quality gates, CRAAP source evaluation, subagent delegation, article templates (tech blog, API docs, newspaper) |
| *(default)* | General development | Standard Copilot Agent Mode capabilities |

### Memory Architecture

The project uses two complementary memory systems:

1. **Memory Bank** (`.memory-bank/`) — Git-tracked, shared project context. Serves as both working context for agents and a teaching artifact for the presentation. Core files: `projectbrief.md`, `productContext.md`, `activeContext.md`, `systemPatterns.md`, `techContext.md`, `progress.md`, `promptHistory.md`.

2. **VS Code Built-in Memory** — Three scopes:
   - `/memories/` — User memory, persistent across all workspaces (first 200 lines auto-loaded)
   - `/memories/session/` — Session-scoped notes (current conversation only)
   - `/memories/repo/` — Repository-scoped facts (local to workspace, not git-tracked)

The Memory Bank is the shared, version-controlled knowledge base. VS Code memory is for personal learnings and session notes.

### Key Deferred Tools

| Tool | Purpose |
|------|--------|
| `fetch_webpage` | Web research for technical-writer mode |
| `github_repo` | Repository metadata and diff calculation |
| `get_changed_files` | Track changes vs default branch |
| `mcp_azure_mcp_search` | Azure resource search (when Azure MCP configured) |