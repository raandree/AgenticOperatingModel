---
marp: true
theme: default
paginate: true
backgroundColor: #ffffff
color: #1e293b
style: |
  /* ---------- Base ---------- */
  section {
    font-family: 'Segoe UI', Arial, sans-serif;
    font-size: 24px;
    background-color: #ffffff;
    color: #1e293b;
  }
  h1 {
    color: #0c4a6e;
    font-size: 1.5em;
    margin-bottom: 0.3em;
    border-bottom: 3px solid #0284c7;
    padding-bottom: 0.15em;
  }
  h2 {
    color: #0369a1;
    font-size: 1.3em;
  }
  h3 {
    color: #0f172a;
    font-size: 1.05em;
    margin-top: 0.3em;
    margin-bottom: 0.2em;
  }
  p, li {
    color: #1e293b;
  }
  strong {
    color: #0c4a6e;
    font-weight: 700;
  }
  em {
    color: #475569;
  }
  a {
    color: #0284c7;
    text-decoration: underline;
  }

  /* ---------- Code ---------- */
  code {
    background-color: #f1f5f9;
    color: #0f172a;
    padding: 0.1em 0.3em;
    border-radius: 4px;
    font-family: 'Cascadia Code', 'Consolas', 'Courier New', monospace;
  }
  pre {
    background-color: #f8fafc;
    color: #0f172a;
    border: 1px solid #cbd5e1;
    border-left: 4px solid #0284c7;
    border-radius: 6px;
    padding: 12px;
    font-size: 0.9em;
  }
  pre code {
    background-color: transparent;
    color: #0f172a;
    padding: 0;
  }

  /* ---------- Tables ---------- */
  table {
    font-size: 0.75em;
    margin: 0 auto;
    border-collapse: collapse;
    border: 1px solid #cbd5e1;
  }
  th {
    background-color: #0c4a6e;
    color: #ffffff;
    padding: 6px 10px;
    border: 1px solid #0c4a6e;
    text-align: left;
  }
  td {
    background-color: #ffffff;
    color: #1e293b;
    padding: 6px 10px;
    border: 1px solid #cbd5e1;
  }
  tr:nth-child(even) td {
    background-color: #f8fafc;
  }

  /* ---------- Blockquotes ---------- */
  blockquote {
    border-left: 4px solid #0284c7;
    background-color: #f0f9ff;
    color: #0c4a6e;
    font-style: italic;
    padding: 0.5em 0.8em;
    margin: 0.5em 0;
    border-radius: 0 4px 4px 0;
  }
  blockquote strong {
    color: #0c4a6e;
  }

  /* ---------- Lead slide ---------- */
  section.lead {
    background: linear-gradient(135deg, #ffffff 0%, #e0f2fe 100%);
  }
  section.lead h1 {
    font-size: 2.2em;
    text-align: center;
    color: #0c4a6e;
    border-bottom: none;
  }
  section.lead h2 {
    text-align: center;
    color: #475569;
  }
  section.lead h3 {
    text-align: center;
    color: #0369a1;
  }
  section.lead p {
    text-align: center;
    color: #334155;
  }

  /* ---------- Section divider ---------- */
  section.section-divider {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    background: linear-gradient(135deg, #0c4a6e 0%, #0369a1 100%);
    color: #ffffff;
  }
  section.section-divider h1 {
    font-size: 2.4em;
    margin-bottom: 0.2em;
    color: #ffffff;
    border-bottom: none;
  }
  section.section-divider h2 {
    color: #bae6fd;
    font-size: 1.2em;
  }
  section.section-divider blockquote {
    background-color: rgba(255, 255, 255, 0.1);
    border-left: 4px solid #bae6fd;
    color: #e0f2fe;
  }

  /* ---------- Layout helpers ---------- */
  img[alt~="center"] {
    display: block;
    margin: 0 auto;
  }
  .columns {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1em;
  }
  footer {
    color: #64748b;
    font-size: 0.6em;
  }
  section::after {
    color: #64748b;
  }

  /* ---------- Dense slide variant ---------- */
  section.dense {
    font-size: 20px;
  }
  section.dense h1 {
    font-size: 1.4em;
    margin-bottom: 0.2em;
  }
  section.dense h3 {
    font-size: 1.0em;
    margin-top: 0.2em;
    margin-bottom: 0.1em;
  }
  section.dense pre {
    padding: 8px;
    font-size: 0.85em;
  }
  section.dense blockquote {
    margin-top: 0.3em;
    margin-bottom: 0.3em;
  }
---
---

<!-- _class: lead -->
<!-- _paginate: false -->

# The Agentic Operating Model

## Versioned, AI-Agent-Assisted Work for Code, Operations, Research & Correspondence

> *"Die Geister, die ich rief, werd' ich nun nicht los."*
> *"The spirits that I summoned, I now cannot rid myself of."*
> — **Johann Wolfgang von Goethe**, *Der Zauberlehrling*

---

<!-- _class: lead -->

# How Do YOU Use AI in Your Work Today?

**Quick Poll:**

**A)** Code autocomplete (Copilot, Tabnine)
**B)** Chat assistants (ChatGPT, Claude) for code, scripts, or documents
**C)** AI agents that act on files and systems (Copilot Agent Mode, Cursor, Claude Code)
**D)** Not yet using AI at all

