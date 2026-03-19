# 4-Hour Agenda: "Full Workshop"

**Presenter**: [Your Name]
**Duration**: 4 hours (240 minutes)
**Format**: Full-day workshop, deep dive training
**Demo Context**: PowerShell (familiar to audience)
**Tool**: GitHub Copilot Agent Mode (VS Code)

---

## Core Message

> **This is NOT a PowerShell training. This is a training about a new paradigm of software development where AI agents autonomously execute multi-step coding tasks.**

PowerShell is simply the language we use for demos because you already know it. The concepts apply to any language.

---

## Agenda

### Part 1: Understanding the Paradigm (120 min)

| Time | Duration | Module | Content Reference | Focus |
|------|----------|--------|-------------------|-------|
| 0:00 | 10 min | **The AI Coding Revolution** | [Module 1](../../content/slides/01-ai-coding-revolution.md) | Why we're here |
| 0:10 | 30 min | **Agentic vs Traditional AI Assistance** | [Module 2](../../content/slides/02-what-is-agentic.md) | The paradigm shift |
| 0:40 | 25 min | **The Power of Context** | [Module 3](../../content/slides/03-power-of-context.md) | Git, structure, history |
| 1:05 | 10 min | :coffee: **Break** | | |
| 1:15 | 25 min | **Controlling AI Behavior** | [Module 4](../../content/slides/04-controlling-ai-behavior.md) | Instruction files deep dive |
| 1:40 | 20 min | **The Verification Loop** | [Module 5](../../content/slides/05-self-verification.md) | Testing as AI guardrail |
| 2:00 | 20 min | :fork_and_knife: **Lunch / Long Break** | | |

### Part 2: Applying Agentic Coding (120 min)

| Time | Duration | Module | Content Reference | Focus |
|------|----------|--------|-------------------|-------|
| 2:20 | 15 min | **Copilot Agent Mode: Your AI Agent** | (Agenda inline — see below) | Tool orientation |
| 2:35 | 35 min | **Live Session: Agentic Workflow in Action** | [Demo Script](../../content/demos/demo-script-main.md) | Full demonstration |
| 3:10 | 10 min | :coffee: **Break** | | |
| 3:20 | 25 min | **Advanced Agent Capabilities** | [Module 8](../../content/slides/08-advanced-capabilities.md) | MCP, modes, checkpoints |
| 3:45 | 20 min | **When to Use (and Not Use) Agentic AI** | [Module 9](../../content/slides/09-when-to-use.md) | Judgment & ethics |
| 4:05 | 15 min | **Your Agentic Future** | [Module 10](../../content/slides/10-your-agentic-future.md) | Next steps, resources |
| **4:20** | — | **End** | | |

> **Note**: Total content is 200 min + 40 min breaks = 240 min. There is a 20-minute buffer built into the 4:20 end time. Use this for extended Q&A, bonus demo content, or to absorb overflow from modules.

---

## Learning Outcomes

After this session, attendees will be able to:

- Explain what agentic coding is and articulate the paradigm shift
- Describe how Git provides context and traceability for AI agents
- Create and configure instruction files for consistent AI behavior
- Understand the self-verification loop and why testing is the AI guardrail
- Use GitHub Copilot Agent Mode for agentic workflows
- Explain MCP, checkpoints, and different agent types
- Make informed decisions about when to use agentic coding
- Start using agentic workflows in their own projects

---

## Module-by-Module Presenter Guide

### Module 1: The AI Coding Revolution (10 min)

**Slides to use**: All (1.1 through 1.4a)

**Presenter guidance**:
- Quick audience poll (Slide 1.2) — 2 minutes, interactive discussion
- Walk through the Three Waves evolution — 3 minutes
- Cover what changed (Slide 1.4) in detail — 3 minutes
- Include the token/cost slide (1.4a) — 2 minutes — this audience benefits from understanding the economics
- Key message: *"This isn't incremental improvement. This is a new way of working."*

**Transition**: *"Let me define exactly what makes coding 'agentic.'"*

---

### Module 2: What Makes Coding "Agentic"? (30 min)

**Slides to use**: All (2.0 through 2.5+)

**Presenter guidance**:
- Vocabulary (Slide 2.0): 5 minutes — walk through each term, take questions
- Defining Agent (Slide 2.1): 5 minutes — the 5 properties with examples
- Traditional vs Agentic (Slides 2.2-2.3): 7 minutes — deep comparison with narration
- The Agentic Loop (Slide 2.4): 5 minutes — full ASCII diagram walkthrough
- Quick comparison demo (5 min): Narrate or briefly demo the same task with traditional chat vs agent mode
- This is the most important conceptual module — don't rush it
- Key message: *"Agents don't just suggest — they act. You become the reviewer, not the typist."*

