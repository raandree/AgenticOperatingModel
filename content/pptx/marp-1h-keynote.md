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

  /* ---------- Section divider ----------
     Note: Marp's frontmatter `backgroundColor: #ffffff` injects an inline
     style on every <section>, which beats class-based background rules
     regardless of specificity. Section-divider slides therefore always
     render on white; text colors below are tuned for that background. */
  section.section-divider {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    color: #1e293b;
  }
  section.section-divider h1 {
    font-size: 2.4em;
    margin-bottom: 0.2em;
    color: #0c4a6e;
    border-bottom: none;
  }
  section.section-divider h2 {
    color: #0369a1;
    font-size: 1.2em;
  }
  section.section-divider blockquote {
    background-color: #f0f9ff;
    border-left: 4px solid #0284c7;
    color: #0c4a6e;
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

  /* ---------- Compact slide variant (denser than dense) ---------- */
  section.compact {
    font-size: 18px;
  }
  section.compact h1 {
    font-size: 1.3em;
    margin-bottom: 0.15em;
    padding-bottom: 0.1em;
  }
  section.compact h2 {
    font-size: 1.15em;
  }
  section.compact h3 {
    font-size: 0.95em;
    margin-top: 0.15em;
    margin-bottom: 0.1em;
  }
  section.compact p {
    margin-top: 0.4em;
    margin-bottom: 0.4em;
  }
  section.compact pre {
    padding: 6px;
    font-size: 0.8em;
  }
  section.compact table {
    font-size: 0.65em;
  }
  section.compact th, section.compact td {
    padding: 3px 6px;
  }
  section.compact blockquote {
    margin: 0.25em 0;
    padding: 0.4em 0.6em;
  }
  section.compact ul, section.compact ol {
    margin-top: 0.25em;
    margin-bottom: 0.25em;
  }
  section.compact li {
    margin-top: 0.1em;
  }
---
---

<!-- _class: lead -->
<!-- _paginate: false -->

![center w:130](../../assets/AOM-glyph-on-light.png)

# The Agentic Operating Model

## Versioned, AI-Agent-Assisted Work for Code, Operations, Research & Correspondence

> *"Die Geister, die ich rief, werd' ich nun nicht los."*
> *"The spirits that I summoned, I now cannot rid myself of."*
> — **Johann Wolfgang von Goethe**, *Der Zauberlehrling*

<!--
The quote is from Goethe's ballad *Der Zauberlehrling* (1797), "The Sorcerer's Apprentice." An apprentice, left alone, enchants a broom to fetch water for him — then realises he never learned the counter-spell to stop it. The poem is the cultural ancestor of every "runaway automation" story since, from Disney's *Fantasia* to modern AI-safety essays.

The relevance to agentic AI is direct: the capability to *summon* autonomous behaviour is now widely available; the capability to *supervise and stop* it lags behind. Most organisations are at the apprentice's stage — the spirits are already in motion, the operating model is being written after the fact.

This training is built around closing that gap: not how to summon harder, but how to keep a deliberate hand on the broom — through version control, verification, guardrails, and reversibility.
-->
---

# AI Has Evolved in Three Waves

| | Wave 1 (2021–22) | Wave 2 (2023–24) | Wave 3 (2025–Now) |
|---|---|---|---|
| **Name** | Autocomplete | Chat Assist | **Agentic Operating Model** |
| **Interaction** | "Complete this line" | "Answer my question" | "Do this task for me" |
| **Workflow** | Single-line suggestions | Copy-paste from chat | Autonomous execution |
| **Who drives** | You type | You paste | AI acts, you review |
| **Deliverable** | Lines of code | Snippets, answers | **Code, runbooks, documents, decisions** |

<!--
The three waves are cumulative, not replacements — autocomplete still lives inside every modern agent.

**Wave 1 (2021–22)** opened with GitHub Copilot's general availability in June 2022. The interaction unit was a single line or block; the human remained author, integrator, and runner. Productivity gains were measurable (~30–55% on benchmark tasks) but the engineering process around the code was unchanged.

**Wave 2 (2023–24)** is the chat era: ChatGPT (Nov 2022), Claude, Gemini. The interaction unit became a *conversation*, and the AI could explain, refactor, or generate larger fragments. The bottleneck moved to the human's copy-paste step and to the lack of context — the model could not see the repository or run the code.

**Wave 3 (2025–26)** is the agentic era: Copilot Agent Mode, Cursor, Claude Code, Aider. The model gains tools (file I/O, shell, search) and runs a loop — observe, plan, act, verify, iterate. The unit of work is no longer a snippet but a *task with verification*. The human role shifts from typist to reviewer.

The shift to Wave 3 is what creates the need for an operating model: once the agent can take actions, version control, tests, and guardrails stop being optional hygiene and become the supervision mechanism.
-->
---

<!-- _class: compact -->

# The Autonomy Horizon — Where This Is Going

> The length of task an agent can finish on its own is **doubling about every 7 months**.

| Human-effort length an agent handles (50% reliability) | ~When |
|---|---|
| Seconds to a few minutes | 2023 |
| Tens of minutes | 2025 |
| Multi-hour tasks, and climbing | 2026 |

- Measured by **METR** across six years; on real software issues the doubling is **even faster**.
- The **trend**, not the exact date, is the point: plan for agents that own longer and longer work.
- Teach it with its caveat — the self-reported *size* of the gain is debated; the *direction* is robust.

<!-- Speaker notes: METR measures agent autonomy as the length of task (in human time) an agent completes at 50% reliability; it has doubled roughly every 7 months for six years. This reframes "why now" into "why this keeps growing." Pair it with the conductor message: as the horizon lengthens, the human moves from fixing AI mistakes to directing AI work. -->

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

<!--
The audience for this training is wider than "developers who write production code." Module 11 makes that case in depth; this 1h-cut slide is the abbreviated version of the same claim. Systems engineers writing PowerShell against Active Directory, SREs maintaining runbooks, security analysts triaging incidents, and knowledge workers reasoning over document corpora all do work that fits the agentic operating model. The verb changes — author, operate, investigate, draft — but the loop (Observe → Plan → Act → Verify → Iterate) and the supervision pattern (Git, Markdown, tests or verifiable artefacts, rollback) do not.

The slide is also a defensive framing. In mixed-audience rooms the most common silent objection from non-developers is "this is interesting but not for me." Naming the four roles up front removes that escape hatch and keeps the room engaged with the operating-model content rather than mentally filing it under "developer stuff I can ignore."
-->
---

# Why Dev & DevOps Practices Are the Foundation

> **The engineering discipline that makes agentic AI trustworthy is the same whether you ship code or a legal pleading.**

| Practice | Why it matters for AI-assisted work |
|---|---|
| **Version control (Git)** | Every AI change is diffable, reviewable, revertible |
| **Plain text / Markdown** | Greppable, mergeable, diff-friendly — unlike Word or PDF |
| **Small commits** | Focused scope = easier AI planning + human review |
| **Automated tests / checks** | Close the loop: AI verifies its own output |
| **Code review mindset** | You supervise the agent — same skill as reviewing a colleague's PR |
| **Reproducible environments** | Dev containers, labs — safe sandbox for the agent to experiment |

> Sysadmins and knowledge workers who adopt these practices get the **same leverage** developers do — just applied to runbooks, case files, and research notes instead of code.

<!--
The argument compressed into this 1h slide is one of the curriculum's load-bearing claims: the engineering hygiene that developer and DevOps teams adopted for human reasons (version control, code review, automated tests, infrastructure as code, CI/CD) turns out to be exactly the substrate an agent needs to operate safely. Git gives the agent context and the human rollback; tests give the agent a verification signal; conventional repository structure gives the agent a navigable surface; pipeline automation gives the agent reversible deployments.

The implication for teams that do *not* yet have these practices is uncomfortable but honest: agentic tooling amplifies whatever discipline already exists. A team with strong tests, clean Git history, and IaC gets multiplicative gains; a team without them gets multiplicative incidents. The right sequence is to invest in the foundation first and adopt the agent against that foundation, not to adopt the agent in the hope that it will somehow build the foundation along the way. The expanded version of this argument appears in Module 9 (the cardinal rule, the destructive-operations guardrails) and Module 12 (the lab as the agent's sandbox).
-->
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

<!--
The five points cover roughly the same territory in every version of the deck; the difference is depth, not topic.

- **Module 2 — "agentic" defined.** The vocabulary slide and the Observe→Plan→Act→Verify loop. Without this, later modules sound like tooling marketing.
- **Module 3 — Context.** Why Git, the repository structure, and a written glossary matter more than choice of model. This module is the one most teams underweight.
- **Module 4 — Controlling behaviour.** Instruction files, custom agents, skills, prompt files. The shift from "prompt the model" to "configure the model’s behaviour as code".
- **Module 5 — Self-verification.** Tests as the executable spec, the "cheating agent" failure mode, and how Pester-style discipline becomes the AI feedback signal.
- **Practical application.** A live walkthrough that shows the loop, not just the screenshots. Saved for the end so the earlier abstractions have something concrete to anchor on.

In the 1h cut, only modules 1–3 and 7 are covered; the 2h adds 4 and 6; the 4h includes hands-on labs (AutomatedLab, MCP server) in modules 8–10. The structure is deliberately *concept → demo → "how this applies to your repo"* in every module.
-->
---

<!-- _class: section-divider -->

# Module 1
## What Makes Work "Agentic"?

> *"All life is problem solving."*
> — **Karl Popper**

<!--
Speaker notes — Module 1 appendix

### Timing: 10 minutes

### Key Points to Emphasize:
1. This is a **paradigm shift**, not incremental improvement
2. The audience's existing skills (Git, testing) are **advantages**
3. This applies to **any language**, we use PowerShell because they know it
4. Tokens and cost are real considerations — agentic loops use more tokens than single-shot requests

### Common Questions:
- "Will AI replace developers?" → No, it changes the role from typist to architect
- "Is this just hype?" → Show productivity statistics
- "What about code quality?" → Covered in verification module
- "How much does it cost?" → Depends on model and usage; token slide covers the economics

### Transition to Module 2:
"Now that we understand why this matters, let's define exactly what makes coding 'agentic'..."
-->
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

<!--
Speaker notes (for newcomers):
- Don't memorize this slide — we'll revisit each term as it comes up.
- Easy mental model:
  - **Model** = the engine (the LLM itself).
  - **Agent** = the driver (uses the engine + tools to reach a goal).
  - **Tool** = a hand (file read, shell, web fetch).
  - **Instruction** = a standing order the driver must always follow.
  - **Skill** = a specialist manual the driver opens only when needed.
  - **Prompt** = what you tell the driver right now.
  - **Memory Bank** = the driver's logbook between trips.
- This vocabulary is shared across Copilot, Claude Code, Cursor — it's not Microsoft-specific.
-->
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

<!--
The word "agent" has a long pedigree in computer science — Marvin Minsky's *Society of Mind* (1986), the BDI architecture from the 1990s (Belief–Desire–Intention), reinforcement-learning agents from the 2010s. The current LLM-driven definition keeps the same five properties (goal, context, tools, autonomy, iteration) but supplies them with natural-language reasoning instead of hand-coded planners.

The practical distinction worth holding onto: an autocomplete suggests; a chatbot explains; an agent *acts and observes the result of its action*. The fifth property — iteration based on feedback — is the one that separates "agent" from "script with an LLM in it."
-->
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

<!--
Speaker notes (for newcomers):
- The analogy answers the most common fear: "Do I need to know less now that AI codes for me?" — No, you need to know *more*, just differently.
- A conductor doesn't play the violin — but they hear when the violin is wrong. That's exactly your new job: hear when the AI is wrong.
- "Multi-agent" sounds futuristic but in practice means: one agent writes, a second reviews security, a third writes docs. We'll see how in Module 4.
-->
---

<!-- _class: dense -->

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

<!--
Speaker notes (for newcomers):
- This 5-step loop is the single most important concept in the whole training. Everything else is detail.
- Compare to how YOU code: you read the file, decide what to change, change it, run it, fix the error. Same loop — the agent just does it faster and without coffee breaks.
- The loop is what makes "agentic" different from "autocomplete": autocomplete stops after step 3 (Act). An agent keeps going until VERIFY says PASS.
- Iteration is automatic. You don't approve every cycle — you approve the final result.
-->
---

<!-- _class: section-divider -->

# Module 2
## The Power of Context

> *"Die Grenzen meiner Sprache bedeuten die Grenzen meiner Welt."*
> *"The limits of my language mean the limits of my world."*
> — **Ludwig Wittgenstein**

<!--
Speaker notes — Module 2 appendix

### Timing: 25-30 minutes (including demo)

### Key Points to Emphasize:
1. The **loop** is the core concept: Observe → Plan → Act → Verify → Iterate
2. Self-verification is what makes this **trustworthy**
3. The role shift: You're now the architect and reviewer
4. The **conductor analogy**: You don't play every instrument — you understand each one's capabilities and orchestrate the ensemble. The better the conductor, the better the orchestra. This applies to multi-agent workflows (Slide 2.4a)

### Demo Tips:
- Keep it simple: One function with tests
- Highlight what the AGENT is doing, not the code
- Show the iteration if a test fails (this is powerful)
- Don't explain PowerShell syntax

### Common Questions:
- "What if it makes a mistake?" → That's what verification is for
- "Is it really autonomous?" → Show file creation, test execution
- "Can I trust it?" → Trust but verify (testing + review)

### Transition to Module 3:
"The agent needs to understand your project to work effectively. Let's see how Git provides that context..."
-->
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

<!--
The word "context" carries two meanings here that are easy to conflate. The first is the model's context window — the literal token budget (200k–2M in 2026 frontier models) that bounds how much text the model can hold at once. The second is *project context* — the structure, conventions, glossary, and history of the specific codebase. The first is a hardware constraint; the second is an authoring problem the team controls.

Low-context output is the failure mode users notice first: code that looks reasonable in isolation but uses the wrong logger, the wrong error type, the wrong test framework. The model has not regressed — it has just defaulted to the most common pattern on the open internet, which is rarely the pattern in your repo.
-->
---

# Git Gives AI a Brain

| What Git Provides | What AI Learns |
|-------------------|----------------|
| **File Structure** | "This is how code is organized" |
| **Existing Code** | "This is the style and patterns" |
| **Config Files** | "These are the rules and dependencies" |
| **Commit History** | "This is what's been worked on recently" |
| **README** | "This is the project's purpose" |

<!--
Speaker notes (for newcomers):
- **Git** = the version-control system. Think of it as "track changes" for an entire project, with full history.
- **Repository** ("repo") = one project's folder + its history. Usually hosted on GitHub or Azure DevOps.
- Why does Git matter here? Because the AI reads your repo to learn HOW your team writes code, not just WHAT they wrote.
- If you've never used Git: GitHub Desktop is the easiest GUI. The agentic operating model assumes a Git repo — if you skip Git, you skip most of the value.
-->
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

<!--
The layout shown is the Sampler / standard PowerShell-module convention: `Public/` for exported cmdlets, `Private/` for internal helpers, `tests/` mirroring `src/`. None of that is enforced by the language — it is convention all the way down — but agents are remarkably good at recognising it and writing files that fit.

The corollary is that a non-conventional layout costs you context. A repo with everything in a single `scripts/` folder and no test directory gives the agent nothing to infer from, and the output will reflect that. Reorganising for convention is one of the highest-leverage things a team can do before adopting agentic tooling.
-->

<!--
Observe is the phase most people underestimate. A modern agent does not "read the whole repository" — the context window cannot hold it. Instead it does a structured discovery pass: directory listing, README, manifest files, top-of-file comments, then targeted reads of the files most likely to be relevant. Tools like semantic search, grep, and symbol lookup are how this scales beyond toy projects.

The `.github/copilot-instructions.md` file shown here matters disproportionately: it is the one file the agent reads *unconditionally* on every task. Anything written there becomes baseline behaviour. This is why Module 4 spends so much time on instruction files — it is the cheapest, most durable lever a team has on agent behaviour.
-->
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

<!--
Speaker notes (for newcomers):
- **Diff** = the literal list of "what changed". Removed lines shown in red, added lines in green.
- This is the single most important safety net: you never have to wonder "what did the AI silently touch?" — the diff shows you, every time.
- VS Code shows diffs visually in the Source Control panel (the branch icon on the left). No command line required.
- Rule of thumb: never accept agent work without reading the diff. Module 9 returns to why this matters.
-->
---

<!-- _class: section-divider -->

# Module 3
## Controlling AI Behavior

> *"Luck is what happens when preparation meets opportunity."*
> — **Seneca**

<!--
Speaker notes — Module 3 appendix

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
-->
---

<!-- _class: compact -->

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

<!--
The inconsistency on this slide is genuine and reproducible — the same prompt to the same model on different days produces different code, because the model has nothing to anchor on beyond its training-data priors. Temperature, recent context, even time-of-day sampling variance all contribute.

The practical cost is hidden until a team scales. One developer alternating between two styles is annoying; ten developers each getting two random styles produces a codebase no reviewer can pattern-match against. The fix is not "better prompting" — it is removing the question from the prompt entirely by writing it down once, in a file the agent reads automatically.
-->
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

<!--
Instruction files implement a pattern called "prompt prefixing": the host application silently prepends the file's contents to every system prompt the model sees. From the model's perspective there is no difference between rules you typed five seconds ago and rules you wrote six months ago — they all arrive together.

The leverage is asymmetric. Writing one rule once costs a minute; the rule then applies to every subsequent task for every developer on the team, indefinitely. This is the single highest-ROI configuration most teams make to their AI tooling, and it is also the one most likely to be skipped because it does not look like "work."
-->
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

# The Complete Customization Ecosystem

| # | Type | File | When It Activates |
|---|------|------|--------------------|
| 1 | **Project Instructions** | `copilot-instructions.md` | Every request |
| 2 | **Pattern-Matched** | `.instructions.md` | When `applyTo` glob matches |
| 3 | **Custom Agents** | `.agent.md` | When agent is selected |
| 4 | **Skills** | `SKILL.md` | Auto, when task matches description |
| 5 | **Prompt Templates** | `.prompt.md` | When `/command` is invoked |
| 6 | **Hooks** | `*.hooks.json` + script | At a fixed point in the loop — *deterministically* |
| 7 | **Cross-Tool** | `AGENTS.md` / `CLAUDE.md` | Always-on (tool-specific) |

> Rows 1–5 and 7 are **advice the model may ignore**. Row 6 is not.

<!--
The six types form a spectrum from "always loaded, no questions" (project instructions) to "loaded only when explicitly invoked" (prompt files), with pattern-matched instructions, skills, and agents distributed across the middle. Each step on the spectrum trades token cost against discoverability — more always-on means more reliability but higher per-request cost; more on-demand means lower cost but more risk the agent misses what it needs.

Most teams reach for the wrong end of the spectrum first. The instinct is to put everything in `copilot-instructions.md` because "then it always works." The result is a bloated always-on file that contradicts itself in places and burns tokens on irrelevant rules. The mature pattern is the inverse: a short always-on file, a handful of pattern-matched instructions for specific languages, a few skills for specialised domains, and prompt files for repeated tasks.
-->
---

<!-- _class: section-divider -->

# Module 4
## Trust but Verify — Automated Testing

> *"Trust, but verify."* — **Russian proverb** *(popularized by Ronald Reagan)*
>
> *"An experiment is a question which science poses to Nature, and a measurement is the recording of Nature's answer."* — **Max Planck**

<!--
Speaker notes — Module 4 appendix

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
-->
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

<!--
Speaker notes (for newcomers):
- **Automated test** = a small piece of code that checks another piece of code does what it should. Either passes or fails — no opinion involved.
- In PowerShell the test framework is called **Pester**. In Python it's pytest, in JavaScript it's Jest. Same idea everywhere.
- Why this matters for AI: tests are the only objective signal the agent has that its work is right. Without tests, "done" means "I think so."
-->
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

<!--
Speaker notes (for newcomers):
- This is the loop that makes "agentic" different from "autocomplete". Autocomplete stops after step 1. An agent only stops when step 3 says PASS.
- **Pester** = the test framework for PowerShell (`Invoke-Pester` runs all tests). Other languages have equivalents (pytest, Jest, JUnit).
- The iteration is automatic — you don't approve every cycle, you approve the final result.
- Critical prerequisite: you must HAVE tests. No tests = no loop. The next slides show how to make sure the agent writes them.
-->

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

<!--
The three-week ramp is a deliberate pacing recommendation, not a fixed schedule. Most engineers can compress the first week into a day if they already use Copilot in chat or completion mode; the more important variable is the *progression* (alone → with real work → with the team) rather than the calendar.

The single most-skipped step in this list is `/init`. Teams routinely write their first `copilot-instructions.md` from scratch, miss conventions that the agent's auto-scan would have surfaced, and end up with a file that misses what the codebase already implies. The `/init` output is rarely the final file, but it is almost always a better starting point than a blank page.
-->
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

<!--
Speaker notes (for newcomers):
- Bookmark the top three links and you have a complete on-ramp: Agent Mode docs (what), Custom Instructions docs (how), MCP servers list (what to plug in).
- All slides + materials for this training live in the repo — attendees get the link in the chat after the session.
- If you're brand new: start with the Agent Mode docs. Everything else makes more sense after you've used it once.
-->

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

<!--
Speaker notes (for newcomers):
- Closing image to take home: your role doesn't shrink — it changes shape.
- A conductor knows every instrument but plays none. The better you understand each AI capability (and each model's quirks), the better the orchestra sounds.
- The fear "AI will make me redundant" assumes you stay a violin player. Promote yourself to conductor before the question even applies.
-->

---

<!-- _class: lead -->

# Sergeant and Commander

> *"The AI is the tactical sergeant on the ground. You are the strategic commander above it."*
> — paraphrased from **Matt Pocock**, *"Claude Code for real engineers"*, 2026

- **Sergeant (AI)** — executes, reports, surfaces casualties (failing tests, broken builds).
- **Commander (you)** — holds the map, sets the objective, decides what counts as victory, owns the consequences.

> Lose the commander and the sergeant still moves — but no longer *toward* anything. That is heteromation (M9.10b) by another name.

<!--
Speaker notes (for newcomers):
- Use this metaphor in your own team conversations. It survives translation across roles: dev, ops, legal, research.
- The hardest discipline isn't telling the AI what to do — it's deciding *what counts as victory* before the AI starts moving. That's the commander's job and nobody else can do it for you.
- Pairs with the earlier conductor metaphor (slide 16 / 10.10): same role, different verb. Conductor for creative work, commander for operational work. Same person.
-->

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

<!--
The closing slide compresses the entire training into eight bullets and one operating sentence. The sentence — "you become the architect and reviewer, AI becomes your tireless implementer" — is the line the training wants people to leave the room remembering. If everything else fades, that role assignment is what stays useful.

The Lao Tzu epigraph at the top of the module ("the journey of a thousand miles begins with a single step") is the right closing note. The training does not promise transformation; it promises a starting point and a map. The transformation, if it happens, is the result of the work the team does in the weeks after, applying the operating model to their actual codebase, on their actual problems, with their actual constraints. The training's job is done when the audience leaves knowing what to do tomorrow morning.
-->
---

<!-- _class: lead -->

![center w:150](../../assets/AOM-glyph-on-light.png)

# Questions?

*Presenter: add your contact details*
*github.com/raandree/AgenticOperatingModel*

<!--
The Q&A is usually where the most useful conversation of the training happens, because the questions surface what the audience has internalised versus what slid past. The five common topics listed on the slide are reliable starters when no one raises a hand first; in practice the room usually has its own opening question.

The most common genuine question after this training is some version of "how do I convince my team / my manager / my security organisation to allow this?" That question is partly about the technology but mostly about organisational change — instruction files committed to a shared repository, GitOps as a structural guardrail, Memory Bank as an audit trail. The curriculum has these answers in its body; the Q&A is where they get connected to the specific organisation in the room.
-->