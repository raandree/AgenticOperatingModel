# Module 2: What Makes Coding "Agentic"?

## Version Guide

| Slide | Title | 1h | 2h | 4h |
|-------|-------|:---:|:---:|:---:|
| 2.0 | Foundational Vocabulary | ✅ | ✅ | ✅ |
| 2.1 | Defining "Agent" | ✅ | ✅ | ✅ |
| 2.2 | The Critical Difference | — | ✅ | ✅ |
| 2.3 | The Agentic Approach | — | ✅ | ✅ |
| 2.4 | The Role Reversal | — | ✅ | ✅ |
| 2.4a | The Conductor and the Orchestra | ✅ | ✅ | ✅ |
| 2.5 | The Agentic Loop | ✅ | ✅ | ✅ |
| 2.6 | OBSERVE Phase | — | — | ✅ |
| 2.7 | PLAN Phase | — | — | ✅ |
| 2.8 | ACT Phase | — | — | ✅ |
| 2.9 | VERIFY Phase | — | — | ✅ |
| 2.10 | ITERATE Phase | — | — | ✅ |
| 2.11 | Demo Time | — | ✅ | ✅ |
| 2.12 | Key Takeaway | ✅ | ✅ | ✅ |

> *"All life is problem solving."* — **Karl Popper**

## Slide 2.0: Foundational Vocabulary

# Speaking the Same Language

Before diving into agentic coding, let's align on the key terms:

| Term | Definition |
|------|------------|
| **Model** | The underlying large language model (LLM) that powers AI tools |
| **Agent** | An autonomous AI entity that can plan and execute tasks |
| **Tools** | Capabilities an agent can invoke (file I/O, terminal, search, etc.) |
| **Skill** | On-demand domain expertise packaged as a reusable knowledge file (`SKILL.md`) |
| **Instructions** | Rule sets (`.instructions.md`) that govern agent behavior |
| **Prompt** | The input or directive given to the model |
| **Memory Bank** | Persistent knowledge base maintained across sessions |
| **Token** | The smallest unit of text the model processes (~4 characters in English) |
| **Context Window** | The maximum amount of text (tokens) a model can consider at once |
| **MCP** | Model Context Protocol — a standard for connecting agents to external tools and data sources |

### Why this matters:
> Every tool and article in this space uses these terms. Understanding them is the foundation for everything that follows.

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

## Slide 2.1: Defining "Agent"

# What IS an Agent?

An **agent** is software that:

| Property | Description |
|----------|-------------|
| **Goals** | Has an objective to accomplish |
| **Context** | Understands its environment |
| **Tools** | Can take actions in the world |
| **Autonomy** | Makes decisions independently |
| **Iteration** | Can refine based on feedback |

### In coding terms:
> An agentic AI doesn't just **suggest** code—it **writes, tests, and fixes** code autonomously.

<!--
The word "agent" has a long pedigree in computer science — Marvin Minsky's *Society of Mind* (1986), the BDI architecture from the 1990s (Belief–Desire–Intention), reinforcement-learning agents from the 2010s. The current LLM-driven definition keeps the same five properties (goal, context, tools, autonomy, iteration) but supplies them with natural-language reasoning instead of hand-coded planners.

The practical distinction worth holding onto: an autocomplete suggests; a chatbot explains; an agent *acts and observes the result of its action*. The fifth property — iteration based on feedback — is the one that separates "agent" from "script with an LLM in it."
-->

---

## Slide 2.2: The Critical Difference

# Traditional AI vs Agentic AI

