---
marp: true
theme: default
paginate: true
backgroundColor: #1a1a2e
color: #eaeaea
style: |
  section {
    font-family: 'Segoe UI', Arial, sans-serif;
    font-size: 28px;
  }
  h1 {
    color: #00d4ff;
    font-size: 1.6em;
  }
  h2 {
    color: #00d4ff;
    font-size: 1.3em;
  }
  h3 {
    color: #7dd3fc;
    font-size: 1.1em;
  }
  code {
    background-color: #16213e;
    color: #e2e8f0;
  }
  pre {
    background-color: #16213e;
    border-radius: 8px;
    padding: 16px;
  }
  table {
    font-size: 0.75em;
    margin: 0 auto;
  }
  th {
    background-color: #16213e;
    color: #00d4ff;
  }
  td {
    background-color: #0f172a;
  }
  blockquote {
    border-left: 4px solid #00d4ff;
    color: #94a3b8;
    font-style: italic;
  }
  a {
    color: #38bdf8;
  }
  section.lead h1 {
    font-size: 2.2em;
    text-align: center;
  }
  section.lead h2 {
    text-align: center;
    color: #94a3b8;
  }
  section.lead p {
    text-align: center;
  }
  section.section-divider {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
  }
  section.section-divider h1 {
    font-size: 2.4em;
    margin-bottom: 0.2em;
  }
  section.section-divider h2 {
    color: #94a3b8;
    font-size: 1.2em;
  }
  img[alt~="center"] {
    display: block;
    margin: 0 auto;
  }
  .columns {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1em;
  }
  strong {
    color: #00d4ff;
  }
  em {
    color: #94a3b8;
  }
  footer {
    color: #475569;
    font-size: 0.6em;
  }
---

<!-- _class: lead -->
<!-- _paginate: false -->

# Agentic Coding

## The Future of AI-Assisted Development

*Your Name — Date*

---

<!-- _class: lead -->

# How Do YOU Use AI for Coding Today?

**Quick Poll:**

**A)** Code autocomplete (Copilot, Tabnine)
**B)** Chat assistants (ChatGPT, Claude)
**C)** AI agents (Copilot Agent Mode, Cursor, Claude Code)
**D)** Not yet using AI for coding

---

# AI Coding Has Evolved in Three Waves

| | Wave 1 (2021–22) | Wave 2 (2023–24) | Wave 3 (2025–Now) |
|---|---|---|---|
| **Name** | Autocomplete | Chat Assist | **Agentic Coding** |
| **Interaction** | "Complete this line" | "Answer my question" | "Do this task for me" |
| **Workflow** | Single line suggestions | Copy-paste from chat | Autonomous execution |
| **Who drives** | You type | You paste | AI acts, you review |

---

# Why Agentic Coding Is Possible NOW

### Technology Advances
- **Massive context windows** — 1M+ tokens (Claude Opus 4.6)
- **Advanced reasoning** — Claude Opus 4.6, GPT-5.3-Codex, Gemini 3.1 Pro
- **Native tool use** abilities in LLMs
- **Model Context Protocol (MCP)** as universal standard (Linux Foundation)

### Tooling Advances
- AI agents with **file system access** and **terminal execution**
- **Checkpoint/rollback** systems built into editors
- **Cloud agents** running autonomously (Copilot Coding Agent)
- **Agentic Workflows** in CI/CD (GitHub, Feb 2026)

---

# Understanding the Economics

### What are tokens?
- ~4 characters or ~¾ of a word — both input and output consume them

| Model | Context Window |
|-------|----------------|
| Claude Opus 4.6 | Up to **1M tokens** |
| GPT-5.3-Codex | **256K tokens** |
| Gemini 3.1 Pro | **2M tokens** |

### Why cost matters in agentic workflows
- Each iteration (observe → plan → act → verify) adds token usage
- Cloud agents run autonomously — costs accumulate
- Monitor usage via GitHub settings or Copilot output panel

---

# Real-World Impact

> *"I'm shipping features in hours that used to take days."*

| Metric | Result |
|--------|--------|
| Task completion | **55% faster** (GitHub study) |
| Debugging time | **40% less** (Microsoft study) |
| Enterprise adoption | NVIDIA (40K), Salesforce (20K), Fortune 500+ |

### But also:
- Requires **new skills** (prompting, verification, review)
- Works best for **certain task types**
- Still needs **human oversight** and architectural judgment

---

# Why This Matters to You

### As PowerShell Developers / DevOps Engineers, you already:

- ✅ Work with **structured repositories**
- ✅ Use **version control** (Git)
- ✅ Write **testable code** (Pester)
- ✅ Follow **conventions** (Approved Verbs, etc.)

These practices make agentic coding **even more effective** for you.

---

# Today's Journey

