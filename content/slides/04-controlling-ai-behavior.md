# Module 4: Controlling AI Behavior

> *"Luck is what happens when preparation meets opportunity."* — **Seneca**

## Slide 4.1: The Consistency Problem

# Same Prompt, Different Results?

### Without instruction files:

**Request 1**: "Add a validation function"
```powershell
# Result: No tests, no error handling, minimal code
function Validate-Input { 
    param($input) 
    return $input -ne $null 
}
```

**Request 2** (same prompt, later):
```powershell
# Result: Different style, verbose, unexpected approach
Function Validate-Input {
    Param([Parameter(Mandatory=$True)]$InputValue)
    If ($Null -eq $InputValue) { Throw "Input required" }
    Return $True
}
```

### The problem:
- ❌ Inconsistent output
- ❌ Doesn't follow your standards
- ❌ Missing tests
- ❌ You have to repeat instructions

---

## Slide 4.2: The Solution

# Instruction Files

> **Instruction files teach AI your rules ONCE, and they apply to EVERY request.**

```
┌─────────────────────────────────────────────────────────────────┐
│                  INSTRUCTION FILE EFFECT                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   Your Request: "Add a validation function"                    │
│                           │                                     │
│                           ▼                                     │
│   ┌─────────────────────────────────────────┐                  │
│   │       copilot-instructions.md            │                  │
│   │   ─────────────────────────────────     │                  │
│   │   • Always create tests                  │                  │
│   │   • Use try/catch for error handling    │                  │
│   │   • Follow existing patterns            │                  │
│   │   • Include comment-based help          │                  │
│   │   • Run tests before completing         │                  │
│   └─────────────────────────────────────────┘                  │
│                           │                                     │
│                           ▼                                     │
│   AI applies these rules AUTOMATICALLY to every request        │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Slide 4.3: Copilot Instruction Files

# Your AI Configuration Files

GitHub Copilot supports **five types** of instruction files:

| File | Scope | Purpose |
|------|-------|--------|
| `.github/copilot-instructions.md` | Always-on | Project-wide coding standards |
| `.instructions.md` files | File-pattern | Language/framework-specific rules |
| `AGENTS.md` | Always-on | Cross-tool compatible instructions |
| `.agent.md` files | Per-agent | Custom agent personas & tools |
| `CLAUDE.md` | Always-on | Claude Code compatibility |

### Location:
```
📁 YourProject/
├── .github/
│   ├── copilot-instructions.md  ← Always-on project rules
│   ├── instructions/
│   │   ├── powershell.instructions.md  ← applyTo: **/*.ps1
│   │   └── testing.instructions.md    ← applyTo: **/*.Tests.ps1
│   └── agents/
│       ├── refactor.agent.md      ← Custom agent
│       └── documenter.agent.md    ← Custom agent
├── AGENTS.md                    ← Cross-tool instructions
├── src/
└── tests/
```

---

## Slide 4.4: Anatomy of copilot-instructions.md

# What Goes Inside

```markdown
# Project Rules for AI Agent

## Code Standards
- Use approved PowerShell verbs (Get, Set, New, Remove, Test, etc.)
- Always include [CmdletBinding()] on functions
- Use parameter validation attributes
- Follow existing code patterns in the repository

## Testing Requirements  
- Create Pester tests for every new function
- Tests must cover: success path, error path, edge cases
- Run Invoke-Pester before reporting completion
- Aim for minimum 80% code coverage

## Documentation
- Include comment-based help for all public functions
- Document parameters with .PARAMETER
- Include at least one .EXAMPLE

## Error Handling
- Wrap risky operations in try/catch
- Use Write-Error for non-terminating errors
- Use throw for terminating errors
- Always include meaningful error messages

