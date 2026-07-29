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
- **Massive context windows** — 1M+ tokens (Claude Opus 4.8)
- **Advanced reasoning** — Claude Opus 4.8, GPT-5.6 family, Gemini 3.6 Flash, Kimi K2.7 Code
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

# Understanding the Economics

### What are tokens?
- ~4 characters or ~¾ of a word — both input and output consume them

| Model | Copilot status (22 Jul 2026) | Best fit |
|---|---|---|
| Claude Opus 4.8 | preview since Jun 29; up to 1M context | premium reasoning |
| GPT-5.6 Sol / Terra / Luna | gradual rollout since Jul 9 | highest / balanced / fast |
| Gemini 3.6 Flash | preview rollout since Jul 21 | web, app, longer-horizon work |
| Kimi K2.7 Code | GA; Business/Enterprise since Jul 7 | open-weight, lower-cost coding |

### Why cost matters in agentic workflows
- Each iteration (observe → plan → act → verify) adds token usage
- Cloud agents run autonomously — costs accumulate
- Some models use provider list pricing under usage-based billing
- Monitor usage via GitHub settings, per-session cost, or OpenTelemetry

<!--
Speaker notes (for newcomers):
- Think of tokens like minutes on a prepaid phone: every message you send and every reply you get "costs" some.
- One agentic task = many small back-and-forth calls (read file, plan, write, run tests, read error, fix). Each call eats tokens.
- That is why even a "cheap" model can produce a noticeable bill when run on autopilot for hours.
- Concrete rule of thumb: 1 page of English text ≈ 500 tokens; a medium PowerShell file ≈ 1000–3000 tokens.
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

<!-- _class: compact -->

# Context Engineering — Context Is a Finite Resource

> Prompt engineering was about the words. **Context engineering** is about *what fills the window* over a whole task.

### Treat the context window as a budget, not a warehouse

- **Context rot** — recall drops as the window fills. A bigger window is **not** simply better.
- **Curate, don't dump** — the smallest set of high-signal tokens that gets the job done.
- **Just-in-time** — let the agent pull files on demand (paths, `grep`) instead of pre-loading everything.
- **Notes outside the window** — your **Memory Bank is exactly this pattern**.

> Same discipline, new name: give the model what it needs, when it needs it — and nothing else.

<!-- Speaker notes: "Context engineering" is the field's successor to prompt engineering (Anthropic, 2025). The counter-intuitive point: a 1M-token window does not mean you should fill it — models lose recall as context grows (context rot). The Memory Bank we already teach is a structured-note-taking instance of context engineering, so this elevates existing content rather than replacing it. -->

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

<!-- _class: compact -->

# Three Evidence Planes — Git Is Necessary, Not Sufficient

| Evidence plane | Question it answers | Durable evidence |
|---|---|---|
| **Traceability** | What artefact changed? | Git diff, commit, pull request |
| **Agent observability** | How did the Agent act? | Model and Tool calls, hooks, subagents, errors, cost |
| **Claim provenance** | Why should I trust this claim? | Exact source passage + stable identifier |

Git cannot show a failed Tool call, a blocked hook, or a claim copied from the
wrong source. **Use all three planes when the consequence matters.**

> Privacy boundary: full trace capture can include prompts, code, file contents,
> Tool arguments, and results. Capture content only in a trusted environment.

<!--
Git Traceability is deliberately retained as the first evidence plane: it is
portable, deterministic, and sufficient for reviewing the final artefact. It is
not a transcript of the Agent's execution. A failed Tool call, a blocked hook,
or a discarded subagent result may leave no Git change at all.

VS Code's OpenTelemetry guide (updated 2026-07-15) emits a connected trace tree
for Agent orchestration, Model calls, Tool calls, hooks, and subagents, plus
cost, error, and outcome metrics. GitHub Copilot session streaming entered
public preview on 2026-07-02 for prompts, responses, and Tool calls. Keep those
execution records separate from adoption dashboards, which measure usage rather
than explain one action.

Content capture is off by default. Turning it on can collect sensitive code,
prompts, file contents, Tool arguments, and Tool results, so retention and
access control become part of the design.

Sources:
- https://code.visualstudio.com/docs/agents/guides/monitoring-agents
- https://github.blog/changelog/2026-07-02-copilot-agent-session-streaming-is-now-in-public-preview/
-->
---

<!-- _class: compact -->

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

<!--
Git forensics — `git log`, `git blame`, `git bisect` — has always existed; what changes with agents is the activation energy. Asking the agent to compute contributor frequency across a directory tree is a one-sentence prompt; doing it by hand is ten minutes of shell scripting most people never bother with.

The attribution pattern shown (Copilot as a named author via `Co-authored-by:` trailer) is becoming the standard way to make AI involvement countable. It does not solve the question "is this code good?" but it solves "how much of our recent code touched AI?", which is the question audit, compliance, and engineering management actually ask.
-->
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

<!--
Speaker notes (for newcomers):
- **Checkpoint** = a saved snapshot of all files at one moment. Like "save game" in a video game.
- VS Code automatically creates checkpoints after each agent turn — you didn't have to do anything.
- This is *separate* from Git commits. Checkpoints are short-term, in-editor. Commits are the permanent, shareable history.
- The combination is powerful: small, free undos via checkpoints; big, durable history via Git.
-->
---

# Commit Strategies for AI Work

| Strategy | Example |
|----------|---------|
| **Conventional Commits** | `feat(validation): add config validation 🤖` |
| **Branch Strategy** | `main → feature/add-validation → ai/config-validation` |
| **Co-authored** | `Co-authored-by: AI Assistant <ai@example.com>` |

<!--
The three strategies are not alternatives — most mature teams use all three at once. Conventional Commits give the message structure (and feed semantic-version tooling like `semantic-release`); branch prefixes make AI work visible at the branch level; the `Co-authored-by:` trailer makes it visible per commit.

The branch-prefix convention (`ai/<slug>`) is more important than it looks. It triggers different CI rules — stricter linting, mandatory human review, sometimes additional security scans — without requiring per-commit metadata. The branch name *is* the policy hook.
-->
---

<!-- _class: compact -->

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

<!--
The `Co-authored-by:` trailer is a Git convention, not a Git feature — it is just a structured line in the commit message body. GitHub recognises it and adds the named co-author to the commit's contributor list; other forges (GitLab, Azure DevOps, Gitea) increasingly do the same.

The useful side-effect for AI-augmented teams is that `git log --author="AI Assistant"` becomes a real query. Reporting "what fraction of last quarter's commits had AI co-authorship?" stops being a survey question and becomes a one-line shell command.
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

<!-- _class: compact -->

# Two Patterns for Context — Grill-Me + Ubiquitous Language

Two concrete, repo-checkable instances of *"context lives in Git"*.

### 1. The Grill-Me Pattern — adversarial requirements interview

The agent interviews **you** (40–100 questions: edge cases, failure modes, owner, rollback) and emits a written design concept you sign off on **before** any code.

