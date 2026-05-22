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

<!-- _class: lead -->

# How Do YOU Use AI in Your Work Today?

**Quick Poll:**

**A)** Code autocomplete (Copilot, Tabnine)
**B)** Chat assistants (ChatGPT, Claude) for code, scripts, or documents
**C)** AI agents that act on files and systems (Copilot Agent Mode, Cursor, Claude Code)
**D)** Not yet using AI at all

> **Whatever you build** — code, runbooks, reports, case files — **this talk is for you.**

<!--
The four answers correspond to four distinct mental models of what AI "is":

- **A) Autocomplete** — AI as a faster keyboard. Productivity gain is real but bounded; the human is still author and integrator.
- **B) Chat assistant** — AI as a knowledgeable colleague you consult. Better for explanation and one-off snippets; copy-paste is the bottleneck.
- **C) Agent** — AI as a workflow participant that reads the repository, edits files, runs commands, and reads the results. Different category of tool, not just a better B.
- **D) Not yet** — includes regulated industries, classified environments, and teams that explicitly chose to wait. Often the most prepared audience for an operating-model conversation, because they haven't yet accumulated bad habits.

In 2026 audiences, A and B together typically account for the large majority. The jump from B to C is the substantive topic of this training; A→B and B→C are very different transitions.
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

<!--
Speaker notes (for newcomers):
- **LLM** = Large Language Model. The "brain" behind the assistant (Claude, GPT, Gemini).
- **Context window** = how much text (your code + chat + docs) the model can read at once.
- **Tool use** = the model can call functions like "read file", "run command", not just generate text.
- **MCP** = a USB-like standard that lets any AI tool talk to any data source. Covered in Module 8.
- The point of this slide: the *capability* existed for a while, but only NOW are price, context size, and tooling good enough for autonomous loops.
-->
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

<!--
The quoted productivity numbers come from the 2024–25 wave of empirical studies:

- The 55% figure is GitHub's Copilot RCT (Peng et al., 2023) on a controlled boilerplate task; later real-world studies put the median closer to 20–30%.
- The 40% debugging-time figure is from Microsoft Research's 2024 internal study, narrower in scope than the GitHub number suggests.
- The Windsurf 94% claim refers to *lines authored*, not *value delivered*; the metric is genuine but selection-biased toward greenfield work.

The enterprise-adoption list (NVIDIA ≈40k engineers, Salesforce ≈20k developers, much of the Fortune 500) is meaningful because it answers the "is this just hype?" question at the procurement level — these are organisations with formal security reviews, not enthusiasts.

The three caveats at the bottom are not throat-clearing. They define the rest of the curriculum: *new skills* (prompting, verification) is Modules 3–5, *task fit* is Module 6, and *oversight* is Modules 7–9. Productivity gains compound when those three are in place and silently regress when they are not.
-->
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

# Why This Matters to You — If You Already Write Code

### As PowerShell Developers / DevOps Engineers, you already:

- ✅ Work with **structured repositories**
- ✅ Use **version control** (Git)
- ✅ Write **testable code** (Pester)
- ✅ Follow **conventions** (Approved Verbs, etc.)

These practices make the agentic model **even more effective** for you — and they are the **blueprint** your non-developer colleagues adopt next.

<!--
The four bullets on this slide are not nice-to-have qualifications; they are the *substrate* an agent needs to operate.

- **Structured repositories** give the agent a knowable surface area. An agent let loose on a flat folder of loose scripts has no map; an agent inside a Sampler/PowerShell project layout knows where public functions, private helpers, and tests live by convention.
- **Git** is the supervision mechanism. Every action the agent takes becomes a diff — reviewable, revertible, attributable. Without Git, there is no equivalent of "undo last 30 minutes".
- **Pester tests** turn intent into something an agent can verify against. The agent's success criterion is no longer "does this look right?" but "does the test suite go green?", which is automatable.
- **Conventions** (Approved Verbs, parameter patterns, comment-based help) compress the prompt: the agent infers what new code should look like from what already exists, instead of being told explicitly every time.

The broader observation: the engineering hygiene PowerShell and DevOps teams adopted for human reasons (review, rollback, reproducibility) is the *same* hygiene that makes AI agents productive and safe. Teams without it tend to discover this the expensive way.
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

