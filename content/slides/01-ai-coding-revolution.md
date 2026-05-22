# Module 1: The AI Coding Revolution

## Version Guide

| Slide | Title | 1h | 2h | 4h |
|-------|-------|:---:|:---:|:---:|
| 1.1 | Title | ✅ | ✅ | ✅ |
| 1.2 | The Question (Poll) | — | ✅ | ✅ |
| 1.3 | The Evolution | ✅ | ✅ | ✅ |
| 1.4 | What Changed? | — | ✅ | ✅ |
| 1.4a | Tokens, Context & Cost | — | — | ✅ |
| 1.5 | The Productivity Question | — | ✅ | ✅ |
| 1.6 | Why This Matters to You | — | ✅ | ✅ |
| 1.7 | Today's Journey | ✅ | ✅ | ✅ |

---

## Slide 1.1: Title

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

## Slide 1.2: The Question

# How do YOU use AI for coding today?

🤔 Quick Poll:

- **A)** Code autocomplete (Copilot, Tabnine)
- **B)** Chat assistants (ChatGPT, Claude)
- **C)** AI agents (Copilot Agent Mode, Cursor, Claude Code)
- **D)** Not yet using AI for coding

<!--
The four answers correspond to four distinct mental models of what AI "is":

- **A) Autocomplete** — AI as a faster keyboard. Productivity gain is real but bounded; the human is still author and integrator.
- **B) Chat assistant** — AI as a knowledgeable colleague you consult. Better for explanation and one-off snippets; copy-paste is the bottleneck.
- **C) Agent** — AI as a workflow participant that reads the repository, edits files, runs commands, and reads the results. Different category of tool, not just a better B.
- **D) Not yet** — includes regulated industries, classified environments, and teams that explicitly chose to wait. Often the most prepared audience for an operating-model conversation, because they haven't yet accumulated bad habits.

In 2026 audiences, A and B together typically account for the large majority. The jump from B to C is the substantive topic of this training; A→B and B→C are very different transitions.
-->

---

## Slide 1.3: The Evolution

# AI Coding Has Evolved in Three Waves

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│  WAVE 1              WAVE 2              WAVE 3                │
│  2021-2022           2023-2024           2025-2026             │
│                                                                 │
│  ┌─────────┐        ┌─────────┐        ┌─────────┐            │
│  │ AUTO-   │        │  CHAT   │        │ AGENTIC │            │
│  │ COMPLETE│   ──▶  │ ASSIST  │   ──▶  │  CODING │            │
│  └─────────┘        └─────────┘        └─────────┘            │
│                                                                 │
│  "Complete         "Answer my         "Do this                │
│   this line"        question"          task for me"           │
│                                                                 │
│  Single line        Copy-paste         Autonomous              │
│  suggestions        workflow           execution               │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

<!--
The three waves are cumulative, not replacements — autocomplete still lives inside every modern agent.

**Wave 1 (2021–22)** opened with GitHub Copilot's general availability in June 2022. The interaction unit was a single line or block; the human remained author, integrator, and runner. Productivity gains were measurable (~30–55% on benchmark tasks) but the engineering process around the code was unchanged.

**Wave 2 (2023–24)** is the chat era: ChatGPT (Nov 2022), Claude, Gemini. The interaction unit became a *conversation*, and the AI could explain, refactor, or generate larger fragments. The bottleneck moved to the human's copy-paste step and to the lack of context — the model could not see the repository or run the code.

**Wave 3 (2025–26)** is the agentic era: Copilot Agent Mode, Cursor, Claude Code, Aider. The model gains tools (file I/O, shell, search) and runs a loop — observe, plan, act, verify, iterate. The unit of work is no longer a snippet but a *task with verification*. The human role shifts from typist to reviewer.

The shift to Wave 3 is what creates the need for an operating model: once the agent can take actions, version control, tests, and guardrails stop being optional hygiene and become the supervision mechanism.
-->

---

## Slide 1.4: What Changed?

# Why the Agentic Operating Model is Possible NOW

### Technology Advances
- **Massive context windows** (1M+ tokens with Claude Opus 4.7)
- **Advanced reasoning** (Claude Opus 4.7, GPT-5.4 / GPT-5.4-mini, Gemini 3.1 Pro)
- **Native tool use** abilities in LLMs
- **Cheaper API costs** for longer iteration loops
- **Model Context Protocol (MCP)** as universal standard (Linux Foundation)

### Tooling Advances
- AI agents with **file system access** and **browser automation**
- **Terminal command** execution with exit code awareness
- **Checkpoint/rollback** systems built into editors
- **Multi-file context** understanding with AST analysis
- **Cloud agents** running autonomously (Copilot Coding Agent, Cursor Cloud Agents)
- **Agentic Workflows** in CI/CD (GitHub Agentic Workflows, GA April 2026)

