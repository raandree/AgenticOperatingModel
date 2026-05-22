# Module 3: The Power of Context

## Version Guide

| Slide | Title | 1h | 2h | 4h |
|-------|-------|:---:|:---:|:---:|
| 3.1 | The Context Problem | ✅ | ✅ | ✅ |
| 3.2 | Git is the Context Provider | ✅ | ✅ | ✅ |
| 3.3 | What the Agent Observes | ✅ | ✅ | ✅ |
| 3.4 | Pattern Recognition | — | ✅ | ✅ |
| 3.5 | The README Effect | — | ✅ | ✅ |
| 3.6 | Configuration File Context | — | — | ✅ |
| 3.7 | Traceability | ✅ | ✅ | ✅ |
| 3.8 | Demo - Git Diff | — | ✅ | ✅ |
| 3.8a | AI Does Git Forensics | — | — | ✅ |
| 3.9 | Checkpoint System | — | — | ✅ |
| 3.10 | Commit Strategies | — | — | ✅ |
| 3.10a | Commit Strategies Explained | — | — | ✅ |
| 3.11 | Best Practices for Context | — | ✅ | ✅ |
| 3.11a | Two Patterns: Grill-Me + Ubiquitous Language | — | — | ✅ |
| 3.12 | Demo - Context in Action | — | — | ✅ |
| 3.13 | Key Takeaway | ✅ | ✅ | ✅ |

> *"Die Grenzen meiner Sprache bedeuten die Grenzen meiner Welt."*
> *"The limits of my language mean the limits of my world."*
> — **Ludwig Wittgenstein**

## Slide 3.1: The Context Problem

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

> **Context is what transforms a generic AI into YOUR coding partner.**

<!--
The word "context" carries two meanings here that are easy to conflate. The first is the model's context window — the literal token budget (200k–2M in 2026 frontier models) that bounds how much text the model can hold at once. The second is *project context* — the structure, conventions, glossary, and history of the specific codebase. The first is a hardware constraint; the second is an authoring problem the team controls.

Low-context output is the failure mode users notice first: code that looks reasonable in isolation but uses the wrong logger, the wrong error type, the wrong test framework. The model has not regressed — it has just defaulted to the most common pattern on the open internet, which is rarely the pattern in your repo.
-->

---

## Slide 3.2: Git is the Context Provider

# Git Gives AI a Brain