1. **What Makes Coding "Agentic"** — The paradigm shift
2. **The Power of Context** — Why Git is foundational
3. **Controlling AI Behavior** — Instruction files and custom agents
4. **Self-Verification** — How AI validates its own work
5. **Advanced Capabilities** — MCP, checkpoints, agent types
6. **When to Use (and Not Use)** — Good judgment matters
7. **Your Agentic Future** — Getting started

---

<!-- _class: section-divider -->

# Module 1
## What Makes Coding "Agentic"?

---

# Speaking the Same Language

| Term | Definition |
|------|------------|
| **Model** | The underlying LLM that powers AI tools |
| **Agent** | An autonomous AI entity that can plan and execute tasks |
| **Tools** | Capabilities an agent can invoke (file I/O, terminal, search) |
| **Skill** | Domain expertise packaged as a reusable `SKILL.md` file |
| **Instructions** | Rule sets (`.instructions.md`) that govern agent behavior |
| **Token** | Smallest unit of text the model processes (~4 chars) |
| **Context Window** | Maximum tokens a model can consider at once |
| **MCP** | Model Context Protocol — standard for connecting agents to external tools |

---

# What IS an Agent?

| Property | Description |
|----------|-------------|
| **Goals** | Has an objective to accomplish |
| **Context** | Understands its environment |
| **Tools** | Can take actions in the world |
| **Autonomy** | Makes decisions independently |
| **Iteration** | Can refine based on feedback |

> An agentic AI doesn't just **suggest** code — it **writes, tests, and fixes** code autonomously.

---

# Traditional AI vs Agentic AI

### Traditional AI Assistance
```
You ask ──▶ AI suggests in chat ──▶ YOU copy to editor ──▶ YOU run it ──▶ YOU fix bugs
```
**Human does most of the work.**

### Agentic AI Coding
```
You describe ──▶ Agent reads project ──▶ Agent creates files ──▶ Agent runs tests
                                                                       │
                                                                  Pass? ──▶ Done ✅
                                                                       │
                                                                  Fail ──▶ Agent fixes ──▶ Re-test
```
**Agent does most of the work. You review and approve.**

---

# Your Role Changes

| Before (Traditional) | After (Agentic) |
|---------------------|-----------------|
| You **type** code | You **describe** intent |
| You **implement** solutions | You **review** solutions |
| You **run** tests | Agent **runs** tests |
| You **debug** failures | Agent **debugs** failures |
| You **create** files | Agent **creates** files |
| You **drive** | You **supervise** |

> From **typist** to **architect and reviewer**

---

# The Agentic Loop

```
         ┌──────────────────────────────────────┐
         │                                      │
         ▼                                      │
   ┌──────────┐                                 │
   │ OBSERVE  │  Read repo, analyze code        │
   └────┬─────┘                                 │
        ▼                                       │
   ┌──────────┐                                 │
   │   PLAN   │  Decide approach, break steps   │
   └────┬─────┘                                 │
        ▼                                       │
   ┌──────────┐                                 │
   │   ACT    │  Write code, create files       │
   └────┬─────┘                                 │
        ▼                                       │
   ┌──────────┐                                 │
   │  VERIFY  │  Run tests, check errors        │
   └────┬─────┘                                 │
        │                                       │
   Pass ──▶ DONE ✅    Fail ──▶ ITERATE ────────┘
```

---

<!-- _class: section-divider -->

# Module 2
## The Power of Context

---

# Why Context Changes Everything

### Without context, AI produces:
- ❌ Generic code that doesn't fit your project
- ❌ Wrong naming conventions
- ❌ Inconsistent patterns
- ❌ Missing project-specific requirements

### With context, AI produces:
- ✅ Code that matches your existing style
- ✅ Correct naming conventions
- ✅ Consistent with existing patterns
- ✅ Aware of project requirements

> **Context transforms a generic AI into YOUR coding partner.**

---

# Git Gives AI a Brain

| What Git Provides | What AI Learns |
|-------------------|----------------|
| **File Structure** | "This is how code is organized" |
| **Existing Code** | "This is the style and patterns" |
| **Config Files** | "These are the rules and dependencies" |
| **Commit History** | "This is what's been worked on recently" |
| **README** | "This is the project's purpose" |

---

# Repository as Knowledge Base

```
📁 YourProject/
├── 📁 src/
│   ├── 📁 Public/                 → "Exported functions go here"
│   │   ├── Get-Something.ps1
│   │   └── Set-Something.ps1
│   └── 📁 Private/                → "Internal helpers here"
│       └── Initialize-Module.ps1
├── 📁 tests/                      → "Tests mirror src structure"
│   ├── Get-Something.Tests.ps1
│   └── Set-Something.Tests.ps1
├── 📄 copilot-instructions.md     → "AI rules"
├── 📄 YourModule.psd1             → "Module metadata"
├── 📄 README.md                   → "Project purpose"
└── 📄 .gitignore                  → "What to ignore"
```

The agent learns: public vs private locations, naming conventions, module structure.

---

# AI Learns From Your Codebase