```
┌─────────────────────────────────────────────────────────────────┐
│                    TRADITIONAL AI ASSISTANCE                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  You: "Write a function to validate email"                     │
│                          │                                      │
│                          ▼                                      │
│                  ┌───────────────┐                             │
│                  │  AI suggests  │                             │
│                  │  code in chat │                             │
│                  └───────────────┘                             │
│                          │                                      │
│                          ▼                                      │
│                  ┌───────────────┐                             │
│                  │  YOU copy to  │                             │
│                  │    editor     │                             │
│                  └───────────────┘                             │
│                          │                                      │
│                          ▼                                      │
│                  ┌───────────────┐                             │
│                  │  YOU run it   │                             │
│                  └───────────────┘                             │
│                          │                                      │
│                          ▼                                      │
│                  ┌───────────────┐                             │
│                  │  YOU fix bugs │                             │
│                  └───────────────┘                             │
│                                                                 │
│                  Human does most of the work                    │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

<!--
The traditional flow has a human in every loop iteration: copy, paste, run, read error, decide what to do next. Each transition is a context switch costing seconds to minutes. On a 30-step task the wall-clock cost is dominated by these handoffs, not by either the human or the model thinking.

The second observation — less obvious — is that the human is also the *only memory* in this flow. The model forgets between turns; the editor doesn't know about the chat; the terminal doesn't know about the file. Everything that persists has to pass through the human's working memory, which is exactly where errors enter.
-->

---

## Slide 2.3: The Agentic Approach

# Agentic AI

```
┌─────────────────────────────────────────────────────────────────┐
│                      AGENTIC AI CODING                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  You: "Add email validation function with tests"               │
│                          │                                      │
│                          ▼                                      │
│                  ┌───────────────┐                             │
│                  │ Agent reads   │                             │
│                  │ your project  │                             │
│                  └───────────────┘                             │
│                          │                                      │
│                          ▼                                      │
│                  ┌───────────────┐                             │
│                  │ Agent creates │                             │
│                  │    files      │                             │
│                  └───────────────┘                             │
│                          │                                      │
│                          ▼                                      │
│                  ┌───────────────┐                             │
│                  │ Agent runs    │                             │
│                  │    tests      │                             │
│                  └───────────────┘                             │
│                          │                                      │
│                    ┌─────┴─────┐                               │
│                    │           │                               │
│                  Pass        Fail                              │
│                    │           │                               │
│                    ▼           ▼                               │
│               ┌────────┐  ┌──────────┐                        │
│               │ Report │  │Agent fixes│──▶ Run tests again    │
│               │ done   │  └──────────┘                        │
│               └────────┘                                       │
│                                                                 │
│                  Agent does most of the work                    │
│                  You review and approve                         │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

<!--
The loop on this slide is what "agent mode" actually means in tools like Copilot Agent Mode, Cursor, Claude Code, and Aider. The model invokes file-system and shell tools, reads their output, and decides what to do next — without a human between each step.

The critical edge is the Pass/Fail branch. In the traditional flow that branch lives in the human's head; here it lives in the agent's loop, gated by an automated check (test suite, linter, build). This is why test-discipline becomes load-bearing: it is the only signal the agent has for whether to stop or keep iterating.

The human's role does not disappear — it moves to the boundaries: defining the goal at the top, reviewing the diff at the bottom. Inside the loop, the human's contribution is approval, not authorship.
-->

---

## Slide 2.4: The Role Reversal

# Your Role Changes

| Before (Traditional) | After (Agentic) |
|---------------------|-----------------|
| You **type** code | You **describe** intent |
| You **implement** solutions | You **review** solutions |
| You **run** tests | Agent **runs** tests |
| You **debug** failures | Agent **debugs** failures |
| You **create** files | Agent **creates** files |
| You drive | You supervise |

### The shift:
> From **typist** to **architect and reviewer**

> *"Sapere aude! — Have the courage to use your own understanding."* — **Immanuel Kant**

<!--
The Kant quote ("Dare to know!") is the motto of the Enlightenment, from his 1784 essay *Was ist Aufklarung?*. He was arguing against intellectual tutelage — the habit of letting others think for you. The parallel here is deliberate and slightly pointed: agentic tools can either amplify your judgement or replace it, and which one happens is a choice the user makes, not a property of the tool.

The table itself describes a skill rotation rather than a skill loss. Reviewing code well is *harder* than writing it — it requires holding the whole system in mind, not just the next line. Teams that thrive with agents are typically the ones whose seniors were already good reviewers; teams that struggle are usually those who conflated "writes code" with "understands code."
-->

---

## Slide 2.4a: The Conductor and the Orchestra

# You Are the Conductor

> *A conductor doesn't play every instrument — but they understand how each one works and how to bring them together to create a harmonious performance.*

