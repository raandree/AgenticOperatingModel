# Module 4: Controlling AI Behavior

## Version Guide

| Slide | Title | 1h | 2h | 4h |
|-------|-------|:---:|:---:|:---:|
| 4.1 | The Consistency Problem | ✅ | ✅ | ✅ |
| 4.2 | The Solution | ✅ | ✅ | ✅ |
| 4.3 | Copilot Instruction Files | ✅ | ✅ | ✅ |
| 4.4 | Anatomy of copilot-instructions.md | — | ✅ | ✅ |
| 4.5 | Rule Categories | — | ✅ | ✅ |
| 4.6 | Before and After | — | ✅ | ✅ |
| 4.7 | Hierarchy of Instructions | — | ✅ | ✅ |
| 4.7a | Spec-Driven Development | — | ✅ | ✅ |
| 4.8 | Custom Agents | — | ✅ | ✅ |
| 4.9 | Custom Agent Examples | — | — | ✅ |
| 4.10 | Skills | — | — | ✅ |
| 4.11 | Prompt Files | — | — | ✅ |
| 4.12 | Agent Handoffs | — | — | ✅ |
| 4.13 | Complete Ecosystem | ✅ | ✅ | ✅ |
| 4.14 | Demo - Before/After | — | ✅ | ✅ |
| 4.15 | Writing Effective Rules | — | — | ✅ |
| 4.16 | Common Rule Patterns | — | — | ✅ |
| 4.17 | Team Consistency | — | — | ✅ |
| 4.18 | Key Takeaway | ✅ | ✅ | ✅ |
| 4.19 | Prompt Evolution | — | — | ✅ |

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

<!--
The inconsistency on this slide is genuine and reproducible — the same prompt to the same model on different days produces different code, because the model has nothing to anchor on beyond its training-data priors. Temperature, recent context, even time-of-day sampling variance all contribute.

The practical cost is hidden until a team scales. One developer alternating between two styles is annoying; ten developers each getting two random styles produces a codebase no reviewer can pattern-match against. The fix is not "better prompting" — it is removing the question from the prompt entirely by writing it down once, in a file the agent reads automatically.
-->

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

<!--
Instruction files implement a pattern called "prompt prefixing": the host application silently prepends the file's contents to every system prompt the model sees. From the model's perspective there is no difference between rules you typed five seconds ago and rules you wrote six months ago — they all arrive together.

The leverage is asymmetric. Writing one rule once costs a minute; the rule then applies to every subsequent task for every developer on the team, indefinitely. This is the single highest-ROI configuration most teams make to their AI tooling, and it is also the one most likely to be skipped because it does not look like "work."
-->

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

<!--
Speaker notes (for newcomers):
- Don't panic at five file types — 90% of teams only use the first one (`copilot-instructions.md`).
- Quick mental model:
  - `copilot-instructions.md` = the rulebook that always applies.
  - `*.instructions.md` files = rules that only apply to certain file types (e.g. only `*.ps1`).
  - `AGENTS.md` / `CLAUDE.md` = same idea but readable by *other* AI tools too (Claude Code, etc.).
  - `.agent.md` = a named specialist (e.g. "security-reviewer") you can summon on demand.
- Start with one file. Add more only when you catch yourself repeating an instruction.
-->

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

<!--
The shape of this file matters. Markdown headings act as soft section tags the model uses for retrieval; bullet lists read as imperative rules; prose reads as background commentary. A well-structured instruction file is closer to a configuration document than to a memo.

Length is a real constraint — the file is prepended to every request, so a 4,000-token rulebook is a 4,000-token tax on every interaction. The discipline is to keep the always-on rules short and push specialised guidance into pattern-matched `*.instructions.md` files or skills that load on demand. "What goes in copilot-instructions.md" is the same question as "what does every task need to know?"
-->

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

<!--
The "things you find yourself repeating" heuristic is the right discovery mechanism for instruction-file content. If a developer corrects the agent three times in a week about how to format errors, that correction belongs in the instruction file, not in the next chat.

What does *not* belong in the instruction file: anything project-specific to a single task (use a prompt file), anything domain-specific that only matters for certain code (use a pattern-matched `.instructions.md`), or anything that is really just a personal preference (use user-level settings). Treating the always-on file as a dumping ground is the most common failure mode — it bloats fast and starts contradicting itself.
-->

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

<!--
The two code samples are not exaggerated for the slide — this is roughly what "no instructions" versus "twenty-line instruction file" produces on the same prompt. The difference is not the model's capability; it is whether the model has been told the team cares about parameter validation, comment-based help, error handling, and tests.

The meta-observation worth holding onto: the instructed version is what a senior developer on that team would have written. The uninstructed version is what a confident newcomer would have produced. Instruction files transfer team-level standards into the agent's defaults; they do not make the model smarter, they make it conform.
-->