> **Whatever you build** — code, runbooks, reports, case files — **this talk is for you.**

---

# AI Has Evolved in Three Waves

| | Wave 1 (2021–22) | Wave 2 (2023–24) | Wave 3 (2025–Now) |
|---|---|---|---|
| **Name** | Autocomplete | Chat Assist | **Agentic Operating Model** |
| **Interaction** | "Complete this line" | "Answer my question" | "Do this task for me" |
| **Workflow** | Single-line suggestions | Copy-paste from chat | Autonomous execution |
| **Who drives** | You type | You paste | AI acts, you review |
| **Deliverable** | Lines of code | Snippets, answers | **Code, runbooks, documents, decisions** |

---

# Why the Agentic Operating Model Is Possible NOW

### Technology Advances
- **Massive context windows** — 1M+ tokens (Claude Opus 4.7)
- **Advanced reasoning** — Claude Opus 4.7, GPT-5.4 / GPT-5.4-mini, Gemini 3.1 Pro
- **Native tool use** abilities in LLMs
- **Model Context Protocol (MCP)** as universal standard (Linux Foundation)

### Tooling Advances
- AI agents with **file system access** and **terminal execution**
- **Checkpoint/rollback** systems built into editors
- **Cloud agents** running autonomously (Copilot Coding Agent)
- **Agentic Workflows** in CI/CD (GitHub, GA April 2026)

---

# Understanding the Economics

### What are tokens?
- ~4 characters or ~¾ of a word — both input and output consume them

| Model | Context Window |
|-------|----------------|
| Claude Opus 4.7 | Up to **1M tokens** |
| GPT-5.4 / GPT-5.4-mini | **256K tokens** |
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

# Why This Matters to You — Whatever Your Role

### Four audiences, one operating model:

| Role | Primary deliverable | Your "tests" are… |
|---|---|---|
| **Developer** | Code | Pester, pytest, CI green |
| **DevOps / SRE** | Pipelines, IaC, runbooks | Lab validation, event-log checks, drift detection |
| **System engineer** | Configuration, evidence | `dcdiag`, `repadmin`, `gpresult`, `klist` output |
| **Research / knowledge worker** | Documents, analyses, correspondence | Citations verified, contradictions detected, deadlines tracked |

> **If you don't write code, you are still in scope.** The agent loop is identical — only the artefact changes.

---

# Why Dev & DevOps Practices Are the Foundation

> **The engineering discipline that makes agentic AI trustworthy is the same whether you ship code or a Schriftsatz.**

| Practice | Why it matters for AI-assisted work |
|---|---|
| **Version control (Git)** | Every AI change is diffable, reviewable, revertible |
| **Plain text / Markdown** | Greppable, mergeable, diff-friendly — unlike Word or PDF |
| **Small commits** | Focused scope = easier AI planning + human review |
| **Automated tests / checks** | Close the loop: AI verifies its own output |
| **Code review mindset** | You supervise the agent — same skill as reviewing a colleague's PR |
| **Reproducible environments** | Dev containers, labs — safe sandbox for the agent to experiment |

> Sysadmins and knowledge workers who adopt these practices get the **same leverage** developers do — just applied to runbooks, case files, and research notes instead of code.

---

# Why This Matters to You — If You Already Write Code

### As PowerShell Developers / DevOps Engineers, you already:

- ✅ Work with **structured repositories**
- ✅ Use **version control** (Git)
- ✅ Write **testable code** (Pester)
- ✅ Follow **conventions** (Approved Verbs, etc.)

These practices make the agentic model **even more effective** for you — and they are the **blueprint** your non-developer colleagues adopt next.

---

# Today's Journey

1. **What Makes Work "Agentic"** — The paradigm shift
2. **The Power of Context** — Why Git is foundational *(for code and prose)*
3. **Controlling AI Behavior** — Instructions, agents, skills, prompts
4. **Self-Verification** — How AI validates its own work
5. **Advanced Capabilities** — MCP, checkpoints, agent types
6. **Beyond Code** — Same loop, different artefact
7. **When to Use (and Not Use)** — Good judgment matters
8. **Your Agentic Future** — Getting started

---

<!-- _class: section-divider -->

# Module 1
## What Makes Work "Agentic"?

> *"All life is problem solving."*
> — **Karl Popper**

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

> An agentic AI doesn't just **suggest** — it **acts, verifies, and iterates** autonomously.
> The *thing it acts on* can be code, a server, an email corpus, or a legal case file.

---

# Traditional AI vs Agentic AI

### Traditional AI Assistance
```
You ask ──▶ AI suggests in chat ──▶ YOU copy to editor ──▶ YOU run it ──▶ YOU fix bugs
```
**Human does most of the work.**

### Agentic AI (same shape, any domain)
```
You describe ──▶ Agent reads project ──▶ Agent edits files ──▶ Agent runs verification
                                                                       │
                                                                  Pass? ──▶ Done ✅
                                                                       │
                                                                  Fail ──▶ Agent fixes ──▶ Re-check
```
**Agent does most of the work. You review and approve.**

