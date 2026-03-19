# 1-Hour Agenda: "The Paradigm Shift"

**Presenter**: [Your Name]
**Duration**: 60 minutes (no break)
**Format**: Conference talk / overview presentation
**Demo Context**: PowerShell (familiar to audience)
**Tool**: GitHub Copilot Agent Mode (VS Code)

---

## Core Message

> **This is NOT a PowerShell training. This is an introduction to a new paradigm of software development where AI agents autonomously execute multi-step coding tasks.**

PowerShell is simply the language we use for the brief demo because you already know it. The concepts apply to any language.

---

## Agenda

| Time | Duration | Module | Content Reference | Focus |
|------|----------|--------|-------------------|-------|
| 0:00 | 5 min | **The AI Coding Revolution** | [Module 1](../../content/slides/01-ai-coding-revolution.md) | Setting the stage |
| 0:05 | 15 min | **What Makes Coding "Agentic"?** | [Module 2](../../content/slides/02-what-is-agentic.md) | Core paradigm |
| 0:20 | 10 min | **Context: Why Git Changes Everything** | [Module 3](../../content/slides/03-power-of-context.md) | Foundation concept |
| 0:30 | 10 min | **Controlling the Agent** | [Module 4](../../content/slides/04-controlling-ai-behavior.md) | Instruction files |
| 0:40 | 10 min | **Trust but Verify** | [Module 5](../../content/slides/05-self-verification.md) | Self-verification |
| 0:50 | 5 min | **Quick Demo** | [Demo Script](../../content/demos/demo-script-main.md) | See it in action |
| 0:55 | 5 min | **Your Agentic Future** | [Module 10](../../content/slides/10-your-agentic-future.md) | Next steps & Q&A |
| **1:00** | — | **End** | | |

---

## Learning Outcomes

After this session, attendees will understand:

- What agentic coding is and how it differs from traditional AI assistance
- Why repository context (Git) is foundational for intelligent AI behavior
- How instruction files control AI behavior and ensure consistency
- Why automated testing is critical as an AI guardrail
- Where to start with agentic coding in their own workflow

---

## Module-by-Module Presenter Guide

### Module 1: The AI Coding Revolution (5 min)

**Slides to use**: 1.1 (Title), 1.3 (The Three Waves)

**Slides to skip**: 1.2 (Poll — no time), 1.4 (Why Now — condense into one sentence), 1.4a (Tokens & Cost — skip entirely)

**Presenter guidance**:
- Open with the title and immediately show the Three Waves diagram
- Spend 1 minute on each wave: autocomplete, chat, agentic
- Land the key message: *"This isn't incremental improvement. This is a new way of working."*
- Skip the audience poll — in 1 hour there's no time for interactive elements
- Don't get into model details or token economics — that's for the 4-hour version

**Transition**: *"So what exactly makes coding 'agentic'? Let me define that clearly."*

---

### Module 2: What Makes Coding "Agentic"? (15 min)

**Slides to use**: 2.0 (Vocabulary — quick overview), 2.1 (Defining Agent), 2.2 (Traditional AI), 2.3 (Agentic AI), 2.4 (The Agentic Loop)

**Slides to skip**: Detailed agentic loop ASCII diagram (show the simplified version only)

**Presenter guidance**:
- Spend 2 minutes max on vocabulary (Slide 2.0) — just name the terms, don't explain each
- The critical comparison is Slides 2.2 vs 2.3 — spend 5 minutes here
- Show the Agentic Loop (Observe → Plan → Act → Verify → Iterate) as a simple flow
- Do NOT do the "Traditional vs Agentic" live demo — just describe the difference
- Key message: *"Agents don't just suggest — they act. You become the reviewer, not the typist."*

**Transition**: *"But an agent is only as good as its understanding. Let's talk about context."*

---

### Module 3: The Power of Context (10 min)

**Slides to use**: 3.1 (The Context Problem), 3.2 (Git as Context Provider), 3.3 (What the Agent Observes)

**Slides to skip**: 3.4 (Pattern Recognition), 3.5+ (Traceability deep-dive)

**Presenter guidance**:
- Start with the "without context / with context" comparison (Slide 3.1) — 2 minutes
- Show the Git-as-context diagram (Slide 3.2) — 3 minutes
- Briefly show the project structure example (Slide 3.3) — 3 minutes
- Mention traceability in one sentence: *"Git also gives you full traceability — you can see every change the AI made via git diff."*
- Key message: *"Git isn't just version control — it's how you give AI a brain."*

**Transition**: *"Context makes AI aware. But how do you make it consistent? That's where instruction files come in."*

---

### Module 4: Controlling AI Behavior (10 min)