<!--
The traditional flow has a human in every loop iteration: copy, paste, run, read error, decide what to do next. Each transition is a context switch costing seconds to minutes. On a 30-step task the wall-clock cost is dominated by these handoffs, not by either the human or the model thinking.

The second observation — less obvious — is that the human is also the *only memory* in this flow. The model forgets between turns; the editor doesn't know about the chat; the terminal doesn't know about the file. Everything that persists has to pass through the human's working memory, which is exactly where errors enter.
-->
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

<!--
The Kant quote ("Dare to know!") is the motto of the Enlightenment, from his 1784 essay *Was ist Aufklarung?*. He was arguing against intellectual tutelage — the habit of letting others think for you. The parallel here is deliberate and slightly pointed: agentic tools can either amplify your judgement or replace it, and which one happens is a choice the user makes, not a property of the tool.

The table itself describes a skill rotation rather than a skill loss. Reviewing code well is *harder* than writing it — it requires holding the whole system in mind, not just the next line. Teams that thrive with agents are typically the ones whose seniors were already good reviewers; teams that struggle are usually those who conflated "writes code" with "understands code."
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

<!-- _class: dense -->

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

<!--
Pattern recognition is mostly few-shot learning at inference time: the model sees three or four examples of how your project handles parameters and errors, and it generalises. No fine-tuning, no training run — just the surrounding files acting as in-context demonstrations.

The practical implication is asymmetric: *good* patterns propagate, but so do *bad* ones. If half your codebase uses `Write-Host` for errors and the other half uses `Write-Error`, the agent will pick whichever it saw most recently. Consistency in the existing code is therefore not just hygiene — it is the signal the agent uses to decide what to write next.
-->
---

<!-- _class: dense -->

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

<!--
A good README has two audiences now — humans onboarding to the project and agents starting a task. The information they need overlaps almost completely: what does this thing do, what does it *not* do, what are the entry points, what are the conventions. A README that fails the human onboarding test will fail the agent in exactly the same ways.

The "AI context" framing also explains why README rot is more expensive in an agentic workflow than it used to be. An outdated README does not just confuse newcomers — it actively steers the agent toward producing code that matches the stale description.
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

<!--
These rules are not new — they are decades-old software-engineering hygiene. What is new is that the cost of violating them is now immediate and visible: the agent produces inconsistent output the same hour you skip the README update, not weeks later when the next developer onboards.

The single-highest-leverage item on the DO list is "meaningful structure." A repository with a clear conventional layout (src/Public, src/Private, tests/, docs/) gives the agent a place to put new things without asking. A flat repository with everything in the root forces a choice the agent will make somewhat arbitrarily.
-->

<!--
Vague rules degrade silently. "Make sure to test stuff" survives review because no one can claim it is wrong, but the agent has no way to operationalise it — there is no observable difference between honouring the rule and ignoring it. Specific rules ("create a Pester test file for every new public function, covering at least one success path and one failure path") are testable and therefore enforceable.

The rule-writing skill is closer to writing technical documentation than to writing prompts. Each rule should answer: what should happen, when, and how would I know it happened? Rules that fail that test are usually wishes, not instructions.
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

<!--
The shape of this file matters. Markdown headings act as soft section tags the model uses for retrieval; bullet lists read as imperative rules; prose reads as background commentary. A well-structured instruction file is closer to a configuration document than to a memo.

Length is a real constraint — the file is prepended to every request, so a 4,000-token rulebook is a 4,000-token tax on every interaction. The discipline is to keep the always-on rules short and push specialised guidance into pattern-matched `*.instructions.md` files or skills that load on demand. "What goes in copilot-instructions.md" is the same question as "what does every task need to know?"
-->

<!--
Speaker notes (for newcomers):
- This is the most practical slide in the module: copy-paste this into your own `copilot-instructions.md` today and the agent will start testing its own output.
- The magic line is "do not report completion until all tests pass" — it forces the agent to iterate instead of giving up.
- **Invoke-Pester** is the command that runs all the tests in your project.
-->
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

