# Agentic Coding: The Future of AI-Assisted Development

## Presentation Agenda

**Presenter**: [Your Name]
**Duration**: 2-4 hours (flexible format)
**Primary Focus**: Agentic Coding Concepts & Practices
**Demo Context**: PowerShell (familiar to audience)
**Tool**: GitHub Copilot Agent Mode (VS Code)

---

## Core Message

> **This is NOT a PowerShell training. This is a training about a new paradigm of software development where AI agents autonomously execute multi-step coding tasks.**

PowerShell is simply the language we use for demos because you already know it. The concepts apply to any language.

---

## Quick Navigation

- [2-Hour Core Agenda](#2-hour-core-agenda) - Essential agentic coding concepts
- [4-Hour Extended Agenda](#4-hour-extended-agenda) - Deep dive with hands-on practice
- [Module Descriptions](#module-descriptions) - Detailed content
- [Key Concepts](#key-concepts-to-convey) - Core learning objectives

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

## 2-Hour Core Agenda

*Focus: Understanding the agentic coding paradigm*

| Time | Duration | Module | Focus |
|------|----------|--------|-------|
| 0:00 | 10 min | **The AI Coding Revolution** | Setting the stage |
| 0:10 | 25 min | **What Makes Coding "Agentic"?** | Core paradigm |
| 0:35 | 20 min | **Context: Why Git Changes Everything** | Foundation concept |
| 0:55 | 10 min | ☕ **Break** | - |
| 1:05 | 20 min | **Controlling the Agent: Instruction Files** | Configuration |
| 1:25 | 20 min | **Trust but Verify: Automated Testing** | Self-verification |
| 1:45 | 15 min | **Live Demo: See It All Together** | Synthesis |
| **2:00** | - | **End** | - |

### 2-Hour Learning Outcomes

After 2 hours, attendees will understand:
- ✅ What agentic coding is and why it's different
- ✅ How repository context enables intelligent AI behavior
- ✅ How to configure AI behavior with instruction files
- ✅ Why automated testing is critical for AI workflows
- ✅ How to maintain traceability and control

---

## 4-Hour Extended Agenda

*Focus: Understanding + Hands-on experience with agentic workflows*

### Part 1: Understanding the Paradigm (90 min)

| Time | Duration | Module | Focus |
|------|----------|--------|-------|
| 0:00 | 10 min | **The AI Coding Revolution** | Why we're here |
| 0:10 | 30 min | **Agentic vs Traditional AI Assistance** | The paradigm shift |
| 0:40 | 25 min | **The Power of Context** | Git, structure, history |
| 1:05 | 10 min | ☕ **Break** | - |
| 1:15 | 25 min | **Controlling AI Behavior** | Instruction files deep dive |
| 1:40 | 20 min | **The Verification Loop** | Testing as AI guardrail |
| 2:00 | - | 🍽️ **Lunch/Long Break** | - |

### Part 2: Applying Agentic Coding (90 min)

| Time | Duration | Module | Focus |
|------|----------|--------|-------|
| 2:00 | 15 min | **Copilot Agent Mode: Your AI Agent** | Tool orientation |
| 2:15 | 35 min | **Live Session: Agentic Workflow in Action** | Full demonstration |
| 2:50 | 10 min | ☕ **Break** | - |
| 3:00 | 25 min | **Advanced Agent Capabilities** | MCP, modes, checkpoints |
| 3:25 | 20 min | **When to Use (and Not Use) Agentic AI** | Judgment & ethics |
| 3:45 | 15 min | **Your Agentic Future** | Next steps, resources |
| **4:00** | - | **End** | - |

---

## Module Descriptions

### Module 1: The AI Coding Revolution (10 min)

**Purpose**: Establish why this matters NOW

**Content**:
- The evolution: Autocomplete → Chat → Agents
- What changed in 2024-2025 that made this possible
- Real productivity gains observed in industry
- Why PowerShell developers should care

**Key Message**: "This isn't incremental improvement. This is a new way of working."

---

### Module 2: What Makes Coding "Agentic"? (25-30 min)

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

### Module 3: The Power of Context (20-25 min)

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

### Module 4: Controlling AI Behavior (20-25 min)

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

**Key Message**: "Instruction files are how you train your AI to work YOUR way."

---

### Module 5: The Verification Loop (20-25 min)

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

### Module 6: Copilot Agent Mode - Your AI Agent (15 min) *[Extended only]*

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

### Module 7: Agentic Workflow in Action (35 min) *[Extended only]*

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

### Module 8: Advanced Agent Capabilities (25 min) *[Extended only]*

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

### Module 9: When to Use (and Not Use) Agentic AI (20 min)

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

### Module 10: Your Agentic Future (15 min)

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

*Agenda Version: 2.0 | Refocused on Agentic Coding | Created: 2026-02-02*