```
┌─────────────────────────────────────────────────────────────────┐
│                     GIT AS AI CONTEXT                           │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   Your Git Repository                                           │
│   ═══════════════════                                          │
│                                                                 │
│   ┌─────────────────┐      ┌─────────────────────────────┐    │
│   │ File Structure  │──────│ "This is how code is        │    │
│   │                 │      │  organized in this project" │    │
│   └─────────────────┘      └─────────────────────────────┘    │
│                                                                 │
│   ┌─────────────────┐      ┌─────────────────────────────┐    │
│   │ Existing Code   │──────│ "This is the style and      │    │
│   │                 │      │  patterns used here"        │    │
│   └─────────────────┘      └─────────────────────────────┘    │
│                                                                 │
│   ┌─────────────────┐      ┌─────────────────────────────┐    │
│   │ Config Files    │──────│ "These are the rules and    │    │
│   │                 │      │  dependencies"              │    │
│   └─────────────────┘      └─────────────────────────────┘    │
│                                                                 │
│   ┌─────────────────┐      ┌─────────────────────────────┐    │
│   │ Commit History  │──────│ "This is what's been        │    │
│   │                 │      │  worked on recently"        │    │
│   └─────────────────┘      └─────────────────────────────┘    │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

<!--
Speaker notes (for newcomers):
- **Git** = the version-control system. Think of it as "track changes" for an entire project, with full history.
- **Repository** ("repo") = one project's folder + its history. Usually hosted on GitHub or Azure DevOps.
- Why does Git matter here? Because the AI reads your repo to learn HOW your team writes code, not just WHAT they wrote.
- If you've never used Git: GitHub Desktop is the easiest GUI. The agentic operating model assumes a Git repo — if you skip Git, you skip most of the value.
-->

---

## Slide 3.3: What the Agent Observes

# Repository as Knowledge Base

```
📁 YourProject/
│
├── 📁 src/
│   ├── 📁 Public/                 ──▶ "Exported functions go here"
│   │   ├── Get-Something.ps1
│   │   └── Set-Something.ps1
│   └── 📁 Private/                ──▶ "Internal helpers here"
│       └── Initialize-Module.ps1
│
├── 📁 tests/                      ──▶ "Tests mirror src structure"
│   ├── Get-Something.Tests.ps1
│   └── Set-Something.Tests.ps1
│
├── � .github/
│   ├── 📄 copilot-instructions.md  ──▶ "AI rules"
│   └── 📁 instructions/
│       └── 📄 powershell.instructions.md
├── 📄 YourModule.psd1             ──▶ "Module metadata"
├── 📄 YourModule.psm1             ──▶ "Root module"
├── 📄 README.md                   ──▶ "Project purpose"
└── 📄 .gitignore                  ──▶ "What to ignore"
```

### The agent learns:
- Public vs Private function locations
- Test file naming conventions
- Module structure patterns

<!--
The layout shown is the Sampler / standard PowerShell-module convention: `Public/` for exported cmdlets, `Private/` for internal helpers, `tests/` mirroring `src/`. None of that is enforced by the language — it is convention all the way down — but agents are remarkably good at recognising it and writing files that fit.

The corollary is that a non-conventional layout costs you context. A repo with everything in a single `scripts/` folder and no test directory gives the agent nothing to infer from, and the output will reflect that. Reorganising for convention is one of the highest-leverage things a team can do before adopting agentic tooling.
-->

---

## Slide 3.4: Pattern Recognition

# AI Learns From Your Codebase

### When agent reads your existing code:

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
- ✅ Uses `[CmdletBinding()]`
- ✅ Uses `[Parameter(Mandatory)]`
- ✅ Uses `[ValidateNotNullOrEmpty()]`
- ✅ Wraps in try/catch
- ✅ Uses `Write-Error` before throw

### New code will match these patterns!

<!--
Pattern recognition is mostly few-shot learning at inference time: the model sees three or four examples of how your project handles parameters and errors, and it generalises. No fine-tuning, no training run — just the surrounding files acting as in-context demonstrations.

The practical implication is asymmetric: *good* patterns propagate, but so do *bad* ones. If half your codebase uses `Write-Host` for errors and the other half uses `Write-Error`, the agent will pick whichever it saw most recently. Consistency in the existing code is therefore not just hygiene — it is the signal the agent uses to decide what to write next.
-->

---

## Slide 3.5: The README Effect

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

## Usage
```powershell
Test-ConfigFile -Path ./config.json -Schema ./schema.json
` ``
```

### What agent learns:
- This is a **validation** module
- It works with **JSON and YAML**
- Functions should provide **detailed error reporting**
- Naming pattern: `Test-*`, `Validate-*`

> Your README isn't just documentation—it's AI context.

<!--
A good README has two audiences now — humans onboarding to the project and agents starting a task. The information they need overlaps almost completely: what does this thing do, what does it *not* do, what are the entry points, what are the conventions. A README that fails the human onboarding test will fail the agent in exactly the same ways.

The "AI context" framing also explains why README rot is more expensive in an agentic workflow than it used to be. An outdated README does not just confuse newcomers — it actively steers the agent toward producing code that matches the stale description.
-->

---

## Slide 3.6: Configuration File Context

# Manifests & Configs Inform AI

### Module Manifest (.psd1):
```powershell
@{
    ModuleVersion = '1.0.0'
    FunctionsToExport = @('Test-*', 'Get-*', 'Set-*')
    RequiredModules = @('PSYaml')
}
```

### Agent learns:
- Function naming patterns to follow
- Dependencies available to use
- Export conventions

### Other config files:
- `PSScriptAnalyzer.settings.psd1` → Code style rules
- `.editorconfig` → Formatting preferences
- `pester.config.ps1` → Testing conventions

<!--
Configuration files are the cheapest form of agent guidance because they are already there for human tooling. `PSScriptAnalyzer`, `.editorconfig`, ESLint configs, `pyproject.toml` — the agent reads them precisely because the human toolchain reads them, and matching their rules is the path of least resistance.

The module manifest is worth singling out: `FunctionsToExport` and `RequiredModules` give the agent a hard signal about naming patterns and available dependencies. An agent that sees `FunctionsToExport = @('Test-*', 'Get-*', 'Set-*')` will not invent a `Validate-Config` function — it will write `Test-Config`.
-->

---