**Slides to use**: 4.1 (Consistency Problem), 4.2 (The Solution), 4.3 (File Types — quick overview)

**Slides to skip**: 4.4 (Full anatomy), 4.5 (Rule categories), 4.6 (Before/After code), 4.7 (Hierarchy), 4.8+ (Custom agents, skills, prompts)

**Presenter guidance**:
- Show the "same prompt, different results" problem (Slide 4.1) — 2 minutes
- Explain instruction files as the solution (Slide 4.2) — 3 minutes
- Quick overview of the 5 file types (Slide 4.3) — 2 minutes
- Mention custom agents in one sentence: *"You can also create specialized agents — a security reviewer, a test writer, a documentation agent."*
- Don't show code examples — refer to the cheat sheet handout
- Key message: *"Instruction files teach AI your rules once. They apply to every request automatically."*

**Transition**: *"Now the AI knows your project and follows your rules. But how do you know the code actually works?"*

---

### Module 5: Trust but Verify (10 min)

**Slides to use**: 5.1 (The Trust Problem), 5.2 (Verification Loop), 5.3 (Why This Matters), 5.5 (Iteration Example)

**Slides to skip**: 5.4 (Coverage details), 5.6 (copilot-instructions.md testing section), 5.7 (Test-first approach)

**Presenter guidance**:
- Open with the honest question: *"Can you trust AI-generated code? Not blindly. But you can verify it."*
- Show the self-verification loop diagram (Slide 5.2) — 3 minutes
- Show the "without tests / with tests" comparison (Slide 5.3) — 2 minutes
- Walk through the iteration example (Slide 5.5) — 3 minutes
- Key message: *"Tests transform 'I think it works' into 'I proved it works.'"*

**Transition**: *"Let me show you all of this working together in a quick demo."*

---

### Quick Demo (5 min)

**Reference**: [Demo Script](../../content/demos/demo-script-main.md) — Parts 1-2 only

**Presenter guidance**:
- This is a **pre-recorded or highly rehearsed** 5-minute showcase
- If live: Use a pre-prepared repository, not an empty one
- Show ONE cycle of the agentic loop:
  1. Give a natural language request
  2. Watch agent read context, plan, write code
  3. Watch agent create tests
  4. Watch agent run tests
  5. Point out the Git diff briefly
- Do NOT attempt multi-feature demos or error recovery in 5 minutes
- If using a recording: narrate over it, pausing at key moments
- Fallback: Show a series of **screenshots** with narration if live demo risks timing

**Key messages to hit**:
- *"I described what I wanted. The AI handled the how."*
- *"It tested its own work before telling me it was done."*
- *"I can see exactly what changed in the Git diff."*

---

### Module 10: Your Agentic Future (5 min)

**Slides to use**: 10.1 (Recap — 5 key concepts), 10.2 (Five Questions), 10.3 (Getting Started — Week 1 only)

**Slides to skip**: 10.4 (First task suggestions), 10.5 (Building copilot-instructions.md), 10.5a (Cross-machine sync)

**Presenter guidance**:
- Recap the 5 key concepts in 1 minute (Slide 10.1)
- Show the 5 questions as a self-check (Slide 10.2) — 1 minute
- Focus on Week 1 getting started (Slide 10.3) — 1 minute
- Close with: *"Start small. Build confidence. Transform your workflow."*
- Leave 1-2 minutes for quick questions
- Direct people to the cheat sheet and sample files for hands-on follow-up

---

## Timing Discipline

> **In a 1-hour session, every minute counts. If you're running 2+ minutes over on any module, cut to the key message and move on.**

### Time Checkpoints

| Clock | You Should Be Starting | If Behind |
|-------|----------------------|-----------|
| 0:05 | Module 2 | Skip the poll entirely |
| 0:20 | Module 3 | Condense Module 2 vocabulary to 1 slide |
| 0:30 | Module 4 | Skip pattern recognition slide in Module 3 |
| 0:40 | Module 5 | Show only 1 instruction file example |
| 0:50 | Quick Demo | Skip iteration example in Module 5 |
| 0:55 | Wrap-up | Cut demo to 3 minutes |

---

## Materials to Distribute

| Material | When to Share |
|----------|--------------|
| [Cheat Sheet](../../content/materials/cheat-sheet.md) | At the start — reference during session |
| [Sample copilot-instructions.md](../../content/materials/sample-copilot-instructions/copilot-instructions.md) | At the end — take-home |
| [Sample agents](../../content/materials/sample-copilot-instructions/) | At the end — take-home |

---

*Agenda Version: 1.0 | 1-Hour Format | Created: 2026-03-11*