---

## Slide 4.6a: Before — Without Instruction Files

# Before — Without Instruction Files

<!-- Stub: notes-only entry; rendered slide lives in marp-presentation.md -->

<!--
The "before" half of the comparison shows the agent's default behaviour when no project rules are in scope. The output is syntactically correct, idiomatically generic, and visibly out of place in a team codebase: no `[CmdletBinding()]`, no parameter validation, no comment-based help, no error handling. The model is doing exactly what it was asked — produce a function that validates a config — at the lowest defensible level of effort, because nothing in the prompt told it the team cared about anything more.

This baseline matters as a calibration point: it is the level the agent reaches when the instruction file is missing, empty, or ignored. Teams that adopt agentic tooling and then complain about output quality are usually looking at this level of output and assuming the model is the bottleneck. The next slide shows the same prompt against the same model with a twenty-line rulebook in scope.
-->

---

## Slide 4.6b: After — With Instruction Files

# After — With Instruction Files

<!-- Stub: notes-only entry; rendered slide lives in marp-presentation.md -->

<!--
The "after" half is the same prompt against the same model — the only thing that changed is the presence of `copilot-instructions.md` with rules about cmdlet binding, parameter validation, comment-based help, error handling, and tests. The output now matches what a senior on the team would have written, because the instruction file transferred the team's standards into the agent's defaults.

The delta is intentionally dramatic, but it is also genuinely representative. The instruction file is not a clever prompt-engineering trick; it is a configuration document that arrives with every request. The same effect compounds across every task for every developer on the team, indefinitely. This is the single highest-ROI configuration change most teams make to their AI tooling, and it is also the one most likely to be skipped because writing a rulebook does not look like "real" engineering work.
-->

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

<!--
The hierarchy mirrors how human teams already work: personal habits, team norms, company policy — each level overrides the more general one only where it has something specific to say. The agent applies all layers simultaneously, with conflicts resolved by specificity (the more local rule wins).

The most useful layer for most teams is the middle one: repository instructions in Git. Personal-level settings drift between developers; org-level policies are usually too coarse to be operational. The Git-committed instruction file is the only layer where "the team agreed to this" and "the agent enforces this" become the same statement.
-->

---

## Slide 4.7a: Spec-Driven Development

# Make the *Spec* the Primary Artefact — Not the Code

> Instruction files (4.3–4.7) capture **persistent rules** — *how* this codebase wants to be coded.
> Spec-driven development captures **per-task intent** — *what* and *why* for the change about to happen.
> The two are complementary. Both belong in Git, written by a human, **before** the agent touches code.

### The flip

| Old order (code-first) | New order (spec-first) |
|------------------------|------------------------|
| 1. Prompt the agent | 1. Write the **spec** — intent, constraints, acceptance criteria |
| 2. Agent generates code | 2. Agent produces a **plan** — architecture, task list, risks |
| 3. Human reviews diff | 3. Human **approves the plan** (cheap to change) |
| 4. Hope it matches intent | 4. Agent executes tasks sequentially |
| | 5. Verify each task **against the spec**, not just "it compiles" |

> The code becomes an *implementation detail*. The spec is the source of truth.

### Project constitution (GitHub Spec Kit pattern)

A `spec/constitution.md` (or `.spec-kit/constitution.md`) checked into the repo declares **non-negotiable principles** the agent must honour on every task:

```markdown
# Project Constitution

## Quality
- All public functions ship with Pester tests covering success, error, edge cases.
- No new code merged without an updated CHANGELOG entry.

## Testing
- Tests are evidence. Tests that mock the thing under test are not evidence.
- Coverage floor: 80% line, 70% branch.

## Security
- No secrets in code. No `Invoke-Expression` on untrusted input.
- Destructive operations require an explicit `-Confirm` or pipeline approval.
```

> Per task you write a short **spec** (1 page); the **constitution** never changes per task. Plans are validated against both.

### Why this beats prompt engineering

- The agent pattern-matches from training data. Your **architectural intent**, **service boundaries**, and **why-that-field-changed-6-months-ago** are not in that data. The spec is the only place they exist.
- **TypeScript catches ~94% of LLM errors that surface as type-check failures.** A strongly-typed spec + strongly-typed code is a guardrail, not a style preference. (The same principle generalises: schemas, JSON-Schema, Pester `Should -Throw`, ARM/Bicep validation — pick the guardrail your language affords.)
- A spec is **reviewable cheaply** (1 page); a 600-line diff is not. Catch the wrong building before the contractor pours the foundation.

### Pitfall — a spec is *not* a substitute for code review

