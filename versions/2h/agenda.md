# 2-Hour Agenda: "Core Concepts + Demo"

**Presenter**: [Your Name]
**Duration**: 2 hours (120 minutes)
**Format**: Half-day session, meetup, team introduction
**Demo Context**: PowerShell (familiar to audience)
**Tool**: GitHub Copilot Agent Mode (VS Code)

---

## Core Message

> **This is NOT a PowerShell training. This is a training about a new paradigm of software development where AI agents autonomously execute multi-step coding tasks.**

PowerShell is simply the language we use for demos because you already know it. The concepts apply to any language.

---

## Agenda

| Time | Duration | Module | Content Reference | Focus |
|------|----------|--------|-------------------|-------|
| 0:00 | 10 min | **The AI Coding Revolution** | [Module 1](../../content/slides/01-ai-coding-revolution.md) | Setting the stage |
| 0:10 | 25 min | **What Makes Coding "Agentic"?** | [Module 2](../../content/slides/02-what-is-agentic.md) | Core paradigm |
| 0:35 | 20 min | **Context: Why Git Changes Everything** | [Module 3](../../content/slides/03-power-of-context.md) | Foundation concept |
| 0:55 | 10 min | :coffee: **Break** | | |
| 1:05 | 20 min | **Controlling the Agent: Instruction Files** | [Module 4](../../content/slides/04-controlling-ai-behavior.md) | Configuration |
| 1:25 | 20 min | **Trust but Verify: Automated Testing** | [Module 5](../../content/slides/05-self-verification.md) | Self-verification |
| 1:45 | 15 min | **Live Demo: See It All Together** | [Demo Script](../../content/demos/demo-script-main.md) | Synthesis |
| **2:00** | — | **End** | | |

> **Note**: The wrap-up (key takeaways, getting started, Q&A) is woven into the final demo and its conclusion. Use Module 10 Slide 10.1 (Recap) and 10.3 (Getting Started) as closing slides after the demo.

---

## Learning Outcomes

After this session, attendees will understand:

- What agentic coding is and why it's different from traditional AI assistance
- How repository context enables intelligent AI behavior
- How to configure AI behavior with instruction files
- Why automated testing is critical for AI workflows
- How to maintain traceability and control
- Where to start with agentic coding

---

## Module-by-Module Presenter Guide

### Module 1: The AI Coding Revolution (10 min)

**Slides to use**: 1.1 (Title), 1.2 (Poll), 1.3 (The Three Waves), 1.4 (Why Now)

**Slides to skip**: 1.4a (Tokens & Cost — save for advanced discussions or mention briefly)

**Presenter guidance**:
- Quick audience poll (Slide 1.2) — 2 minutes, show of hands
- Walk through the Three Waves evolution — 3 minutes
- Highlight what changed in 2024-2025 — 3 minutes
- Optionally mention token/cost in one sentence: *"Bigger context windows and cheaper API costs make longer agentic loops economically viable."*
- Key message: *"This isn't incremental improvement. This is a new way of working."*

**Transition**: *"Let me define exactly what makes coding 'agentic.'"*

---

### Module 2: What Makes Coding "Agentic"? (25 min)

**Slides to use**: 2.0 (Vocabulary), 2.1 (Defining Agent), 2.2 (Traditional AI), 2.3 (Agentic AI), 2.4 (The Agentic Loop)

**Slides to skip**: None — use all slides, but don't linger on vocabulary