## Git Practices
- Suggest conventional commit messages
- Never commit secrets or credentials
```

---

## Slide 4.5: Rule Categories

# What You Can Control

| Category | Examples |
|----------|----------|
| **Code Style** | Naming conventions, formatting, structure |
| **Testing** | When to create tests, what to cover |
| **Documentation** | Help text, comments, README updates |
| **Error Handling** | Try/catch usage, error messages |
| **Security** | Secrets, credentials, safe practices |
| **Git** | Commit messages, branch conventions |
| **Workflow** | When to ask, when to proceed |
| **Agent Scope** | Which tools agents can use |

### Key insight:
> Write rules for the things you find yourself **repeating** to AI.

---

## Slide 4.6: Before and After

# The Impact of Instruction Files

### WITHOUT copilot-instructions.md:
```powershell
# AI output - minimal, no tests, no help
function Test-Config {
    param($Path)
    if (Test-Path $Path) { 
        Get-Content $Path | ConvertFrom-Json 
    }
}
```

### WITH copilot-instructions.md:
```powershell
<#
.SYNOPSIS
    Validates a configuration file.
.PARAMETER Path
    Path to the configuration file.
.EXAMPLE
    Test-Config -Path ./config.json
#>
function Test-Config {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Path
    )
    
    try {
        if (-not (Test-Path -Path $Path)) {
            throw "Configuration file not found: $Path"
        }
        
        $content = Get-Content -Path $Path -Raw
        $config = $content | ConvertFrom-Json
        
        return $config
    }
    catch {
        Write-Error "Failed to validate config: $_"
        throw
    }
}
```

**Plus**: Tests created automatically!

---

## Slide 4.7: Hierarchy of Instructions

# Priority Order

```
┌─────────────────────────────────────────────────────────────────┐
│                  INSTRUCTION HIERARCHY                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   HIGHEST PRIORITY                                             │
│   ═══════════════                                              │
│                                                                 │
│   1. � Personal instructions (user-level settings)              │
│      └── Your personal preferences                             │
│          Apply across all workspaces                           │
│                                                                 │
│   2. 📁 Repository instructions                                │
│      ├── .github/copilot-instructions.md                       │
│      ├── AGENTS.md                                             │
│      └── .instructions.md files (pattern-matched)              │
│          Project-specific rules, shared via Git                │
│                                                                 │
│   3. 🏢 Organization instructions                               │
│      └── Defined at GitHub org level                           │
│          Company-wide standards                                │
│                                                                 │
│   LOWEST PRIORITY                                              │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Why this matters:
- Team shares project rules via `.github/copilot-instructions.md` in Git
- You keep personal preferences in user-level settings
- Organizations enforce company-wide policies
- Pattern-matched files apply only to relevant code

---

## Slide 4.8: Custom Agents

# Specialized Agent Behaviors

Different tasks need different behaviors:

```
📁 .github/agents/
├── 📄 refactor.agent.md
├── 📄 documenter.agent.md
├── 📄 debugger.agent.md
└── 📄 test-first.agent.md
```

### Example: Software Engineer Agent (Production-Grade)
```markdown
---
name: software-engineer
description: Expert-level agent for production-ready code
model: 'Claude Opus 4.6 (copilot)'
argument-hint: 'Describe the feature, bug fix, or refactoring task'
tools: ['editFiles', 'codebase', 'runTests', 'runCommands',
        'search', 'problems', 'githubRepo', 'fetch']
agents: ['security-reviewer']
handoffs:
  - label: Run Security Review
    agent: security-reviewer
    prompt: Review the code changes above for vulnerabilities.
    send: false
---
# Software Engineer Agent

## Execution Style
- ZERO-CONFIRMATION: Act, don't ask. State what you ARE doing.
- Complete all phases: Analyze → Implement → Test → Verify
- Never return control until the task is 100% complete

## Workflow
1. Read the codebase to understand patterns
2. Plan the implementation
3. Write code following project standards
4. Run all tests and fix failures
5. Hand off to security-reviewer when ready
```

---

## Slide 4.9: Custom Agent Examples

# Specialized Agents with Advanced Features

### Security Reviewer Agent (with Handoff Back)
```markdown
---
name: security-reviewer
description: Validate code for security vulnerabilities and quality
model: 'Claude Opus 4.6 (copilot)'
argument-hint: 'Specify code, files, or scope to audit'
tools: ['codebase', 'search', 'problems', 'runTests', 'fetch']
agents: []
handoffs:
  - label: Fix Issues Found
    agent: software-engineer
    prompt: Fix the security issues identified in the review above.
    send: false
---
# Security Reviewer Agent

## Approach
- ZERO-TRUST: Assume nothing is secure until proven
- Run SAST, dependency audit, secrets scan
- Classify findings by CVSS severity (0.0-10.0)
- Decision: PASS / FAIL / CONDITIONAL
- Hand off to software-engineer for remediation
```