```
┌─────────────────────────────────────────────────────────────────┐
│                    THE ORCHESTRA ANALOGY                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│           🎼  THE CONDUCTOR (You)                               │
│           ──────────────────────                                │
│           • Has a vision of the perfect result                  │
│           • Understands every instrument's capabilities         │
│           • Orchestrates the ensemble                           │
│           • Intervenes when something sounds off                │
│                                                                 │
│   🎻 Agent 1    🎺 Agent 2    🥁 Agent 3    🎹 Agent 4        │
│   Code Writer   Test Runner   Reviewer      Deployer           │
│                                                                 │
│   Each musician plays autonomously — but the conductor          │
│   shapes the interpretation and ensures harmony.                │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### The parallels:

| Conductor | Developer with AI Agents |
|-----------|-------------------------|
| Knows every instrument's range and timbre | Understands each agent's capabilities and limits |
| Has a clear vision of the final performance | Has a concrete idea of the desired outcome |
| Doesn't play the instruments themselves | Doesn't write the code line by line |
| Intervenes when something is off | Reviews, corrects, and redirects agents |
| The better the conductor, the better the orchestra | The better your expertise, the better the AI output |

> *Der Dirigent hat wegen seiner Fähigkeit und Erfahrung eine konkrete Vorstellung
> des akustisch subjektiv perfekten Ergebnisses. Jeder KI Agent ist ein weiterer
> Musiker in diesem Orchester, der autonom spielen kann, aber dennoch einen
> erfahrenen Dirigenten benötigt, um ihn effektiv zu führen.*

### Why this analogy works for agentic coding:
- **Multi-agent orchestration**: Just as a conductor coordinates strings, brass, woodwinds, and percussion, you coordinate coding agents, testing agents, review agents, and deployment agents
- **Autonomy within guidance**: Musicians (agents) perform autonomously, but the conductor (you) sets tempo, dynamics, and interpretation
- **Expertise matters more, not less**: A great conductor makes a good orchestra exceptional. Your domain knowledge and judgment make AI agents dramatically more effective
- **The result exceeds individual parts**: No single musician creates a symphony — and no single agent delivers a complete solution without orchestration

<!--
Speaker notes (for newcomers):
- The analogy answers the most common fear: "Do I need to know less now that AI codes for me?" — No, you need to know *more*, just differently.
- A conductor doesn't play the violin — but they hear when the violin is wrong. That's exactly your new job: hear when the AI is wrong.
- "Multi-agent" sounds futuristic but in practice means: one agent writes, a second reviews security, a third writes docs. We'll see how in Module 4.
-->

---

## Slide 2.5: The Agentic Loop

# Observe → Plan → Act → Verify → Iterate

```
┌─────────────────────────────────────────────────────────────────┐
│                      THE AGENTIC LOOP                           │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│         ┌──────────────────────────────────────────┐           │
│         │                                          │           │
│         ▼                                          │           │
│   ┌──────────┐                                     │           │
│   │ OBSERVE  │  Read repository structure          │           │
│   │          │  Analyze existing code              │           │
│   │          │  Understand patterns                │           │
│   └────┬─────┘                                     │           │
│        │                                           │           │
│        ▼                                           │           │
│   ┌──────────┐                                     │           │
│   │   PLAN   │  Decide what to create/modify       │           │
│   │          │  Break into steps                   │           │
│   │          │  Consider dependencies              │           │
│   └────┬─────┘                                     │           │
│        │                                           │           │
│        ▼                                           │           │
│   ┌──────────┐                                     │           │
│   │   ACT    │  Write code                         │           │
│   │          │  Create files                       │           │
│   │          │  Modify existing files              │           │
│   └────┬─────┘                                     │           │
│        │                                           │           │
│        ▼                                           │           │
│   ┌──────────┐                                     │           │
│   │  VERIFY  │  Run tests                          │           │
│   │          │  Check for errors                   │           │
│   │          │  Validate output                    │           │
│   └────┬─────┘                                     │           │
│        │                                           │           │
│   ┌────┴────┐                                      │           │
│   │         │                                      │           │
│ Pass      Fail ──────────────────────────────────▶│           │
│   │                        ITERATE                             │
│   ▼                                                            │
│ DONE                                                           │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

<!--
Speaker notes (for newcomers):
- This 5-step loop is the single most important concept in the whole training. Everything else is detail.
- Compare to how YOU code: you read the file, decide what to change, change it, run it, fix the error. Same loop — the agent just does it faster and without coffee breaks.
- The loop is what makes "agentic" different from "autocomplete": autocomplete stops after step 3 (Act). An agent keeps going until VERIFY says PASS.
- Iteration is automatic. You don't approve every cycle — you approve the final result.
-->

---

## Slide 2.6: OBSERVE Phase

# What the Agent Sees

Before writing a single line of code, an agentic AI:

