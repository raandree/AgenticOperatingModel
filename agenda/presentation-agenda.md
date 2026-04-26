# The Agentic Operating Model

## Presentation Agenda — Three-Version Architecture

**Primary Focus**: The Agentic Operating Model — versioned, AI-agent-assisted knowledge work
**Demo Context**: PowerShell (familiar to audience)
**Tool**: GitHub Copilot Agent Mode (VS Code)

---

## Architecture: Single Source, Three Versions

This agenda defines three presentation versions (**1h**, **2h**, **4h**) that share the **same** module content. All modules live in single files under `content/slides/`. The versions differ only in:

1. **Which modules** are included
2. **Which slides** within a module are presented
3. **Timing and pacing**

> **DRY Principle**: Content is written once. When you update a module, all versions that include it automatically benefit. Version-specific slide selection is documented in the **Version Guide** table at the top of each slide file and the [Slide Inclusion Guide](#slide-inclusion-guide) below.

---

## Core Message

> **This is NOT a PowerShell training. It is NOT even a coding training. It is a training about a new working model — versioned, agent-assisted knowledge work — that applies to code, infrastructure, research, and legal/business work alike. Coding is one instance of the pattern, not the pattern itself.**

PowerShell is simply the language we use for demos because you already know it. The concepts apply to any language — and to many kinds of work that are not "code" at all.

---

## Audience Profiles

This training addresses four overlapping profiles. The core modules (M01–M10) serve all four. **M11 + M12** are the opt-in extensions for system engineers and knowledge workers.

| Profile | Primary deliverable | Training hook | Recommended modules |
|---------|---------------------|---------------|---------------------|
| **Developer** | Code | "AI that codes" | M01–M10 |
| **DevOps / SRE** | Pipelines, IaC, runbooks | "AI that operates" | M01–M10, optionally M12 |
| **System engineer** | Configuration, validation, evidence | "AI that tests on real OS — in a lab" | M01–M05, M08–M10, **M11 + M12** |
| **Research / knowledge worker** | Documents, analyses, correspondence | "AI that reasons over your corpus — with a diff" | M01–M05, M09–M10, **M11** |

See the module descriptions for M11 and M12 further down.

---

## Quick Navigation

- [Version Summary](#version-summary) — At-a-glance comparison
- [Module Inclusion Matrix](#module-inclusion-matrix) — What's in each version
- [1-Hour Keynote](#version-1-1-hour-keynote) — Conference / meetup / lunch & learn
- [2-Hour Standard](#version-2-2-hour-standard) — Team / department / customer briefing
- [4-Hour Workshop](#version-3-4-hour-workshop) — Practitioner deep dive
- [Slide Inclusion Guide](#slide-inclusion-guide) — Which slides per version per module
- [Module Descriptions](#module-descriptions-shared-content) — Shared content details

---

## Version Summary

| Version | Duration | Format | Audience | Breaks |
|---------|----------|--------|----------|--------|
| **1h Keynote** | 60 min | Presentation | Conference, meetup, lunch & learn | None |
| **2h Standard** | 120 min | Presentation + demo | Team, department, customer briefing | 1 × 10 min |
| **4h Workshop** | ~4.5h wall clock | Presentation + demos + deep dives | Practitioners, hands-on workshop | 2 × 10 min + lunch |

---

## Module Inclusion Matrix

| Module | Topic | 1h | 2h | 4h | Notes |
|--------|-------|:---:|:---:|:---:|-------|
| **M01** | The AI Coding Revolution | 5 min | 10 min | 10 min | 1h: condensed intro |
| **M02** | What Makes Coding Agentic | 15 min | 25 min | 30 min | Core paradigm |
| **M03** | The Power of Context | 10 min | 20 min | 25 min | Git as AI brain |
| **M04** | Controlling AI Behavior | 10 min | 20 min | 25 min | 4h: includes prompt evolution demo |
| **M05** | Self-Verification | 5 min | 20 min | 20 min | 1h: concept only |
| **M06** | Copilot Agent Mode Overview | — | — | 15 min | Tool orientation |
| **M07** | Agentic Workflow in Action | — | — | 35 min | Full live build |
| **Demo** | Synthesis Demo | 10 min | 10 min | — | Condensed; replaced by M07 in 4h |
| **M08** | Advanced Capabilities | — | — | 25 min | MCP, checkpoints, agent types |
| **M09** | When to Use (and Not Use) | — | — | 20 min | Judgment & ethics |
| **M10** | Your Agentic Future | 5 min | 5 min | 15 min | 1h/2h: quick wrap; 4h: full |
| **M11** ✦ | Agentic Work Beyond Code | — | opt. 15 min | opt. 25 min | **Optional** — system-engineer / knowledge-worker track |
| **M12** ✦ | The Lab as the Agent's Sandbox | — | opt. 15 min | opt. 25 min | **Optional** — system-engineer track (AutomatedLab) |
| | **Teaching time** | **60 min** | **110 min** | **220 min** | Excluding optional M11/M12 |
| | **Breaks** | **0 min** | **10 min** | **20 min + lunch** | |

✦ = Optional module. Include when the audience is not predominantly developers. When M11/M12 are added to the 4h workshop, displace M08 or M09 to stay within wall-clock budget, or extend the workshop to 5h.

---

## Key Concepts to Convey

### The Paradigm Shift

| Traditional AI Assistance | Agentic Coding |
|--------------------------|----------------|
| AI suggests, human implements | AI plans, executes, verifies |
| Single-file context | Entire repository context |
| Copy-paste from chat | Autonomous file operations |
| Human runs tests | Agent runs tests, iterates |
| One interaction at a time | Multi-step autonomous workflows |
| Human drives | AI drives, human supervises |

### Core Principles (What Attendees Must Understand)

1. **Context is Everything** - How Git repository structure gives AI understanding
2. **Autonomous Execution** - AI as an agent that acts, not just advises
3. **Self-Verification** - AI running tests to validate its own work
4. **Instruction-Driven Behavior** - Controlling AI through configuration files
5. **Human Oversight** - Review, approve, rollback capabilities
6. **Traceability** - Tracking what AI changed and why

---

## Version 1: 1-Hour Keynote

*Focus: Awareness and inspiration — "what is this and why should I care?"*

| Time | Duration | Content | Focus |
|------|----------|---------|-------|
| 0:00 | 5 min | **M01: The AI Coding Revolution** | Why we're here — evolution to agentic |
| 0:05 | 15 min | **M02: What Makes Coding Agentic** | Agent definition + agentic loop concept |
| 0:20 | 10 min | **M03: The Power of Context** | Git as context provider + traceability |
| 0:30 | 10 min | **M04: Controlling AI Behavior** | Instruction files + ecosystem overview |
| 0:40 | 5 min | **M05: Self-Verification** | Verification loop concept |
| 0:45 | 10 min | **Demo: Quick Synthesis** | See it all together in action |
| 0:55 | 5 min | **M10: Next Steps** | Resources + call to action |
| **1:00** | — | **End** | — |

### 1-Hour Facilitator Notes

- **Pacing**: Fast-moving, no breaks. Energy must stay high.
- **Demos**: One short, pre-rehearsed demo only. No live debugging.
- **Slides**: Use only slides marked ✅ in the "1h" column of each module's Version Guide.
- **Tone**: Inspirational keynote — sell the paradigm shift, don't teach the details.
- **Skip**: Polls, deep-dive diagrams, individual agentic loop phases, all advanced topics.
- **End with**: A clear call to action (try it, set up copilot-instructions.md this week).

### 1-Hour Learning Outcomes

After 1 hour, attendees will understand:
- ✅ What agentic coding is and why it's different
- ✅ How repository context enables intelligent AI behavior
- ✅ That instruction files exist to control AI behavior
- ✅ That automated testing enables AI self-verification
- ✅ Where to start (resources and first steps)

---

## Version 2: 2-Hour Standard

*Focus: Understanding the paradigm — concepts, rationale, and a demonstration*

| Time | Duration | Content | Focus |
|------|----------|---------|-------|
| 0:00 | 10 min | **M01: The AI Coding Revolution** | Setting the stage |
| 0:10 | 25 min | **M02: What Makes Coding Agentic** | Core paradigm + demo |
| 0:35 | 20 min | **M03: The Power of Context** | Foundation concept |
| 0:55 | 10 min | ☕ **Break** | — |
| 1:05 | 20 min | **M04: Controlling AI Behavior** | Instruction files + custom agents |
| 1:25 | 20 min | **M05: Self-Verification** | Testing as AI guardrail |
| 1:45 | 10 min | **Demo: Synthesis** | See it all together |
| 1:55 | 5 min | **M10: Next Steps** | Resources + call to action |
| **2:00** | — | **End** | — |

### 2-Hour Facilitator Notes

- **Pacing**: Steady teaching pace with one 10-minute break.
- **Demos**: Synthesis demo at the end ties all concepts together.
- **Slides**: Use slides marked ✅ in the "2h" column of each module's Version Guide.
- **Tone**: Educational — explain the concepts, show the "aha" moments.
- **Interaction**: The poll in M01 works well here. Encourage questions during break.
- **Skip**: Individual agentic loop phase deep-dives (2.6–2.10), advanced topics (Skills, Prompt files, Handoffs), all of M06–M09.

### 2-Hour Learning Outcomes

After 2 hours, attendees will understand:
- ✅ What agentic coding is and why it's different
- ✅ How repository context enables intelligent AI behavior
- ✅ How to configure AI behavior with instruction files
- ✅ Why automated testing is critical for AI workflows
- ✅ How to maintain traceability and control

---

## Version 3: 4-Hour Workshop

*Focus: Understanding + hands-on experience with agentic workflows*

### Part 1: Understanding the Paradigm (120 min)

| Time | Duration | Content | Focus |
|------|----------|---------|-------|
| 0:00 | 10 min | **M01: The AI Coding Revolution** | Why we're here |
| 0:10 | 30 min | **M02: What Makes Coding Agentic** | Paradigm shift + all loop phases |
| 0:40 | 25 min | **M03: The Power of Context** | Git, structure, history, forensics |
| 1:05 | 10 min | ☕ **Break** | — |
| 1:15 | 25 min | **M04: Controlling AI Behavior** | Deep dive + prompt evolution demo |
| 1:40 | 20 min | **M05: Self-Verification** | Testing as AI guardrail |
| **2:00** | — | 🍽️ **Lunch / Long Break** | — |

### Part 2: Applying Agentic Coding (120 min)

| Time | Duration | Content | Focus |
|------|----------|---------|-------|
| 0:00 | 15 min | **M06: Copilot Agent Mode** | Tool orientation |
| 0:15 | 35 min | **M07: Agentic Workflow in Action** | Full end-to-end demonstration |
| 0:50 | 10 min | ☕ **Break** | — |
| 1:00 | 25 min | **M08: Advanced Capabilities** | MCP, checkpoints, agent types |
| 1:25 | 20 min | **M09: When to Use (and Not Use)** | Judgment & ethics |
| 1:45 | 15 min | **M10: Your Agentic Future** | Next steps, resources, Q&A |
| **2:00** | — | **End** | — |

### 4-Hour Facilitator Notes

- **Pacing**: Teaching + demo-heavy. Allow time for questions after each module.
- **Demos**: Prompt Evolution demo in M04. Full live build in M07. MCP demo in M08.
- **Slides**: Use ALL slides (everything marked ✅ in the "4h" column).
- **Tone**: Workshop — mix of teaching and hands-on demonstration.
- **Interaction**: Encourage questions throughout, especially during demos.
- **Lunch**: Plan 30–60 min for lunch between Part 1 and Part 2 (not counted in teaching time).

### 4-Hour Learning Outcomes

After 4 hours, attendees will understand:
- ✅ Everything from the 2-hour version, plus:
- ✅ How the full Copilot Agent Mode toolset works
- ✅ How MCP extends agent capabilities
- ✅ How checkpoints and rollback provide safety nets
- ✅ When to use agentic AI (and when not to)
- ✅ How to evaluate AI-generated code critically
- ✅ Concrete next steps for their own projects

---

## Slide Inclusion Guide

Each module file in `content/slides/` contains a **Version Guide** table at the top. The tables below are the master reference — keep them in sync with the slide files.

### Module 1: The AI Coding Revolution

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

### Module 2: What Makes Coding Agentic

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

### Module 3: The Power of Context

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
| 3.12 | Demo - Context in Action | — | — | ✅ |
| 3.13 | Key Takeaway | ✅ | ✅ | ✅ |

### Module 4: Controlling AI Behavior

| Slide | Title | 1h | 2h | 4h |
|-------|-------|:---:|:---:|:---:|
| 4.1 | The Consistency Problem | ✅ | ✅ | ✅ |
| 4.2 | The Solution | ✅ | ✅ | ✅ |
| 4.3 | Copilot Instruction Files | ✅ | ✅ | ✅ |
| 4.4 | Anatomy of copilot-instructions.md | — | ✅ | ✅ |
| 4.5 | Rule Categories | — | ✅ | ✅ |
| 4.6 | Before and After | — | ✅ | ✅ |
| 4.7 | Hierarchy of Instructions | — | ✅ | ✅ |
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

### Module 5: Self-Verification

| Slide | Title | 1h | 2h | 4h |
|-------|-------|:---:|:---:|:---:|
| 5.1 | The Trust Problem | ✅ | ✅ | ✅ |
| 5.2 | The Verification Loop | ✅ | ✅ | ✅ |
| 5.3 | Why This Matters | — | ✅ | ✅ |
| 5.4 | What Gets Tested | — | ✅ | ✅ |
| 5.5 | The Iteration Power | — | ✅ | ✅ |
| 5.6 | Enabling Self-Verification | — | ✅ | ✅ |
| 5.7 | Test-First with AI | — | — | ✅ |
| 5.8 | Test-First Demo | — | — | ✅ |
| 5.9 | Beyond Pester | — | — | ✅ |
| 5.10 | Demo - Watch AI Self-Verify | — | ✅ | ✅ |
| 5.11 | When Tests Fail | — | — | ✅ |
| 5.12 | Trust Hierarchy | — | — | ✅ |
| 5.13 | Key Takeaway | ✅ | ✅ | ✅ |

### Module 8: Advanced Capabilities *(4h only)*

| Slide | Title | 1h | 2h | 4h |
|-------|-------|:---:|:---:|:---:|
| 8.1–8.13 | All slides | — | — | ✅ |

### Module 9: When to Use *(4h only)*

| Slide | Title | 1h | 2h | 4h |
|-------|-------|:---:|:---:|:---:|
| 9.1–9.14 | All slides | — | — | ✅ |

### Module 10: Your Agentic Future

| Slide | Title | 1h | 2h | 4h |
|-------|-------|:---:|:---:|:---:|
| 10.1 | Recap | — | — | ✅ |
| 10.2 | The Five Questions | — | — | ✅ |
| 10.3 | Getting Started | ✅ | ✅ | ✅ |
| 10.4 | Your First Task | — | ✅ | ✅ |
| 10.5 | Building copilot-instructions.md | — | — | ✅ |
| 10.5a | Cross-Machine Sync | — | — | ✅ |
| 10.6 | Resources | ✅ | ✅ | ✅ |
| 10.7 | Sample Instruction Library | — | — | ✅ |
| 10.8 | The Future | — | — | ✅ |
| 10.9 | Call to Action | ✅ | ✅ | ✅ |
| 10.10 | Final Thought | — | — | ✅ |
| 10.11 | Q&A | — | — | ✅ |
| 10.12 | Thank You | ✅ | ✅ | ✅ |

### Module 11: Agentic Work Beyond Code *(optional — system-engineer / knowledge-worker track)*

| Slide | Title | 1h | 2h | 4h |
|-------|-------|:---:|:---:|:---:|
| 11.1 | Same Loop, Different Deliverable | — | ✅ | ✅ |
| 11.2 | Three Real Projects, One Pattern | — | ✅ | ✅ |
| 11.3 | The Universal Operating Model | — | ✅ | ✅ |
| 11.4 | What Counts as "Non-Coding"? | — | — | ✅ |
| 11.5 | Markdown as the Reasoning Substrate | — | — | ✅ |
| 11.6 | Git Is Not Just for Code | — | ✅ | ✅ |
| 11.7 | The Memory Bank Pattern | — | ✅ | ✅ |
| 11.8 | PowerShell as the "Fingers" | — | — | ✅ |
| 11.9 | Data Governance & Confidentiality | — | ✅ | ✅ |
| 11.10 | Audience Extensions | — | — | ✅ |
| 11.11 | Key Takeaway | — | ✅ | ✅ |

### Module 12: The Lab as the Agent's Sandbox *(optional — system-engineer track)*

| Slide | Title | 1h | 2h | 4h |
|-------|-------|:---:|:---:|:---:|
| 12.1 | Why Sysadmins Don't Let Agents Touch Prod | — | ✅ | ✅ |
| 12.2 | The Four Properties of a Good Agent Sandbox | — | ✅ | ✅ |
| 12.3 | AutomatedLab in 60 Seconds | — | — | ✅ |
| 12.4 | A Minimal Lab Definition | — | — | ✅ |
| 12.5 | The Agent's Feedback Loop on Infrastructure | — | ✅ | ✅ |
| 12.6 | Live Example — The Kerberos RC4 Lab | — | — | ✅ |
| 12.7 | Snapshot-Driven Iteration | — | — | ✅ |
| 12.8 | Invoke-LabCommand as a First-Class Tool | — | — | ✅ |
| 12.9 | Lab vs. Cloud vs. Dev Container | — | — | ✅ |
| 12.10 | What You Can Actually Test Safely | — | ✅ | ✅ |
| 12.11 | Demo Reference | — | ✅ | ✅ |
| 12.12 | Key Takeaway | — | ✅ | ✅ |

---

## Module Descriptions (Shared Content)

### Module 1: The AI Coding Revolution *(1h: 5 min · 2h: 10 min · 4h: 10 min)*

**Purpose**: Establish why this matters NOW

**Content**:
- The evolution: Autocomplete → Chat → Agents
- What changed in 2024-2025 that made this possible
- Real productivity gains observed in industry
- Why PowerShell developers should care

**Key Message**: "This isn't incremental improvement. This is a new way of working."

---

### Module 2: What Makes Coding "Agentic"? *(1h: 15 min · 2h: 25 min · 4h: 30 min)*

**Purpose**: Define the paradigm clearly

**Content**:

1. **Foundational Vocabulary** (5 min)
   - Key terms: Model, Agent, Tools, Skill, Instructions, Prompt, Memory Bank, Token, Context Window, MCP
   - Ensure all attendees speak the same language before hands-on work

2. **Defining "Agent"** (10 min)
   - An agent has: goals, context, tools, autonomy
   - Compare: Copilot autocomplete vs. Copilot Agent Mode
   - The agent loop: Observe → Plan → Act → Verify → Iterate

2. **The Agent Execution Model** (10 min)
   ```
   ┌─────────────────────────────────────────────────┐
   │                  AGENTIC LOOP                    │
   ├─────────────────────────────────────────────────┤
   │                                                 │
   │   User: "Add a function to validate configs"   │
   │                     │                          │
   │                     ▼                          │
   │   ┌─────────────────────────────────────┐     │
   │   │ OBSERVE: Read repo structure, files │     │
   │   └─────────────────────────────────────┘     │
   │                     │                          │
   │                     ▼                          │
   │   ┌─────────────────────────────────────┐     │
   │   │ PLAN: Decide what to create/modify  │     │
   │   └─────────────────────────────────────┘     │
   │                     │                          │
   │                     ▼                          │
   │   ┌─────────────────────────────────────┐     │
   │   │ ACT: Write code, create tests       │     │
   │   └─────────────────────────────────────┘     │
   │                     │                          │
   │                     ▼                          │
   │   ┌─────────────────────────────────────┐     │
   │   │ VERIFY: Run tests, check results    │     │
   │   └─────────────────────────────────────┘     │
   │                     │                          │
   │            Pass?  ──┴── Fail?                  │
   │              │           │                     │
   │              ▼           └──▶ ITERATE ─────┐   │
   │           DONE                             │   │
   │              ◀─────────────────────────────┘   │
   │                                                 │
   └─────────────────────────────────────────────────┘
   ```

3. **Demo: Traditional vs Agentic** (5-10 min)
   - Same task, two approaches
   - Highlight: Autonomous file creation, test execution, iteration

**Key Message**: "Agents don't just suggest—they act. You become the reviewer, not the typist."

---

### Module 3: The Power of Context *(1h: 10 min · 2h: 20 min · 4h: 25 min)*

**Purpose**: Explain WHY Git is foundational to agentic coding

**Content**:

1. **Why Context Matters** (7 min)
   - AI without context = generic, wrong, inconsistent
   - AI with context = pattern-matching, consistent, aware
   - Repository as knowledge base

2. **What Agents "See"** (8 min)
   ```
   ┌────────────────────────────────────────────────┐
   │           WHAT THE AGENT OBSERVES              │
   ├────────────────────────────────────────────────┤
   │                                                │
   │  📁 Repository Structure                       │
   │  ├── How is code organized?                   │
   │  ├── Naming conventions?                      │
   │  └── Module patterns?                         │
   │                                                │
   │  📜 File Contents                              │
   │  ├── Existing code patterns                   │
   │  ├── Coding style                             │
   │  └── Dependencies and imports                 │
   │                                                │
   │  📋 Configuration Files                        │
   │  ├── README.md → Project purpose              │
   │  ├── .github/copilot-instructions.md → AI rules │
   │  └── Manifests → Dependencies                 │
   │                                                │
   │  📝 Git History (Implicit)                     │
   │  ├── Recent focus areas                       │
   │  ├── Commit message patterns                  │
   │  └── Evolution of codebase                    │
   │                                                │
   └────────────────────────────────────────────────┘
   ```

3. **Traceability: Knowing What AI Changed** (5 min)
   - Git diff shows exactly what agent modified
   - Checkpoints allow rollback
   - Commit history documents AI contributions
   - **Demo**: Show diff of agent changes, checkpoint restore

4. **Best Practices for Context** (5 min)
   - Always work in a Git repository
   - Meaningful directory structure
   - Good README files
   - Consistent patterns help AI learn

**Key Message**: "Git isn't just version control—it's how you give AI a brain."

---

### Module 4: Controlling AI Behavior *(1h: 10 min · 2h: 20 min · 4h: 25 min)*

**Purpose**: Show how instruction files shape agent behavior

**Content**:

1. **The Problem with Unconfigured AI** (5 min)
   - Inconsistent results between requests
   - Doesn't know your standards
   - Generic solutions that don't fit
   - **Demo**: Same prompt, different (bad) results without config

2. **Instruction Files: Teaching AI Your Rules** (10 min)
   - What is `copilot-instructions.md`?
   - Hierarchy: Project rules override global
   - What to include:
     - Code standards
     - Testing requirements
     - Documentation expectations
     - Security rules
     - Git conventions

   **Example**:
   ```markdown
   # Project Rules for AI Agent
   
   ## Execution Style
   - Always create tests alongside new functions
   - Run tests before reporting completion
   - Commit after each logical unit of work
   
   ## Code Standards
   - Follow existing patterns in the codebase
   - Include error handling for all functions
   - Add inline comments for complex logic
   
   ## Verification
   - Run linter before completing
   - Ensure all tests pass
   - Report what was changed
   ```

3. **Custom Agent Modes** (5 min)
   - Different "personalities" for different tasks
   - Refactoring agent vs. Documentation agent
   - **Demo**: Switch modes, show behavior difference

4. **Demo: Before/After Configuration** (5 min)
   - Same request without copilot-instructions.md
   - Same request WITH copilot-instructions.md
   - Dramatic difference in quality

5. **Demo: Prompt Evolution** (10-15 min, extended version only)
   - Same task, six levels of prompt quality
   - Shows impact of referencing instructions, skills, and agents
   - See [demo-prompt-evolution.md](../content/demos/demo-prompt-evolution.md)

**Key Message**: "Instruction files are how you train your AI to work YOUR way."

---

### Module 5: The Verification Loop *(1h: 5 min · 2h: 20 min · 4h: 20 min)*

**Purpose**: Explain automated testing as AI guardrail

**Content**:

1. **Why AI Needs Tests** (5 min)
   - AI can write plausible but wrong code
   - Tests are executable specifications
   - Without tests, how do you know it works?
   - With tests, AI can iterate until correct

2. **The Self-Verification Pattern** (10 min)
   ```
   ┌─────────────────────────────────────────────────┐
   │           SELF-VERIFICATION LOOP                │
   ├─────────────────────────────────────────────────┤
   │                                                 │
   │   Agent receives task                          │
   │         │                                       │
   │         ▼                                       │
   │   ┌─────────────────┐                          │
   │   │ Write function  │                          │
   │   └─────────────────┘                          │
   │         │                                       │
   │         ▼                                       │
   │   ┌─────────────────┐                          │
   │   │ Write tests     │                          │
   │   └─────────────────┘                          │
   │         │                                       │
   │         ▼                                       │
   │   ┌─────────────────┐     ┌─────────────────┐  │
   │   │ Run tests       │────▶│ Tests fail      │  │
   │   └─────────────────┘     └─────────────────┘  │
   │         │                        │             │
   │     Tests pass                   ▼             │
   │         │                 ┌─────────────────┐  │
   │         ▼                 │ Analyze failure │  │
   │   ┌─────────────────┐     └─────────────────┘  │
   │   │ Report success  │            │             │
   │   └─────────────────┘            ▼             │
   │                          ┌─────────────────┐   │
   │                          │ Fix code        │   │
   │                          └─────────────────┘   │
   │                                  │             │
   │                                  └──▶ Run tests│
   │                                                 │
   └─────────────────────────────────────────────────┘
   ```

3. **Live Demo: Watch AI Self-Correct** (10 min)
   - Request: "Add input validation function with tests"
   - Watch: Agent writes function
   - Watch: Agent writes tests
   - Watch: Agent runs tests
   - Watch: Agent fixes failures (if any)
   - Result: Working, tested code

**Key Message**: "Tests aren't just for humans—they're how AI knows it succeeded."

---

### Module 6: Copilot Agent Mode — Your AI Agent *(4h only: 15 min)*

**Purpose**: Orient attendees to the specific tool

**Content**:

1. **Why Copilot Agent Mode?** (5 min)
   - Built into VS Code, no extra extension
   - True agentic capabilities (not just chat)
   - File system access, terminal execution
   - Multiple agent types (Agent, Plan, Ask)
   - Custom agents and instruction files

2. **Key Features Tour** (10 min)
   - Agent Mode vs Plan Mode vs Ask Mode
   - Tool approval settings
   - Undo/redo system
   - MCP server integration
   - Custom agents (.agent.md)

**Note**: This is not a comprehensive Copilot tutorial—just enough to understand the demos.

---

### Module 7: Agentic Workflow in Action *(4h only: 35 min)*

**Purpose**: Full end-to-end demonstration

**Scenario**: Build something from scratch using agentic workflow

**Script**:

1. **Setup** (5 min)
   - Empty Git repository
   - Add copilot-instructions.md with project standards
   - Explain what we're building

2. **Initial Generation** (10 min)
   - Single natural language request
   - Watch agent:
     - Analyze empty repo
     - Create structure
     - Generate code
     - Create tests
     - Run tests
   - Highlight: No copy-paste, no manual file creation

3. **Adding Features** (10 min)
   - Request additional capability
   - Watch agent:
     - Read existing code for patterns
     - Extend consistently
     - Add tests for new feature
     - Verify all tests pass
   - Highlight: Pattern recognition, consistency

4. **Handling Errors** (5 min)
   - Intentionally cause a failure scenario
   - Watch agent:
     - Detect the issue
     - Propose fix
     - Implement and verify

5. **Review & Commit** (5 min)
   - Review git diff
   - Discuss what was created
   - Commit with meaningful message
   - Highlight: Full traceability

**Key Message**: "30 minutes of AI work, verified and ready for review."

---

### Module 8: Advanced Agent Capabilities *(4h only: 25 min)*

**Purpose**: Show the frontier of agentic coding

**Content**:

1. **MCP: Model Context Protocol** (10 min)
   - Extending agent capabilities with tools
   - Examples:
     - Database connections
     - API integrations  
     - Web scraping
     - File format conversions
   - **Demo**: Using an MCP tool

2. **Checkpoints & Rollback** (5 min)
   - Agent creates restore points
   - When things go wrong, go back
   - **Demo**: Break something, rollback

3. **Multi-File Refactoring** (5 min)
   - Agent understanding across files
   - Coordinated changes
   - **Demo**: Rename that affects multiple files

4. **The Future** (5 min)
   - Multi-agent collaboration
   - Longer autonomous sessions
   - Integration with CI/CD
   - Domain-specific agents

---

### Module 9: When to Use (and Not Use) Agentic AI *(4h only: 20 min)*

**Purpose**: Develop judgment about appropriate use

**Content**:

1. **Where Agentic Coding Excels** ✅ (7 min)
   - Boilerplate and scaffolding
   - Test generation
   - Documentation
   - Refactoring well-tested code
   - Learning new patterns
   - Repetitive modifications
   - Prototyping

2. **Agent Security & Boundaries** (5 min)
   - What can the agent do? Where are the limits?
   - How to restrict agent capabilities
   - Safeguards: tool approval, sandboxing, checkpoints
   - Organization policies for team-wide guardrails

3. **Where to Be Careful** ⚠️ (5 min)
   - Security-sensitive code
   - Complex business logic
   - Performance-critical paths
   - Code you don't understand
   - When you can't verify the result

3. **The Human Role** (3 min)
   - You're the architect, AI is the builder
   - **Know what you are doing** — understanding the code remains essential
   - Review everything before committing
   - Tests are your safety net
   - Don't trust, verify
   - Maintain understanding of your codebase

**Key Message**: "AI is a powerful tool. Like all powerful tools, it requires judgment."

---

### Module 10: Your Agentic Future *(1h: 5 min · 2h: 5 min · 4h: 15 min)*

**Purpose**: Inspire action and provide resources

**Content**:

1. **Start Small** (5 min)
   - Pick a low-risk task
   - Set up copilot-instructions.md
   - Try one agentic workflow
   - Build from there

2. **Resources** (5 min)
   - Copilot Agent Mode documentation
   - Community resources
   - Sample configurations
   - Further learning

3. **Q&A** (5 min)

---

### Module 11: Agentic Work Beyond Code *(optional; 2h: 15 min · 4h: 25 min)*

**Purpose**: Generalise the agentic-coding paradigm to non-coding knowledge work.

**When to include**: Audience contains system engineers, analysts, researchers, legal-ops, or mixed roles. Omit for pure developer audiences.

**Content**:

1. **The Universal Operating Model** (5–10 min)
   - Same loop (Observe → Plan → Act → Verify → Iterate) applied to runbooks, case files, correspondence.
   - Three reference projects that independently converged on the same pattern.
   - Markdown + Git + Memory Bank + PowerShell = the universal building blocks.

2. **The Memory Bank Pattern** (5 min)
   - The 6–7-file pattern (`projectbrief.md`, `activeContext.md`, `progress.md`, …).
   - Tool-neutral: same files work for Copilot, Claude Code, Cline.
   - Handout: `content/materials/memory-bank-template/`.

3. **Data Governance & Confidentiality** (5 min) *— mandatory for this module*
   - Copilot Enterprise vs. Business vs. Individual data handling.
   - Content exclusions, model routing, local alternatives.
   - What never belongs in a public-model prompt.

4. **Demo reference** (10 min, 4h only): `demo-corpus-analysis.md` — email corpus → timeline → contradiction detection → response letter.

**Key Message**: "Agentic coding is a special case of agentic knowledge work. The same rigour applies."

---

### Module 12: The Lab as the Agent's Sandbox *(optional; 2h: 15 min · 4h: 25 min)*

**Purpose**: Show how a reproducible lab turns the agent from a scripter into a trustworthy operator.

**When to include**: Audience contains system engineers, AD/Windows admins, or DevOps practitioners with infra responsibilities.

**Content**:

1. **Why Sysadmins Don't Let Agents Touch Prod** (3 min)
   - The operator's dilemma; the case for autonomy in an isolated sandbox.

2. **The Four Properties of a Good Agent Sandbox** (3 min)
   - Reversibility, reproducibility, observability, isolation.
   - Why AutomatedLab scores highly on all four for Windows infra.

3. **AutomatedLab Essentials** (5–10 min, 4h only)
   - Lab-as-code (`New-LabDefinition` / `Install-Lab`).
   - `Invoke-LabCommand` as the agent's first-class tool.
   - Snapshot-driven iteration.

4. **The Agent's Feedback Loop on Infrastructure** (5 min)
   - Mapping Observe/Plan/Act/Verify/Iterate to registry reads, event logs, snapshots.

5. **Demo reference** (10–15 min, 4h only): `demo-ops-kerberos-lab.md` — runbook → change script → lab execution → event verification → commit.

**Key Message**: "A lab is not a toy. It is the place where risk goes to get rehearsed."

---

## Demo Principles

### Every Demo Should Show:

1. **The Autonomous Nature** - AI acting, not just suggesting
2. **Context Awareness** - AI understanding the project
3. **Self-Verification** - AI running tests
4. **Traceability** - Seeing what changed via Git

### Demo DON'Ts:

- ❌ Don't focus on PowerShell syntax
- ❌ Don't explain Pester test structure
- ❌ Don't dive into module development patterns
- ❌ Don't troubleshoot PowerShell issues

### Demo DOs:

- ✅ Focus on what the AGENT is doing
- ✅ Highlight the autonomous behavior
- ✅ Show the observe-plan-act-verify loop
- ✅ Emphasize context utilization
- ✅ Demonstrate traceability

---

## Key Takeaways (For Every Attendee)

By the end of this session, every attendee should be able to answer:

1. **What is agentic coding?**
   > AI that autonomously executes multi-step coding tasks, using context to plan, act, verify, and iterate.

2. **Why does Git matter for AI?**
   > Git provides the context (structure, patterns, history) that enables intelligent AI behavior, plus traceability of what AI changed.

3. **How do I control AI behavior?**
   > Through instruction files (copilot-instructions.md) that define standards, requirements, and expectations.

4. **How can I trust AI-generated code?**
   > Through automated testing that lets AI verify its own work, plus human review of diffs.

5. **When should I use agentic coding?**
   > For well-defined tasks where you can verify results, especially boilerplate, tests, docs, and refactoring.

---

*Agenda Version: 3.0 | Three-Version Architecture (1h · 2h · 4h) | Created: 2026-02-02 | Updated: 2026-03-19*