### Refactor Agent (Constrained Scope)
```markdown
---
name: Refactorer
description: Improve code quality without changing functionality
tools: ['editFiles', 'codebase', 'runTests', 'problems']
---
# Refactoring Agent

## Rules
- Never add new features or remove functionality
- Run tests after every change—all must pass
- Explain each refactoring decision
- Make minimal, focused changes
```

### Key Pattern: Agent Handoff Chains
```
Software Engineer ──▶ Security Reviewer ──▶ Production
       ◀────── Fix Issues ──────┘
```
> Agents can reference each other and create **automated review pipelines**.

---

## Slide 4.10: Skills — Domain Knowledge on Demand

# Teach AI When to Use What

Skills are folders containing a `SKILL.md` file with specialized domain knowledge. Copilot **auto-activates** them based on your task.

### Location:
```
📁 .github/skills/
└── 📁 sampler-build-debug/
    └── 📄 SKILL.md
```

### Example: Build Debug Skill
```markdown
---
name: sampler-build-debug
description: >-
  Debug Sampler module builds, Pester test failures, and
  VS Code freezing issues. USE FOR: build errors, Pester
  failures, ModuleBuilder issues. DO NOT USE FOR: new
  features, refactoring, or general PowerShell questions.
---
# Sampler Build Debug Skill

## Common Build Errors
- ModuleBuilder fails when function files have syntax errors
- Pester mock scope issues with InModuleScope
- VS Code freezes during long-running builds: use terminal instead

## Diagnostic Steps
1. Run `build.ps1 -ResolveDependency -Tasks build`
2. Check `output/` directory for compiled module
3. Run `Invoke-Pester -Path tests/ -Output Detailed`
```

### Key difference from Instructions:
> **Instructions** = rules applied to every request  
> **Skills** = knowledge loaded **only when relevant** (triggered by description keywords)

---

## Slide 4.11: Prompt Files — Reusable Templates

# Create Slash Commands for Repeated Tasks

Prompt files (`.prompt.md`) become `/slash` commands in Copilot Chat. Perfect for tasks you run repeatedly.

### Location:
```
📁 .github/prompts/
└── 📄 CodeReview.prompt.md
```

### Example: Code Review Prompt
```markdown
---
name: CodeReview
description: Multi-phase security-focused code review
mode: ask
tools: ['codebase', 'problems', 'search']
---
# Security Code Review

Perform a 3-phase review of the specified code:

## Phase 1: Static Analysis
- Check for injection vulnerabilities
- Scan for hardcoded secrets
- Validate input sanitization

## Phase 2: Logic Review
- Verify error handling completeness
- Check for race conditions
- Validate boundary conditions

## Phase 3: Report
- Classify findings by CVSS severity
- Provide specific remediation steps
- Generate summary table
```

### Usage:
Type `/CodeReview` in Copilot Chat → the template runs with your context.

### Key difference from Agents:
> **Agents** = persistent personas with tools and behaviors  
> **Prompts** = single-use task templates invoked on demand

---

## Slide 4.12: Agent Handoffs & Multi-Agent Pipelines

# Agents That Work Together

Copilot agents can **hand off** to other agents, creating automated workflows:

```yaml
# In software-engineer.agent.md
---
name: software-engineer
tools: ['editFiles', 'runTests', 'codebase']
agents: ['security-reviewer', 'technical-writer']
handoffs:
  - label: Run Security Review
    agent: security-reviewer
    prompt: Review the code changes for vulnerabilities.
  - label: Write Documentation
    agent: technical-writer
    prompt: Document the implementation above.
---
```