### Reads Repository Structure
```
📁 YourProject/
├── 📁 src/
│   ├── 📄 MainModule.psm1
│   └── 📁 Private/
├── 📁 tests/
├── � .github/
│   ├── 📄 copilot-instructions.md   ← "My rules"
│   └── 📁 instructions/
│       └── 📄 powershell.instructions.md
├── 📄 README.md                     ← "Project purpose"
└── 📄 .gitignore
```

### Analyzes Existing Code
- Naming conventions
- Code style
- Error handling patterns
- Existing functions

### Understands Context
- What does this project do?
- How is it structured?
- What patterns should I follow?

<!--
Observe is the phase most people underestimate. A modern agent does not "read the whole repository" — the context window cannot hold it. Instead it does a structured discovery pass: directory listing, README, manifest files, top-of-file comments, then targeted reads of the files most likely to be relevant. Tools like semantic search, grep, and symbol lookup are how this scales beyond toy projects.

The `.github/copilot-instructions.md` file shown here matters disproportionately: it is the one file the agent reads *unconditionally* on every task. Anything written there becomes baseline behaviour. This is why Module 4 spends so much time on instruction files — it is the cheapest, most durable lever a team has on agent behaviour.
-->

---

## Slide 2.7: PLAN Phase

# Agent Creates a Strategy

Given: "Add a function to validate configuration files"

### Agent thinks:
```
1. Check existing validation patterns in codebase
2. Determine where new function should go
3. Identify what test patterns are used
4. Plan:
   a. Create function in source/Public/
   b. Create tests in tests/
   c. Follow existing naming convention
   d. Match existing error handling style
```

### Key insight:
> The agent **adapts** to YOUR project, not the other way around.

<!--
Planning is where the agent commits to a path. In recent models (GPT-5, Claude Sonnet 4.5, Gemini 2.5) the plan is usually emitted as a short numbered list before any action is taken — partly for the user's benefit, partly as a self-conditioning mechanism that keeps the agent's later steps consistent.

The adaptation point is non-trivial: an agent that always writes "the React way" or "the Django way" regardless of the host project is a liability. Good agentic behaviour is *high-variance in the small* (writes code that looks like the surrounding code) and *low-variance in the large* (sticks to the plan it announced). Instruction files and conventions are the levers that keep both ends honest.
-->

---

## Slide 2.8: ACT Phase

# Agent Takes Action

The agent doesn't just suggest—it **does**:

| Action | Traditional AI | Agentic AI |
|--------|---------------|------------|
| Create new file | ❌ Suggests code | ✅ Creates file |
| Write to file | ❌ Shows in chat | ✅ Writes directly |
| Run commands | ❌ Tells you to run | ✅ Executes itself |
| Create multiple files | ❌ One at a time | ✅ All at once |

### Real example:
Agent might create:
- `source/Public/Test-ConfigFile.ps1`
- `tests/Test-ConfigFile.Tests.ps1`
- Update module manifest

All in one workflow.

<!--
The Act phase is where the abstraction "agent" becomes concrete: actual file writes, actual `git` commands, actual `pwsh` invocations. Behind the scenes these are tool calls — typed function invocations the model emits and the host application executes on its behalf. The MCP standard (Module 8) is the emerging contract for how those tools get exposed.

Two properties of the Act phase matter for risk: actions are *reversible* (because Git tracks the diff) but they are *not gated* (the agent does not stop to ask before each one in agent mode). The combination is intentional — stopping every time would destroy the productivity gain — but it is also why the verification phase, version control discipline, and destructive-operation guardrails (Module 7) become load-bearing.
-->

---

## Slide 2.9: VERIFY Phase

# Agent Checks Its Own Work

This is the **critical difference**:

```
┌─────────────────────────────────────────┐
│         SELF-VERIFICATION               │
├─────────────────────────────────────────┤
│                                         │
│  Agent: "I wrote the function"          │
│              │                          │
│              ▼                          │
│  Agent: "Now running tests..."          │
│              │                          │
│              ▼                          │
│  ┌───────────────────────┐             │
│  │   Invoke-Pester       │             │
│  │   ───────────────     │             │
│  │   Tests: 5            │             │
│  │   Passed: 4           │             │
│  │   Failed: 1  ←────────┼── Problem! │
│  └───────────────────────┘             │
│              │                          │
│              ▼                          │
│  Agent: "Test failed. Fixing..."        │
│              │                          │
│              ▼                          │
│  Agent: "Fixed. Running tests again..." │
│              │                          │
│              ▼                          │
│  Agent: "All tests pass. Done."         │
│                                         │
└─────────────────────────────────────────┘
```