**Transition**: *"An agent's power depends on understanding. Context is everything."*

---

### Module 3: The Power of Context (25 min)

**Slides to use**: All (3.1 through 3.5+)

**Presenter guidance**:
- Context Problem (Slide 3.1): 3 minutes — without/with comparison
- Git as Context (Slide 3.2): 5 minutes — the four sources diagram
- What Agent Observes (Slide 3.3): 5 minutes — walk through project structure example
- Pattern Recognition (Slide 3.4): 5 minutes — show how AI learns from existing code
- Traceability (Slide 3.5): 5 minutes — Git diff, checkpoints, commit history
- Best Practices: 2 minutes — always Git, meaningful structure, good READMEs
- Key message: *"Git isn't just version control — it's how you give AI a brain."*

**Transition**: *"Context makes AI aware. Instruction files make it consistent."*

---

### Module 4: Controlling AI Behavior (25 min)

**Slides to use**: All (4.1 through 4.12)

**Presenter guidance**:
- Consistency Problem (Slide 4.1): 3 minutes — same prompt, different results
- The Solution (Slide 4.2): 3 minutes — instruction file effect diagram
- File Types (Slide 4.3): 3 minutes — overview of all 5 types
- Anatomy (Slide 4.4): 3 minutes — walk through real copilot-instructions.md
- Rule Categories (Slide 4.5): 2 minutes — what you can control
- Before/After (Slide 4.6): 3 minutes — dramatic quality difference
- Hierarchy (Slide 4.7): 2 minutes — priority order
- Custom Agents (Slides 4.8-4.9): 3 minutes — show two .agent.md examples
- Skills (Slide 4.10): 1 minute — on-demand domain knowledge
- Prompts (Slide 4.11): 1 minute — reusable slash commands
- Handoffs (Slide 4.12): 1 minute — agent-to-agent delegation
- Key message: *"Instruction files teach AI your rules once. Custom agents give it specialized behaviors."*

**Transition**: *"The AI knows your project and follows your rules. But how do you know the code works?"*

---

### Module 5: The Verification Loop (20 min)

**Slides to use**: All (5.1 through 5.7)

**Presenter guidance**:
- Trust Problem (Slide 5.1): 2 minutes — honest assessment
- Verification Loop (Slide 5.2): 5 minutes — full diagram walkthrough
- Why This Matters (Slide 5.3): 3 minutes — "I think" vs "I proved"
- What Gets Tested (Slide 5.4): 2 minutes — test coverage table
- Iteration Example (Slide 5.5): 3 minutes — self-correction walkthrough
- Testing Instructions (Slide 5.6): 2 minutes — copilot-instructions.md section
- Test-First (Slide 5.7): 3 minutes — alternative approach with AI
- Key message: *"Tests transform 'I think it works' into 'I proved it works.'"*

**Transition**: *"Now let me orient you to the tool we'll use, then I'll show you everything working together."*

---

### Module 6: Copilot Agent Mode — Your AI Agent (15 min)

> This module has no separate slide file. Present from this agenda directly.

**Content**:

1. **Why Copilot Agent Mode?** (5 min)
   - Built into VS Code, no extra extension needed
   - True agentic capabilities (not just chat)
   - File system access, terminal execution
   - Multiple agent types (Agent, Plan, Ask, Background, Cloud)
   - Custom agents and instruction files

2. **Key Features Tour** (10 min)
   - Agent Mode vs Plan Mode vs Ask Mode
   - Tool approval settings (Ask always / Auto)
   - Undo/redo checkpoints
   - MCP server integration
   - Custom agents (.agent.md) — show the dropdown
   - Background and cloud agents — brief mention
   - `/init` command for auto-generating instructions

**Transition**: *"Now let me show you all of this in action with a real project build."*

---

### Module 7: Agentic Workflow in Action — Live Build (35 min)

**Reference**: [Demo Script](../../content/demos/demo-script-main.md) — All 6 parts

**Presenter guidance**:
- **Part 1 — Setup** (3-5 min): Empty repo + copilot-instructions.md
- **Part 2 — Initial Creation** (7-10 min): Full module creation from single prompt
- **Part 3 — Adding a Feature** (5-7 min): Pattern recognition and consistency
- **Part 4 — Traceability** (3-5 min): Git status/diff walkthrough
- **Part 5 — Commit** (1-2 min): Meaningful commit message
- **Part 6 — Bonus** (5-7 min): Skills, prompts, cross-machine sync