Running the compiler from the spec **without reading the generated code** produces progressively worse code on every cycle. The spec captures *per-task intent*; it does not capture the **design of the system**. Skip the read step and the codebase drifts into software entropy — vibe-coding with extra ceremony.

> *"You have to invest in the design of the system every day."* — **Kent Beck**
>
> *"Compile-from-spec without reading what it wrote produces worse and worse code."* — Matt Pocock, *"Claude Code for real engineers"*, 2026

### Cross-reference

- Pair with **M3 Power of Context** — the spec lives in Git like everything else.
- Pair with **M5 Self-Verification** — "verify against the spec" is the acceptance test.
- Pair with **M9.10a counter-pattern "Architecture review BEFORE generation"** — the spec *is* the artefact that gets reviewed.

> See: [GitHub Spec Kit](https://github.com/github/spec-kit) · the agentic-operating-model take is *instruction files for the codebase, specs for the change, constitution for the line nobody crosses*.

<!--
Speaker notes (for newcomers):
- **Spec** = a short written description of WHAT you want and WHY — written *before* any code.
- Think of it like a one-page work order: "Build me X, it must handle Y, must NOT do Z."
- Why bother? Because if the agent goes off-track, the spec is the cheap thing to fix (1 page) vs. re-reading 600 lines of generated code.
- **Constitution** = the project's permanent ground rules (e.g. "all public functions get tests"). One per project, rarely changes.
- Spec = per task. Constitution = forever. Instructions (slide 4.3) = forever, like the constitution.
-->

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
model: 'Claude Opus 4.7 (copilot)'
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
<!--
A custom agent is a named bundle of three things: a system prompt (the persona), a tool allowlist (what the agent can actually do), and optional handoffs (which other agents it can call). The same underlying model powers all of them; the difference is configuration, not capability.

The tool allowlist matters more than the persona. A "refactor agent" without `runTests` cannot actually verify its refactors; a "security reviewer" with `editFiles` is no longer a reviewer. Choosing the minimal tool set for each agent is what turns the agent definition from cosplay into an actual constraint.
-->
---

## Slide 4.9: Custom Agent Examples

# Specialized Agents with Advanced Features

### Security Reviewer Agent (with Handoff Back)
```markdown
---
name: security-reviewer
description: Validate code for security vulnerabilities and quality
model: 'Claude Opus 4.7 (copilot)'
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

<!--
The two examples illustrate the natural division of labour: the engineer agent has broad write access and broad responsibility; the reviewer agent has read access and narrow responsibility. The handoff chain becomes a workflow contract — the engineer cannot mark a task complete until the reviewer approves, and the reviewer cannot edit, only report and route back.

This pattern compresses an organisational practice (separation of duties between authors and reviewers) into agent configuration. It does not replace human review for sensitive code, but it does mean the AI-authored code that reaches a human reviewer has already cleared an automated security pass — reducing the volume of trivial findings the human has to triage.
-->

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

<!--
Speaker notes (for newcomers):
- Why not just put everything in instructions? Because instructions are loaded on *every* request — burning tokens (= money) even when irrelevant.
- A **skill** is like a reference book on a shelf: the agent grabs it only when the task title matches its description.
- Example: a "debug failing Pester tests" skill is useless 95% of the time. As a skill, it costs zero tokens until you actually have a failing test.
- Key field: the `description:` in the skill's frontmatter is what triggers it. Write it like a search query — keywords matter.
-->

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

<!--
Speaker notes (for newcomers):
- A prompt file is just a saved message you re-use. Type `/CodeReview` instead of pasting the same paragraph for the hundredth time.
- Easy way to start: every time you re-type the same paragraph, save it as a `.prompt.md`. After a month you'll have your own toolkit.
- Difference from a skill: a skill is loaded *automatically* when relevant. A prompt is loaded *manually* when you type the slash command.
-->

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

<!--
Speaker notes (for newcomers):
- **Handoff** = one agent finishing its job and passing the result to a different agent with a different specialty.
- Real-world analogy: developer commits → hands to QA → hands to security → hands to release engineer. Same idea, fully automated.
- Don't build a 5-agent pipeline on day one. Start with a single agent. Add a second only when you keep doing the same review by hand.
-->

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

> *Illustrative layout below — your project may keep these in `.github/` or sync them via `~/OneDrive/CopilotAtelier/` (see Module 10). Sample files for this training live in [`content/materials/sample-copilot-instructions/`](../materials/sample-copilot-instructions/).*

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

<!--
The six types form a spectrum from "always loaded, no questions" (project instructions) to "loaded only when explicitly invoked" (prompt files), with pattern-matched instructions, skills, and agents distributed across the middle. Each step on the spectrum trades token cost against discoverability — more always-on means more reliability but higher per-request cost; more on-demand means lower cost but more risk the agent misses what it needs.

Most teams reach for the wrong end of the spectrum first. The instinct is to put everything in `copilot-instructions.md` because "then it always works." The result is a bloated always-on file that contradicts itself in places and burns tokens on irrelevant rules. The mature pattern is the inverse: a short always-on file, a handful of pattern-matched instructions for specific languages, a few skills for specialised domains, and prompt files for repeated tasks.
-->

---

## Slide 4.13a: Your Atelier — Customization as Code

# Your Atelier — Customization as Code

<!-- Stub: notes-only entry; rendered slide lives in marp-presentation.md -->

<!--
"Atelier" is the deliberate metaphor here — the workshop of a craftsperson, kept stocked with their own instruments, organised the way they think, and carried with them between projects. Applied to agentic tooling, the atelier is the personal layer of customisation that travels with the developer rather than living inside any one repository: instruction files, custom agents, skills, prompt files, all version-controlled and synced across machines (the cross-machine sync pattern from slide 10.5a).

The "as code" framing is the load-bearing claim. The atelier is not a collection of saved chat snippets or browser bookmarks; it is a Git-tracked directory tree with diffable history, peer review, and rollback. The same engineering discipline the curriculum applies to project code applies to the developer's personal AI configuration. Mature practitioners maintain their atelier with the same care they give to their dotfiles or their PowerShell profile — and for the same reason: small daily investments compound into a permanent productivity advantage.
-->

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

<!--
The demo's value is in the *sameness* of the prompt. If the audience sees you typing different words on the second run, the demo proves nothing. The instruction file is what changed; the request is identical to the character.

A good follow-up question to surface in the audience: "how do you know the agent actually read the instructions?" The honest answer is that you do not know with certainty — you infer it from the output conforming to the rules. This is one reason teams keep the instruction file short: a shorter file is more likely to be honoured in full, and easier to debug when it is not.
-->

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

<!--
Vague rules degrade silently. "Make sure to test stuff" survives review because no one can claim it is wrong, but the agent has no way to operationalise it — there is no observable difference between honouring the rule and ignoring it. Specific rules ("create a Pester test file for every new public function, covering at least one success path and one failure path") are testable and therefore enforceable.

The rule-writing skill is closer to writing technical documentation than to writing prompts. Each rule should answer: what should happen, when, and how would I know it happened? Rules that fail that test are usually wishes, not instructions.
-->

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

<!--
The template is deliberately a skeleton, not a recipe. Copy-pasting it verbatim produces a generic file that performs only marginally better than no file at all. The work is in filling in the bracketed sections with the team's actual conventions — which is exactly the conversation that exposes how much convention the team has actually agreed on.

The `/init` command shortcut is a reasonable starting point but not an endpoint. It scans the repository, infers conventions, and proposes a draft. Treat the output as a first-pass strawman to edit, not as the finished file — it captures what is already in the codebase, including the inconsistencies you wanted to fix.
-->

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

<!--
The team-consistency argument is structurally the same as the case for shared lint configs or `.editorconfig` files: heterogeneous outputs across developers create review churn that scales superlinearly with team size. Centralising the rules in Git makes the rules part of the codebase, which is the only artefact every developer reliably reads.

The organisational variant — policies enforced at the GitHub org level — is the right layer for things like "never commit secrets" or "never invoke shell with untrusted input." Project-level files should focus on conventions that are specific to the project; cross-cutting safety rules belong higher up where they cannot be silently overridden by a project that forgot to inherit them.
-->

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

<!--
The word "training" on this slide is deliberate but slightly metaphorical. None of these mechanisms modify model weights; they are all forms of context engineering — supplying the right information at the right moment so the model's outputs conform to local expectations. The effect resembles training; the mechanism does not.

The deeper point: the model is fixed (whatever frontier model you happen to be using), but the *system around the model* is entirely under team control. Instruction files, agents, skills, prompts, repository structure, conventions, glossary — these are the levers that determine output quality. Investing in the model is buying a faster horse; investing in this configuration layer is building rails.
-->

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

<!--
The six-level ladder shows the same model producing six different artefacts for the same task, depending on how much of the configuration layer the prompt activates. Level 1 is the model in isolation; Level 6 is the model with full access to the team's instructions, skills, and conventions.

The insight worth emphasising is that Levels 4–6 are not better *prompts* — they are better *invocations* of pre-existing context. A team that has invested in instruction files and skills gets Level 6 output from a Level 1 prompt, because the context is already loaded. A team that has not invested has to type the whole context into every prompt and still get worse results, because ad-hoc prompting is less precise than reviewed configuration. The ladder is, in effect, a measure of how much configuration work the team has banked.
-->

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