- Brooks, *Design of Design*: defects originate in requirements, not code.
- Ship as a custom agent / skill — e.g. [`github.com/mattpocockuk/skills`](https://github.com/mattpocockuk/skills) (~13k ★).
- The grill-me transcript **becomes the spec** (pairs with M4 spec-driven dev).

### 2. Ubiquitous-Language File — DDD for human-AI collaboration

`docs/glossary.md` — checked-in markdown table of every domain term, with *forbidden synonyms*.

| Term | Means | Don't say |
|------|-------|-----------|
| `Tenant` | Billable customer organisation | Account, Client, Org |
| `Seat` | Licensed user inside a Tenant | User, Member, Login |
| `Run` | End-to-end pipeline execution | Job, Build, Invocation |

Agent reads it before planning → log lines, tests, variable names use the **team's** language, not the model's. Drift shows up in `git log`.

> Vague *"context"* → **artefacts a human reviewed and a diff can prove**.

<!--
The Grill-Me pattern operationalises Fred Brooks's observation from *The Design of Design* (2010) that most defects originate in the requirements, not the implementation. By forcing the agent to interview the human *before* writing code, the cost of the inevitable misunderstanding moves from "discovered after deployment" to "discovered in chat." The transcript itself becomes a reviewable spec artefact — not a side-effect, but the point.

The Ubiquitous-Language pattern applies Eric Evans's Domain-Driven Design idea (*Domain-Driven Design*, 2003) to human-AI collaboration. Without a glossary, the agent picks whichever synonym is most common in its training data: "customer" instead of your "tenant," "job" instead of your "run." The result is code that compiles but uses vocabulary nobody on the team uses, which is invisible at PR-time and corrosive over months.

Both patterns share a structural property worth naming: they produce *artefacts* (transcript, glossary) that live in Git. "Context" stops being something hand-waved in a hallway conversation and becomes something a diff can show changed.
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
Speaker notes (for newcomers):
- This is the most practical slide in the module: copy-paste this into your own `copilot-instructions.md` today and the agent will start testing its own output.
- The magic line is "do not report completion until all tests pass" — it forces the agent to iterate instead of giving up.
- **Invoke-Pester** is the command that runs all the tests in your project.
-->

<!--
The shape of this file matters. Markdown headings act as soft section tags the model uses for retrieval; bullet lists read as imperative rules; prose reads as background commentary. A well-structured instruction file is closer to a configuration document than to a memo.

Length is a real constraint — the file is prepended to every request, so a 4,000-token rulebook is a 4,000-token tax on every interaction. The discipline is to keep the always-on rules short and push specialised guidance into pattern-matched `*.instructions.md` files or skills that load on demand. "What goes in copilot-instructions.md" is the same question as "what does every task need to know?"
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

<!--
Speaker notes (for newcomers):
- Companion to the previous slide: writing a spec is half the discipline. **Reading the diff** is the other half.
- "Compile-from-spec" = asking the agent "build me X from the spec" and merging whatever it produces without looking. Feels productive. Compounds into garbage.
- The two daily habits to internalise: (1) read every AI diff, (2) when the design no longer matches the spec, fix the *design*, not the prompt.
- Software entropy is exponential. Three unread cycles isn't 3× worse — it's unrecoverable without a refactor.
-->

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

<!-- _class: dense -->

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

<!--
Speaker notes (for newcomers):
- **Handoff** = one agent finishing its job and passing the result to a different agent with a different specialty.
- Real-world analogy: developer commits → hands to QA → hands to security → hands to release engineer. Same idea, fully automated.
- Don't build a 5-agent pipeline on day one. Start with a single agent. Add a second only when you keep doing the same review by hand.
-->
---

<!-- _class: compact -->

# Beyond Handoffs — Orchestration Patterns

A sequential handoff (Dev → QA) is one shape. Agents compose in more:

| Pattern | Shape | Use when |
|---|---|---|
| **Routing** | classify, then send to the right specialist | inputs fall into distinct kinds |
| **Parallelization** | split into independent sub-tasks, then merge | the work divides cleanly |
| **Orchestrator–workers** | a lead splits work *it decides* at runtime | you can't pre-list the sub-tasks |
| **Evaluator–optimizer** | one drafts, another critiques, loop | clear quality criteria exist |

### Sub-agents for context isolation

A worker explores in **its own clean window** and returns a **short summary** — the lead never sees the noise. (VS Code now runs parallel agent sessions.)

> Rule of thumb: **don't build an agent when a workflow will do.** Start simple; add structure only when it earns its keep.

<!-- Speaker notes: This generalizes the existing Dev to QA to Prod handoff into the standard agentic patterns (Anthropic, "Building effective agents"): routing, parallelization, orchestrator-workers, evaluator-optimizer, plus sub-agents that isolate context and return distilled summaries. The discipline to stress: simplicity first — a fixed workflow is more predictable than an autonomous agent; reach for agents only when the steps can't be pre-defined. -->

---

<!-- _class: dense -->

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

<!--
Speaker notes (for newcomers):
- Why not just put everything in instructions? Because instructions are loaded on *every* request — burning tokens (= money) even when irrelevant.
- A **skill** is like a reference book on a shelf: the agent grabs it only when the task title matches its description.
- Example: a "debug failing Pester tests" skill is useless 95% of the time. As a skill, it costs zero tokens until you actually have a failing test.
- Key field: the `description:` in the skill's frontmatter is what triggers it. Write it like a search query — keywords matter.
-->
---

<!-- _class: compact -->

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

<!--
Speaker notes (for newcomers):
- A prompt file is just a saved message you re-use. Type `/CodeReview` instead of pasting the same paragraph for the hundredth time.
- Easy way to start: every time you re-type the same paragraph, save it as a `.prompt.md`. After a month you'll have your own toolkit.
- Difference from a skill: a skill is loaded *automatically* when relevant. A prompt is loaded *manually* when you type the slash command.
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

<!-- _class: compact -->

# The Standardization Wave — Your Customizations Are Portable

Agent ecosystems are converging on **open, cross-vendor standards** under Linux Foundation governance.

| Standard | What it is | Where it runs |
|---|---|---|
| **MCP** | Agent-to-Tool context and capability protocol | Copilot, Claude, ChatGPT, Cursor… |
| **A2A** | independent Agent-to-Agent task protocol | cross-vendor Agent systems |
| **AGENTS.md** | project instructions for agents | most coding agents |
| **Agent Skills** (`SKILL.md`) | on-demand expertise, progressive disclosure | Copilot, Codex, Cursor, Gemini CLI, goose… |

- **Protocol map:** MCP equips one Agent; A2A lets independent Agents collaborate.
- **Why you care:** the atelier you build here is an *investment that travels* — not lock-in.
- The Foundation even calls it an **"agent operating stack"** — the same idea as this training's operating model.

<!-- Speaker notes: The shift since early 2026 — Skills, AGENTS.md, and MCP moved under the Agentic AI Foundation, while A2A is maintained as a separate Linux Foundation project. A2A v1.0.1 shipped in May 2026, so this is a protocol-map clarification rather than a July trend: MCP is Agent-to-Tool; A2A is independent Agent-to-Agent; an in-process subagent still uses the host's native delegation primitive. Takeaway: instruction files, Skills, and protocol investments are portable, but exact support still varies by product. Sources: https://aaif.io/ and https://a2a-protocol.org/latest/ -->

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

> **Write an agent once, use it everywhere** — the same files run in the editor, the **terminal** ([ShellPilot](https://github.com/raandree/ShellPilot)), and a **desktop app** ([DeskPilot](https://github.com/raandree/DeskPilot)).

<!--
"Atelier" is the deliberate metaphor here — the workshop of a craftsperson, kept stocked with their own instruments, organised the way they think, and carried with them between projects. Applied to agentic tooling, the atelier is the personal layer of customisation that travels with the developer rather than living inside any one repository: instruction files, custom agents, skills, prompt files, all version-controlled and synced across machines (the cross-machine sync pattern from slide 10.5a).

The "as code" framing is the load-bearing claim. The atelier is not a collection of saved chat snippets or browser bookmarks; it is a Git-tracked directory tree with diffable history, peer review, and rollback. The same engineering discipline the curriculum applies to project code applies to the developer's personal AI configuration. Mature practitioners maintain their atelier with the same care they give to their dotfiles or their PowerShell profile — and for the same reason: small daily investments compound into a permanent productivity advantage.

The portability claim is now literal rather than aspirational: ShellPilot (github.com/raandree/ShellPilot) loads the same instruction files and Agent Skills from the PowerShell terminal, and DeskPilot (github.com/raandree/DeskPilot), built on the ShellPilot engine, does the same from a desktop chat app. "Use it everywhere" comes to mean the editor, the shell, and a GUI — the Atelier is the durable asset; the surface is interchangeable.
-->
---

<!-- _class: compact -->

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
| Frontmatter parse error | Blank line required between closing `---` and first heading |

**Diagnostic tools** — `Chat view gear → Open Chat Customizations` lists every registered agent / instruction / skill / prompt. `Chat view ⋯ → Show Agent Debug Logs` shows registration and parse errors.

> **Rule**: debug the *description*, not the content.

<!--
Speaker notes (for newcomers):
- The most common skill bug: "my skill never fires." Almost always the `description:` is too vague.
- Treat the description like a search query. Include the exact phrases users would say ("USE FOR: debug Pester, mock issues, ModuleBuilder error…").
- The `DO NOT USE FOR:` line is just as important — it stops the skill firing on adjacent-but-wrong tasks.
- If your skill won't load at all: 99% of the time the YAML frontmatter is malformed. Open the Agent Debug Logs panel — the error is there.
- Worked example: CopilotAtelier's `skill-creator` skill is the meta-skill for this — the six-step authoring frame, the 1024-char description cap, and a Claude-A/Claude-B eval loop.
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

<!-- _class: compact -->

# You Can Verify the Output, Not the Reasoning

> *Bei einer KI-Antwort gibt es keine kausale Kette von Gründen, der wir folgen können — nur statistische Korrelation. Und trotzdem vertrauen wir ihr mehr als einem Menschen.*
> *A model's answer has no causal chain of reasons you can follow — only statistical correlation — yet we trust it more than a human's.*
> — Richard David Precht, *Lanz & Precht* (ZDF), 2026 *(sinngemäß / paraphrased)*

### The epistemic "why" beneath Module 4

- A model does not *reason to* an answer along an auditable chain — it samples the most probable continuation. Ask *"why this and not that?"* and there is **no traceable justification**, only weights.
- **Automation bias** makes us trust the confident machine answer *more* than a human's — precisely when we can least inspect it (see the Vigilance Trap, M9).

### So the operating model verifies what it *can*

| You cannot audit… | So you verify the… |
|---|---|
| The model's reasoning (a black box) | **Artefact** — tests pass, the `git diff`, an RSOP / `terraform plan` |
| *Why* it chose an approach | **Behaviour** — evals across many tasks (a score, not a vibe) |
| A trustworthy *"who said it"* | **Traceability** — Git attributes every change (M2) |

> Don't verify the thought — you can't. Verify the **artefact** — you can. That is why self-verification and traceability are **non-negotiable**.

<!-- Speaker notes: This slide is the epistemic "why" beneath all of Module 4. A model produces the statistically most probable output; it does not follow a causal chain of reasons a human can audit — Richard David Precht makes exactly this point in the Lanz & Precht podcast (ZDF, 2026), noting we nonetheless trust the machine more than a person (automation bias, which the Vigilance Trap slide in M9 grounds in Parasuraman & Manzey 2010). The AOM's whole answer follows: since you cannot inspect the reasoning, verify the deterministic artefact instead — tests, the git diff, an RSOP or terraform plan — measure the agent's behaviour with evals, and lean on Git traceability to replace the missing "whom do I trust" signal. The Precht line is paraphrased from an auto-transcribed episode; verify it against the audio before quoting verbatim on stage. -->

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

<!--
Speaker notes (for newcomers):
- This is the single most practical slide in Module 4 — copy-paste this block into your own `copilot-instructions.md` today.
- The magic line is "do not report completion until all tests pass." That one rule forces the agent to iterate rather than give up.
- Want it in a non-PowerShell project? Replace `Invoke-Pester` with `pytest`, `npm test`, `dotnet test`, etc. The pattern is language-agnostic.
-->

---

<!-- _class: dense -->

# Test-First with AI

### Traditional — Code First
`Write function → Write tests → Run → Fix`

### Test-First — Tests as Specifications
`Write tests → Write function to pass them → Green ✅`

> **Tests become the specification. The agent's job is to satisfy them.**

*Codified as* CopilotAtelier's [`test-driven-development`](https://github.com/raandree/CopilotAtelier) skill — red-green-refactor, a failing Pester test before the code, and the test pyramid.

<!--
Test-first development with AI inverts the failure mode of the cheating-agent trap (slide 5.11a). When tests are written first and the code is written to pass them, the tests act as the specification the code must conform to — the agent cannot rewrite the spec to fit the bug, because the spec exists before the bug does.

The practical concern is that not all requirements are easy to express as tests upfront. Anything involving UI, performance, or fuzzy correctness ("the error message should be helpful") resists test-first authoring. The mature pattern is hybrid: test-first for behaviour with crisp acceptance criteria, code-first followed by tests for behaviour that has to be discovered before it can be specified.
-->
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

<!--
The test code on this slide is the executable form of a requirements document. Each `It` block names a behaviour the function must exhibit; the function does not exist yet and the tests fail by design. The agent's task is to produce the smallest implementation that turns all the assertions green — nothing more.

The pattern aligns with what the spec-driven module called "plan before code" (slide 4.7a). The test suite *is* the plan; the implementation is downstream of it. This eliminates a class of disagreement that otherwise has to be resolved by reading generated code — if the tests pass, the behaviour matches the spec by definition.
-->
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

<!--
The verification surface extends well beyond unit tests. Static analysers (PSScriptAnalyzer, ESLint, Pylint, Roslyn analysers) catch a different class of defect than tests do — style, common bug patterns, security smells — and they run in milliseconds rather than seconds. Type checkers (mypy, pyright, TypeScript's `tsc`, F#'s compiler) catch yet another class, the one Matt Pocock pointed at when he claimed TypeScript catches ~94% of LLM errors that surface as type-check failures.

The practical implication is that verification should be a *layered* signal, not a single check. Compile/type-check (instant), lint (sub-second), unit tests (seconds), integration tests (minutes), end-to-end (longer). The agent should iterate at the fastest layer it can, escalating to slower layers only when faster ones go green. Skipping the fast layers in favour of running the full test suite on every iteration is a common mistake — it wastes the cheap signal that would have caught most of the defects.
-->
---

<!-- _class: compact -->

# The Cheating-Agent Trap

> *"AI writes broken code — then writes broken tests to validate the broken code."*
> — *Axel Molist, "What 6 months of AI coding did to my dev team" (2026)*

### The trap:
Self-verification only works if **tests are independent of the code**.
When the same agent writes both, both can be wrong **in the same direction**.

```text
Code:  IsValidEmail("abc") → returns $true
Tests: Should -BeTrue        ← matches the bug
Agent: "All 12 tests passed." 🟢     Reality: function is broken.
```

### Mitigations — pick at least two:

| Mitigation | Why it works |
|---|---|
| **Tests-as-specs**, written first (often by a human) | Tests anchor on real behaviour, not on the code |
| **"Tests must fail first"** rule | Forces the agent to prove the test discriminates |
| **Independent reviewer agent** | A second agent writes adversarial / negative tests |
| **Mutation testing** | Mutate the code; if no test fails, the suite is too weak |
| **Hold-out acceptance criteria** | Cases the agent never sees, run by the human after "done" |

> Assertions are evidence. **Evidence requires an independent witness.**

<!--
Speaker notes (for newcomers):
- The trap in one sentence: if the same brain writes the bug AND the test, it writes a test that approves the bug.
- Easiest mitigation for beginners: write (or sketch) the tests yourself BEFORE asking the agent to implement the function. Now tests are independent.
- Or: ask a *different* agent (a "reviewer" agent from Module 4) to write the tests. Two brains, one truth.
-->
---

<!-- _class: compact -->

# Evals Are Not Unit Tests

A unit test asks "is this function correct?" An **eval** asks "does the **agent** do the right thing across many varied tasks — when the output isn't deterministic?"

| | Unit test | Eval |
|---|---|---|
| Grades | one function | the agent's behaviour over a task set |
| Answer | pass / fail | a **score** across trials |
| Grader | code | code **+ LLM-as-judge + human** |

- **Capability evals** (start low, a hill to climb) vs. **regression evals** (near 100%, catch backsliding).
- **`pass@k`** (one of k tries works) vs. **`pass^k`** (all k succeed — the bar for reliability).
- **Eval-driven development:** write the eval *before* the agent can pass it — the same move as test-first.
- **In practice:** CopilotAtelier's [`agent-evals`](https://github.com/raandree/CopilotAtelier) skill ships a `run-evals.ps1` harness with `pass@k` / `pass^k` gating — start from 20–50 real failures.

> Deterministic tests still verify the *code*. Evals verify the *agent*. You need both.

<!-- Speaker notes: This extends self-verification from deterministic Pester tests (which prove the code) to evals (which measure the non-deterministic agent or prompt). Vocabulary: graders (code / LLM-as-judge / human), capability vs regression evals, pass@k vs pass^k, and eval-driven development. Practitioners call evals "the single hardest problem in AI engineering." For this audience: you don't need a framework to start — 20 to 50 real tasks from your own failures is enough. -->

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

<!--
The split between automated and human layers is not arbitrary — it tracks which questions have objective answers. "Does the code compile?", "do the tests pass?", "is the code free of lint warnings?" are decidable; an agent can answer them as well as a human. "Is the logic correct?", "is this the right abstraction?", "does this fit our architecture?" are judgement calls; an agent can offer an opinion but the decision lives with the human.

That last item deserves a caveat. "Does this fit our architecture?" is only *partly* a judgement call — a large subset of architecture conformance (layering, dependency direction, naming, public/internal boundaries) is decidable and belongs in the automated column. Architecture-rule analysers (NDepend, the Roslyn analysers) enforce it in compiled languages; in PowerShell the equivalent is a handful of Pester *architecture tests* asserting module boundaries, help coverage, and manifest rules. Put those in the agent's loop and it self-corrects *structural* drift the way it self-corrects a failing unit test — keeping the distance between the built system and its intended architecture (call it *structural debt*, distinct from technical and comprehension debt) near zero. What stays a genuine judgement call is the deeper question — "is this the *right* abstraction?" — not the structural rules.

The practical implication is that human review should focus on layers 4–5. Spending review cycles re-checking the agent's syntax and tests is wasted effort — the agent already checked them, and the human is not faster or more accurate at the same check. Time saved at the bottom of the hierarchy is time available to spend on the top, where human judgement is genuinely scarce.
-->
---

<!-- _class: section-divider -->

# Module 5
## Advanced Capabilities

> *"Alles hängt mit allem zusammen."*
> *"Everything is connected to everything else."*
> — **Alexander von Humboldt**

<!--
Speaker notes — Module 5 appendix

### Timing: 20-25 minutes

### Key Points to Emphasize:
1. Tests transform "I think it works" into "I proved it works"
2. The agent **iterates until tests pass** — you get working code
3. Test-first approach treats tests as **specifications**
4. You still review, but automated checks handle basics

### Demo Tips:
- Show a real test execution
- If possible, have a test fail and show agent fixing it
- Show the final "all tests passed" output
- Highlight that this happened without your intervention

### Common Questions:
- "What if tests are wrong?" → Tests are also code you review
- "How long does iteration take?" → Usually 1-2 cycles
- "What about complex logic?" → Works best with clear specifications
- "Does it always pass?" → No, but you see exactly what failed

### Transition to Module 6 (Extended) or Summary:
- Extended: "Now let's see all of this in action with Copilot Agent Mode..."
- 2-Hour: "Let's see all these concepts come together in a live demo..."
-->
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

<!--
Speaker notes (for newcomers):
- **MCP** = Model Context Protocol. Think of it as "USB for AI tools."
- Before MCP: every AI tool needed a custom integration for every data source. Painful.
- After MCP: one plug fits everything. Write an MCP server once, every AI tool (Copilot, Claude, Cursor…) can use it.
- Standardized by the Linux Foundation — so it's not a Microsoft- or Anthropic-only thing.
- You don't need to build MCP servers to benefit; hundreds already exist for GitHub, Azure, databases, browsers, etc.
-->
---

<!-- _class: dense -->

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

<!--
The protocol Anthropic published in late 2024 caught on faster than anyone expected; by mid-2026 it had been moved to the Linux Foundation and adopted by every major AI coding tool. The reason is structural: before MCP, every AI host had to write its own integration for every tool, and every tool vendor had to maintain N adapters. MCP turned an N×M problem into an N+M problem.

The "USB for AI tools" framing is more than analogy. MCP defines transport (stdio, HTTP), discovery (`list_tools`), invocation (`call_tool`), and a typed schema language. A server exposes capabilities; the agent discovers and uses them without bespoke wiring. The economic effect mirrors what USB did for peripherals: once the protocol stabilises, the ecosystem can scale independently of any single vendor.
-->
---

<!-- _class: dense -->

# MCP Sits On Top of Your APIs

> MCP does not replace your backend. It replaces the **middleware between
> the model and the API you already own**.

|  | REST API | MCP server |
|---|---|---|
| **Who calls it** | another program | **the model itself** |
| **Caller behaviour** | deterministic | **probabilistic** |
| **The contract** | endpoint + payload | tool name + schema + **description** |
| **Who picks the call** | your app code | **the model's reasoning** |

- **Nothing is thrown away** — auth, paging, rate limits, error handling still live *inside the MCP server*. The work **moved**; it did not vanish.
- **Routing logic left your codebase** — unit tests no longer cover it. That is what **evals** and **containment** are for.

<!--
Slide 8.2 states the capability gap as a binary — without MCP the agent cannot query a database or call a REST API. A room full of people who own a large existing API, CIM, and PowerShell estate will hear that as "MCP is an alternative to what we already built." It is not. The MCP server is a translator that sits over the API you already own; the backend is untouched. The accurate slogan is *MCP on top of APIs*, not *MCP versus APIs* — and for this audience that reframe is usually the moment the protocol stops sounding like a rewrite and starts sounding like an adapter.

The single substitution that produces everything else is the client. With a REST API the client is another program, written by someone who read the docs and hard-coded the call. With MCP the client is the model: it picks the tool by *reading the description*, calls it with arguments it inferred, and will combine capabilities in orders nobody specified. That is the reason the security slide two slides on exists — least privilege is not an arbitrary rule here, it is the consequence of handing an API to a probabilistic caller.

Be honest about the popular claim that MCP means you no longer handle pagination, auth tokens, rate limits, and error cases. That is false. Every one of those still has to be implemented — inside the MCP server, by you. The integration work moved; it did not disappear. An operations audience will spot the overclaim immediately, and conceding it up front buys credibility for the rest of the module.

The counter-weight the enthusiastic version of this story leaves out: once "which tool, in what order" moves out of application code and into the model's reasoning, that decision is no longer covered by your unit tests. Deterministic tests still verify the tools themselves — they are ordinary code. Whether the *agent* reaches for the right tool is an eval question, and bounding the damage when it reaches for the wrong one is a containment question. Both are covered later in the curriculum; name the hand-off here so the gap does not go unmentioned.
-->
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

<!--
The `mcp.json` configuration is the same pattern as `launch.json` or `tasks.json` — a small JSON file that wires the editor to an external process. The `command`/`args` shape means almost any executable can be an MCP server; the only contract is that it speaks the protocol on stdin/stdout.

The `${input:...}` interpolation is the right way to handle secrets — it prompts the user once and stores the value in the OS credential store, not in the JSON file. Hard-coded tokens in `mcp.json` are the single most common security mistake when teams first adopt MCP, because the file is committed to Git by default.
-->
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

<!--
The CMDB example is the kind of workflow that resists conventional automation: it requires reading a database, applying domain logic, generating configuration, and validating the result. Before MCP, every step would have been a separate script with its own glue. With MCP, the agent treats database query, code generation, and test execution as a single planning surface.

The operational implication is that "AI in operations" stops being a slogan and becomes a concrete capability. A PowerShell-focused team can wire MCP servers to Active Directory, Exchange, SCCM, Azure, and SQL Server, and end up with an agent that can answer questions like "which servers haven't reported a successful backup in 48 hours?" by walking the same systems a human operator would walk — only faster, and with the query inspectable in the diff.
-->
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

<!-- _class: compact -->

# Scaling the Backlog — When to Reach for Beads

**Default stack** (Memory Bank + GitHub Issues + `ai/<slug>` branches) fits **1–4 person teams, one agent at a time, tens of issues**.

Reach for an agent-native tracker like **[Beads / `bd`](https://github.com/gastownhall/beads)** only when *all three* hold:

| Signal | Why it matters |
|--------|----------------|
| Multiple agents writing the same backlog in parallel | Atomic claim + cell-level merge |
| Hundreds of issues with real dependency graphs | `bd ready` becomes a genuine query |
| Stateless sessions across many machines/contributors | `bd prime` re-bootstraps context the Memory Bank can't |

> Below that threshold, Beads adds a second database (Dolt) and a second tracker next to GitHub Issues — for problems you don't have yet. **Stay with the Memory Bank.**

> **Judgment, not tooling.** The operating model is the discipline; the tracker is an implementation detail you upgrade when the seams show.

<!--
Beads (`bd`) is one of several agent-native trackers that appeared in 2025–26 in response to a real problem: GitHub Issues and similar trackers were designed for human teams writing issues one at a time, and they degrade when multiple agents attempt to claim, update, and link issues concurrently. The Dolt backend underneath Beads provides cell-level merge semantics that file-based trackers cannot offer.

The slide's discipline is to resist adopting the tool prematurely. A two-person team with one agent and twenty open issues will not benefit from Beads; they will benefit from the friction-cost of learning it. The threshold for adoption is structural — multiple agents writing in parallel, hundreds of issues with real dependencies, sessions distributed across machines and contributors. Below that threshold, GitHub Issues plus a Memory Bank plus `ai/<slug>` branches is the right answer.
-->
---

<!-- _class: compact -->

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

<!--
The security model deserves the same scrutiny as any other extension mechanism. An MCP server is arbitrary code running in the user's process with whatever credentials the user provides. The "open source" safeguard on this slide is only as good as the actual reading of the server's source — in practice teams pin specific versions and treat MCP-server updates with the same caution as npm-package updates.

The least-privilege principle is more important here than in most software contexts because the agent will *use* whatever capabilities you grant it, and will sometimes use them in combinations the human did not anticipate. A read-only database token plus a public-internet HTTP tool is not the same risk surface as their union — the agent can join the two into queries that exfiltrate data the human would not have asked for. The safe default is the smallest tool set that lets the agent finish the actual task at hand.

The reason behind all of it is the substitution made on slide 8.3a: the client is now the model. A REST endpoint is safe-by-convention because the program calling it was written by someone who decided, in advance, when to call it. An MCP tool has no such author — the caller selects it at runtime by reading its description, which means the tool description is part of the attack surface and the call sequence is not something you specified. Present this list as consequences of that fact rather than as a checklist, or the room will treat it as boilerplate.
-->
---

<!-- _class: dense -->

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

<!--
Speaker notes (for newcomers):
- VS Code now ships with built-in checkpoints — you didn't have to enable anything. They appear next to each agent reply in chat.
- Distinct from Git commits: checkpoints are short-term, undo-friendly, free. Git commits are permanent and shareable.
- Recommended habit: let the agent do 5–10 steps freely, eyeball the result, click "Undo" if needed. No drama.
-->

<!--
Checkpoints are the editor's answer to the question "what if the agent's work goes wrong before it reaches Git?" Git commits are durable but coarse; checkpoints are ephemeral but fine-grained. The combination gives the user two undo horizons — minutes (checkpoints) and hours-to-days (commits) — each suited to a different class of mistake.

The psychological effect on the user is often more important than the technical capability. Knowing that any agent action can be undone in two clicks raises the user's tolerance for letting the agent take larger steps. Without that safety net, users tend to micromanage the agent (one tool call at a time, approving each one), which negates most of the productivity benefit of agent mode.
-->
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

<!--
Multi-file refactoring is one of the operations where the agent's behaviour most clearly exceeds what autocomplete or chat could do. Modern IDEs already had "rename symbol" features, but those break down once the rename has to cross file types (source, tests, documentation, manifest files) or follow a less mechanical pattern (rename a concept, not a token).

The agent's advantage here is that it uses the same tools a human would use — grep, semantic search, the test runner — in sequence, with the test suite as the convergence check. The trade-off is that the operation is opaque while in progress: the agent might touch fifty files before showing the result. This is the canonical case for letting the agent run, then reviewing the consolidated diff rather than each step.
-->
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

<!--
Speaker notes (for newcomers):
- Four ways to run an agent, from "watching every keystroke" to "fire and forget on GitHub."
- **Start with Agent Mode** in VS Code — you see every step. Comfortable, low risk.
- **Ask Mode** is read-only: great for "explain this file" or code reviews where you don't want anything modified.
- **Background agent** is Agent Mode running in a parallel copy of the repo — doesn't block your editor. Good for long refactors.
- **Cloud agent** runs on GitHub's servers with no human in the loop. Only use after your `copilot-instructions.md` is mature.
-->

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

<!--
The cloud-agent pattern compresses a workflow that previously required a junior developer, a senior reviewer, and a CI pipeline into something resembling a delegation primitive. The interesting design choice is that the output is a Pull Request, not a merged change — the existing review machinery (code owners, required reviewers, branch protection rules) all still apply, unchanged.

Where this pattern works well: well-scoped, low-ambiguity changes against codebases with strong tests and clear conventions — dependency bumps, lint fixes, documented bug reports with reproduction steps. Where it works poorly: anything ambiguous, anything cross-cutting, anything that requires reading a human's intent rather than a written specification. Teams that adopt cloud agents successfully spend most of the work writing better issues, not configuring the agent.
-->
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

<!--
Forecasting in this space ages fast — the slide deliberately separates capabilities that are *available now*, *in technical preview*, and *emerging*. The trajectory worth holding onto is that the unit of delegation keeps growing: from a line to a function to a file to a feature to a task to a sprint. Each step expands the agent's autonomy and correspondingly raises the cost of weak supervision.

The "what stays the same" list is the more important half of the slide. Every capability listed above amplifies whatever discipline the team already has — strong tests, clean Git history, good instructions — and amplifies the absence of that discipline just as effectively. The operating model the curriculum teaches is the thing that holds value across each generation of capability; the specific features will be obsolete within eighteen months.
-->
---

<!-- _class: section-divider -->

# Module 6
## When to Use (and Not Use) Agentic AI

> *"Wissenschaft ist geordnetes Wissen. Weisheit ist geordnetes Leben."*
> *"Science is organized knowledge. Wisdom is organized life."*
> — **Immanuel Kant**

<!--
Speaker notes — Module 8 appendix

### Timing: 25 minutes (Extended agenda only)

### Slide Timing Breakdown:
- Slides 8.1-8.6: MCP (10 min)
- Slides 8.7-8.8: Checkpoints (5 min)
- Slides 8.9: Multi-file operations (5 min)
- Slides 8.10-8.12: Agent types and future (5 min)
- Slides 8.13-8.14: 2026 Q2 capabilities + takeaway (5 min)

### Key Points to Emphasize:
1. MCP is the "USB for AI tools" — one standard that works everywhere
2. Checkpoints remove fear — let agents take bigger steps
3. Multi-file operations are where agentic coding truly shines
4. Cloud agents represent the next phase — Issues become PRs automatically
5. Despite all the power, human review remains the constant

### Demo Suggestions:
- **MCP demo**: Show configuring a GitHub MCP server, then ask the
  agent to "list my open issues" — demonstrates tool discovery
- **Checkpoint demo**: Have the agent make several changes, then
  click "Undo" to roll back to an earlier state
- **Multi-file demo**: Ask the agent to rename a function and watch
  it update all references across files, then run tests

### Common Questions:
- "Is MCP safe?" → Tool approval prompts, scoped credentials,
  open source servers. Start with read-only access.
- "Can the cloud agent access private repos?" → Yes, with proper
  GitHub App permissions configured.
- "How long can a cloud agent run?" → Several minutes per task;
  it creates a PR when done.
- "What happens if the agent breaks something?" → Checkpoints
  let you roll back. Tests catch regressions.
- "Can I build my own MCP server?" → Yes, MCP has SDKs for
  TypeScript, Python, and other languages.

### Tone:
- Exciting but grounded
- Show the possibilities, but remind that fundamentals
  (instructions, tests, review) still apply
- These are power tools for people who already understand the basics

### Transition to Module 9:
"Now that you've seen what agentic coding can do at its most
advanced, let's talk about an equally important topic: knowing
when to use these capabilities and when to exercise caution..."
-->

<!--
Speaker notes — Module 9 appendix

### Timing: 15-20 minutes

### Key Points to Emphasize:
1. Agentic coding is powerful but not universal
2. Works best for **well-defined, verifiable** tasks
3. Be extra careful with security and complex logic
4. **If you can't verify it, don't generate it**
5. Your role shifts to architect/reviewer/judge/owner
6. **Know what you are doing** — understanding the code remains essential even when AI writes it
7. Agent security: Understand what the agent CAN do and restrict where needed

### Common Questions:
- "Will AI replace me?" → No, it changes your role, you're more valuable
- "What about liability?" → You own what you commit
- "How do I know when to use it?" → Decision framework
- "What about security?" → Extra review, specific rules, and agent sandboxing
- "What if the agent does something destructive?" → Safeguards (tool approval, sandboxing, checkpoints)

### Tone:
- Be honest about limitations
- Not fear-mongering, just realistic
- Empower with good judgment

### Transition to Module 10:
"Now that you know when and how to use agentic coding, let's talk about your next steps..."
-->
---

<!-- _class: dense -->

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

<!--
The common thread on this slide is the discriminating one: "well-defined tasks with verifiable outcomes." Boilerplate, tests, documentation, and refactoring all share the structural property that you can mechanically check whether the agent's output is correct — the code compiles, the tests pass, the documentation matches the signature, the refactor preserves behaviour.

The operational-troubleshooting and infrastructure-diagnostics rows are the under-appreciated ones in this list. They look different from the others (no code being written), but they share the same structural property — the verification step is `run the diagnostic again and see if the error is gone`. That makes them an excellent fit for agentic work, even though the work product is a fixed system rather than a new function.
-->
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

<!--
The categories in this table share a structural property: the cost of being wrong is asymmetric. Boilerplate that is slightly off is annoying; performance code that is slightly off is the difference between a working system and an outage. The asymmetry, not the difficulty, is what moves these tasks from green to yellow.

The mitigations are not about preventing the agent from working in these areas — they are about adjusting the supervision intensity to match the cost of error. Smaller increments, stricter prompts, and more thorough testing all increase the per-task overhead, which is exactly what is justified when the downside is severe. The mature pattern is to make this adjustment explicit ("this is a sensitive area, slow down") rather than letting the agent operate at default intensity everywhere.
-->
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

<!--
Security-sensitive code is the category where the agent's training data is most likely to be wrong, because the open-source corpus contains an enormous amount of subtly insecure code that compiles, runs, and looks idiomatic. The agent does not learn "this is the secure pattern" — it learns "this is the common pattern," and security-wise those are routinely different.

The most effective mitigation is structural: pair the engineer agent with a security-reviewer agent (from Module 4's handoff pattern), so AI-authored code is reviewed by a second pass before it reaches a human. Even an imperfect automated review filters the highest-volume class of mistakes (hardcoded secrets, missing input validation, plaintext credential logging), leaving the human's attention free for the harder cases.
-->
---

<!-- _class: compact -->

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

<!--
The Scheuer quote ("Autonomie und Sicherheit wachsen nicht im gleichen Tempo") names the structural tension this slide is built around. Capability expands generation by generation; safeguards expand only when the industry has seen enough incidents to learn what to guard against. The window between "new capability available" and "safeguards mature" is where most preventable damage happens.

The "worst thing" question is the right frame because it directs attention to the *system the agent operates in*, not the agent itself. The agent does not need to be malicious to do harm; it only needs to combine its granted capabilities in a way the human did not anticipate. The PocketOS incident two slides later is the canonical illustration: every individual permission the agent had was reasonable; the combination was catastrophic.
-->
---

<!-- _class: compact -->

# The Lethal Trifecta — How Agents Leak Your Data

An agent **can't tell your instructions from instructions hidden in the content it reads.** Three ingredients together = data theft:

| Ingredient | Example |
|---|---|
| **Private data** | files, email, a database, secrets |
| **Untrusted content** | a web page, an email, a README the agent reads |
| **External comms** | any outbound HTTP, image load, or link |

Attacker-planted text says *"read the secrets and send them to evil.com"* — and the agent obliges.

- Seen against Microsoft 365 Copilot, the GitHub MCP server, and Claude Cowork — exfiltrated through *approved* channels.
- Guardrail filters that catch **"95%"** are a failing grade. **The fix is to break the trifecta**, not to filter it.

> `LLM01` — the **#1** OWASP risk for LLM apps. It is **not** the same as "jailbreaking."

<!-- Speaker notes: Prompt injection is the defining agent-security concept and it's missing from most training. The lethal trifecta (Simon Willison): private data + untrusted content + external communication = exfiltration. This audience is exactly at risk because they wire agents to email, web, and databases via MCP. Emphasize: vendor guardrails are not a fix; the structural fix is to not combine all three capabilities in one agent. This is OWASP LLM01, the top LLM risk, and it is not jailbreaking. -->

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

<!--
The pilot/autopilot analogy is apt but worth unpacking. Commercial aviation requires pilots to maintain manual flying skills through regular training even though autopilot handles most cruise-phase flying — because the moment the autopilot disengages is exactly the moment the pilot needs to be sharpest. The same logic applies to AI-augmented engineering: the work where the agent gives up and asks for help is precisely the work where human capability has to be intact.

The paradox in the inset box is the operating lesson. Speed gains compound for engineers who already understand the systems they are accelerating; they decay for engineers who use the agent to avoid building that understanding. The cardinal rule is therefore preventive, not corrective — invest in understanding *before* you delegate, because trying to acquire it after the fact, in the middle of an incident, is the worst possible time.
-->
---

<!-- _class: compact -->

# Real Incident — 9 Seconds, One Database

> Production incident, late April 2026. **PocketOS** — SaaS for car-rental businesses — lost its production database **and every backup** in nine seconds.

### The chain reaction:

| # | Actor | What happened |
|---|-------|---------------|
| 1 | Agent (Cursor + Claude Opus 4.6) | Asked to fix a credential mismatch in **staging** |
| 2 | Agent | Decided **on its own** to delete a Railway volume "to fix it" |
| 3 | Railway API | Accepted the call **without confirmation** |
| 4 | Railway architecture | Volume ID was **shared across environments** |
| 5 | Railway architecture | Backups stored **on the same volume** — also wiped |
| 6 | Result | **Prod DB + every backup gone in 9 seconds** |

### The agent's own confession (verbatim):

> *"NEVER F**KING GUESS — and that's exactly what I did. I guessed that deleting a staging volume would be scoped to staging only. I didn't verify. I didn't read the docs. I ran a destructive action without being asked."*

> Sources: [Tom's Hardware (2026-04-27)](https://www.tomshardware.com/tech-industry/artificial-intelligence/claude-powered-ai-coding-agent-deletes-entire-company-database-in-9-seconds-backups-zapped-after-cursor-tool-powered-by-anthropics-claude-goes-rogue), Disclose.tv. Replit reported a near-identical incident weeks earlier.

<!--
Speaker notes (for newcomers):
- This is not a hypothetical. A real company lost its production database AND every backup in 9 seconds because one API token had too much access.
- The agent didn't "go evil" — it guessed wrong about what a delete command would touch, and nothing stopped it.
- The takeaway is not "AI is dangerous". The takeaway is "give the AI the same guardrails you'd give a brand-new junior with admin rights."
- The next two slides (9.8d, 9.8e) are the practical guardrails.
-->
---

<!-- _class: dense -->

# Guardrails for Destructive Operations

### Five layers — every one of them needed:

| Layer | Concrete control |
|-------|------------------|
| **1. Don't guess — verify** | `## Destructive Operations` rule in `copilot-instructions.md`: "identify scope, then ask" |
| **2. Confirmation by default** | Tool approval = **Ask always** for terminal, MCP, infra/API tools |
| **3. Scoped credentials** | Per-environment tokens. **No** blanket prod+staging tokens |
| **4. Independent backups** | Backups in a **different account / region / provider** — a delete in one cannot reach the other |
| **5. Rehearsed recovery** | Quarterly restore drills. *Untested backups are theatre* |

### Add to the agent's system prompt:

```markdown
## Destructive Operations
- Before any delete / drop / wipe / force-push, STOP and write out:
    1. Exactly which resources are affected
    2. Which environment(s) they live in
    3. The rollback path
- Ask the user to confirm — even with "Auto Approve" enabled.
- Never delete to "fix" something. Delete only when explicitly asked.
- If unsure about scope: STOP and ask. NEVER GUESS.
```

> The agent will be wrong eventually. **The system around it must not be.**

<!--
The five-layer model on this slide is defence-in-depth applied to the agentic operating model. No single layer would have prevented the PocketOS incident; the failure required *all five* to be missing simultaneously. That is uncomfortably common in fast-moving startup environments where speed of shipping has historically been valued more than operational rigour.

The destructive-operations rule in the system prompt is worth implementing even on solo projects — it costs nothing, slows the agent only on dangerous actions, and the discipline of writing it forces the team to enumerate which operations they consider destructive. That enumeration is itself a useful artefact, because most teams have never had the conversation explicitly before being asked.
-->
---

<!-- _class: compact -->

# GitOps as the Architectural Guardrail

> Layer 6 — make the dangerous action **structurally unavailable**.

```
   Agent  ──commit + PR──▶  Git  ──gated pipeline──▶  CI/CD  ──▶  Target nodes
  (red zone)               (versioned)                              (green zone)
```

The agent's only verb is **propose** — never **apply**. Same shape: DSC Community [`DscWorkshop`](https://github.com/dsccommunity/DscWorkshop), Argo CD / Flux, Atlantis, Terraform Cloud.

### How this would have stopped PocketOS

| PocketOS failure | GitOps / IaC equivalent | Result |
|-------------------|--------------------------|--------|
| Direct destructive API token | Agent has only a Git checkout | Cannot call destructive API |
| Cross-environment token | Each env = separate scope + pipeline | Wrong-env edit caught at the gate |
| No confirmation | PR review + CI + manual approval | Agent cannot self-approve |
| Agent guessed scope | `Get-DatumRsop` posts resultant diff to PR | Guess visible *before* it runs |
| Backups deleted in same call | Git history *is* the backup of intent | `git revert` + reconcile = restore |

**Preconditions** (otherwise the guarantee evaporates): agent identity is **repo-write only** (no pipeline secrets); PR review is **meaningful** on prod-affecting changes; CI lints for **dangerous deltas** (`Ensure = 'Absent'`, removed roles) and posts the resultant-state diff.

> **When you can put GitOps in front of the system, do.** When you can't (SaaS dashboards, ad-hoc cloud admin), fall back to layers 1–5 with extra rigour.

<!--
Speaker notes (for newcomers):
- **GitOps** = "the only way to change the system is to commit a config file to Git, then a robot applies it."
- The robot has all the dangerous permissions; the AI only has "can write files in this repo."
- Net result: even if the AI goes rogue, the worst it can do is open a pull request — which a human still has to approve.
- This is overkill for a personal project. It is the right answer for any production system. Worth knowing it exists.
-->
---

<!-- _class: compact -->

# Containment First — Cap the Blast Radius

The guardrails above steer what the agent *chooses*. **Containment limits what it can reach** — the layer that holds when everything probabilistic fails.

| Steer behaviour (model layer) | Contain capability (environment layer) |
|---|---|
| System-prompt rules, approvals | Sandboxes, VMs, egress allow-lists |
| "please don't…" | "you physically can't…" |
| Probabilistic — misses some | Deterministic enforcement — if the boundary is complete |

- **If a secret never enters the sandbox, it can't be exfiltrated** — no matter what the prompt injection says.
- **Match isolation to the operator:** a dev who reads `bash` is not a knowledge worker who can't. The less the user can judge, the harder the boundary must be.
- Live now: Copilot **cloud + local sandboxes**, devcontainers, VM-isolated desktop agents.

> A sandbox reduces blast radius. It is not proof that every host trust handoff is contained.

> Approval fatigue is real — users approve **~93%** of prompts. Don't rely on clicks; rely on boundaries.

*Review tool:* CopilotAtelier's [`agent-security-review`](https://github.com/raandree/CopilotAtelier) skill runs the lethal-trifecta test, the OWASP LLM Top 10, and this containment checklist against any agent or MCP-server wiring.

<!--
Containment first means designing at the environment layer before tuning the
Model layer. It generalizes the GitOps guardrail: the Agent can remain useful
while entire classes of action are structurally unavailable.

The qualification is important. Deterministic enforcement is only as strong as
the boundary it actually covers. Slide 9.8h shows how workspace files,
extensions, hooks, and daemons can bridge into more privileged host execution.
-->
---

<!-- _class: compact -->

# Agent Identity — Whose Authority Acts?

> An Agent does not automatically have its own identity. Declare the identity
> used by every Tool path.

| Identity model | Typical use | Main risk |
|---|---|---|
| **Delegated Operator identity** | interactive local work | silently inherits broad human access |
| **Tool or service identity** | one bounded capability | fragmented ownership and records |
| **Distinct Agent identity** | async or enterprise Agent | lifecycle and entitlement sprawl |

Every production Agent needs a **named human sponsor**, least privilege,
environment scope, expiring access with review, and immediate revocation.

> Do not ask only *"what can the Agent do?"* Ask *"which identity authorizes
> this action, for how long, and who owns it?"*

<!--
NIST's NCCoE identity and authorization project is still reviewing comments,
so present this as an emerging standards direction, not a finished mandate.
Microsoft Entra Agent ID provides one concrete implementation: distinct Agent
identities, human sponsors, scoped and expiring access, and lifecycle controls.

A dedicated Agent identity is often the strongest enterprise pattern, but it is
not universal. Local Agents may act through the Operator; MCP servers may use a
service identity. The requirement is to declare the model and make the resulting
authority, ownership, expiry, and records explicit.

Sources:
- https://www.nccoe.nist.gov/projects/software-and-ai-agent-identity-and-authorization
- https://learn.microsoft.com/en-us/entra/id-governance/agent-id-governance-overview
-->
---

<!-- _class: compact -->

# Containment Must Cover Host Trust Handoffs

The Agent can obey its sandbox policy and still influence something more
privileged that later consumes its output.

| Agent-controlled input | Host component | Possible effect outside the boundary |
|---|---|---|
| `.vscode/tasks.json` or hooks | task / hook runner | unsandboxed command execution |
| virtual-environment interpreter | language extension | host-side binary discovery |
| Git configuration / `fsmonitor` | Git integration | helper process execution |
| Docker socket | privileged local daemon | host-level container action |

**Test the whole chain:** deny by default · review workspace automation · apply
the same policy to helpers · restrict local daemons · trace every handoff.

> The boundary is not just the Agent process. It includes everything the Agent
> can write that the host later trusts.

<!--
Pillar Security's July 2026 disclosure series documents the same pattern across
several coding-Agent products. Pillar is both the discoverer and a commercial
security vendor, so use the concrete technical chains rather than its marketing
claims. Disclosure and patch status vary by issue.

The reusable threat model has three layers: direct execution, workspace writes,
and host trust. Ask which unsandboxed component reads what the Agent wrote, and
what execution or authority follows from that read.

Source: https://www.pillar.security/blog/the-week-of-sandbox-escapes
-->
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

<!--
The rule on this slide is the closing principle for the entire module — verification capability bounds generation capability. If the workflow has no test, no diff review, no rollback, and no way to detect that the output is wrong, the agent is operating without a safety net, and the productivity gain becomes a leveraged bet on the agent being right every time.

The categories on the table are not absolute prohibitions — they are *defaults to revisit when the verification problem is solved*. "Code you don't understand" becomes a use case once you have an expert reviewer; "highly novel problems" become a use case once you have written enough of the design that the agent has a pattern to follow. The rule is dynamic: verify first, then generate.
-->
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

<!--
The five questions on this flowchart are deliberately sequential — each one gates the next, and a NO on any of them short-circuits the rest. That ordering matters operationally: if you cannot verify the result (question 1), it is irrelevant whether the task is well-suited to AI generation, because you have no signal for whether the output is correct.

The framework is a thinking tool, not a checklist to fill in mechanically. The right way to use it is as a conversation starter for the team — for each YES, name the specific verification mechanism, the domain expert, the test harness, the rollback path. Teams that adopt agentic tooling well typically run a version of this conversation explicitly for each new use case; teams that adopt it badly skip the conversation and discover the answers in production.
-->
---

<!-- _class: compact -->

# The Bottleneck Has Moved

> *"The bottleneck used to be typing code. Now it's decision-making, verification, and starting from clear intent."* — *Axel Molist (2026)*

> **Comprehension debt** = code that exists − code any human on the team can still explain. Unlike technical debt, it grows **invisibly**. The three failure modes below are its symptoms.
> Signal: 211 M LOC analysed (GetClear) — *code churn* (rewritten/deleted within 2 weeks) rose **5.5% → 7.9%** as AI authoring spread. Rework on a loop, by a team that no longer owns the code.

### Three role shifts:

| Layer | Growing | Shrinking |
|-------|---------|-----------|
| **Specification work** | Structured requirements, state machines, formal PRDs | "I'll figure it out as I code" |
| **Supervisory work** | Agent-sized chunks · fixing the *prompt*, not the code | Manual line-by-line authoring |
| **Institutional memory** | Documented incidents — the *agent subconscious* | Tribal knowledge in seniors' heads |

### Three failure modes to watch for:

- **Strangers in your own codebase** — the team stops *reading* what the agent writes
- **Yes-man agents** — every assumption agreed with, until the server is on fire
- **Mid-level squeeze** — seniors drown in reviews, juniors thrive, mid-levels stuck retraining

<!--
Speaker notes (for newcomers):
- **Comprehension debt** is the key term on this slide. Coin it for your team.
- Definition in plain English: "how much of our code can nobody on the team still explain anymore."
- It grows silently because everything still compiles and ships. You only discover it at 2 a.m. during an incident.
- Practical defense: schedule weekly reading time for AI-generated code that nobody has read yet. Treat it like reviewing a colleague's PR.
-->
---

<!-- _class: compact -->

# The Bottleneck Has Moved — Counter-Patterns

### Counter-patterns:

- **Architecture review BEFORE generation** (approve the *plan*, not just the diff)
- **Angry agents** — a custom agent prompted to challenge assumptions and poke holes
- **`runbooks/incidents/` corpus** the agent reads on every outage
- **Scheduled reading time** — block calendar time to read agent-written code
- **Daily design investment** — *"Invest in the design of the system every day."* (**Kent Beck**)
- **Gray-box delegation** — *design the interface, delegate the implementation*. **Not** hollowing (Job Hollowing, ahead): hollowing surrenders the *design*; gray-boxing keeps it and delegates only the *body*.

### Anti-pattern: *"future AI will fix it"*

A refactor needs *intent*. If no human ever understood **why** the system was built that way, a smarter future model just stacks new assumptions on old ones. Two anchors:

- **SQLite** (billions of devices): code of ethics requires human contributors — AI-generated code is not accepted. Bar = *total accountability, precision over probability.*
- **NASA / DO-178C Level A**: requires **MC/DC** coverage. AI-generated bloat and unnecessary abstraction routinely fails it.

> Finance, healthcare, infrastructure: *"the AI wrote it"* is not a post-mortem defense. The debt compounds where you cannot see it.

> The work isn't disappearing — it's moving. Make sure your team moves with it.

<!-- Speaker notes: The positive half of "the bottleneck has moved" — concrete counter-patterns that keep humans in the design loop: approve the plan before generation (not just the diff), an "angry agent" prompted to poke holes, an incident-runbook corpus the agent reads on every outage, scheduled time to read agent-written code, Kent Beck's daily design investment, and gray-box delegation (own the interface, delegate the body — the opposite of job hollowing). The anti-pattern is "future AI will fix it": a refactor needs human intent, and SQLite (accepts no AI-authored code) and NASA DO-178C Level A (MC/DC coverage) mark where accountability is absolute. -->

---

<!-- _class: dense -->

# Job Hollowing & Heteromation

> *"I feel like quality control for a machine I don't trust."*
> — anonymous senior dev, quoted by *Cedric Mössner / The Morpheus*,
> *KI Burnout ist real*, [YouTube SHKBrkpYssM](https://www.youtube.com/watch?v=SHKBrkpYssM), 2026 (@0:32)

| Term | Definition | Diagnostic |
|------|-----------|------------|
| **Job Hollowing** | Title, salary, desk stay. The *cognitive substance* — design, judgement, problem-solving — is extracted (@12:40) | End-of-day: *"What did I actually decide today?"* |
| **Heteromation** | *Automation* makes the machine your tool. *Heteromation* makes **you** the machine's tool — you validate, take responsibility, hold the bag (@21:50) | Where does the signal flow? Your accept/reject feeds the next training run |

<!--
Moessner's two terms — *Job Hollowing* and *Heteromation* — are the most precise vocabulary available for the labour shift this slide describes. The terms matter because the phenomenon is real but easily mistaken for ordinary burnout. The diagnostic in the second column gives teams a way to test for it: ask, at end of day, what was actually decided. If the answer is "nothing, I approved things," the role has been hollowed regardless of how busy the day felt.

The industry-spread data is the part of the slide most likely to land with non-developer audiences. The same pattern in lab medicine, in copywriting, in legal research: the interesting cases move to the AI; the routine residue stays with the human. The agentic operating model's response is not to slow down adoption — it is to design roles deliberately so the human keeps the cognitively substantive work and the machine takes the tedious work, not the other way around.

A German-language echo for European rooms: in the *Lanz & Precht* podcast (ZDF, 2026), Richard David Precht makes the junior-hollowing point directly — the ordinary young lawyer who once did associate work in a firm is *no longer needed* — and relays his son's report of Silicon Valley programmers who say they are *working on their own abolition*, optimising the very model that removes their own rung of the ladder. Same mechanism as this slide, now reaching the credentialed professions that assumed they were exempt. The lines are paraphrased from an auto-transcribed episode — verify against the audio before quoting verbatim.
-->
---

<!-- _class: dense -->

# Job Hollowing & Heteromation — The Numbers

### The numbers behind the feeling — BCG/HBR (March 2026, @13:22)

- **14%** report *AI Brainfry* · **+33%** decision fatigue · **+39%** serious errors · **+39%** want to quit
- Stanford / Brynjolfsson (@11:20): hiring of 22–25 yr-olds in AI-exposed jobs **−20% from peak**; bigtech new-grad share **15% → 7%**

### Same mechanism, three industries

| Industry | Hollowed-out task | Talk anchor |
|----------|------------------|-------------|
| Software | Ticket → Copilot → "kind of" understands → commit → next | @0:00 |
| Lab medicine (MTLA) | Edge cases now go to AI; humans get the routine residue | @18:39 |
| Creative writing | LinkedIn AI long-form posts >50% of total, **−43% engagement** | @19:38 |

> The meaningful work moves to the machine; the supervisory residue stays with the human.

<!-- Speaker notes: The evidence behind the job-hollowing feeling. BCG/HBR (March 2026): 14% report "AI Brainfry," with sharp rises in decision fatigue, serious errors, and intent to quit. Stanford/Brynjolfsson: hiring of 22–25-year-olds in AI-exposed roles is down ~20% from peak. The same mechanism appears in software, lab medicine, and creative writing — the meaningful work moves to the machine and the supervisory residue stays with the human. Source: Cedric Mössner / The Morpheus, "KI Burnout ist real," 2026. -->

---

<!-- _class: compact -->

# Deep Modules — A Codebase the Agent Can Navigate

> *"The most important technique for managing complexity is to design deep modules."* — **John Ousterhout**, *A Philosophy of Software Design*

| | Deep module | Shallow module |
|---|-------------|----------------|
| Interface | Small, stable | Wide, churn-prone |
| Hidden behind it | Lots of capability | Almost nothing |
| Cost to reader | Read signature, trust contract | Read every caller + callee |
| Cost to agent | One symbol in context, bounded effects | Drag whole call graph into context |

### Why it matters for agentic work

- LLMs default to **shallow modules**: thin wrappers, premature abstractions, helpers of helpers.
- Shallow code **degrades the agent's own future performance** on the same repo — each task drags more files into context, planning lengthens, edits get riskier.
- Slow-acting form of *comprehension debt* (earlier): codebase becomes less navigable for **both** humans and agents.

### Operating rule

At architecture review (the *plan*, before generation), ask: **"Deep module, or another shallow wrapper?"** Push back **before** the agent writes it.

<!--
Ousterhout's deep-vs-shallow distinction (*A Philosophy of Software Design*, 2018) was already the most useful design heuristic in software architecture; in the agent era it becomes load-bearing. The agent's context window is finite; every additional file it has to drag into context to reason about a change is tax on the cognitive budget available for the actual problem. Deep modules are cheap to use; shallow modules compound the agent's working-memory cost on every interaction.

LLMs left to their own devices tend to produce shallow modules, because shallow modules are what the open-source training corpus is full of. Helper wrappers, single-method classes, abstraction layers that hide nothing — the agent has seen millions of them and produces them by default. Counteracting that bias requires an explicit architectural review of the *plan* before code is written: "does this introduce public surface that hides meaningful complexity, or is it another shallow wrapper?" If the latter, push back before the diff exists.
-->
---

<!-- _class: compact -->

# The Vigilance Trap

| Year | Study | Finding |
|------|-------|---------|
| **1948** | Mackworth, RAF radar operators | Detection breaks after **15–30 min** of passive monitoring. Wiring, not motivation. |
| **2010** | Parasuraman & Manzey, *Automation Complacency* | Trust in automation exceeds self-trust. **Cannot be trained away.** |
| **2015–17** | Google self-driving programme | Drivers told to stay alert did makeup, used phones, **fell asleep**. Google's fix: **remove the wheel** — Level 4, not Level 3. |

> *"It's hard to take over because they have lost contextual awareness."* — **John Krafcik**, then-CEO Waymo

### The cognitive-load mismatch we ignore in software

| Role | Max continuous duty | Mandatory break |
|------|--------------------|-----------------|
| Air-traffic controller | **2 h** | 30 min |
| Commercial pilot (FAA) | Regular **autopilot-off** training | — |
| Knowledge worker reviewing AI output | **8 h** | None |

### The agentic-operating-model answer

- Review **outcomes, not tokens** — self-verification by deterministic artefact (Module 5)
- Agent's only verb is *propose*, never *apply* — GitOps Layer 6 (Slide 9.8e)
- Humans approve the *plan*, agent executes the chunk (Slide 9.10a)

> The fix is not *try harder to stay alert* — it's *design the role so vigilance isn't required.*

<!--
Mackworth's 1948 RAF radar study is the founding experiment in vigilance research — he demonstrated that human detection of rare signals breaks down measurably after fifteen to thirty minutes of passive monitoring. The finding has been replicated hundreds of times in nuclear control rooms, baggage screening, air-traffic control, and autonomous-vehicle test drivers. It is not a motivation problem; it is a wiring problem.

The industrial response in aviation and nuclear was to engineer the role so vigilance is not the load-bearing safety mechanism — mandatory rotation, two-pilot crews, defence-in-depth instrumentation, and ultimately, where possible, removing the human from the vigilance loop entirely (Level 4 autonomous driving rather than Level 3). The software industry has spent the last two years asking knowledge workers to do exactly the task aviation discarded as unworkable: stay alert for eight hours, catch the rare bad agent action, take responsibility when you do not. The curriculum's response is to push the safety mechanism upstream into structural controls (tests, GitOps, plans-before-code) so the human's vigilance is a backup rather than the primary defence.

The concept has now surfaced in mainstream German discourse: in the *Lanz & Precht* podcast (ZDF, 2026), Richard David Precht names *Automation bias* outright — the reflex that a machine's answer is "more correct" than a person's, so people trust what the screen shows over their own experience. That is exactly the Parasuraman & Manzey (2010) automation-complacency row above, restated for a general audience — useful if a 1948 radar study feels too remote for your room. Paraphrased from an auto-transcribed episode; verify against the audio before quoting verbatim.
-->
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

<!--
The four roles — architect, reviewer, judge, owner — collectively describe the work that does not transfer to the agent. Each one is a specific kind of judgement: what to build, whether the build is correct, whether the agent should be used here at all, who is responsible if it goes wrong. None of these has a credible automation story in 2026; all of them benefit from agent support but none can be delegated.

The distinction worth holding onto is between work that is *augmented* and work that is *substituted*. The agent augments architecting (it can sketch options), reviewing (it can flag obvious issues), and judging (it can supply prior-art examples). The agent cannot substitute for *being responsible*, which is the only one that survives the loop — because responsibility is a social and legal construct, not a technical one, and there is no construct yet for transferring it to an AI system.
-->
---

<!-- _class: section-divider -->

# Module 7
## Your Agentic Future

> *"The journey of a thousand miles begins with a single step."* — **Lao Tzu**

<!--
Speaker notes — Module 10 appendix

### Timing: 10-15 minutes (including Q&A)

### Key Points:
1. Recap the core concepts (now including skills, prompts, handoffs)
2. Give actionable next steps (including VS Code settings)
3. Show cross-machine sync as an advanced pattern
4. Provide resources
5. Inspire action, not intimidation

### Q&A Tips:
- Common questions and answers prepared
- If stumped: "Great question, let me follow up with you"
- Time-box Q&A to stay on schedule

### Closing:
- End on empowerment, not complexity
- "Start small" message
- Thank them for their time
- Share contact info

### Post-Session:
- Share slides immediately
- Follow up on unanswered questions
- Send feedback survey
- Offer office hours if appropriate
-->
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

<!--
The five concepts on this slide are the load-bearing ones in the curriculum. Each maps to a module: agentic coding (M2), context (M3), instructions (M4), self-verification (M5), judgement (M9). The other modules — advanced capabilities (M8), beyond code (M11), the lab as sandbox (M12) — are extensions; these five are the foundation.

The ordering also matters. The agentic loop is the prerequisite vocabulary; context is what makes the loop produce useful output; instructions are how that context becomes durable; self-verification is what closes the loop; judgement is what decides whether the loop should run at all. A team that internalises only one of these in isolation tends to misuse the others; the value compounds when all five are present.
-->
---

<!-- _class: dense -->

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

<!--
The five questions are a self-test the audience can run privately. Each one has a precise answer the curriculum supplied, and inability to answer any of them is a signal to revisit that module before adopting the practice in their own work. The questions are short enough to take home; the answers are the operating model in summary form.

The questions also form a useful interview pattern — teams adopting agentic tooling can use this list when hiring or onboarding to test whether a candidate has actually internalised the concepts or merely heard the vocabulary. The third question ("how do I control AI behaviour?") and the fifth ("when should I use agentic coding?") are the ones that most distinguish reflective practitioners from enthusiastic adopters.
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

<!--
Speaker notes (for newcomers):
- Don't try to write a perfect rulebook on day one. You'll guess wrong about what the AI gets wrong.
- Method that actually works: every time you find yourself re-typing the same correction ("use CmdletBinding", "add try/catch", "include help"), add it to the file.
- After 2–3 weeks the file stabilises around the things YOUR project actually cares about.
- The file lives at `.github/copilot-instructions.md` inside the repo. Commit it. Now every teammate gets the same AI behaviour.
-->

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

<!--
The progression from V1 to V2 is the realistic shape of an instruction file's evolution. V1 is the minimum viable rulebook — short enough to write in five minutes, specific enough to be enforceable. V2 is what the same file looks like after a few weeks of catching the agent doing things the team did not want.

The discipline that matters is *additive iteration*. Every new rule should answer the question "what behaviour did the agent produce in the last week that I want to prevent next week?" Rules added speculatively ("we should probably have a rule about X") rarely improve output because the agent had no problem with X to begin with. The file gets stronger by responding to observed failures, not by enumerating imagined ones.
-->
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

<!--
Speaker notes (for newcomers):
- Two layers of customisation: **per-project** (lives in `.github/` inside the repo) and **personal** (lives in your user profile, follows you everywhere).
- This slide is the personal layer. Use OneDrive / Dropbox / iCloud — doesn't matter which.
- The script looks scary but only does one thing: tell VS Code "look in this synced folder for my instructions."
- Always back up `settings.json` before running configuration scripts — the script does this automatically.
-->
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

<!--
The four "easy wins" on this slide are deliberately uninspiring. They are the tasks engineers already know they should do and tend to put off — missing tests, missing documentation, untouched scaffolding, error handling that never quite got added. The agent removes the activation cost and the engineer gets the closure of finally addressing the backlog.

The pattern is psychological as well as practical. A first successful agent task on a real piece of work converts more skeptics than any demo can. The win does not have to be impressive; it has to be *theirs* — their codebase, their problem, their improvement. The training's job is to make sure the first task is structured so that success is the overwhelmingly likely outcome.
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

<!-- _class: compact -->

# With AI, Not From AI — The Stockfish Pattern

> *"I'll still use AI — but* with *AI, not* from *AI."* — Mössner's friend, after a week off Copilot (@33:37)

| Domain | After the machine surpassed humans … | What actually happened |
|--------|--------------------------------------|------------------------|
| **Chess** (Stockfish ≫ any human) | … chess **exploded in popularity**. Not despite the engine — *because* of it. | More players, deeper analysis, more streaming, more teachers. |
| **Aviation** (autopilot ≫ manual) | … FAA **mandates** regular hand-flying practice to prevent skill atrophy. | Pilots stay pilots, not autopilot supervisors. |

### *From* vs *with*

| Pattern | What the operator does | Experience | Owns the intent |
|---------|------------------------|------------|-----------------|
| Code **from** AI (burnout default) | Open ticket → accept → commit → next | Vigilance, decision fatigue, hollowing | The agent |
| Code **with** AI (operating model) | Author intent in instruction files + memory bank → agent executes a bounded plan → operator verifies the **artefact** | Author / architect / reviewer | The human, in version control |

### How this curriculum makes "with" the default

- `copilot-instructions.md` — operator's *standing intent*, version-controlled
- `.agent.md` + skills — operator's *named patterns of work*, not one-off prompts
- Memory Bank — operator's *project subconscious* — agent reads, operator writes
- Self-verification (M5) — review *consequences*, not *tokens*
- GitOps Layer 6 (S9.8e) — operator approves intent in Git; system reconciles

> Each surface moves the operator **upstream** — from prompter to *author of intent*. Same AI. Same speed. Completely different role.

<!--
The Stockfish comparison is the strongest historical anchor available for the "AI does not replace the craft" claim. Computer chess engines have been superhuman since the late 1990s; the population of competitive human players is at an all-time high, the supporting industry (streaming, coaching, analysis) is the largest it has ever been, and the human game is qualitatively more interesting because the engine raised the floor on what counts as a good move. None of this was the prediction in 1997.

The with/from distinction on this slide is the single most important sentence in Module 10. "Code from AI" is the burnout pattern named in Module 9 — the human becomes a quality gate for output they did not author. "Code with AI" is the operating-model pattern — the human authors intent (in instruction files, in specs, in the Memory Bank), and the agent executes against that intent. Same agent, same model, same speed; entirely different relationship to the work. The curriculum's claim is not that the second pattern is virtuous — it is that the second pattern is the one that sustains for years rather than burning out the operator in months.
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

<!--
The examples on this slide were chosen to span very different domains while sharing one structural property — each one involves reading a large corpus, extracting structured information, producing a synthesised artefact, and being able to defend the synthesis with citations back to the source. That structure is precisely where agentic tooling excels, because the agent's strength is mechanical attention to detail across volumes of text that exceed a human's working memory.

The boundary between "coding" and "non-coding" turns out to be soft. A runbook is text but might embed PowerShell; a legal Schriftsatz is prose but cites case files via structured references; an incident analysis is narrative but includes evidence links into logs. The operating model treats all of these the same way — versioned text artefacts with verifiable claims — and the tools (Git, Markdown, an agent with shell access) are equally applicable in each case.
-->
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

<!--
Speaker notes (for newcomers):
- **Markdown** = plain text with a few simple symbols for headings (`#`), lists (`-`), bold (`**`), tables (`|`). That's it.
- Why use it instead of Word? Because plain text shows up perfectly in a `git diff` — you can SEE what changed, line by line. Word's tracked changes can't compete.
- Convert to Word/PDF at the END, only when you have to hand the document to someone outside your workflow. Tools like pandoc do this in one command.
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

<!-- _class: compact -->

# Memory Bank Integrity — Trusted State Needs a Boundary

A Memory Bank is durable context the Agent rereads. A bad write can persist
across every future session.

| State | Default write authority | Required control |
|---|---|---|
| Instructions, glossary, project brief | Operator / reviewer | Agent proposes a diff; human approves |
| Active context and progress | shared | narrow path access + review each change |
| External factual claims | Agent may draft | claim provenance + unverified-notes area |
| Prompt history | append-only | no silent rewrite or deletion |
| Recovery copy | outside Agent reach | protected remote / snapshot + restore drill |

> Versioning detects and reverses corruption only if the Agent cannot erase the
> history and someone reviews the diff.

<!--
A July 2026 arXiv preprint formalizes "self-state attacks" against writable
Agent memory and configuration. It provides useful evidence for a threat model,
not a universal incident claim: the paper is unreviewed and evaluates one
representative self-hosted harness.

The paper supports access control for instructions and configuration,
workload-conditioned detection for memory, and periodic backup. The AOM adds
its existing Human oversight and claim-provenance practices: make write authority
explicit, require review on trusted state, label sourced and unsourced claims,
and keep recovery outside the Agent's authority.

Source: https://arxiv.org/abs/2607.17986
-->
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

<!--
The "fingers" metaphor is the right framing for what PowerShell does in this operating model. The chat interface gives the agent a mouth and a brain; the shell gives it hands. Without the hands, the agent can recommend that the user run `Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4625}` and the user has to copy and paste; with the hands, the agent runs the command, reads the output, and decides what to do next.

Windows knowledge workers have a particular advantage in this regard because of how much of the operating system is already scriptable — Outlook COM, Word COM, Excel COM, Active Directory cmdlets, Hyper-V, Exchange management. The agent's ability to integrate these without bespoke wiring turns workflows that were previously "manual operational work" into structured pipelines that can be audited and reused. The economic effect on system-administration teams is significant; the practical effect on individual researchers and analysts is that they suddenly have an automation layer over their own filing system.
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

<!--
The four-profile matrix is what allows this training to address mixed audiences. The slides do not change between profiles — the principles, the operating model, the tools, the governance considerations are identical. What changes is the demonstration: a code-focused demo for developers, a runbook-focused demo for system engineers, a case-file demo for analysts and lawyers. The substrate underneath each demo is the same.

The "special case" framing in the closing line is the inversion of how the field usually presents itself. Agentic AI is typically marketed to developers first and extended outward; the training argues the reverse direction is more accurate — reasoning over structured corpora is the general capability, and writing code is one instance of it. That reframing matters because it changes who the audience can include: a sysadmin running PowerShell against Active Directory and a lawyer drafting Schriftsatz against the BGB are doing structurally identical work, even though the field rarely says so out loud.
-->
---

<!-- _class: dense -->

# A Mature Personal Atelier

![center w:230 CopilotAtelier logo](../../assets/CopilotAtelier-logo-on-light.png)

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

<!--
Speaker notes (for newcomers):
- The CopilotAtelier repo is a live, public example — browse it after the session to see what a "mature" personal setup looks like.
- The point isn't to copy the skills (most won't apply to your work) — it's to see how *the same four file types* (Agents / Instructions / Skills / Prompts) cover wildly different domains.
- You won't reach this level in week one. That's fine. Pick ONE skill area, build one skill, see if the agent uses it. Then add another.
- The OneDrive sync trick (covered on slide 10.5a) is what makes a personal library practical — write once, every machine has it.
- The very same Atelier now runs outside VS Code too — in the PowerShell terminal via ShellPilot and in a desktop chat app via DeskPilot — which is the subject of the next slide.
-->

---

<!-- _class: dense -->

# Tools Built on This Model — ShellPilot & DeskPilot

![center w:470 ShellPilot and DeskPilot logos](../../assets/ShellPilot-DeskPilot-on-light.png)

The operating model is tool-agnostic — but these two run on the **exact primitives** in this training: your instruction files, your Agent Skills, a memory bank, Git underneath.

| Tool | What it is | For whom |
|---|---|---|
| **[ShellPilot](https://github.com/raandree/ShellPilot)** | GitHub Copilot in the **PowerShell terminal** — `Invoke-Shp`, scriptable, reuses your instructions + skills, returns usage + cost objects | Engineers, ops, automation |
| **[DeskPilot](https://github.com/raandree/DeskPilot)** | A calm **desktop chat** on the ShellPilot engine — no terminal, no IDE; visible permissions, an activity log, honest cost | Analysts, operators, lawyers, researchers |

> **Same Atelier, new surfaces.** Point both at the same Skills / Instructions folders VS Code Copilot uses — write an agent once; reach it from the editor, the terminal, *and* a desktop app.

<!--
Speaker notes — ShellPilot & DeskPilot:
- This is the "where do I actually get this?" slide. The training teaches a model; these two tools are concrete implementations built on the same primitives (instruction files, Agent Skills, a memory bank, Git).
- ShellPilot is the engine: a PowerShell module (Invoke-Shp) that drives a Copilot agent from the terminal and is fully scriptable. It reuses the SAME instruction and skill files as VS Code and returns structured token-usage + cost objects. It is "PowerShell as the fingers" turned into a product.
- DeskPilot is the front door: a local web chat UI on top of ShellPilot for the non-coding audience from the previous slides — no terminal or IDE, permissions shown as switches (Terminal off by default), an activity panel, and per-turn cost.
- Honest status: both are experimental pre-releases that talk to internal Copilot endpoints intended for first-party editors. Present them as preview tooling, not supported products; run on a single-user machine and point the workspace at a version-controlled folder.
- Reinforces the Atelier message from Module 4: customization-as-code is portable — the same files run across the editor, the terminal, and a desktop app.
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

# AutomatedLab in 60 Seconds

> **Open-source PowerShell framework for provisioning complete Hyper-V lab environments from code.**

### What it gives you:
- **Lab definitions as PowerShell** — domains, networks, DCs, SQL, CM, PKI — all as code
- **One command to build** — `Install-Lab` spins up VMs, installs OS, promotes DCs
- **One command to tear down** — `Remove-Lab` returns the host to clean state
- **First-class remoting** — `Invoke-LabCommand` runs arbitrary PowerShell on any VM
- **Snapshots** — `Checkpoint-LabVM`, `Restore-LabVMSnapshot`

> **Everything scriptable. Everything discoverable via PowerShell.**

<!--
Speaker notes (for newcomers):
- **AutomatedLab** = open-source PowerShell module that builds entire Windows lab environments (DCs, member servers, SQL, etc.) from a script.
- **Hyper-V** = Microsoft's built-in virtualisation in Windows Pro/Enterprise/Server. Free, already installed in most enterprise setups.
- Why does the AI need this? Because it needs a place where rebooting a domain controller costs nothing. AutomatedLab gives that place.
- Alternatives exist (Vagrant, Terraform + Azure) but none are as Windows-native or as PowerShell-first.
-->
---

<!-- _class: dense -->

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

<!--
The sample script on this slide is a complete working lab definition; nothing has been elided for the slide. The `Install-Lab` call at the bottom triggers AutomatedLab to download (or use locally cached) Windows Server ISOs, provision two Hyper-V VMs, promote the first to a domain controller, join the second to the new domain, and configure the virtual network. The whole sequence takes roughly twenty to forty minutes depending on the host and whether the ISOs are cached.

The brevity is deliberate evidence of the broader claim: infrastructure-as-code is mature enough that a non-trivial environment fits in a twelve-line script. That brevity is what makes the lab a credible sandbox for agents — if rebuilding the environment cost an afternoon, no one would let the agent break it. Because rebuilding takes one command and the agent can drive it, the cost of letting the agent be wrong is essentially the wall-clock time of the next `Install-Lab` invocation.
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

<!-- _class: dense -->

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

<!--
The Kerberos RC4 deprecation is the textbook example for this module because it combines all the difficulty modes at once: production-critical (every domain logon depends on it), poorly documented (Microsoft's published guidance has moved several times), incremental (the change happens in named phases with specific event signatures), and irreversible-feeling (operators are afraid to test it because failure cascades across the directory). A lab where the entire environment can be reverted in seconds turns that fear into a routine test.

The eight-step session is the canonical agentic-operations workflow in eight bullets. The output — one commit that includes both the change script and the verified runbook — is what makes the work transferable. A human operator on the production change ticket can read the runbook, see the events that prove the script worked in the lab, and decide whether the same change is safe to roll out. The agent did not change production; the agent produced a reviewable artefact that lets a human change production with confidence.
-->
---

<!-- _class: dense -->

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

<!--
The snapshot-checkpoint-rollback sequence is the operational equivalent of the Git-based reversibility the curriculum has been arguing for since Module 3. Just as `git revert` makes code changes structurally reversible, `Checkpoint-LabVM` and `Restore-LabVMSnapshot` make infrastructure changes structurally reversible. The agent is allowed to be wrong because the cost of being wrong has been engineered down to seconds.

The rule embedded in the example — take a snapshot before any destructive change, automatically — should be a hard rule in the agent's instruction file for infrastructure work. It costs nothing on success (the snapshot is discarded with the lab teardown) and saves the entire investigation on failure (a single restore call returns to a known-good state). Teams that internalise this rule report dramatically more willingness to let the agent try novel sequences, because the downside has been removed.
-->
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

<!--
Speaker notes (for newcomers):
- One cmdlet to remember: **`Invoke-LabCommand`**. It runs PowerShell *inside* a lab VM and gives you the results back as real objects.
- This is what closes the agentic loop for infrastructure: the agent acts on a VM, then reads back what happened, then decides what to do next.
- Without something like this, the agent is just "typing scripts and hoping" — no feedback, no verification, no iteration.
-->
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

<!--
The table is intentionally specific about which sandbox suits which workload. There is no general-purpose answer; the right choice depends on what the agent is going to interact with. Windows-stack work (AD, GPO, Kerberos, DSC, SCCM) has essentially one defensible answer (AutomatedLab on Hyper-V); cloud-stack work has a different one (Terraform against an isolated subscription); cross-platform application code has yet another (dev containers).

The closing rule — pick the smallest sandbox that still contains the risk — is the parsimony principle for sandbox selection. A multi-forest AutomatedLab with PKI and SCCM is overkill for testing a single DSC composite resource; a dev container is insufficient for rehearsing a domain-wide Kerberos change. Matching the sandbox to the risk surface keeps the iteration cycle fast enough to be useful and complete enough to be trustworthy.
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

<!--
Speaker notes (for newcomers):
- Step 5 ("first verification fails, agent diagnoses from event logs") is the moment everything in the training clicks. Wait for the audience reaction.
- The runbook stays in Markdown next to the scripts. One PR shows both the script and the doc change — they cannot drift apart.
- This is `Invoke-Pester` for infrastructure. Same loop. Different artefact.
-->

---

# M9 Key Takeaway

1. **Agents are only as safe as their sandbox.** Reversible · reproducible · observable · isolated.
2. **AutomatedLab is the Hyper-V-native answer** for Windows, AD, and Microsoft-stack system engineering.
3. **`Invoke-LabCommand` is the agent's hands on infrastructure** — runs code *and* reads back structured results.
4. **Snapshot before every destructive action.** Make "undo" the default.
5. **Verified change + diffed runbook + git commit** is the system engineer's equivalent of green tests.

> **The full model: agent writes code, runs it in a lab, verifies with events, documents the result, commits. This is agentic operations.**

<!--
Speaker notes (for newcomers):
- One-line summary for sysadmins who joined late: *give the agent a lab, snapshot before every destructive action, verify with events, commit the runbook.*
- The four sandbox properties (reversible · reproducible · observable · isolated) are the checklist for any platform you let an agent loose on — not just AutomatedLab.
- This module closes the loop with Module 5 (self-verification): same pattern, infrastructure scale.
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