> *"Verification"* means Pester for code, `dcdiag` for a DC, or "every citation resolves" for a legal draft.

---

# Your Role Changes

| Before (Traditional) | After (Agentic) |
|---------------------|-----------------|
| You **type** — code, commands, prose | You **describe** intent |
| You **implement** solutions | You **review** solutions |
| You **run** checks (tests, `dcdiag`, citation audits) | Agent **runs** the checks |
| You **debug** failures | Agent **debugs** failures |
| You **create** files | Agent **creates** files |
| You **drive** | You **supervise** |

> From **typist** to **architect and reviewer** — whether you ship code, configuration, or a 40-page case file.

> *"Sapere aude! — Have the courage to use your own understanding."* — **Immanuel Kant**

---

# You Are the Conductor 🎼

> *A conductor doesn't play every instrument — but they understand
> how each one works and how to bring them together into a
> harmonious performance.*

| Conductor | You — with AI agents |
|-----------|---------------------|
| Knows every instrument | Understands each agent's capabilities |
| Has a vision of the result | Has a concrete idea of the outcome |
| Doesn't play the instruments | Doesn't write every line of code, runbook, or paragraph |
| Intervenes when something is off | Reviews, corrects, redirects agents |
| Better conductor → better orchestra | Better domain expertise → better AI output |

> Works the same whether your "score" is a codebase, a data center, or a legal brief.

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

> *"Die Grenzen meiner Sprache bedeuten die Grenzen meiner Welt."*
> *"The limits of my language mean the limits of my world."*
> — **Ludwig Wittgenstein**

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

<!-- _class: dense -->

# AI Does the Git Forensics for You

### Ask the agent:
> "Show me how often each contributor changed `Deploy-Application.ps1`"

### Agent runs:
```powershell
git log --follow --format='%aN' -- src/Public/Deploy-Application.ps1 |
    Group-Object | Sort-Object Count -Descending |
    Select-Object Count, Name
```

### Result:
```
  47  Alice (Human)
  31  Copilot (AI)
  12  Bob (Human)
   3  Carol (Human)
```

### What you learn:
- **Who** changed what — human or AI
- **How often** — contribution frequency
- **Accountability** — every commit is attributed

> AI + Git = **full audit trail** with zero manual effort.

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

<!-- _class: dense -->

# Commit Strategies — Explained

### Conventional Commits
Structured commit messages: `type(scope): description`
- Makes AI commits **searchable** and **filterable**
- Add 🤖 emoji or `[AI]` tag to identify AI-generated commits
- Types: `feat`, `fix`, `refactor`, `test`, `docs`, `chore`

### Branch Strategy
Isolate AI work on **dedicated branches** before merging:
- `ai/` prefix signals "AI-generated, needs review"
- Enables **PR-based review** before merging to feature branch
- Keeps `main` clean — AI work is reviewed just like human work

### Co-authored Commits
Git's `Co-authored-by` trailer gives **explicit attribution**:
- Shows up in GitHub's contributor graph
- Clear signal in `git log` and `git blame`
- Team knows which code had AI involvement

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

> *"Luck is what happens when preparation meets opportunity."*
> — **Seneca**

---

<!-- _class: dense -->

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

<!-- _class: dense -->

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

<!-- _class: dense -->

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

<!-- _class: dense -->

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

# Before — Without Instruction Files

### Same prompt produces:
```powershell
function Test-Config {
    param($Path)
    if (Test-Path $Path) { Get-Content $Path | ConvertFrom-Json }
}
```

- Minimal implementation
- No parameter validation
- No error handling
- No tests, no help text

> What if AI **always** followed your standards?

---

<!-- _class: dense -->

# After — With Instruction Files

### Same prompt now produces:
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

<!-- _class: dense -->

# Your Atelier — Customization as Code

> **Four surfaces + environment + keybindings — version it, sync it, script its setup.**