<!--
Speaker notes (for newcomers):
- **LLM** = Large Language Model. The "brain" behind the assistant (Claude, GPT, Gemini).
- **Context window** = how much text (your code + chat + docs) the model can read at once.
- **Tool use** = the model can call functions like "read file", "run command", not just generate text.
- **MCP** = a USB-like standard that lets any AI tool talk to any data source. Covered in Module 8.
- The point of this slide: the *capability* existed for a while, but only NOW are price, context size, and tooling good enough for autonomous loops.
-->

---

## Slide 1.4a: Tokens, Context Windows & Cost

# Understanding the Economics

### What are tokens?
- A **token** is the smallest unit of text the model processes
- ~4 characters or ~¾ of a word in English
- Both your **input** (prompt + context) and the model's **output** consume tokens

### Context window sizes (April 2026):
| Model | Context Window |
|-------|----------------|
| Claude Opus 4.7 | Up to **1M tokens** |
| GPT-5.4 / GPT-5.4-mini | **256K tokens** |
| GPT-5.3-Codex | **256K tokens** (specialized coding variant) |
| Gemini 3.1 Pro | **2M tokens** |

### Why cost matters in agentic workflows:
- Agentic loops consume **more tokens** than single-shot requests
- Each iteration (observe → plan → act → verify) adds token usage
- Larger context windows = more tokens per request = higher cost
- **Cloud agents** (Copilot Coding Agent) run autonomously — costs accumulate

### How to measure token usage:
- GitHub Copilot: Check usage dashboard in GitHub settings
- VS Code: Monitor in Copilot output panel
- API-based tools: Token counts returned in API responses

> **Hands-on idea**: Track how many tokens a real agentic task consumes from start to finish.

<!--
Speaker notes (for newcomers):
- Think of tokens like minutes on a prepaid phone: every message you send and every reply you get "costs" some.
- One agentic task = many small back-and-forth calls (read file, plan, write, run tests, read error, fix). Each call eats tokens.
- That is why even a "cheap" model can produce a noticeable bill when run on autopilot for hours.
- Concrete rule of thumb: 1 page of English text ≈ 500 tokens; a medium PowerShell file ≈ 1000–3000 tokens.
-->

---

## Slide 1.5: The Productivity Question

# Real-World Impact

> "I'm shipping features in hours that used to take days."
> — Common developer feedback on agentic tools

### What the data shows (April 2026):
- **55% faster** task completion (GitHub study)
- **40% less time** debugging (Microsoft study)
- **Boilerplate generation**: Minutes instead of hours
- **Test generation**: Comprehensive coverage faster
- **Enterprise adoption**: NVIDIA (40K engineers), Salesforce (20K developers), Fortune 500+
- **Windsurf claims**: 94% of code written by AI in their workflows

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

## Slide 1.6: Why This Matters to You

# As PowerShell Developers / DevOps Engineers

You already:
- ✅ Work with **structured repositories**
- ✅ Use **version control** (Git)
- ✅ Write **testable code** (Pester)
- ✅ Follow **conventions** (Approved Verbs, etc.)

These practices make agentic coding **even more effective** for you.

<!--
The four bullets on this slide are not nice-to-have qualifications; they are the *substrate* an agent needs to operate.

- **Structured repositories** give the agent a knowable surface area. An agent let loose on a flat folder of loose scripts has no map; an agent inside a Sampler/PowerShell project layout knows where public functions, private helpers, and tests live by convention.
- **Git** is the supervision mechanism. Every action the agent takes becomes a diff — reviewable, revertible, attributable. Without Git, there is no equivalent of "undo last 30 minutes".
- **Pester tests** turn intent into something an agent can verify against. The agent's success criterion is no longer "does this look right?" but "does the test suite go green?", which is automatable.
- **Conventions** (Approved Verbs, parameter patterns, comment-based help) compress the prompt: the agent infers what new code should look like from what already exists, instead of being told explicitly every time.

The broader observation: the engineering hygiene PowerShell and DevOps teams adopted for human reasons (review, rollback, reproducibility) is the *same* hygiene that makes AI agents productive and safe. Teams without it tend to discover this the expensive way.
-->

---

## Slide 1.7: Today's Journey

# What We'll Cover

1. **What Makes Coding "Agentic"**
   - The paradigm shift from suggestions to execution

2. **The Power of Context**
   - Why Git is foundational to AI understanding

3. **Controlling AI Behavior**
   - Instruction files and custom agents

4. **Self-Verification**
   - How AI validates its own work

5. **Practical Application**
   - Live demonstration of the full workflow

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

## Speaker Notes - Module 1

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