```powershell
# Existing function in your project
function Get-UserData {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$UserId
    )
    try {
        # Implementation
    }
    catch {
        Write-Error "Failed to get user data: $_"
        throw
    }
}
```

### Agent observes patterns:
✅ `[CmdletBinding()]` · ✅ `[Parameter(Mandatory)]` · ✅ `[ValidateNotNullOrEmpty()]`
✅ try/catch · ✅ `Write-Error` before throw

**New code will match these patterns!**

---

# README Provides Purpose

```markdown
# ConfigValidator Module
A PowerShell module for validating configuration files
against defined schemas.

## Features
- JSON schema validation
- YAML configuration support
- Custom validation rules
- Detailed error reporting
```

### What the agent learns:
- This is a **validation** module → functions should validate
- Works with **JSON and YAML** → use those formats
- **Detailed error reporting** → verbose errors expected
- Naming pattern: `Test-*`, `Validate-*`

> Your README isn't just documentation — it's **AI context**.

---

# Git Provides Traceability

### You always know what AI changed:

```diff
diff --git a/source/Public/Test-ConfigFile.ps1
new file mode 100644
+function Test-ConfigFile {
+    [CmdletBinding()]
+    param(
+        [Parameter(Mandatory)]
+        [string]$Path,
+        [Parameter(Mandatory)]
+        [string]$SchemaPath
+    )
+    # ... implementation
+}
```

- Every line added, modified, or deleted — **visible**
- No hidden changes
- **Full accountability**

---

# Checkpoint System — Rollback When Needed

```
Time ─────────────────────────────────────────────▶

  ●──────────●──────────●──────────●──────────●
  │          │          │          │          │
Start    Feature     Tests      Oops!     Working
         Added      Added      Broken     Again

              ↑
              └── "I don't like this" → ROLLBACK HERE
```

You're **never stuck**. You can always go back.

---

# Commit Strategies for AI Work

| Strategy | Example |
|----------|---------|
| **Conventional Commits** | `feat(validation): add config validation 🤖` |
| **Branch Strategy** | `main → feature/add-validation → ai/config-validation` |
| **Co-authored** | `Co-authored-by: AI Assistant <ai@example.com>` |

---

# Maximize AI Effectiveness

### DO ✅
- **Work in Git repos** — always initialize Git first
- **Meaningful structure** — organize files logically
- **Good README** — explain project purpose
- **Consistent patterns** — AI learns from consistency
- **Descriptive names** — files and functions

### DON'T ❌
- Work outside Git — no context, poor results
- Random file locations — confuses AI
- Skip README — AI needs to understand purpose
- Mix styles — inconsistency → inconsistent output

---

<!-- _class: section-divider -->

# Module 3
## Controlling AI Behavior

---

# The Consistency Problem

### Without instruction files — same prompt, different results:

**Request 1:**
```powershell
function Validate-Input { param($input) return $input -ne $null }
```
*Minimal, no tests, no error handling*

**Request 2** (same prompt, later):
```powershell
Function Validate-Input {
    Param([Parameter(Mandatory=$True)]$InputValue)
    If ($Null -eq $InputValue) { Throw "Input required" }
    Return $True
}
```
*Different style, verbose, inconsistent*

---

# Instruction Files — The Solution

> **Define your rules ONCE, apply to EVERY request.**

```
   Your Request: "Add a validation function"
                         │
                         ▼
          ┌─────────────────────────────────────┐
          │    copilot-instructions.md           │
          │    ──────────────────────────        │
          │    • Always create tests             │
          │    • Use try/catch error handling     │
          │    • Follow existing patterns         │
          │    • Include comment-based help       │
          │    • Run tests before completing      │
          └─────────────────────────────────────┘
                         │
                         ▼
          AI applies these rules AUTOMATICALLY
```

---

# Five Types of Copilot Instruction Files

| File | Scope | Purpose |
|------|-------|---------|
| `.github/copilot-instructions.md` | Always-on | Project-wide coding standards |
| `.instructions.md` files | File-pattern | Language/framework-specific rules |
| `AGENTS.md` | Always-on | Cross-tool compatible instructions |
| `.agent.md` files | Per-agent | Custom agent personas & tools |
| `CLAUDE.md` | Always-on | Claude Code compatibility |

```
📁 YourProject/
├── .github/
│   ├── copilot-instructions.md      ← Always-on project rules
│   ├── instructions/
│   │   ├── powershell.instructions.md  ← applyTo: **/*.ps1
│   │   └── testing.instructions.md     ← applyTo: **/*.Tests.ps1
│   └── agents/
│       ├── refactor.agent.md        ← Custom agent
│       └── documenter.agent.md      ← Custom agent
└── AGENTS.md                        ← Cross-tool instructions
```

---

# What Goes Inside copilot-instructions.md

