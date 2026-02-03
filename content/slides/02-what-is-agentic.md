# Module 2: What Makes Coding "Agentic"?

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
├── 📄 .clinerules          ← "My instructions"
├── 📄 README.md            ← "Project purpose"
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

---

## Slide 2.11: Demo Time

# Let's See It in Action

## Demo: Traditional vs Agentic

### Traditional (Copilot-style):
1. Type function name
2. Accept autocomplete
3. Copy test from chat
4. Paste into file
5. Run tests manually
6. Fix failures manually

### Agentic (Cline):
1. Describe what you want
2. Watch agent work
3. Review the result

**Same task. Different experience.**

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

---

## Speaker Notes - Module 2

### Timing: 25-30 minutes (including demo)

### Key Points to Emphasize:
1. The **loop** is the core concept: Observe → Plan → Act → Verify → Iterate
2. Self-verification is what makes this **trustworthy**
3. The role shift: You're now the architect and reviewer

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