<!--
The "before" half of the comparison shows the agent's default behaviour when no project rules are in scope. The output is syntactically correct, idiomatically generic, and visibly out of place in a team codebase: no `[CmdletBinding()]`, no parameter validation, no comment-based help, no error handling. The model is doing exactly what it was asked — produce a function that validates a config — at the lowest defensible level of effort, because nothing in the prompt told it the team cared about anything more.

This baseline matters as a calibration point: it is the level the agent reaches when the instruction file is missing, empty, or ignored. Teams that adopt agentic tooling and then complain about output quality are usually looking at this level of output and assuming the model is the bottleneck. The next slide shows the same prompt against the same model with a twenty-line rulebook in scope.
-->
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

<!--
The "after" half is the same prompt against the same model — the only thing that changed is the presence of `copilot-instructions.md` with rules about cmdlet binding, parameter validation, comment-based help, error handling, and tests. The output now matches what a senior on the team would have written, because the instruction file transferred the team's standards into the agent's defaults.

The delta is intentionally dramatic, but it is also genuinely representative. The instruction file is not a clever prompt-engineering trick; it is a configuration document that arrives with every request. The same effect compounds across every task for every developer on the team, indefinitely. This is the single highest-ROI configuration change most teams make to their AI tooling, and it is also the one most likely to be skipped because writing a rulebook does not look like "real" engineering work.
-->
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

<!--
The "things you find yourself repeating" heuristic is the right discovery mechanism for instruction-file content. If a developer corrects the agent three times in a week about how to format errors, that correction belongs in the instruction file, not in the next chat.

What does *not* belong in the instruction file: anything project-specific to a single task (use a prompt file), anything domain-specific that only matters for certain code (use a pattern-matched `.instructions.md`), or anything that is really just a personal preference (use user-level settings). Treating the always-on file as a dumping ground is the most common failure mode — it bloats fast and starts contradicting itself.
-->
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

<!--
The hierarchy mirrors how human teams already work: personal habits, team norms, company policy — each level overrides the more general one only where it has something specific to say. The agent applies all layers simultaneously, with conflicts resolved by specificity (the more local rule wins).

The most useful layer for most teams is the middle one: repository instructions in Git. Personal-level settings drift between developers; org-level policies are usually too coarse to be operational. The Git-committed instruction file is the only layer where "the team agreed to this" and "the agent enforces this" become the same statement.
-->
---

<!-- _class: compact -->

# Spec-Driven Development — Make the Spec the Primary Artefact

> Instruction files = *persistent rules* (how this codebase codes). Specs = *per-task intent* (what & why, for this change). Both in Git, both by a human, **before** code.

| Old order (code-first) | New order (spec-first) |
|------------------------|------------------------|
| Prompt agent → code → review diff → hope | Spec → agent plan → **approve plan** → execute → **verify against spec** |

### Project constitution (GitHub Spec Kit pattern)

`spec/constitution.md` in the repo — non-negotiable rules the agent must honour on **every** task:

- *No public function without Pester tests for success / error / edge.*
- *Tests are evidence. Tests that mock the thing under test are not evidence.*
- *Destructive operations require explicit `-Confirm` or pipeline approval.*

### Why it beats prompt engineering

- The agent's training data has no idea what *your* service boundaries mean. The spec is the only place that exists.
- **Strong types catch ~94% of LLM errors** at compile time (TypeScript benchmark) — schemas, Pester, Bicep validation generalise the same idea.
- A 1-page spec reviewed up front is cheaper to fix than a 600-line diff reviewed at the end.

> Continued → next slide: *the spec is not a substitute for code review*.

<!--
Speaker notes (for newcomers):
- **Spec** = a short written description of WHAT you want and WHY — written *before* any code.
- Think of it like a one-page work order: "Build me X, it must handle Y, must NOT do Z."
- Why bother? Because if the agent goes off-track, the spec is the cheap thing to fix (1 page) vs. re-reading 600 lines of generated code.
- **Constitution** = the project's permanent ground rules (e.g. "all public functions get tests"). One per project, rarely changes.
- Spec = per task. Constitution = forever. Instructions (slide 4.3) = forever, like the constitution.
-->
---

<!-- _class: compact -->

# Spec-Driven Development — The Spec Is Not a Substitute for Code Review