```markdown
# Project Rules for AI Agent

## Code Standards
- Use approved PowerShell verbs (Get, Set, New, Remove, Test)
- Always include [CmdletBinding()] on functions
- Use parameter validation attributes
- Follow existing code patterns

## Testing Requirements
- Create Pester tests for every new function
- Cover: success path, error path, edge cases
- Run Invoke-Pester before reporting completion
- Do not finish until all tests pass

## Error Handling
- Wrap risky operations in try/catch
- Use Write-Error for non-terminating errors
- Use throw for terminating errors
- Include meaningful error messages
```

---

# Before and After Instruction Files

### WITHOUT copilot-instructions.md
```powershell
function Test-Config {
    param($Path)
    if (Test-Path $Path) { Get-Content $Path | ConvertFrom-Json }
}
```
*Minimal, no tests, no help*

### WITH copilot-instructions.md
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
        if (-not (Test-Path -Path $Path)) { throw "File not found: $Path" }
        Get-Content -Path $Path -Raw | ConvertFrom-Json
    }
    catch { Write-Error "Failed to validate config: $_"; throw }
}
```
**Plus**: Tests created automatically!

---

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

> Write rules for things you find yourself **repeating** to AI.

---

# Priority Order

| # | Level | Source |
|---|-------|--------|
| 1 | **Highest** | Personal instructions (user-level settings) |
| 2 | | Repository instructions (`copilot-instructions.md`, `AGENTS.md`) |
| 3 | | Pattern-matched instructions (`.instructions.md` with `applyTo`) |
| 4 | **Lowest** | Organization instructions (GitHub org level) |

- Team shares project rules via Git
- You keep personal preferences in user settings
- Organizations enforce company-wide policies

---

# Custom Agents — Specialized Behaviors

```markdown
---
name: software-engineer
description: Expert-level agent for production-ready code
tools: ['editFiles', 'codebase', 'runTests', 'runCommands',
        'search', 'problems', 'githubRepo', 'fetch']
agents: ['security-reviewer']
handoffs:
  - label: Run Security Review
    agent: security-reviewer
    prompt: Review the code changes for vulnerabilities.
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

# Agent Handoff Chains

Agents can reference each other and create **automated review pipelines**:

```
Software Engineer ──▶ Security Reviewer ──▶ Production
       ◀────── Fix Issues ──────┘
```

### Security Reviewer Agent
```markdown
---
name: security-reviewer
description: Validate code for security vulnerabilities
tools: ['codebase', 'search', 'problems', 'runTests']
handoffs:
  - label: Fix Issues Found
    agent: software-engineer
    prompt: Fix the security issues identified above.
---
# Security Reviewer Agent
- ZERO-TRUST: Assume nothing is secure until proven
- Classify findings by CVSS severity
- Decision: PASS / FAIL / CONDITIONAL
```

---

# Skills — Domain Knowledge on Demand

Skills are `SKILL.md` files with specialized knowledge. Copilot **auto-activates** them based on your task.

```markdown
---
name: sampler-build-debug
description: >-
  Debug Sampler module builds and Pester test failures.
  USE FOR: build errors, Pester failures, ModuleBuilder issues.
  DO NOT USE FOR: new features, refactoring.
---
# Sampler Build Debug Skill

## Common Build Errors
- ModuleBuilder fails when function files have syntax errors
- Pester mock scope issues with InModuleScope
- VS Code freezes during builds: use terminal instead

## Diagnostic Steps
1. Run build.ps1 -ResolveDependency -Tasks build
2. Check output/ directory for compiled module
3. Run Invoke-Pester -Path tests/ -Output Detailed
```

**Key difference**: Instructions = always-on rules · Skills = loaded **only when relevant**

---

# Prompt Files — Reusable Slash Commands

`.prompt.md` files become `/slash` commands in Copilot Chat:

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

## Phase 2: Logic Review
- Verify error handling completeness
- Check for race conditions

## Phase 3: Report
- Classify findings by CVSS severity
- Provide remediation steps
```

Type `/CodeReview` in Copilot Chat → the template runs with your context.

---

# The Complete Customization Ecosystem

| # | Type | File | When It Activates |
|---|------|------|--------------------|
| 1 | **Project Instructions** | `copilot-instructions.md` | Every request |
| 2 | **Pattern-Matched** | `.instructions.md` | When `applyTo` glob matches |
| 3 | **Custom Agents** | `.agent.md` | When agent is selected |
| 4 | **Skills** | `SKILL.md` | Auto, when task matches description |
| 5 | **Prompt Templates** | `.prompt.md` | When `/command` is invoked |
| 6 | **Cross-Tool** | `AGENTS.md` / `CLAUDE.md` | Always-on (tool-specific) |

---

<!-- _class: section-divider -->

# Module 4
## Trust but Verify — Automated Testing

---

# Can You Trust AI-Generated Code?

### The honest answer:
> **Not blindly. But you can verify it.**

### AI can produce code that:
- ✅ Looks correct
- ✅ Follows patterns
- ✅ Has proper syntax

But also:
- ❌ Has subtle bugs
- ❌ Misses edge cases
- ❌ Doesn't handle errors well

> **Automated tests let AI verify its own work.**

---

# The Self-Verification Loop

```
   Request: "Add input validation function"
                    │
                    ▼
   1. Agent writes the function
                    │
                    ▼
   2. Agent writes comprehensive tests
                    │
                    ▼
   3. Agent runs: Invoke-Pester
                    │
           ┌───────┴───────┐
           │               │
       All Pass        Some Fail
           │               │
           ▼               ▼
     Done ✅         4. Agent analyzes failure
                           │
                           ▼
                     5. Agent fixes code
                           │
                           └──▶ Go to step 3