**Key themes to reinforce throughout**:
- Autonomous execution — *"I described what I wanted. The AI handled the how."*
- Context awareness — *"It learned my patterns from the instruction file and existing code."*
- Self-verification — *"It tested its own work and fixed issues before I even saw them."*
- Traceability — *"Git shows me exactly what changed. No mystery."*

**If demo fails**: Have pre-built project ready. Show pre-recorded video. Use screenshots.

---

### Module 8: Advanced Agent Capabilities (25 min)

**Slides to use**: All (8.1 through 8.12)

**Presenter guidance**:
- MCP concept (Slides 8.1-8.3): 5 minutes — what it is, architecture diagram
- MCP in VS Code (Slides 8.4-8.5): 3 minutes — configuration, use cases
- MCP Security (Slide 8.6): 2 minutes — trust model, safeguards
- Checkpoints (Slides 8.7-8.8): 5 minutes — rollback demonstration
- Multi-File Operations (Slide 8.9): 3 minutes — coordinated changes
- Agent Types (Slides 8.10-8.11): 5 minutes — local, background, cloud, third-party
- Future (Slide 8.12): 2 minutes — what's coming next
- Key message: *"These capabilities turn a smart coding assistant into a full development workflow engine."*

**Transition**: *"With all this power, judgment becomes critical. When should you use agentic coding?"*

---

### Module 9: When to Use (and Not Use) Agentic AI (20 min)

**Slides to use**: All (9.1 through 9.8b)

**Presenter guidance**:
- Judgment Question (Slide 9.1): 1 minute — framing
- Where It Excels (Slides 9.2-9.5): 7 minutes — boilerplate, tests, docs, refactoring
- Where to Be Careful (Slides 9.6-9.8): 5 minutes — business logic, security, performance
- Agent Security (Slide 9.8a): 3 minutes — boundaries, restrictions, safeguards
- Guiding Principle (Slide 9.8b): 2 minutes — "Know what you are doing"
- Human Role: 2 minutes — architect, reviewer, judge, owner
- Key message: *"AI is a powerful tool. Like all powerful tools, it requires judgment."*

**Transition**: *"Let me help you get started on your own agentic journey."*

---

### Module 10: Your Agentic Future (15 min)

**Slides to use**: All (10.1 through 10.5a)

**Presenter guidance**:
- Recap (Slide 10.1): 2 minutes — 5 key concepts
- Five Questions (Slide 10.2): 2 minutes — self-check
- Getting Started (Slide 10.3): 3 minutes — Week 1, 2, 3 progression
- First Tasks (Slide 10.4): 2 minutes — easy wins
- Building copilot-instructions.md (Slide 10.5): 2 minutes — version 1 → 2 progression
- Cross-Machine Sync (Slide 10.5a): 2 minutes — OneDrive pattern
- Close with: *"Start small. Build confidence. Transform your workflow."*
- Final Q&A: remaining time

---

## Timing Discipline

### Time Checkpoints

| Clock | You Should Be Starting | If Behind |
|-------|----------------------|-----------|
| 0:10 | Module 2 | Cut poll discussion short |
| 0:40 | Module 3 | Cut Module 2 demo narration |
| 1:05 | Break | Shorten traceability to 2 minutes |
| 1:15 | Module 4 | — |
| 1:40 | Module 5 | Skip skills/prompts/handoffs slides |
| 2:00 | Lunch Break | Cut test-first slide |
| 2:20 | Module 6 | — |
| 2:35 | Live Build | Cut Module 6 features tour to 5 minutes |
| 3:10 | Break | Skip bonus demo (Part 6) |
| 3:20 | Module 8 | — |
| 3:45 | Module 9 | Skip multi-file operations |
| 4:05 | Module 10 | Cut security slide to 1 minute |

### If Running Short on Time
- Module 6: Cut to 8 minutes — just name the modes, jump to demo
- Module 7: Cut Part 6 (bonus) and Part 4 (traceability) — saves 10 minutes
- Module 8: Cut multi-file operations and future slides — saves 5 minutes
- Module 9: Skip security deep-dive — saves 3 minutes
- Module 10: Cut cross-machine sync — saves 2 minutes

---

## Materials to Distribute

| Material | When to Share |
|----------|--------------|
| [Cheat Sheet](../../content/materials/cheat-sheet.md) | At the start — reference during session |
| [Sample copilot-instructions.md](../../content/materials/sample-copilot-instructions/copilot-instructions.md) | At the start — follow along |
| [Sample agents & skills](../../content/materials/sample-copilot-instructions/) | After Module 4 or at end |
| [MARP slides](../../content/pptx/agentic-coding-presentation.md) | At the end — take-home |

---

*Agenda Version: 1.0 | 4-Hour Format | Created: 2026-03-11*
