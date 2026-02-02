# Technical Context - Agentic Coding Presentation

## Technology Stack

### Primary Tools

#### Cline (VS Code Extension)
- **Purpose**: AI coding agent for VS Code
- **Key Features**:
  - Autonomous task execution
  - File system access (read/write/create)
  - Terminal command execution
  - Multi-file context understanding
  - Custom instruction files (.clinerules)
  - Plan/Act modes for controlled workflows
  - MCP (Model Context Protocol) server support
  - Checkpoint/rollback capabilities

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
  - Cline
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
│  ├── 📄 .clinerules            │  "My instructions"         │
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
│              CLINE INSTRUCTION FILE HIERARCHY               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Priority   │  Location              │  Purpose             │
│  ─────────  │  ────────────────────  │  ────────────────    │
│  1 (High)   │  .clinerules/          │  Project-specific    │
│             │  ├── *.md              │  rules & patterns    │
│             │  └── chatmodes/*.md    │  Custom agent modes  │
│                                                             │
│  2 (Medium) │  Global settings       │  User preferences    │
│             │  (Cline extension)     │  & defaults          │
│                                                             │
│  3 (Low)    │  System prompt         │  Base agent          │
│             │  (Built-in)            │  capabilities        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## Demo Environment Requirements

### Minimum Setup
- VS Code (latest)
- Cline extension (latest)
- PowerShell 7.x
- Git
- Pester 5.x
- API key for LLM provider (OpenAI, Anthropic, etc.)

### Recommended Additional Tools
- Windows Terminal
- PSScriptAnalyzer
- GitLens extension
- Oh-My-Posh (for terminal aesthetics)

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
├── .clinerules              # Cline instructions
├── .gitignore
└── README.md
```

### Sample .clinerules Content
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
| VS Code | 1.85+ | IDE |
| Cline | Latest | AI agent |

## API/LLM Considerations

### Supported Providers (for Cline)
- Anthropic Claude (Recommended for coding)
- OpenAI GPT-4
- Azure OpenAI
- Google Gemini
- Local models via Ollama/LM Studio

### Cost Considerations for Presentation
- Estimate token usage for demos
- Have backup API keys
- Consider rate limits during live coding