```

---

# Tests Are Executable Specifications

### Without tests:
```
Agent: "I wrote a function that validates email addresses."
You:   "Does it work?"
Agent: "I think so." 🤷
```

### With tests:
```
Agent: "I wrote a function that validates email addresses."
Agent: "Running tests..."
Agent: "5 tests passed: valid emails, invalid emails,
        empty input, null input, special characters."
Agent: "It works. Here's proof." ✅
```

> Tests transform **"I think it works"** into **"I proved it works."**

---

# Comprehensive Coverage

| Test Type | Purpose |
|-----------|---------|
| **Success Path** | Happy path works correctly |
| **Error Path** | Errors handled properly |
| **Edge Cases** | Boundaries and limits work |
| **Null/Empty** | Handles missing input |
| **Invalid Input** | Rejects bad data |
| **Return Values** | Outputs correct data |

```powershell
Describe 'Test-EmailAddress' {
    Context 'Valid Emails' {
        It 'Returns true for standard email' { }
        It 'Returns true for email with subdomain' { }
    }
    Context 'Invalid Emails' {
        It 'Returns false for missing @' { }
        It 'Returns false for missing domain' { }
    }
    Context 'Edge Cases' {
        It 'Handles null input gracefully' { }
        It 'Handles empty string' { }
    }
}
```

---

# Self-Correction in Action

### Attempt 1:
```
Agent: Writing Test-EmailAddress...
Agent: Running tests...
Result: 4 passed, 1 failed ❌
Failed: "Handles null input gracefully"
```

### Agent analyzes:
> "The function throws when input is null. Need to add null check."

### Attempt 2:
```
Agent: Fixed — added null parameter validation
Agent: Running tests...
Result: 5 passed, 0 failed ✅
```

**This happens automatically.** You receive working code.

---

# Enabling Self-Verification

### Add to your copilot-instructions.md:

```markdown
## Testing Requirements
- Create Pester tests for every new function
- Tests in corresponding tests/ directory
- File naming: [FunctionName].Tests.ps1

### What to Test
- Success path, error path, edge cases
- Null and empty inputs
- Parameter validation
- Error messages

### Verification
- Run Invoke-Pester after writing code
- Do not report completion until all tests pass
- If tests fail, fix code and re-run
- Report final test results to user
```

---

# Test-First with AI

### Traditional: Code First
```
1. Write function → 2. Write tests → 3. Run tests → 4. Fix issues
```

### Test-First: Tests as Specifications
```
1. Write tests → 2. Write function to pass them → 3. Tests pass ✅
```

### Prompt:
> "Write Pester tests for a function that validates Azure resource IDs.
> Include tests for valid IDs, invalid formats, null input, and empty strings.
> Then implement the function to pass those tests."

---

# Beyond Pester — Additional Verification

### Linting with PSScriptAnalyzer:
```markdown
## In copilot-instructions.md:
- Run Invoke-ScriptAnalyzer after writing code
- Fix any warnings before completing
```

### Agent self-corrects lint issues:
```
Agent: Running PSScriptAnalyzer...
Warning: Avoid using Write-Host
Agent: Fixing — changing to Write-Output
Agent: Running PSScriptAnalyzer... No issues found ✅
```

---

# Trust Hierarchy

| Layer | Who Does It | What It Checks |
|-------|-------------|----------------|
| 1. **Syntax Check** | Agent | Code runs |
| 2. **Unit Tests** | Agent | Behavior correct |
| 3. **Linting** | Agent | Style correct |
| 4. **Code Review** | **You** | Logic correct? |
| 5. **Approve & Commit** | **You** | Accept changes |

Agent handles layers 1–3 **automatically**.
You handle layers 4–5 with **full visibility** via `git diff`.

---

<!-- _class: section-divider -->

# Module 5
## Advanced Capabilities

---

# MCP — The Universal Connector

### Without MCP, your agent can:
- ✅ Read files in workspace
- ✅ Run terminal commands
- ✅ Search code

### Without MCP, your agent **cannot**:
- ❌ Query a database
- ❌ Call a REST API
- ❌ Check Azure resource status
- ❌ Search GitHub issues

> **MCP (Model Context Protocol)** gives agents a standardized way
> to connect to external tools, data sources, and services.

---

# How MCP Works

```
  ┌──────────────┐           ┌──────────────────┐
  │  AI Agent    │           │  MCP Server      │
  │  (Copilot)   │◀── MCP ──▶│  (local/remote)  │
  └──────────────┘           └────────┬─────────┘
                                      │
                                      ▼
                            ┌──────────────────┐
                            │ External Service │
                            │ • Database       │
                            │ • REST API       │
                            │ • Cloud provider │
                            │ • Git platform   │
                            └──────────────────┘