### Release Pipeline Pattern:
```
┌─────────────────────────────────────────────────────────────────┐
│                    MULTI-AGENT PIPELINE                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   ┌──────────────┐      ┌──────────────┐      ┌────────────┐  │
│   │  Software     │      │  Security    │      │ Production │  │
│   │  Engineer     │─────▶│  Reviewer    │─────▶│ Deployment │  │
│   │  Agent        │      │  Agent       │      │            │  │
│   └──────────────┘      └──────┬───────┘      └────────────┘  │
│                                 │                               │
│                          FAIL?  │                               │
│                                 ▼                               │
│                          ┌──────────────┐                      │
│                          │ Back to Dev  │                      │
│                          │ "Fix Issues" │                      │
│                          └──────────────┘                      │
│                                                                 │
│   Dev writes code → QA reviews → PASS/FAIL/CONDITIONAL        │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

> **Handoffs** let you build a full software release pipeline with AI agents.

---

## Slide 4.13: The Complete Customization Ecosystem

# Six Types of Copilot Customization

| # | Type | File | When It Activates |
|---|------|------|--------------------|
| 1 | **Project Instructions** | `copilot-instructions.md` | Every chat request |
| 2 | **Pattern-Matched Instructions** | `.instructions.md` | When `applyTo` glob matches |
| 3 | **Custom Agents** | `.agent.md` | When agent is selected |
| 4 | **Skills** | `SKILL.md` (in folders) | Auto-detected by description |
| 5 | **Prompt Files** | `.prompt.md` | When `/command` is typed |
| 6 | **Cross-Tool Instructions** | `AGENTS.md` / `CLAUDE.md` | Always-on |

### Directory Layout:
```
📁 .github/
├── 📄 copilot-instructions.md  ← Always-on rules
├── 📁 instructions/            ← Pattern-matched
│   ├── 📄 powershell.instructions.md
│   └── 📄 testing.instructions.md
├── 📁 agents/                  ← Custom agents
│   ├── 📄 software-engineer.agent.md
│   └── 📄 security-reviewer.agent.md
├── 📁 skills/                  ← Domain knowledge
│   └── 📁 sampler-build-debug/
│       └── 📄 SKILL.md
└── 📁 prompts/                 ← Slash commands
    └── 📄 CodeReview.prompt.md
```

---

## Slide 4.14: Demo - Before/After

# See the Difference

### Demo: Instruction File Impact

**Part 1: Without copilot-instructions.md**
1. Request: "Add a function to parse JSON config"
2. Observe: Minimal output, no tests, basic code

**Part 2: With copilot-instructions.md**
1. Add instruction file with standards
2. Same request: "Add a function to parse JSON config"
3. Observe: Full output with tests, help, error handling

### Key observation:
> Same request. Dramatically different results.

---

## Slide 4.15: Writing Effective Rules

# Best Practices

### DO ✅
```markdown
## Testing Requirements
- Create Pester tests for every new function
- Include tests for: success, failure, edge cases
- Run Invoke-Pester before reporting completion
```
*Specific, actionable, measurable*

### DON'T ❌
```markdown
## Testing
- Make sure to test stuff
- Code should work
```
*Vague, unmeasurable, no guidance*

---

## Slide 4.16: Common Rule Patterns

# Starter Template

```markdown
# [Project Name] AI Rules

## Execution Style
- [How should AI approach tasks?]
- [When should it ask vs proceed?]
- [How should it verify completion?]

## Code Standards
- [Naming conventions]
- [Required patterns]
- [Error handling approach]

## Testing Requirements
- [What tests are required?]
- [Coverage expectations]
- [How to run tests?]

## Documentation
- [Help text requirements]
- [Comment standards]
- [README updates]

## Security
- [What to never include]
- [Sensitive data handling]
- [Authentication patterns]

## Git Practices
- [Commit message format]
- [Branch conventions]
- [When to suggest commits]
```

> Use `/init` in Copilot Chat to auto-generate instructions from your codebase!

---

## Slide 4.17: Team Consistency

# Shared Rules = Shared Standards

```
┌─────────────────────────────────────────────────────────────────┐
│                    TEAM CONSISTENCY                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   Dev A uses AI                 Dev B uses AI                  │
│        │                              │                         │
│        ▼                              ▼                         │
│   ┌──────────┐                 ┌──────────┐                    │
│   │ Reads    │                 │ Reads    │                    │
│   │copilot-  │◄───────────────│copilot-  │                    │
│   │instruc-  │    Same file!   │instruc-  │                    │
│   │tions.md  │                 │tions.md  │                    │
│   └──────────┘                 └──────────┘                    │
│        │                              │                         │
│        ▼                              ▼                         │
│   ┌──────────┐                 ┌──────────┐                    │
│   │Consistent│                 │Consistent│                    │
│   │  Output  │                 │  Output  │                    │
│   └──────────┘                 └──────────┘                    │
│                                                                 │
│   SAME STANDARDS ──▶ SAME CODE QUALITY ──▶ LESS REVIEW CHURN  │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