## Slide 3.7: Traceability - The Git Advantage

# Knowing What AI Changed

This is **critical** for trust:

```
┌─────────────────────────────────────────────────────────────────┐
│                    TRACEABILITY FLOW                            │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Before Agent Work          After Agent Work                   │
│  ─────────────────          ────────────────                   │
│                                                                 │
│  📁 Your Repo                📁 Your Repo                      │
│  └── (existing files)        ├── (existing files)              │
│                              ├── + New file 1    ← NEW         │
│                              ├── + New file 2    ← NEW         │
│                              └── ~ Modified file ← CHANGED     │
│                                                                 │
│                     ┌───────────────────┐                      │
│                     │    git diff       │                      │
│                     └─────────┬─────────┘                      │
│                               │                                 │
│                               ▼                                 │
│                     ┌───────────────────┐                      │
│                     │ EXACTLY what      │                      │
│                     │ agent changed     │                      │
│                     └───────────────────┘                      │
│                                                                 │
│  YOU SEE: Every line added, modified, or deleted               │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

<!--
Speaker notes (for newcomers):
- **Diff** = the literal list of "what changed". Removed lines shown in red, added lines in green.
- This is the single most important safety net: you never have to wonder "what did the AI silently touch?" — the diff shows you, every time.
- VS Code shows diffs visually in the Source Control panel (the branch icon on the left). No command line required.
- Rule of thumb: never accept agent work without reading the diff. Module 9 returns to why this matters.
-->

---

## Slide 3.8: Demo - Git Diff

# See What Changed

```diff
diff --git a/source/Public/Test-ConfigFile.ps1 b/source/Public/Test-ConfigFile.ps1
new file mode 100644
--- /dev/null
+++ b/source/Public/Test-ConfigFile.ps1
@@ -0,0 +1,45 @@
+function Test-ConfigFile {
+    [CmdletBinding()]
+    param(
+        [Parameter(Mandatory)]
+        [string]$Path,
+        
+        [Parameter(Mandatory)]
+        [string]$SchemaPath
+    )
+    
+    # ... rest of implementation
+}
```

### You can see:
- Exactly what was created
- Every line of code
- No hidden changes
- Full accountability

<!--
The `git diff` output shown here is what code review is built on, and it is also what makes agentic work reviewable at all. Each `+` line is a claim the agent is making about what should exist; each `-` line is a claim about what should no longer exist. Both are now propositions the human can accept or reject.

The diff is also where most agent failures actually become visible — not in the chat output, which always reads confidently, but in the diff: an unexpected file rewritten, a test deleted, a configuration silently changed. "Read the diff before you commit" is the single most-recommended discipline in this entire training.
-->

---

## Slide 3.8a: AI Does the Git Forensics for You

# AI + Git = Full Audit Trail

### Ask the agent:
> "Show me how often each contributor changed `Deploy-Application.ps1`"

### Agent runs:
```bash
git log --follow --format='%aN' -- src/Public/Deploy-Application.ps1 \
  | sort | uniq -c | sort -rn
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

<!--
Git forensics — `git log`, `git blame`, `git bisect` — has always existed; what changes with agents is the activation energy. Asking the agent to compute contributor frequency across a directory tree is a one-sentence prompt; doing it by hand is ten minutes of shell scripting most people never bother with.

The attribution pattern shown (Copilot as a named author via `Co-authored-by:` trailer) is becoming the standard way to make AI involvement countable. It does not solve the question "is this code good?" but it solves "how much of our recent code touched AI?", which is the question audit, compliance, and engineering management actually ask.
-->

---

## Slide 3.9: Checkpoint System

# Rollback When Needed

```
┌─────────────────────────────────────────────────────────────────┐
│                    CHECKPOINT TIMELINE                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Time ───────────────────────────────────────────────────────▶ │
│                                                                 │
│    ●──────────●──────────●──────────●──────────●               │
│    │          │          │          │          │               │
│   Start    Checkpoint  Checkpoint  Checkpoint  Current         │
│            #1          #2          #3          State           │
│    │          │          │          │          │               │
│    ▼          ▼          ▼          ▼          ▼               │
│  Clean     Feature    Tests      Oops!      Working           │
│  State     Added      Added      Broken     Again             │
│                                                                 │
│                          │                                      │
│                          │ "I don't like this direction"       │
│                          │                                      │
│                          └────────▶ ROLLBACK TO #2             │
│                                                                 │
│  Agent: "Restored to state after tests were added"             │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

You're never stuck. You can always go back.

<!--
Speaker notes (for newcomers):
- **Checkpoint** = a saved snapshot of all files at one moment. Like "save game" in a video game.
- VS Code automatically creates checkpoints after each agent turn — you didn't have to do anything.
- This is *separate* from Git commits. Checkpoints are short-term, in-editor. Commits are the permanent, shareable history.
- The combination is powerful: small, free undos via checkpoints; big, durable history via Git.
-->

---

## Slide 3.10: Commit Strategies

# Documenting AI Contributions

### Option 1: Conventional Commits
```
feat(validation): add config file validation function