The [CopilotAtelier](https://github.com/raandree/CopilotAtelier) reference repo demonstrates the pattern:

```
~/OneDrive/CopilotAtelier/
├── Agents/          # *.agent.md       — personas + tools
├── Instructions/    # *.instructions.md — rules (applyTo globs)
├── Skills/          # <name>/SKILL.md  — on-demand expertise
├── Prompts/         # *.prompt.md      — /slash commands
├── Keybindings/     # keybindings.json — shared hotkeys
└── Setup-CopilotSettings.ps1           — idempotent installer
```

### VS Code settings point at the folders:
```jsonc
"chat.agentFilesLocations":        { "~/OneDrive/CopilotAtelier/Agents": true }
"chat.instructionsFilesLocations": { "~/OneDrive/CopilotAtelier/Instructions": true }
"chat.agentSkillsLocations":       { "~/OneDrive/CopilotAtelier/Skills": true }
"chat.promptFilesLocations":       { "~/OneDrive/CopilotAtelier/Prompts": true }
```

> **Write an agent once, use it everywhere.** Your personal agent config travels with you like your dotfiles.

---

<!-- _class: dense -->

# Skill-Authoring Discipline

Skills load **only when Copilot thinks they're relevant**. Get the description right or they never fire.

### Required structure

```markdown
---
name: my-skill-name
description: >-
  One-sentence purpose. Then:
  USE FOR: trigger phrases, keywords, concrete scenarios.
  DO NOT USE FOR: adjacent-but-different scenarios.
---

# Skill Title

Content starts here...
```

### Common failure modes

| Symptom | Cause |
|---|---|
| Skill never appears in `/skills` menu | Missing YAML frontmatter, or missing `name` / `description` |
| Skill registered but never auto-loads | Description too vague — add `USE FOR` trigger phrases |
| Fresh skill not showing up | VS Code must be reloaded after adding a skill |
| Frontmatter parse error | Blank line required between closing `---` and first heading |

### Diagnostic tools

- **Chat view gear → Open Chat Customizations** — lists every registered agent, instruction, skill, prompt
- **Chat view `…` → Show Agent Debug Logs** — exact registration/parse errors

> **Rule**: If a skill is not firing, debug the *description*, not the content.

---

<!-- _class: section-divider -->

# Module 4
## Trust but Verify — Automated Testing

> *"Trust, but verify."* — **Russian proverb** *(popularized by Ronald Reagan)*
>
> *"An experiment is a question which science poses to Nature, and a measurement is the recording of Nature's answer."* — **Max Planck**

---

<!-- _class: dense -->

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

<!-- _class: dense -->

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

<!-- _class: dense -->

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

> *"Experiments are the only means of knowledge at our disposal. Everything else is poetry, imagination."* — **Max Planck**

---

<!-- _class: dense -->

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

<!-- _class: dense -->

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

<!-- _class: dense -->

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

<!-- _class: dense -->

# Test-First with AI

### Traditional — Code First
`Write function → Write tests → Run → Fix`

### Test-First — Tests as Specifications
`Write tests → Write function to pass them → Green ✅`

> **Tests become the specification. The agent's job is to satisfy them.**

---

<!-- _class: dense -->

# Test-First — In Practice

### Example prompt
> *"Write Pester tests for a function that validates Azure resource IDs. Cover valid IDs, invalid formats, null, and empty strings. Then implement the function to pass those tests."*

### What the agent does

1. Writes the test file.
2. Writes the implementation.
3. Runs `Invoke-Pester`, iterates until green.
4. You review one commit: tests + code + green run.

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

> *"Alles hängt mit allem zusammen."*
> *"Everything is connected to everything else."*
> — **Alexander von Humboldt**

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

# Beyond Code — Anything You Can Script

> AI agents can assist with **anything you can do from the command line or programmatically**.

| "Code" Tasks | "Beyond Code" Tasks |
|-------------|---------------------|
| Write functions | Parse `repadmin` output |
| Generate tests | Diagnose DNS via `dcdiag` |
| Refactor modules | Correlate Event Logs across servers |
| Create pipelines | Interpret `gpresult` XML |
| Write docs | Decode Kerberos error codes |

The same agentic loop applies:
**Observe** (run diagnostics) → **Plan** (root cause) → **Act** (fix) → **Verify** (re-run) → **Iterate**

> If you can **run it in a terminal**, an AI agent can help you **understand, automate, and troubleshoot it**.

> *"Die Wirkung solcher Systeme erschließt sich erst im eigenen Umgang — nicht auf Folien."*
> *"The impact only reveals itself through hands-on experience — not on slides."*
> — **Stephan Scheuer**, Handelsblatt (Feb 2026)

---

<!-- _class: dense -->

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

<!-- _class: dense -->

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

> *"Wissenschaft ist geordnetes Wissen. Weisheit ist geordnetes Leben."*
> *"Science is organized knowledge. Wisdom is organized life."*
> — **Immanuel Kant**

---

# Where the Model Excels ✅

| Task Type | Why It Works |
|-----------|-------------|
| **Boilerplate / Scaffolding** | Repetitive, well-defined patterns |
| **Test Generation** | Systematic, verifiable |
| **Documentation** | Reading code → generating help |
| **Refactoring** | Pattern-based transformations |
| **CRUD Operations** | Standard patterns, predictable |
| **Config Files** | Template-based, format-specific |
| **Build Scripts** | Common patterns, platform-specific |
| **Operational Troubleshooting** | Parsing diagnostic output, correlating logs |
| **Infrastructure Diagnostics** | `repadmin`, `dcdiag`, `gpresult`, Event Logs |

> Common thread: **well-defined tasks with verifiable outcomes** —
> including anything you can do from the command line, not just writing code.

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

<!-- _class: dense -->

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

<!-- _class: dense -->

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

> *"Autonomy and security don't grow at the same pace."* — **Stephan Scheuer**, Handelsblatt

---

<!-- _class: dense -->

# The Cardinal Rule

> Even when it looks like programming is no longer required, **understanding the underlying code remains essential**.

| Without Understanding | With Understanding |
|----------------------|--------------------|
| Can't review AI output | Catch errors and vulnerabilities |
| Can't debug failures | Know where to look |
| Can't make design decisions | Guide AI better |
| Blind trust | Informed trust |

> **You are the pilot. AI is the autopilot. You still need to know how to fly.**

> *"He who learns but does not think, is lost. He who thinks but does not learn is in great danger."*
> — **Confucius**

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

> *"L'homme n'est rien d'autre que ce qu'il se fait."*
> *"Man is nothing else but what he makes of himself."*
> — **Jean-Paul Sartre**

---

<!-- _class: section-divider -->

# Module 7
## Your Agentic Future

> *"The journey of a thousand miles begins with a single step."* — **Lao Tzu**

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

> Start with 5–10 rules. Add more as you learn what the AI gets wrong.

---

# Evolving Your Instructions

### Version 2 — after experience:
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
    'chat.agentFilesLocations'        = @{ '~/OneDrive/CopilotAtelier/Agents' = $true }
    'chat.instructionsFilesLocations'  = @{ '~/OneDrive/CopilotAtelier/Instructions' = $true }
    'chat.agentSkillsLocations'       = @{ '~/OneDrive/CopilotAtelier/Skills' = $true }
    'chat.promptFilesLocations'       = @{ '~/OneDrive/CopilotAtelier/Prompts' = $true }
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

# You Are the Conductor — AI Is Your Orchestra

| 🎼 Your Expertise (Conductor) | 🎻 AI Capabilities (Musicians) |
|-------------------------------|----------------------------------|
| Domain knowledge | Speed of execution |
| Vision of the perfect result | Pattern recognition |
| Design judgment | Comprehensive testing |
| Quality standards | Tireless iteration |
| Review & orchestration | Autonomous performance |

> *"The whole is greater than the sum of its parts."* — **Aristotle**

### = A Symphony: *Better code, faster delivery, less tedium*

---

<!-- _class: section-divider -->

# Module 8
## Agentic Work Beyond Code

> *"The computer is incredibly fast, accurate, and stupid. Man is unbelievably slow, inaccurate, and brilliant. The marriage of the two is a force beyond calculation."*
> — attributed to **Leo Cherne**

---

# This Pattern Is Not About Code

Everything you have learned so far applies **unchanged** to:

| Domain | "Code" is replaced by… |
|---|---|
| Systems engineering | Runbooks, registry changes, event-log verification |
| Incident response | Timelines, root-cause reports, remediation plans |
| Legal & compliance | Case files, Schriftsätze, citation-backed arguments |
| Research & analysis | Literature reviews, corpus indices, synthesis documents |
| Business ops | Status reports, stakeholder communications, decisions with evidence |

> **The loop is identical. Only the artefact changes.**

---

# Three Real Projects, One Pattern

| Project | Domain | Primary artefact | Uses GHCP for |
|---|---|---|---|
| **Project A** | AD Kerberos RC4 rollout | Numbered PowerShell runbook | Script authoring, lab validation, open questions |
| **Project B** | Multi-year legal dispute | 15+ formal emails, argumentation | 600+ document corpus indexing, contradiction detection |
| **Project C** | Tenancy law (German) | Case file, legal Schriftsätze | BGB/BetrKV citation, deadline tracking, drafting |

### All three use the **same six building blocks**:
VS Code + Git + GHCP · Markdown · PowerShell · `memory-bank/` · structured input corpus · deterministic Markdown output

---

# The Universal Operating Model

```
┌──────────────────────────────────────────────────────────────┐
│                VERSION-CONTROLLED WORKSPACE                   │
├──────────────────────────────────────────────────────────────┤
│                                                              │
│   INPUT/           memory-bank/            OUTPUT/           │
│   emails           projectbrief            runbooks          │
│   PDFs             activeContext           case files        │
│   event logs      ─►progress             ─►letters           │
│   configs          systemPatterns          scripts           │
│   transcripts      promptHistory           reports           │
│          │                │                    ▲             │
│          └────────┬───────┴────────────────────┘             │
│                   ▼                                          │
│          ┌─────────────────┐                                 │
│          │  GHCP + tools   │  ← PowerShell, terminal,       │
│          │ reads/writes/   │    Outlook COM, AutomatedLab,  │
│          │ runs/verifies   │    MCP servers                 │
│          └─────────────────┘                                 │
└──────────────────────────────────────────────────────────────┘
                        │
                        ▼
                   git commit
           (diff · revert · blame · branch)
```

---

# What Counts as "Non-Coding"?

| Task | The agent does… |
|---|---|
| Reconstruct a timeline | Reads 600 emails, extracts dates, detects contradictions |
| Draft a complaint letter | Cites prior correspondence, consistent terminology, legal structure |
| Analyse an incident | Reads logs, correlates events, post-mortem with evidence links |
| Track open questions | Maintains a living document keyed to vendor engagements |
| Produce a runbook | Turns 12 scripts into an ordered, annotated operational guide |
| Research a regulation | Reads statute, cross-references sources, drafts an opinion |
| Monitor deadlines | Computes dates from contract clauses, flags thresholds |

> **Verifiable, auditable reasoning tasks** — exactly what git + Markdown + an agent loop are good at.

---

# Markdown as the Reasoning Substrate

| Property | Why it matters |
|---|---|
| **Plain text** | Diffable, greppable, portable, future-proof |
| **Structure without ceremony** | Headings, tables, lists — 95 % coverage |
| **Tables render everywhere** | Parties, deadlines, evidence, decisions |
| **Block quotes for citations** | Preserve exact source text alongside analysis |
| **Fenced code for commands** | Embed OCR command, SQL query, `Invoke-LabCommand` call |
| **Linkable** | Cross-reference case files, memory bank, source corpus |
| **Exports cleanly** | DOCX via pandoc, PDF via LaTeX, HTML via Marp |

> **A Word document is a destination. Markdown is a working medium.**

---

# Git Is Not Just for Code

```
$ git log --oneline Results/Formal-Letter.md
d4f8ea1  v2: add 28 evidence references, timeline history
7c21b9e  v1: initial formal letter to counterparty
b210c3e  Incorporate review feedback from session 9
a0fe73c  Correct timeline for approval workflow
91bc4d1  Restructure argumentation around policy directive
2d3a1f8  Initial outline
```

### Each commit is:
- **Reversible** — restore any prior version
- **Blameable** — who decided what, when
- **Branchable** — try a firm tone vs. conciliatory tone side-by-side
- **Citable** — "version as of commit `d4f8ea1`" is exact

> **Your complaint letter, your runbook, and your case file deserve the same rigour as production code.**

---

# The Memory Bank Pattern

The same six or seven files appear in every serious GHCP project:

| File | Purpose |
|---|---|
| `projectbrief.md` | What this project is and why it exists |
| `productContext.md` | Stakeholders, background, scope |
| `activeContext.md` | Current focus, recent changes, next steps *(the **index**)* |
| `progress.md` | What's done, what's pending, known issues |
| `systemPatterns.md` | Conventions, folder structure, patterns |
| `techContext.md` | Tools, versions, environment |
| `promptHistory.md` | Append-only record of prompts and decisions |

> **Tool-neutral**: Copilot · Claude Code · Cline all converge here.
> **Template shipped**: `content/materials/memory-bank-template/`

---

# PowerShell as the "Fingers"

GHCP's chat is powerful. Its **tools** are what make it *operational*.

| Capability | PowerShell surface |
|---|---|
| **Email corpus** | Outlook COM (`New-Object -ComObject Outlook.Application`) |
| **Office documents** | Word/Excel COM, or ZIP/XML parsing for DOCX/XLSX |
| **PDFs** | .NET zlib/deflate, pandoc, targeted OCR |
| **Active Directory** | `ActiveDirectory`, ADSI, `Get-ADUser` |
| **Event logs** | `Get-WinEvent`, XML filters |
| **Exchange / M365** | Graph PowerShell SDK, EWS |
| **Hyper-V** | Native module + AutomatedLab |
| **Web data** | `Invoke-WebRequest`, MCP servers |

> **The agent proposes, PowerShell executes, git records.**

---

# Data Governance & Confidentiality

> **Mandatory for HR, legal, and regulated-industry audiences.**

| Concern | Check before you start |
|---|---|
| **Data residency** | Copilot Enterprise vs. Business vs. Individual — where does the prompt go? |
| **Training opt-out** | Business/Enterprise: no training; Individual: opt-out setting |
| **Content exclusions** | `.copilotignore` / repo settings to keep sensitive paths out of context |
| **Model routing** | Know which model your prompt hits (Claude / GPT / Gemini) |
| **Local alternatives** | Ollama + Cline, LM Studio, Azure OpenAI private endpoint |
| **Repository hygiene** | Private repos, `.gitignore` raw evidence |
| **Prompt hygiene** | Pseudonymise names, redact account numbers |

### Rule of thumb:
> **If you would not paste it into a public forum, configure your stack before you paste it into a prompt.**

---

# Four Profiles, One Training

| Profile | Primary deliverable | Hook |
|---|---|---|
| **Developer** | Code | "AI that codes" |
| **DevOps / SRE** | Pipelines, IaC, runbooks | "AI that operates" |
| **System engineer** | Configuration, validation, evidence | "AI that tests on real OS — in a lab" |
| **Research / knowledge worker** | Documents, analyses, correspondence | "AI that reasons over your corpus — with a diff" |

### The slides don't change. What changes is:
- The **demo** (code vs. runbook vs. case file)
- The **tools** (Pester vs. `Invoke-LabCommand` vs. Outlook COM)
- The **success criterion** (green tests vs. event 205 vs. all references cited)

> **Agentic coding is a special case of agentic knowledge work.**

---

<!-- _class: dense -->

# A Mature Personal Atelier

What does the pattern look like once you stop thinking of it as "AI for code"?

### [CopilotAtelier](https://github.com/raandree/CopilotAtelier) — one person's public skill library:

| Domain | Example skills |
|---|---|
| **Infrastructure** | `automatedlab-deployment`, `dsc-troubleshooting`, `winrm-troubleshooting`, `mecm-dsc-deployment` |
| **Configuration / DSC** | `datum-configuration`, `sampler-framework`, `sampler-build-debug`, `sampler-migration` |
| **Testing** | `pester-patterns` |
| **Documents** | `pdf-to-markdown`, `docx-to-markdown`, `xlsx-to-markdown`, `pandoc-docx-export` |
| **Communications** | `outlook-email-export`, `outlook-calendar-export`, `send-outlook-email`, `create-outlook-draft`, `microsoft-todo-tasks` |
| **Knowledge work** | `grammar-check`, `german-legal-research` |

### One person. Four surfaces (Agents · Instructions · Skills · Prompts). Git-versioned. OneDrive-synced.

> **Proof that the operating model is real** — the same shape of work (lab runbook, DSC debug session, legal Schriftsatz, payslip PDF parse) uses the same four customization surfaces, one agent loop, one git history.

---

# M8 Key Takeaway

1. **The agentic loop is domain-independent.** Observe → Plan → Act → Verify → Iterate applies to code, infrastructure, and prose alike.
2. **Git + Markdown + a memory bank** is a better working medium than any document editor for anything you need to reason about carefully.
3. **PowerShell gives the agent hands** in your Windows world — email, PDFs, AD, Exchange, Hyper-V.
4. **Data governance is not optional** the moment your corpus contains real people's real lives.
5. **If you're a sysadmin or an analyst, you are the audience** — just with a different deliverable.

> **Next: how a lab makes the agent safe to let loose on real infrastructure.**

---

<!-- _class: section-divider -->

# Module 9
## The Lab as the Agent's Sandbox

> *"In theory, there is no difference between theory and practice. In practice, there is."*
> — attributed to **Jan L. A. van de Snepscheut**

---

# Why Sysadmins Don't Let Agents Touch Prod

### An agent that can act on real infrastructure can also:
- Reboot a DC at 14:07 on a Tuesday
- Change `msDS-SupportedEncryptionTypes` on 400 service accounts
- Delete the wrong GPO
- Commit `Remove-ADOrganizationalUnit -Recursive` to main

> **You cannot give an agent free hands on production. But you also cannot benefit from its speed if you gate every action behind a three-person approval board.**

### The way out:
> **Give it full autonomy — in a place where nothing matters.**

---

# The Four Properties of a Good Agent Sandbox

| Property | Why the agent needs it |
|---|---|
| **Reversibility** | Every destructive action is undoable (snapshots) |
| **Reproducibility** | The environment can be re-created deterministically |
| **Observability** | The agent can *see* the result (event logs, registry, services) |
| **Isolation** | Broad admin rights inside; no bridge to prod |

### Sandbox scores for Windows infra:

| Platform | Score |
|---|---|
| **AutomatedLab (Hyper-V)** | ★★★★★ |
| Terraform + sandbox cloud subscription | ★★★★☆ |
| Dev Containers | ★★★☆☆ |
| Kind / Minikube | ★★★★☆ *(containers only)* |
| Bare-metal test lab | ★★☆☆☆ |

---

# AutomatedLab in 60 Seconds

> **Open-source PowerShell framework for provisioning complete Hyper-V lab environments from code.**

### What it gives you:
- **Lab definitions as PowerShell** — domains, networks, DCs, SQL, CM, PKI — all as code
- **One command to build** — `Install-Lab` spins up VMs, installs OS, promotes DCs
- **One command to tear down** — `Remove-Lab` returns the host to clean state
- **First-class remoting** — `Invoke-LabCommand` runs arbitrary PowerShell on any VM
- **Snapshots** — `Checkpoint-LabVM`, `Restore-LabVMSnapshot`

> **Everything scriptable. Everything discoverable via PowerShell.**

---

# A Minimal Lab Definition

```powershell
New-LabDefinition -Name 'AgenticSandbox' -DefaultVirtualizationEngine HyperV

Add-LabVirtualNetworkDefinition -Name 'AgenticSandbox' `
    -AddressSpace 192.168.100.0/24

Set-LabInstallationCredential -Username Install -Password 'Somepass1'

Add-LabMachineDefinition -Name DC1 -Network 'AgenticSandbox' `
    -IpAddress 192.168.100.10 `
    -OperatingSystem 'Windows Server 2025 Datacenter (Desktop Experience)' `
    -Roles RootDC -DomainName 'contoso.com'

Add-LabMachineDefinition -Name S1 -Network 'AgenticSandbox' `
    -IpAddress 192.168.100.20 `
    -OperatingSystem 'Windows Server 2025 Datacenter (Desktop Experience)' `
    -DomainName 'contoso.com'

Install-Lab
```

> **Twelve lines of PowerShell → a fully functioning AD domain the agent can experiment on.**

---

# The Agent's Feedback Loop on Infrastructure

```
┌─────────────────────────────────────────────────────────────┐
│                  AGENTIC LOOP ON INFRA                      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  OBSERVE ── Get-LabVM · Invoke-LabCommand { Get-ItemProp } │
│                           │                                │
│  PLAN    ── Decide which DCs, which registry value, order │
│                           │                                │
│  ACT     ── Checkpoint-LabVM  (safety)                    │
│             Invoke-LabCommand { Set-ItemProperty }        │
│             Restart-LabVM -Wait                           │
│                           │                                │
│  VERIFY  ── Invoke-LabCommand { Get-WinEvent -Id 205 }    │
│             → event appears? yes / no                      │
│                           │                                │
│  ITERATE ── Fail: Restore-LabVMSnapshot, fix, retry       │
│             Pass: git commit runbook + script             │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

# Live Example — The Kerberos RC4 Lab

### Starting state:
- 5-VM lab: 2 DCs, 2 member servers, 1 client
- Runbook: `ADDC - RC4 Shutdown.md`

### The agent's session:
1. **Reads** the runbook and current registry state on both DCs
2. **Drafts** `51 Set-RC4DefaultDisablementPhase.ps1`
3. **Checkpoints** the DCs
4. **Applies** the change via `Invoke-LabCommand`
5. **Reboots** the DCs via `Restart-LabVM -Wait`
6. **Reads** event 205 across all DCs
7. **Updates** the runbook with observed behaviour
8. **Commits** script + runbook together

> **Output: one git commit that captures the change AND the evidence it worked.**

---

# Snapshot-Driven Iteration

```powershell
# Agent's first action on any destructive task:
Checkpoint-LabVM -ComputerName DC1, DC2 -SnapshotName 'pre-phase-2'

# Try something
Invoke-LabCommand -ComputerName DC1, DC2 -ScriptBlock {
    Set-ItemProperty -Path 'HKLM:\SYSTEM\...\Kdc' `
        -Name 'DefaultDomainSupportedEncTypes' -Value 0x18
}