**Presenter guidance**:
- Vocabulary (Slide 2.0): 5 minutes — walk through the table, ensure everyone knows the terms
- Defining Agent (Slide 2.1): 3 minutes — the 5 properties
- Traditional vs Agentic (Slides 2.2-2.3): 7 minutes — this is the core comparison, spend time here
- The Agentic Loop (Slide 2.4): 5 minutes — show the full ASCII diagram
- If time permits, narrate a quick "traditional vs agentic" scenario (don't demo yet)
- Key message: *"Agents don't just suggest — they act. You become the reviewer, not the typist."*

**Transition**: *"An agent's power depends on what it understands. Let's talk about context."*

---

### Module 3: The Power of Context (20 min)

**Slides to use**: 3.1 (Context Problem), 3.2 (Git as Context), 3.3 (What Agent Observes), 3.4 (Pattern Recognition), 3.5 (Traceability)

**Slides to skip**: None — use all slides

**Presenter guidance**:
- Context Problem (Slide 3.1): 3 minutes — without/with comparison
- Git as Context (Slide 3.2): 5 minutes — the four sources diagram
- What Agent Observes (Slide 3.3): 5 minutes — project structure example
- Pattern Recognition (Slide 3.4): 3 minutes — how AI learns from code
- Traceability (Slide 3.5): 4 minutes — Git diff, checkpoints, commit history
- Key message: *"Git isn't just version control — it's how you give AI a brain."*

**Transition**: *"Context makes AI aware. Instruction files make it consistent."*

---

### Module 4: Controlling AI Behavior (20 min)

**Slides to use**: 4.1 (Consistency Problem), 4.2 (The Solution), 4.3 (File Types), 4.4 (Anatomy), 4.6 (Before/After), 4.8 (Custom Agents — brief)

**Slides to skip**: 4.5 (Rule categories), 4.7 (Hierarchy — mention verbally), 4.9+ (Advanced agents, skills, prompts, handoffs)

**Presenter guidance**:
- Consistency Problem (Slide 4.1): 3 minutes — same prompt, different results
- The Solution (Slide 4.2): 3 minutes — instruction file effect diagram
- File Types (Slide 4.3): 3 minutes — quick overview of the 5 types
- Anatomy (Slide 4.4): 5 minutes — walk through a real copilot-instructions.md
- Before/After (Slide 4.6): 3 minutes — dramatic code quality difference
- Custom Agents (Slide 4.8): 3 minutes — briefly show one .agent.md example
- Mention skills and prompts in one sentence each
- Key message: *"Instruction files teach AI your rules once. They apply to every request automatically."*

**Transition**: *"The AI knows your project and follows your rules. But how do you know the code works?"*

---

### Module 5: Trust but Verify (20 min)

**Slides to use**: 5.1 (Trust Problem), 5.2 (Verification Loop), 5.3 (Why This Matters), 5.4 (What Gets Tested), 5.5 (Iteration Example), 5.6 (copilot-instructions.md testing section)

**Slides to skip**: 5.7 (Test-first approach — mention briefly)

**Presenter guidance**:
- Trust Problem (Slide 5.1): 3 minutes — honest assessment of AI-generated code
- Verification Loop (Slide 5.2): 5 minutes — walk through the full diagram
- Why This Matters (Slide 5.3): 3 minutes — "I think" vs "I proved"
- What Gets Tested (Slide 5.4): 3 minutes — test coverage table
- Iteration Example (Slide 5.5): 3 minutes — show self-correction in action
- Testing Instructions (Slide 5.6): 3 minutes — how to enable this in copilot-instructions.md
- Key message: *"Tests transform 'I think it works' into 'I proved it works.'"*

**Transition**: *"Let me show you all of this working together live."*

---

### Synthesis Demo (15 min)

**Reference**: [Demo Script](../../content/demos/demo-script-main.md) — Parts 1-3

**Presenter guidance**:
- Use Demo Parts 1-3 (Setup, Initial Creation, Adding a Feature)
- Skip Demo Parts 4-6 (Traceability, Commit, Bonus)
- **Setup** (2 min): Show the empty repo + copilot-instructions.md
- **Initial Creation** (7 min): Single prompt → watch full agentic loop
- **Adding a Feature** (4 min): Show context awareness and pattern matching
- **Wrap-up** (2 min): Show git status, highlight key messages
- Close with Module 10 Slides 10.1 (Recap) and 10.3 (Getting Started — Week 1)
- Final 2 minutes: Q&A and resource sharing

**Key messages to hit**:
- *"I described what I wanted. The AI handled the how."*
- *"It learned my patterns from the instruction file and existing code."*
- *"It tested its own work and fixed issues before I even saw them."*
- *"Git shows me exactly what changed. No mystery."*

---

## Timing Discipline

### Time Checkpoints

| Clock | You Should Be Starting | If Behind |
|-------|----------------------|-----------|
| 0:10 | Module 2 | Cut poll to quick show-of-hands |
| 0:35 | Module 3 | Shorten vocabulary to 3 minutes |
| 0:55 | Break | Skip pattern recognition slide |
| 1:05 | Module 4 | — |
| 1:25 | Module 5 | Skip custom agents section |
| 1:45 | Demo | Cut demo intro to 1 minute |
| 1:55 | Wrap-up Q&A | Keep demo to core loop only |

### If Running Short on Time
- Module 4: Skip before/after code comparison — just describe the effect
- Module 5: Skip "what gets tested" table — jump to iteration example
- Demo: Show only one agentic loop cycle (skip "adding a feature")

---

## Materials to Distribute

| Material | When to Share |
|----------|--------------|
| [Cheat Sheet](../../content/materials/cheat-sheet.md) | At the start — reference during session |
| [Sample copilot-instructions.md](../../content/materials/sample-copilot-instructions/copilot-instructions.md) | At the end — take-home |
| [Sample agents & skills](../../content/materials/sample-copilot-instructions/) | At the end — take-home |

---

*Agenda Version: 1.0 | 2-Hour Format | Created: 2026-03-11*