> Commit `.github/copilot-instructions.md` to Git. Everyone gets the same AI behavior.
> Organizations can also enforce company-wide policies.

---

## Slide 4.18: Key Takeaway

# Customization = AI Training

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│   WITHOUT CUSTOMIZATION          WITH CUSTOMIZATION             │
│                                                                 │
│   • Repeat yourself             • Define once, apply always    │
│   • Inconsistent results        • Consistent quality           │
│   • Generic code                • Project-tailored code        │
│   • Missing tests               • Tests included               │
│   • Each team member different  • Team-wide consistency        │
│   • No org-level control        • Organization policies        │
│   • No reusable workflows       • Slash commands & handoffs    │
│   • One-size-fits-all           • Specialized agents & skills  │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

> **Instruction files, agents, skills, and prompts are how you train AI to work YOUR way.**
> Write your rules once. Get consistent results forever.

---

## Slide 4.19: Prompt Evolution — Same Task, Six Levels

# Your Prompt Quality Shapes the Output

The same task — *"Write a PowerShell function that compares file sizes"* — produces radically different results depending on how you prompt:

| Level | Prompt Addition | What the AI Produces |
|-------|----------------|---------------------|
| **1** | Just the task | A single function in a flat `.ps1` file |
| **2** | + "check instructions and skills" | + Proper `[CmdletBinding()]`, validation, help |
| **3** | + "tests, Sampler scaffolding, be creative" | + Full module, Pester tests, creative additions |
| **4** | + "use the Sampler build script" | + Proper build pipeline (`build.ps1`, `build.yaml`) |
| **5** | + "documentation, memory bank" | + README, comment-based help, `.memory-bank/` |
| **6** | + "follow ALL instructions, use ALL skills" | + Maximum resource utilization |

### The Pattern:
```
Prompt Quality ↑  →  Context Utilization ↑  →  Output Quality ↑
```

### Key Insight:
> You don't need Level 6 if your instructions and skills are well-configured.
> But **knowing how to write an effective prompt** is the difference between
> getting a function and getting a production-ready module.

> **Demo**: See the [Prompt Evolution demo script](../demos/demo-prompt-evolution.md) for a live walkthrough of all six levels.

---

## Speaker Notes - Module 4

### Timing: 30-35 minutes

### Key Points to Emphasize:
1. Instruction files solve the **consistency problem**
2. Write rules for things you find yourself **repeating**
3. Commit `.github/copilot-instructions.md` to Git for **team consistency**
4. Custom agents allow **specialized behaviors**
5. **Skills** give agents domain knowledge, loaded on demand
6. **Prompt files** create reusable `/slash` commands for common tasks
7. **Agent handoffs** enable multi-agent pipelines (Dev → QA → Prod)
8. Use `/init` to auto-generate instructions from your codebase

### Demo Tips:
- Show clear before/after comparison
- Use same request both times for dramatic effect
- Don't spend time on the file syntax — show the result
- Highlight how tests appear automatically with rules
- If time permits, show a `/CodeReview` prompt invocation
- **For extended sessions**: Use the [Prompt Evolution demo](../demos/demo-prompt-evolution.md) to show 6 levels of prompt quality

### Common Questions:
- "Where do I put it?" → `.github/copilot-instructions.md` for project-wide, `.github/instructions/` for pattern-matched
- "How specific should rules be?" → Specific enough to be actionable
- "Can I have multiple files?" → Yes, use `.instructions.md` files with `applyTo` patterns
- "Do rules slow down AI?" → No, they improve quality
- "Does this work with other tools?" → Use `AGENTS.md` for cross-tool compatibility
- "What's the difference between skills and instructions?" → Instructions are rules always applied; skills are domain knowledge loaded only when relevant
- "What's the difference between agents and prompts?" → Agents are persistent personas; prompts are single-use task templates
- "Can agents call other agents?" → Yes, via handoffs in YAML frontmatter — great for release pipelines

### Transition to Module 5:
"Now you can control what AI produces. But how do you know it actually works? That's where automated testing and self-verification come in..."