```

- **Open standard** — now under the Linux Foundation
- **Works across tools** — Copilot, Claude Code, Cursor all support MCP
- **Growing ecosystem** — hundreds of MCP servers available
- Think of it as **"USB for AI tools"**

---

# MCP in VS Code

```json
// .vscode/mcp.json
{
  "servers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "${input:ghToken}"
      }
    },
    "sqlite": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sqlite",
               "--db-path", "./data/inventory.db"]
    }
  }
}
```

Agent discovers tools automatically → calls them during tasks → you approve calls.

---

# MCP Use Cases

| MCP Server | What It Provides | Example |
|------------|-----------------|---------|
| **GitHub** | Issues, PRs, repos | "Find all open bug issues" |
| **Azure** | Resource management | "Check App Service status" |
| **SQLite** | Database queries | "Show today's signups" |
| **Fetch** | Web content | "Get the API docs from this URL" |
| **Docker** | Container mgmt | "List running containers" |
| **Playwright** | Browser automation | "Screenshot the test page" |

### PowerShell example:
> "Query the CMDB database for all prod servers and generate a DSC config"

MCP turns your agent from **"code assistant"** into **"operations assistant"**.

---

# MCP Security Considerations

### MCP servers CAN:
- Read/write databases
- Make network requests on your behalf
- Access services with your credentials

### Safeguards:
- Tool approval prompts (you approve each call)
- Scoped credentials (least privilege tokens)
- Local execution (most servers run on your machine)
- Open source (inspect what the server does)

### Best Practices:
- ✅ Use read-only tokens where possible
- ✅ Review MCP server source before installing
- ✅ Never use production credentials in dev
- ✅ Start with "Ask always" tool approval

> **Golden rule**: Give MCP servers the **minimum permissions** needed.

---

# Checkpoints & Rollback

Copilot Agent Mode creates **checkpoints** automatically:

```
──●────────●────────●────────●────────●────────●──▶ time
  │        │        │        │        │        │
Start   Created  Modified  Added   Deleted   Broke
        file A   file B    tests   old file  something

🔙 "Undo last 3 changes" → restored to after "Modified file B"
```

| Action | How |
|--------|-----|
| View checkpoints | Click checkpoint icon in chat |
| Compare changes | Hover to see diff |
| Rollback | Click "Undo" to restore |
| Selective undo | Undo specific files, keep others |

> Checkpoints give you confidence to let agents take **bigger steps**.

---

# Multi-File Operations

### Example: Renaming `Get-ServerInfo` → `Get-ServerHealth`

| File Changed | What Changed |
|-------------|-------------|
| `Public/Get-ServerInfo.ps1` | → Renamed file + updated function name |
| `DemoModule.psd1` | → Updated FunctionsToExport |
| `Tests/Get-ServerInfo.Tests.ps1` | → Renamed file + updated all blocks |
| `README.md` | → Updated usage examples |
| `docs/Get-ServerInfo.md` | → Renamed and updated |

**Total**: 5 files changed, 0 missed references ✅

Agent uses **search** to find all references, then **tests** to verify nothing broke.

---

# Agent Types

| Type | Where It Runs | Best For |
|------|--------------|----------|
| **Agent Mode** | VS Code (local) | Interactive coding tasks |
| **Plan Mode** | VS Code (local) | Planning before acting |
| **Ask Mode** | VS Code (local) | Read-only analysis |
| **Background** | Separate worktree | Long-running tasks |
| **Cloud Agent** | GitHub infrastructure | Issues → PRs automatically |
| **Third-party** | VS Code extensions | Specialized workflows |

---

# Cloud Agent Workflow

```
1. You create a GitHub Issue:
   "Add retry logic to Get-ApiData function"
                    │
                    ▼
2. Assign to Copilot (or CLI: gh copilot agent --issue 42)
                    │
                    ▼
3. Cloud agent works autonomously:
   • Reads repo + instructions
   • Plans implementation
   • Writes code + tests
   • Runs CI pipeline
   • Creates Pull Request
                    │
                    ▼
4. You review the PR normally
   • Read diff, check tests
   • Request changes or approve
   • Merge when satisfied