- Created Test-ConfigFile function
- Added comprehensive Pester tests
- Integrated with existing schema validation

🤖 Generated with Copilot Agent Mode assistance
```

### Option 2: Branch Strategy
```
main
  └── feature/add-validation
        └── ai/config-validation  ← AI works here
```

### Option 3: Co-authored Commits
```
feat: add validation function

Co-authored-by: AI Assistant <ai@example.com>
```

<!--
The three strategies are not alternatives — most mature teams use all three at once. Conventional Commits give the message structure (and feed semantic-version tooling like `semantic-release`); branch prefixes make AI work visible at the branch level; the `Co-authored-by:` trailer makes it visible per commit.

The branch-prefix convention (`ai/<slug>`) is more important than it looks. It triggers different CI rules — stricter linting, mandatory human review, sometimes additional security scans — without requiring per-commit metadata. The branch name *is* the policy hook.
-->

---

## Slide 3.10a: Commit Strategies — Explained

# Why Each Strategy Matters

### Conventional Commits
Structured commit messages: `type(scope): description`
- Makes AI commits **searchable** and **filterable** via `git log --grep`
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

<!--
The `Co-authored-by:` trailer is a Git convention, not a Git feature — it is just a structured line in the commit message body. GitHub recognises it and adds the named co-author to the commit's contributor list; other forges (GitLab, Azure DevOps, Gitea) increasingly do the same.

The useful side-effect for AI-augmented teams is that `git log --author="AI Assistant"` becomes a real query. Reporting "what fraction of last quarter's commits had AI co-authorship?" stops being a survey question and becomes a one-line shell command.
-->

---

## Slide 3.11: Best Practices for Context

# Maximize AI Effectiveness

### DO ✅
- **Work in Git repos** — Always initialize Git first
- **Meaningful structure** — Organize files logically
- **Good README** — Explain project purpose
- **Consistent patterns** — AI learns from consistency
- **Descriptive names** — Files and functions

### DON'T ❌
- **Don't work outside Git** — No context, poor results
- **Don't have random file locations** — Confuses AI
- **Don't skip README** — AI needs to understand purpose
- **Don't mix styles** — Inconsistency → inconsistent output

<!--
These rules are not new — they are decades-old software-engineering hygiene. What is new is that the cost of violating them is now immediate and visible: the agent produces inconsistent output the same hour you skip the README update, not weeks later when the next developer onboards.

The single-highest-leverage item on the DO list is "meaningful structure." A repository with a clear conventional layout (src/Public, src/Private, tests/, docs/) gives the agent a place to put new things without asking. A flat repository with everything in the root forces a choice the agent will make somewhat arbitrarily.
-->

---

## Slide 3.11a: Two Patterns for Context

# Grill-Me + Ubiquitous Language

Two concrete, repo-checkable instances of "context lives in Git".

### 1. The Grill-Me Pattern — adversarial requirements interview

Before writing any code, the agent **interviews you**: 40–100 questions about edge cases, failure modes, integration points, owner, rollback. Output is a written design concept the human signs off on.

- Anchored in Brooks, *The Design of Design*: most defects originate in the requirements, not the code.
- Implemented as a custom agent / skill (e.g. `github.com/mattpocockuk/skills`, ~13k stars).
- Pairs with **M4** spec-driven development: the grill-me transcript *becomes* the spec.

### 2. Ubiquitous-Language File — DDD for human-AI collaboration

A `docs/glossary.md` checked into the repo. Markdown table of every domain term the agent is allowed to use, with definitions and *forbidden synonyms*.

| Term | Means | Don't say |
|------|-------|-----------|
| `Tenant` | A billable customer organisation | Account, Client, Org |
| `Seat` | A licensed user inside a Tenant | User, Member, Login |
| `Run` | One end-to-end pipeline execution | Job, Build, Invocation |

- Agent reads the glossary before planning → variable names, log lines, and tests use the team's language, not the model's.
- Drift in the glossary = drift in the system — surfaces in `git log`.

> Both patterns turn vague *"context"* into **artefacts a human reviewed and a diff can prove**.

<!--
The Grill-Me pattern operationalises Fred Brooks's observation from *The Design of Design* (2010) that most defects originate in the requirements, not the implementation. By forcing the agent to interview the human *before* writing code, the cost of the inevitable misunderstanding moves from "discovered after deployment" to "discovered in chat." The transcript itself becomes a reviewable spec artefact — not a side-effect, but the point.

The Ubiquitous-Language pattern applies Eric Evans's Domain-Driven Design idea (*Domain-Driven Design*, 2003) to human-AI collaboration. Without a glossary, the agent picks whichever synonym is most common in its training data: "customer" instead of your "tenant," "job" instead of your "run." The result is code that compiles but uses vocabulary nobody on the team uses, which is invisible at PR-time and corrosive over months.

Both patterns share a structural property worth naming: they produce *artefacts* (transcript, glossary) that live in Git. "Context" stops being something hand-waved in a hallway conversation and becomes something a diff can show changed.
-->

---

## Slide 3.12: Demo - Context in Action

# Watch AI Use Context

### Demo: Adding a Function to Existing Project

1. **Show** existing project structure
2. **Show** existing code patterns
3. **Request** new function
4. **Watch** agent analyze context
5. **See** new code matching existing patterns
6. **Review** diff showing changes
7. **Commit** with meaningful message

### Key observation:
The agent produces code that **fits** because it **learned** from your repository.

<!--
The demo's most revealing moment is usually the diff: the new file the agent created looks like it was written by whoever wrote the surrounding code, because the agent inferred the style from exactly that surrounding code. There is no model fine-tuning involved — just disciplined use of context at inference time.

The failure-mode contrast is also worth showing if time permits: run the same prompt against a fresh, empty repository. The output will be syntactically correct, idiomatically generic, and visibly out of place. Same model, same prompt, different context — different code.
-->

---

## Slide 3.13: Key Takeaway

# Git Enables Intelligent AI

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│    WITHOUT GIT                      WITH GIT                   │
│                                                                 │
│    AI asks:                         AI knows:                  │
│    "What style?"                    "Use this style"           │
│    "Where to put it?"               "Put it here"              │
│    "What patterns?"                 "Match these patterns"     │
│    "What conventions?"              "Follow these conventions" │
│                                                                 │
│    Result:                          Result:                    │
│    Generic code                     Tailored code              │
│    Doesn't fit                      Fits perfectly             │
│    Needs rework                     Ready to commit            │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

> Git isn't just version control—it's **how you give AI understanding** 
> and **maintain accountability** for what it changes.

<!--
The slide reframes Git from "the thing that tracks changes" to "the thing that makes agent work possible at all." Both halves of that claim are load-bearing: Git provides the *input* to agentic work (structure, history, patterns the agent reads) and the *output check* (the diff the human reviews, the rollback the team relies on).

A team that runs through this module and concludes "we need to invest in our repository before we invest in more AI tooling" has understood the point. The cheapest, most durable improvement to agent quality is almost never "a better model" — it is a better-organised codebase with a glossary, a README, conventional structure, and a habit of small, well-described commits.
-->

---

## Speaker Notes - Module 3

### Timing: 20-25 minutes

### Key Points to Emphasize:
1. **Context transforms generic AI into your coding partner**
2. AI learns from your repository: structure, patterns, conventions
3. Git provides **traceability** — you always know what changed
4. **Checkpoints** mean you can always roll back

### Demo Tips:
- Show a real repository with existing patterns
- Have agent create something new
- Highlight how output matches existing code style
- Show git diff to prove traceability
- Demonstrate a rollback if time permits

### Common Questions:
- "Does it read ALL files?" → It reads relevant files based on task
- "What about large repos?" → Smart context selection
- "Private/sensitive files?" → Can use .gitignore patterns

### Transition to Module 4:
"Context helps AI understand your project. But how do you teach it your specific rules? That's what custom instructions and instruction files are for..."