# Verify
Invoke-LabCommand -ComputerName DC1 -ScriptBlock {
    Get-WinEvent -LogName System -MaxEvents 50 |
        Where-Object Id -in 201..209
}

# If it didn't work as expected:
Restore-LabVMSnapshot -ComputerName DC1, DC2 -SnapshotName 'pre-phase-2'
```

> **Every experiment is cheap. Every mistake is a restore away from undone.**

---

# Invoke-LabCommand — The Key Cmdlet

```powershell
Invoke-LabCommand -ComputerName DC1 -ScriptBlock {
    Get-ADUser -Filter * -Properties 'msDS-SupportedEncryptionTypes' |
        Where-Object { $_.'msDS-SupportedEncryptionTypes' -band 0x4 } |
        Select-Object Name, 'msDS-SupportedEncryptionTypes'
} -PassThru
```

### What the agent gets:
- **Typed PowerShell objects** back — not just text
- **Per-VM execution** with per-VM results
- Runs as a **lab-scoped admin**; no credential handling
- **Scales** from one VM to an entire domain

> **`Invoke-LabCommand` is to infrastructure what `Invoke-Pester` is to code.**

---

# Lab vs. Cloud vs. Dev Container

| Scenario | Best sandbox |
|---|---|
| Windows Server / AD / GPO / Kerberos / DSC | **AutomatedLab on Hyper-V** |
| Container workloads, microservices | Docker Compose / Kind |
| Cross-platform app code, CI pipelines | Dev Containers / Codespaces |
| Real cloud IAM, networking, managed services | Terraform + isolated Azure subscription |
| Pure scripting / PowerShell module | Dev Container with PowerShell image |
| Multi-forest, PKI, SCCM | **AutomatedLab** *(nothing else gets close)* |

> **Pick the smallest sandbox that still contains the risk you are trying to de-risk.**

---

# What You Can Actually Test Safely

| Task | Without a lab | With a lab + agent |
|---|---|---|
| Change enc-types on 400 accounts | 3-week CAB | 20-min script + snapshot + verify |
| Validate a GPO before prod | Test OU, human verification | Full-domain lab, event-based verification |
| Build a new DSC composite | Spin up a VM manually | `AutomatedLab` + `Invoke-LabCommand` iteration |
| Upgrade DCs to newer OS | Months of planning | Rehearse end-to-end in hours |
| Test a monitoring rule | Beg for dev access | Generate the exact event pattern in the lab |

> **The lab is not a toy. It is the place where risk goes to get rehearsed.**

---

# Demo Reference

> **Live demo**: `content/demos/demo-ops-kerberos-lab.md`

### What the demo shows (≈ 15 min):
1. A fresh 2-DC lab already deployed
2. A runbook Markdown file open in VS Code
3. Copilot Agent reads the runbook and proposes a change script
4. Agent calls `Checkpoint-LabVM`, applies the change, runs verification
5. First verification **fails** — agent diagnoses from event logs and iterates
6. On success, agent updates the runbook and commits

> **One cohesive workflow. No tab-switching between PowerShell ISE, a Word runbook, and a change ticket.**

---

# M9 Key Takeaway

1. **Agents are only as safe as their sandbox.** Reversible · reproducible · observable · isolated.
2. **AutomatedLab is the Hyper-V-native answer** for Windows, AD, and Microsoft-stack system engineering.
3. **`Invoke-LabCommand` is the agent's hands on infrastructure** — runs code *and* reads back structured results.
4. **Snapshot before every destructive action.** Make "undo" the default.
5. **Verified change + diffed runbook + git commit** is the system engineer's equivalent of green tests.

> **The full model: agent writes code, runs it in a lab, verifies with events, documents the result, commits. This is agentic operations.**

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