```

---

# The Horizon — What's Coming

| Capability | Status | Impact |
|------------|--------|--------|
| **Longer autonomous sessions** | Emerging | Bigger tasks without check-ins |
| **Multi-agent collaboration** | Available | Dev → QA → Docs handoffs |
| **CI/CD integration** | Preview | Agents triggered by pipeline events |
| **Domain-specific agents** | Growing | Specialized for IaC, security, testing |
| **Agentic workflows** | Preview | Markdown-defined CI/CD with AI decisions |

### What stays the same:
- **You** define what to build
- **You** review what was built
- **Git** provides traceability
- **Tests** provide verification

---

<!-- _class: section-divider -->

# Module 6
## When to Use (and Not Use) Agentic AI

---

# Where Agentic Coding Excels ✅

| Task Type | Why It Works |
|-----------|-------------|
| **Boilerplate / Scaffolding** | Repetitive, well-defined patterns |
| **Test Generation** | Systematic, verifiable |
| **Documentation** | Reading code → generating help |
| **Refactoring** | Pattern-based transformations |
| **CRUD Operations** | Standard patterns, predictable |
| **Config Files** | Template-based, format-specific |
| **Build Scripts** | Common patterns, platform-specific |

> Common thread: **well-defined tasks with verifiable outcomes**.

---

# Where to Be Careful ⚠️

| Task Type | Why Caution Needed |
|-----------|-------------------|
| **Complex Business Logic** | AI may misunderstand requirements |
| **Performance-Critical** | May not optimize correctly |
| **Security-Sensitive** | Subtle vulnerabilities possible |
| **Integration Code** | External systems are unpredictable |
| **Legacy Systems** | Context may be incomplete |

### Mitigation:
- Extra review time
- More specific prompts
- Smaller increments
- More comprehensive testing

---

# Security-Sensitive Code ⚠️

### Risks with AI-generated code:
- Improper input validation
- Missing authentication checks
- Insecure default configurations
- Exposed sensitive data

### Add to your copilot-instructions.md:
```markdown
## Security Rules
- Never hardcode credentials or secrets
- Always validate and sanitize input
- Use parameterized queries for databases
- Implement proper authentication checks
- Follow principle of least privilege
```

### Always: security review, run scanners, test auth paths, verify secret handling.

---

# Agent Security & Boundaries

### What agents CAN do:
- Read/write files in workspace
- Execute terminal commands
- Install packages
- Access MCP servers

### Safeguards that exist:
- Tool approval prompts
- Terminal sandboxing
- Checkpoint/rollback for undo
- Commands require user confirmation

### How to restrict:
- Set tool approval to "Ask always"
- Limit terminal access in VS Code settings
- Use `.gitignore` to hide sensitive files
- Define security rules in copilot-instructions.md
- Restrict MCP server permissions

---

# The Cardinal Rule

> Even when it looks like programming is no longer required, **understanding the underlying code remains essential**.

| Without Understanding | With Understanding |
|----------------------|--------------------|
| Can't review AI output | Catch errors and vulnerabilities |
| Can't debug failures | Know where to look |
| Can't make design decisions | Guide AI better |
| Blind trust | Informed trust |

> **You are the pilot. AI is the autopilot. You still need to know how to fly.**

---

# When to Avoid ❌

| Scenario | Why Not |
|----------|---------|
| **Code you don't understand** | Can't review effectively |
| **No way to verify results** | Can't test = can't trust |
| **High-stakes first attempt** | Production without testing |
| **Highly novel problems** | No patterns to learn from |
| **Compliance-critical without review** | Regulatory requirements |

> **If you can't verify it, don't generate it.**

---

# Decision Framework

### Ask yourself:

1. **Can I verify the result?**
   No → Don't use AI generation

2. **Do I understand the domain well enough to review?**
   No → Learn first, or get expert review

3. **Is this security or safety critical?**
   Yes → Extra review, smaller chunks

4. **Are there established patterns to follow?**
   No → Be very specific, expect more iteration

5. **Can I break this into testable pieces?**
   Yes → Proceed with agentic workflow ✅

---

# The Human Role Remains

### You are NOT replaced. Your role shifts:

| Role | Responsibility |
|------|---------------|
| **Architect** | Define what to build, make design decisions |
| **Reviewer** | Evaluate generated code, check correctness |
| **Judge** | Decide when to use AI, know your limits |
| **Owner** | Responsible for code quality, accountable for outcomes |

> **"AI wrote it" is not an excuse.** You commit it, you own it.

---

<!-- _class: section-divider -->

# Module 7
## Your Agentic Future

---

# What We've Learned

| # | Concept | Key Insight |
|---|---------|-------------|
| 1 | **Agentic Coding** | AI that plans, executes, and verifies autonomously |
| 2 | **Context is Power** | Git gives AI understanding and you traceability |
| 3 | **Instruction Files** | copilot-instructions.md teaches AI your rules |
| 4 | **Custom Agents** | Specialized behaviors with handoffs |
| 5 | **Skills & Prompts** | On-demand knowledge + reusable commands |
| 6 | **Self-Verification** | Automated testing lets AI prove its work |
| 7 | **Judgment Matters** | Know when to use it and when to be careful |

---

# Can You Answer These?

**1. What is agentic coding?**
> AI that autonomously executes multi-step tasks: plan, act, verify, iterate.

**2. Why does Git matter for AI?**
> Context (structure, patterns) + Traceability (what changed).

**3. How do I control AI behavior?**
> Instruction files, custom agents, skills, prompt templates, handoffs.

**4. How can I trust AI-generated code?**
> Automated testing + human review.

**5. When should I use agentic coding?**
> For well-defined tasks where you can verify results.

---

# Getting Started — Week 1

### Setup
```
□ Enable Copilot Agent Mode in VS Code
□ Enable recommended settings:
  - chat.includeApplyingInstructions: true
  - chat.includeReferencedInstructions: true
  - github.copilot.chat.agent.thinkingTool: true
  - github.copilot.chat.search.semanticTextResults: true