<!--
Verification is the step that separates "agent" from "random code generator." The check has to be something the agent can run and read — typically a test suite, a build, a linter, a type-check. "Looks right to me" does not count, because the model cannot reliably evaluate its own output by inspection.

The failure mode worth naming here is the Cheating-Agent Trap (covered in Module 5): an agent under pressure to "make the tests pass" can edit the tests instead of the code. The defence is structural — version control, code review, and instruction-file rules forbidding test edits unless explicitly requested — not behavioural.
-->

---

## Slide 2.10: ITERATE Phase

# Self-Correction in Action

The agent doesn't give up on first failure:

### Iteration Example:
1. **Attempt 1**: Write function → Test fails (edge case)
2. **Analyze**: "Ah, null input not handled"
3. **Attempt 2**: Add null check → Test fails (wrong error type)
4. **Analyze**: "Need to throw correct exception"
5. **Attempt 3**: Fix exception → All tests pass ✅

### Why this matters:
- Mimics how **humans** actually code
- Catches issues **before** you see them
- Delivers **working** code, not "maybe" code

<!--
Iteration is bounded, not infinite. Every agent host imposes some cap — maximum tool calls per turn, maximum turns per task, maximum tokens consumed — partly for cost reasons, partly because runaway loops are a real failure mode (the agent fixing a symptom that re-creates itself in another file).

The interesting variable to watch in practice is *iteration depth*: how many cycles does the agent need before VERIFY passes? On well-structured repositories with good tests, two or three. On under-tested codebases the agent may iterate ten times and still ship something that compiles but is wrong. Iteration depth is therefore a useful proxy for "how AI-ready is this repo?" — high counts mean the verification signal is too weak.
-->

---

## Slide 2.11: Demo Time

# Let's See It in Action

## Demo: Traditional vs Agentic

### Traditional (Autocomplete/Chat):
1. Type function name
2. Accept autocomplete
3. Copy test from chat
4. Paste into file
5. Run tests manually
6. Fix failures manually

### Agentic (Copilot Agent Mode):
1. Describe what you want
2. Watch agent work
3. Review the result

**Same task. Different experience.**

<!--
The demo's purpose is not to impress the audience with what the agent can do — it is to make the loop *visible*. The slides up to this point describe Observe→Plan→Act→Verify→Iterate as a diagram; the demo shows the same loop unfolding in real time in the editor.

The most instructive part of the demo is usually a failure: a test that doesn't pass on the first try, the agent reading the error, and the agent's second attempt. That sequence answers more questions about how agents work than any successful run ever could.
-->

---

## Slide 2.12: Key Takeaway

# The Paradigm Shift

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│        TRADITIONAL                      AGENTIC                │
│                                                                 │
│   "AI helps me type faster"    "AI executes tasks for me"      │
│                                                                 │
│   ┌─────────────────────┐      ┌─────────────────────┐        │
│   │                     │      │                     │        │
│   │   You ──▶ AI ──▶ You│      │   You ──▶ AI ──▶ Done│       │
│   │    │              │ │      │    │              │  │        │
│   │    └──────────────┘ │      │    └── Review ────┘  │        │
│   │                     │      │                      │        │
│   │  You do the work    │      │  AI does the work    │        │
│   │  AI assists         │      │  You supervise       │        │
│   │                     │      │                      │        │
│   └─────────────────────┘      └──────────────────────┘        │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

> Agents don't just **suggest**—they **act**.
> You become the **reviewer**, not the **typist**.

<!--
The paradigm-shift framing is deliberately stark. In practice most teams operate in a blended mode — autocomplete for trivial edits, chat for explanation, agent for multi-file changes. The shift is real, but it is a redistribution of work across modes rather than a wholesale replacement of one with another.

The phrase "reviewer, not typist" is also a hiring and skill-development signal: the skills that matter on an AI-augmented team are reading code quickly, writing good specifications, designing tests, and judging trade-offs — the things that used to be considered "senior" work. Junior developers entering this world need a deliberate path to those skills, because the typing apprenticeship that used to build them is gone.
-->

---

## Speaker Notes - Module 2

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