> The spec tells the agent *what* to build. It does not absolve you from reading *what it actually wrote*.

### Pitfall — compile-from-spec without reading

Running the compiler from the spec **without reading what it wrote** makes the code worse every cycle. The spec is per-task intent; **the design is a daily investment**.

Each unread cycle:

- Drifts the implementation further from the spec's intent.
- Bakes in subtle bugs the next cycle has to work around.
- Compounds — software entropy is exponential, not linear.

### The two daily investments

- **Read the diff.** Every AI commit. No exceptions.
- **Refactor the design.** When the spec and the code disagree, fix the *design*, not just the next prompt.

> *"Invest in the design of the system every day."* — **Kent Beck**
> *"Compile-from-spec without reading = software entropy."* — Matt Pocock, 2026

> Pair: **M3** (spec lives in Git) · **M5** (verify against spec) · **M9.10a** (architecture review *before* generation). See [GitHub Spec Kit](https://github.com/github/spec-kit).

---

<!-- _class: dense -->

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

<!--
A custom agent is a named bundle of three things: a system prompt (the persona), a tool allowlist (what the agent can actually do), and optional handoffs (which other agents it can call). The same underlying model powers all of them; the difference is configuration, not capability.

The tool allowlist matters more than the persona. A "refactor agent" without `runTests` cannot actually verify its refactors; a "security reviewer" with `editFiles` is no longer a reviewer. Choosing the minimal tool set for each agent is what turns the agent definition from cosplay into an actual constraint.
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
| 6 | **Cross-Tool** | `AGENTS.md` / `CLAUDE.md` | Always-on (tool-specific) |

<!--
The six types form a spectrum from "always loaded, no questions" (project instructions) to "loaded only when explicitly invoked" (prompt files), with pattern-matched instructions, skills, and agents distributed across the middle. Each step on the spectrum trades token cost against discoverability — more always-on means more reliability but higher per-request cost; more on-demand means lower cost but more risk the agent misses what it needs.

Most teams reach for the wrong end of the spectrum first. The instinct is to put everything in `copilot-instructions.md` because "then it always works." The result is a bloated always-on file that contradicts itself in places and burns tokens on irrelevant rules. The mature pattern is the inverse: a short always-on file, a handful of pattern-matched instructions for specific languages, a few skills for specialised domains, and prompt files for repeated tasks.
-->
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

<!--
"Atelier" is the deliberate metaphor here — the workshop of a craftsperson, kept stocked with their own instruments, organised the way they think, and carried with them between projects. Applied to agentic tooling, the atelier is the personal layer of customisation that travels with the developer rather than living inside any one repository: instruction files, custom agents, skills, prompt files, all version-controlled and synced across machines (the cross-machine sync pattern from slide 10.5a).

The "as code" framing is the load-bearing claim. The atelier is not a collection of saved chat snippets or browser bookmarks; it is a Git-tracked directory tree with diffable history, peer review, and rollback. The same engineering discipline the curriculum applies to project code applies to the developer's personal AI configuration. Mature practitioners maintain their atelier with the same care they give to their dotfiles or their PowerShell profile — and for the same reason: small daily investments compound into a permanent productivity advantage.
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

<!--
The Planck quote frames the philosophical claim under this entire module: knowledge requires evidence, and in software the evidence is a passing test. "It compiles" and "the chat output looks reasonable" are not evidence — they are absence of one specific class of failure.

The "executable specification" framing has been around since Beck's *Test-Driven Development* (2002), but it acquires new force in the agent era. For a human team, a test suite is a check on the code. For an agent, the test suite is the *only signal that closes the verification loop*. Without tests, the agent has no way to know when to stop iterating — it falls back to the model's own assessment of its work, which is exactly the unreliable judgement the tests were supposed to replace.
-->
---

<!-- _class: compact -->

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

<!--
The Pester structure shown (`Describe` → `Context` → `It`) is BDD-style nesting borrowed from Ruby's RSpec by way of JavaScript's Jasmine and Mocha. The structure does not affect test execution — it affects readability and the granularity of the failure report. A flat list of `It` blocks passes the same tests; a well-grouped suite tells you *which class of behaviour* broke.

The six categories on the table are not arbitrary — they correspond to the six places defects empirically cluster in production code (success-path bugs are rare; null/empty/edge are common; error-path defects are the most expensive because they only surface in incidents). An agent told to write "comprehensive tests" will usually produce a balanced sample across these six; a vague "write some tests" instruction produces three success-path tests and nothing else.
-->
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

> **Rate of feedback = speed limit.** *"Don't outrun your headlights."* — Hunt & Thomas, *Pragmatic Programmer*. Fast tests = small correctable strides for the agent; slow tests = long dangerous ones. TDD doesn't fight AI — it **governs** it.

<!--
Iteration is bounded, not infinite. Every agent host imposes some cap — maximum tool calls per turn, maximum turns per task, maximum tokens consumed — partly for cost reasons, partly because runaway loops are a real failure mode (the agent fixing a symptom that re-creates itself in another file).

The interesting variable to watch in practice is *iteration depth*: how many cycles does the agent need before VERIFY passes? On well-structured repositories with good tests, two or three. On under-tested codebases the agent may iterate ten times and still ship something that compiles but is wrong. Iteration depth is therefore a useful proxy for "how AI-ready is this repo?" — high counts mean the verification signal is too weak.
-->
<!--
The self-verification loop on this slide is the structural reason agentic coding is different from autocomplete. Autocomplete stops at step 1; the chat-era model stops at step 2; only an agent with tool access can run step 3 and iterate on the result.

The loop is genuinely automatic but bounded — every host enforces some maximum on iteration count, typically five to ten cycles before the agent stops and reports failure to the human. Hitting that cap is itself a signal: usually it means the test is testing the wrong thing, or the requirement is under-specified, or the agent has been chasing a symptom across files. The remedy is rarely "give it more cycles."
-->

<!--
The Pragmatic Programmer headlights metaphor is the right framing for test-loop speed. Slow tests do not just slow the human — they slow the agent's iteration cycle, which means the agent runs further between checks and accumulates more uncorrected drift before a failure surfaces.

The quantitative version: a five-second test loop lets the agent iterate twelve times per minute. A five-minute test loop lets it iterate twice per hour. The same model on the same task produces dramatically different code quality at those two rates, because the corrective signal arrives at fundamentally different cadences. Investing in test speed is therefore not a developer-experience nicety — it is direct investment in agent output quality.
-->
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

<!-- _class: compact -->

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

<!--
The "if you can run it in a terminal" framing is the most important reframing in this module for a DevOps audience. Most discussion of agentic AI focuses on writing application code, which under-sells what the technology actually does. The model does not care whether the tool it invokes returns source code, JSON, RTF, a stack trace, or `repadmin /showrepl` output — it parses text and reasons about it.

The Active Directory troubleshooting example is genuinely representative of operations work: most of the job is reading diagnostic output (event logs, `gpresult`, `nltest`, `dcdiag`), correlating across hosts, and forming hypotheses. An agent with shell access and a domain glossary can carry the same loop, with the human supervising the conclusions rather than transcribing the inputs.
-->

<!--
Speaker notes (for newcomers):
- Four ways to run an agent, from "watching every keystroke" to "fire and forget on GitHub."
- Start with **Agent Mode** in VS Code — you see everything. Comfortable, low risk.
- Promote tasks to **Cloud Agent** only after you trust your instructions — there's no human in the loop while it runs.
- **Background agent** = like Agent Mode but in a separate copy of the repo so it doesn't block your editor. Good for long refactors.
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

<!--
The immediate / this-week / ongoing structure is calibrated to convert intent into action. Most adoption failures happen in the gap between leaving a workshop motivated and opening the editor the next morning unsure what to do first. The immediate items are deliberately small enough to complete in twenty minutes; the week-one items expand the surface; the ongoing items are the durable practice.

The order also matters. Enabling Agent Mode before writing an instruction file leaves the operator unsupervised; writing the instruction file first ensures the first agentic task already operates under the team's rules. The "share with a colleague" item in week one is the social-mechanism step — it moves the practice from individual to team without requiring a top-down rollout.
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

<!--
Speaker notes — Module 11 appendix

### Timing: 15-20 minutes (2h cut) / 25 minutes (4h cut)

Module 11 widens the agentic operating model beyond code. The pedagogical move is to defuse the assumption that this curriculum is a developers-only practice; the structural claim is that runbooks, legal correspondence, research synthesis, and operational reports all submit to the same loop when the verification step can be made concrete.

When presenting to a mixed audience, this is the module that earns the non-developer attendees' attention. The three-project table (Kerberos rollout, multi-year legal dispute, German tenancy case) is the empirical anchor; the data-governance slide is the gatekeeper that keeps the talk credible in regulated contexts. The transition to Module 12 narrows back to one concrete extension — the lab as the agent's sandbox for infrastructure work.
-->
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

<!--
The table on this slide is one of the strongest claims in the curriculum. Up to this point the audience has been encouraged to picture agents working on source code; this slide widens the frame to claim the same operating model applies to runbooks, legal arguments, research synthesis, and operational reports. The claim is empirical — the next slide names three projects where it has held — not aspirational.

The structural property that makes the loop transfer is verifiability. Code can be compiled and tested; a runbook can be executed in a lab; a legal argument can be cross-checked against a corpus; a research synthesis can be audited against its sources. The agentic loop closes wherever there is a way to check the work. The artefact looks different in each domain, but the supervision pattern — Observe, Plan, Act, Verify, Iterate — is identical.
-->
---

# Three Real Projects, One Pattern

| Project | Domain | Primary artefact | Uses GHCP for |
|---|---|---|---|
| **Project A** | AD Kerberos RC4 rollout | Numbered PowerShell runbook | Script authoring, lab validation, open questions |
| **Project B** | Multi-year legal dispute | 15+ formal emails, argumentation | 600+ document corpus indexing, contradiction detection |
| **Project C** | Tenancy law (German) | Case file, legal Schriftsätze | BGB/BetrKV citation, deadline tracking, drafting |

### All three use the **same six building blocks**:
VS Code + Git + GHCP · Markdown · PowerShell · `memory-bank/` · structured input corpus · deterministic Markdown output

<!--
The three projects on this slide are deliberately drawn from non-software domains — systems engineering, multi-year legal dispute, German tenancy law — to defuse the assumption that the operating model is a software-only practice. The Kerberos RC4 rollout (Project A) produced numbered PowerShell runbooks; the legal dispute (Project B) produced argumentation structures and formal correspondence; the tenancy case (Project C) produced Schriftsatz drafts citing the BGB and BetrKV.

The six building blocks listed at the bottom are the load-bearing finding. None of the three projects could have proceeded with a chat interface alone; each one needed a Git repository, Markdown as the working medium, PowerShell as the bridge to local systems, and a Memory Bank for context that survives across sessions. The operating model is what made the work *durable* — weeks of analysis that could be paused, resumed, audited, and reverted, rather than evaporating between chat sessions.
-->
---

<!-- _class: dense -->

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

<!--
The input / Memory Bank / output / agent / Git diagram is the architectural summary of every project that uses this operating model. The shape is consistent across domains: a structured input corpus (emails, PDFs, logs, evidence), a stable context store (the Memory Bank), an output folder for the deliverables (runbooks, letters, reports), an agent with tools that connects them, and Git underneath everything as the audit and rollback layer.

The diagram's most underappreciated feature is the Memory Bank in the middle. Without it, every chat session begins with the user re-briefing the agent on the project's state; with it, the briefing is the file the agent reads first. The asymmetry compounds quickly — a long-running project (weeks or months) accumulates context that a short chat history cannot reproduce. The Memory Bank is the part of the operating model that turns "the agent helped me with one task" into "the agent participates in a multi-month effort."
-->
---

<!-- _class: dense -->

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

<!--
The `git log` example is real, drawn from a multi-month tenancy dispute. Each commit corresponds to a substantive decision — the version of the letter that incorporated review feedback, the version that restructured around the regulatory directive, the version that added the twenty-eight evidence references. Reading the log backwards reconstructs the thinking; reading it forwards explains the result.

The four properties below the log (reversible, blameable, branchable, citable) are the same properties software engineers value in Git for source code, applied to prose artefacts. "Version as of commit d4f8ea1" is a precise identifier for the exact text that left the office on a specific day; the equivalent in a Word-based workflow is "the version we sent on Tuesday, I think," with no way to recover the lost edits since.
-->
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

<!--
Speaker notes (for newcomers):
- **Memory Bank** = a small set of Markdown files that act as the project's long-term memory between AI chat sessions.
- Why needed? Because each new chat starts fresh — the AI doesn't remember yesterday. The Memory Bank is the briefing you hand it on day 1.
- Don't overthink it: start with `projectbrief.md` ("what is this project") and `activeContext.md` ("what are we working on right now"). Add the rest only when you feel the pain.
- The template in `content/materials/` is ready to copy into any new project.
-->
---

<!-- _class: dense -->

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

<!--
The data-governance slide is the gatekeeper for any non-software audience and increasingly for software audiences too. The matrix is intentionally aimed at the practical questions a compliance officer or legal team will ask: where does the prompt go, who trains on it, what stays out of context, which model handles the request, what is the local-only fallback.

The distinction between Copilot Individual, Business, and Enterprise tiers is the one most teams get wrong. Individual plans default to using prompts for training unless the user opts out; Business and Enterprise plans do not train on customer prompts at all and offer data-residency controls. For HR, legal, healthcare, and any regulated context, the tier choice is the difference between a defensible deployment and a compliance incident waiting to surface. The rule of thumb at the bottom is unsubtle on purpose — it gives non-technical reviewers a clear test they can apply without understanding the underlying details.
-->
---

# M8 Key Takeaway

1. **The agentic loop is domain-independent.** Observe → Plan → Act → Verify → Iterate applies to code, infrastructure, and prose alike.
2. **Git + Markdown + a memory bank** is a better working medium than any document editor for anything you need to reason about carefully.
3. **PowerShell gives the agent hands** in your Windows world — email, PDFs, AD, Exchange, Hyper-V.
4. **Data governance is not optional** the moment your corpus contains real people's real lives.
5. **If you're a sysadmin or an analyst, you are the audience** — just with a different deliverable.

> **Next: how a lab makes the agent safe to let loose on real infrastructure.**

<!--
The summary collapses Module 8 into four capabilities that change the shape of what an agent can do: external reach (MCP), reversibility (checkpoints), coordinated change (multi-file ops), and deployment flexibility (local / background / cloud). Each one expands a different dimension of the basic agentic loop; together they constitute the difference between an editor feature and an operations platform.

The progression to Module 9 is deliberate. Module 8 shows what agents *can* do; Module 9 turns to what they *should* do. The expanded capability surface makes the discrimination harder — a task that was obviously out of scope for autocomplete is no longer obviously out of scope for a cloud agent with database access and rollback. The decision framework moves from technical (can the tool handle this?) to organisational (do we want the tool handling this?).
-->
---

<!-- _class: section-divider -->

# Module 9
## The Lab as the Agent's Sandbox

> *"In theory, there is no difference between theory and practice. In practice, there is."*
> — attributed to **Jan L. A. van de Snepscheut**

<!--
Speaker notes — Module 12 appendix

### Timing: 20-25 minutes (4h cut only)

Module 12 is the operations-track closer. The argument structure is: agents acting on production infrastructure are unsafe by default; a properly designed lab (reversible, reproducible, observable, isolated) makes the agentic loop safe to run; AutomatedLab on Hyper-V is the Hyper-V-native answer for Windows-stack work; Invoke-LabCommand closes the verification loop the way Invoke-Pester does for code.

The Kerberos RC4 example is deliberately chosen because it combines every difficulty mode at once — production-critical, poorly documented, incremental, irreversible-feeling. A lab that rebuilds in twenty minutes turns that fear into a routine test. The operational claim worth landing: the agent does not change production; the agent produces a reviewable artefact (script + runbook + event-log evidence) that lets a human change production with confidence. That is what 'agentic operations' actually means in practice.
-->
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

<!--
The four examples in the bullet list are not hypothetical — each one has happened in field reports during 2025–26. The reboot of a domain controller at 14:07 on a Tuesday is paraphrased from a real Reddit thread. The mass-change of `msDS-SupportedEncryptionTypes` is the kind of thing the Kerberos RC4 deprecation timeline produced as agents misread Microsoft's guidance. The recursive OU delete is a periodic Microsoft 365 incident.

The dilemma framing matters because it cuts through the binary discourse common in operations contexts. "Just don't use AI agents on infrastructure" is one answer, and it leaves the productivity gains on the table; "trust the agent because the demos look great" is the opposite answer, and it produces the incidents above. The sandbox pattern is the middle path: give the agent full autonomy in a structurally safe place, then promote only the verified change to production through normal change-management channels.
-->
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

<!--
The four properties — reversibility, reproducibility, observability, isolation — are the minimum set for an environment that an agent can operate in safely and usefully. Take any one of them away and either the agent becomes unsafe (no isolation, no reversibility) or it stops being useful (no reproducibility means each iteration starts from a different baseline; no observability means the agent cannot close its verification loop).

The scoring table is a frank assessment, not a marketing claim. AutomatedLab scores well for Windows infrastructure work because every property maps to a native PowerShell cmdlet (`Restore-LabVMSnapshot`, `Install-Lab`, `Invoke-LabCommand`, Hyper-V isolation). Dev containers score lower on observability because Windows event logs and registry state are not first-class inside a Linux container. Cloud sandboxes score well *if* cost discipline holds; teams that forget the teardown script discover that an "isolated" agent can run up a four-figure cloud bill over a weekend.
-->
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

<!--
The diagram is the most explicit mapping in the curriculum between the abstract agentic loop and a concrete infrastructure workflow. Each phase has a literal PowerShell cmdlet behind it — `Get-LabVM` for observe, `Checkpoint-LabVM` and `Invoke-LabCommand` for act, `Get-WinEvent` for verify, `Restore-LabVMSnapshot` for the iteration fallback. None of these were designed with AI agents in mind; they were designed for human operators, and they happen to give the agent the same affordances.

The verify step is the one most often misunderstood. "Did event 205 appear?" is a binary check the agent can run by reading the system event log; it succeeds or fails in a way the agent can act on. By contrast, "is the domain healthy?" is a check no agent can perform reliably because it is not operationalised. The discipline of designing verification steps as concrete log entries or registry values is what makes the loop closable; vague verification criteria collapse the loop back into the cheating-agent trap from Module 5.
-->
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

<!--
The before/after comparison on this slide compresses what is often a multi-week procedural difference into a single table. The three-week CAB process for a mass attribute change is not paranoia — it is the rational response to a change that touches authentication for every account in the forest. The lab variant does not skip the rigour; it relocates it. The script is still reviewed, the change is still rehearsed, the verification is still required. What changes is that all of that happens in a place where mistakes cost minutes rather than incidents.

The closing line is the operational claim of the entire module. The lab is where risk is rehearsed *before* it touches production, not a place where risk is ignored. A team that uses agents in a lab to rehearse changes ends up with better change tickets — specific scripts, observed event sequences, documented side effects — not lower-quality ones. The CAB review on the production change is still required; it is now able to read a runbook that says "we did this in the lab, here is the event log proving it worked, here is the rollback snapshot reference."
-->
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

# Sergeant and Commander

> *"The AI is the tactical sergeant on the ground. You are the strategic commander above it."*
> — paraphrased from **Matt Pocock**, *"Claude Code for real engineers"*, 2026

- **Sergeant (AI)** — executes, reports, surfaces casualties (failing tests, broken builds).
- **Commander (you)** — holds the map, sets the objective, decides what counts as victory, owns the consequences.

> Lose the commander and the sergeant still moves — but no longer *toward* anything. That is heteromation (M9.10b) by another name.

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

# Questions?

*[Your Contact Info]*
*[Your Email]*
*[Materials Download Link]*

<!--
The Q&A is usually where the most useful conversation of the training happens, because the questions surface what the audience has internalised versus what slid past. The five common topics listed on the slide are reliable starters when no one raises a hand first; in practice the room usually has its own opening question.

The most common genuine question after this training is some version of "how do I convince my team / my manager / my security organisation to allow this?" That question is partly about the technology but mostly about organisational change — instruction files committed to a shared repository, GitOps as a structural guardrail, Memory Bank as an audit trail. The curriculum has these answers in its body; the Q&A is where they get connected to the specific organisation in the room.
-->