□ Create your first .github/copilot-instructions.md
□ Try the /init command to auto-generate instructions
□ Try one simple task in Agent mode
```

---

# Getting Started — Weeks 2–3

### Week 2: Practice
```
□ Use agentic workflow on a real (low-risk) task
□ Create a .instructions.md file for your language
□ Create a custom agent (.agent.md) for a common workflow
□ Create a prompt file (.prompt.md) for a repeated task
□ Watch the self-verification loop in action
```

### Week 3: Integrate
```
□ Add copilot-instructions.md to a team project
□ Share custom agents with colleagues
□ Try agent handoffs (Dev → Security Review)
□ Try background or cloud agent
□ Establish team conventions for AI use
```

---

# Your First copilot-instructions.md

### Start Simple (Version 1):
```markdown
# Project Rules
## Testing
- Create Pester tests for new functions
- Run Invoke-Pester before completion
## Code Style
- Use [CmdletBinding()] on all functions
- Include error handling
```

### Iterate (Version 2 — after experience):
```markdown
# Project Rules
## Testing
- Create Pester tests for new functions
- Cover success, failure, edge cases
- Do not finish until all tests pass
## Code Style
- Use [CmdletBinding()] on all functions
- Include [Parameter()] attributes
- Include comment-based help with examples
## Error Handling
- Use try/catch for risky operations
- Provide meaningful error messages
```

> **Tip**: Use `/init` in chat to auto-generate a starting point!

---

# Cross-Machine Customization Sync

VS Code lets you redirect customizations to a synced folder (e.g., OneDrive):

```powershell
# Point all 4 customization types to OneDrive
$settings = @{
    'chat.agentFilesLocations'        = @{ '~/OneDrive/MyCopilot/Agents' = $true }
    'chat.instructionsFilesLocations'  = @{ '~/OneDrive/MyCopilot/Instructions' = $true }
    'chat.agentSkillsLocations'       = @{ '~/OneDrive/MyCopilot/Skills' = $true }
    'chat.promptFilesLocations'       = @{ '~/OneDrive/MyCopilot/Prompts' = $true }
}
```

Write an agent once, use it on **every machine**.
OneDrive syncs Instructions, Agents, Skills, and Prompts automatically.

---

# Suggested Starting Points

### Easy Wins:
- Generate Pester tests for an existing function
- Add comment-based help to undocumented code
- Create module scaffolding from scratch
- Refactor a function to add error handling

### Example Prompt to Try:
> "I have a PowerShell function called Get-ServerStatus.
> Generate comprehensive Pester tests covering valid server names,
> invalid server names, unreachable servers, null and empty inputs."

Expected outcome: **working tests in minutes**, verified by the agent.

---

# Resources

### GitHub Copilot
- **Agent Mode**: code.visualstudio.com/docs/copilot/agents/overview
- **Custom Instructions**: code.visualstudio.com/docs/copilot/customization/custom-instructions
- **Custom Agents**: code.visualstudio.com/docs/copilot/customization/custom-agents
- **Coding Agent (Cloud)**: docs.github.com/copilot/using-github-copilot/using-copilot-coding-agent

### Alternative Tools
- **Cursor** (cursor.com) · **Windsurf** (windsurf.com) · **Claude Code** (code.claude.com)

### Model Context Protocol
- **Spec**: modelcontextprotocol.io
- **Servers**: github.com/modelcontextprotocol/servers

---

# You + AI > You Alone

| Your Expertise | AI Capabilities |
|----------------|-----------------|
| Domain knowledge | Speed of execution |
| Design judgment | Pattern recognition |
| Quality standards | Comprehensive testing |
| Review capability | Tireless iteration |

### = 10x Productivity
*Better code, faster delivery, less tedium*

---

<!-- _class: lead -->

# Thank You!

### Key Takeaways

1. **Agentic coding** = AI that acts, not just suggests
2. **Git** = Context + Traceability
3. **Instruction files** = Consistent quality
4. **Custom agents** = Specialized behaviors
5. **Automated testing** = AI proves its work
6. **Your judgment** = Still essential

> **Start small. Build confidence. Transform your workflow.**

---

<!-- _class: lead -->

# Questions?

*[Your Contact Info]*
*[Your Email]*
*[Materials Download Link]*