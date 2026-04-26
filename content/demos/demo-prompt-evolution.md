# Demo Script: Prompt Evolution — From Minimal to Mastery

## Overview

This demo shows **the same task** expressed through **six increasingly effective prompts**. Each prompt builds on the previous one by adding more context, scope, and leverage of available resources (instructions, skills, agents, memory bank). The progression demonstrates how prompt quality directly impacts output quality, completeness, and cost efficiency.

Use this demo for:

- Module 4 deep dive (Controlling AI Behavior) — illustrating why context matters in prompts
- Module 5 reinforcement (Self-Verification) — showing how prompts can request autonomous testing
- The 4-hour extended session as a standalone exercise or facilitator-driven walkthrough
- A take-home reference for attendees to practice prompt evolution on their own

> **Cross-reference**: For the main end-to-end build demo, see [demo-script-main.md](demo-script-main.md).

---

## The Task (Constant Across All Levels)

> Create a PowerShell function that gets two files and returns the difference in file size.

This is intentionally simple — the point is NOT what the function does, but how the prompt shapes the AI's behavior and output scope.

---

## The Prompt Evolution

### Level 1: Bare Minimum — "Just Do It"

```text
I need a powershell function that gets two files and returns the difference in file
size. store this in v1.ps1.

Then tell me how many tokens you used and how much it costs when using Anthropic
Opus 4.7 1M.
```

#### What the AI Does

- Writes a single function to a single file
- No tests, no documentation, no module structure
- May or may not follow PowerShell best practices (depends on model defaults)
- May not use `[CmdletBinding()]`, proper parameter validation, or comment-based help

#### Presenter Talking Points

> "This is what most people start with. A direct instruction with no context.
> The AI produces *something* — but it doesn't know your standards, your team's
> patterns, or your project's structure. You'll get a function, but probably not
> the function you actually want in production."

> "Notice how it stores the result in `v1.ps1` — a flat script file, not a module.
> No tests. No error handling (or generic error handling). No documentation.
> You'd have to review and rewrite significant parts."

#### Expected Output Characteristics

| Aspect | Likely Result |
|--------|--------------|
| Function structure | Basic `param()`, maybe no `[CmdletBinding()]` |
| Parameter validation | Minimal or none |
| Error handling | None or generic |
| Tests | ❌ None |
| Documentation | ❌ None |
| Module structure | ❌ None |
| Follows project rules | ❌ No awareness of `.instructions.md` or skills |
| Cost awareness | ✅ Reports token count (prompt asks for it) |

---

### Level 2: Context Awareness — "Remember Your Training"

```text
I need a powershell function that gets two files and returns the difference in file
size. store this in v1.ps1. please don't miss instructions and skills telling you
how to do this.

Then tell me how many tokens you used and how much it costs when using Anthropic
Opus 4.7 1M.
```

#### What Changes

The single added sentence — *"please don't miss instructions and skills telling you how to do this"* — nudges the AI to:

- **Check for `.instructions.md` files** in the workspace and apply their rules
- **Load relevant skills** (e.g., `sampler-framework`, `pester-patterns`) if their descriptions match
- Follow coding standards defined in `powershell.instructions.md` (e.g., `[CmdletBinding()]`, approved verbs, parameter validation)

#### Presenter Talking Points

> "One sentence changed. Same task. But now the AI actively looks for instructions
> and skills before writing code. If you have a `powershell.instructions.md` that
> says 'always use `[CmdletBinding()]`', it will follow it."

> "This is the cheapest improvement you can make — just reminding the AI to
> use the resources you've already configured. Think of it as the difference
> between giving someone a task and saying 'BTW, check the style guide first.'"

#### Expected Output Delta vs Level 1

| Aspect | Improvement |
|--------|------------|
| Function structure | ✅ `[CmdletBinding()]`, proper `param()` block |
| Parameter validation | ✅ `[Parameter(Mandatory)]`, `[ValidateNotNullOrEmpty()]` |
| Error handling | ✅ `try/catch` if instructions require it |
| Comment-based help | ✅ `.SYNOPSIS`, `.PARAMETER`, `.EXAMPLE` |
| Tests | ⚠️ Maybe (depends on instruction file rules) |
| Module structure | ❌ Still just `v1.ps1` |

---

### Level 3: Expanded Scope + Autonomous Execution — "Build the Full Thing"

```text
I need a powershell function that gets two files and returns the difference in file
size. Store the files right here. Don't miss instructions and skills telling you
how to do this!

Then add pester tests, a changelog and sampler module scaffolding. Run the tests
autonomously until the task is done. Be creative in adding functions that fit into
the scope and would make the module more useful and complete.

Then tell me how many tokens you used and how much it costs when using Anthropic
Opus 4.7 1M.
```

#### What Changes

This prompt escalates dramatically:

1. **"Store the files right here"** — tells the agent to use the current directory, creating proper structure
2. **"Pester tests, changelog, Sampler scaffolding"** — requests a complete module with testing infrastructure
3. **"Run the tests autonomously until the task is done"** — enables the agentic self-verification loop
4. **"Be creative in adding functions"** — grants the agent license to expand scope intelligently

#### Presenter Talking Points

> "Now we're in full agentic territory. The AI isn't just writing a function —
> it's building a complete module with tests, running those tests, and iterating
> until everything passes. It's also being creative, adding related functions
> like `Get-FileSize`, `Compare-FileHash`, or `Get-FileSizeReport`."

> "This is where the 'autonomous iteration' loop kicks in. The agent writes
> tests, runs them, sees failures, fixes the code, runs again — without you
> doing anything. This is the self-verification pattern from Module 5."

#### Expected Output Delta vs Level 2

| Aspect | Improvement |
|--------|------------|
| Module structure | ✅ Full Sampler scaffolding (`source/`, `tests/`, `.psd1`, `.psm1`) |
| Tests | ✅ Comprehensive Pester 5 tests |
| Changelog | ✅ `CHANGELOG.md` created |
| Additional functions | ✅ Creative additions (e.g., `Get-FileSize`, `Compare-FileHash`) |
| Self-verification | ✅ Agent runs tests and iterates on failures |
| Autonomous execution | ✅ Full agentic loop |

---

### Level 4: Toolchain Specificity — "Use the Right Build System"

```text
I need a powershell function that gets two files and returns the difference in file
size. Store the files right here. Don't miss instructions and skills telling you
how to do this!

Then add pester tests, a changelog and sampler module scaffolding. Run the tests
using the Sampler build script. Be creative in adding functions that fit into the
scope and would make the module more useful and complete.

Then tell me how many tokens you used and how much it costs when using Anthropic
Opus 4.7 1M.
```

#### What Changes

One key substitution: **"Run the tests using the Sampler build script"** replaces "Run the tests autonomously."

This tells the AI to:

- Use `.\build.ps1 -Tasks test` instead of raw `Invoke-Pester`
- Respect the Sampler build pipeline (resolve dependencies, compile module, then test)
- Follow the `build.yaml` task configuration
- Use the `sampler-build-debug` skill if available for troubleshooting build failures

#### Presenter Talking Points

> "This is a subtle but important change. Instead of 'just run the tests', we're
> saying 'use the Sampler build script.' This is the difference between running
> tests in isolation and running them through the full build pipeline — which
> resolves dependencies, compiles the module, and then tests the compiled output."

> "If the AI has the `sampler-framework` or `sampler-build-debug` skill loaded,
> it knows exactly how to troubleshoot build failures. It knows about
> `RequiredModules.psd1`, `build.yaml` task ordering, and `output/` directory
> structure."

#### Expected Output Delta vs Level 3

| Aspect | Improvement |
|--------|------------|
| Build system | ✅ `build.ps1`, `build.yaml`, `RequiredModules.psd1` |
| Test execution | ✅ Via Sampler pipeline, not raw `Invoke-Pester` |
| Dependency resolution | ✅ `Resolve-Dependency.ps1` / `Resolve-Dependency.psd1` |
| Module compilation | ✅ Compiled module in `output/` |

---

### Level 5: Full Lifecycle — "Document and Remember Everything"

```text
I need a powershell function that gets two files and returns the difference in file
size. Store the files right here. Don't miss instructions and skills telling you
how to do this!

Then add pester tests, a changelog and sampler module scaffolding. Run the tests
using the Sampler build script. Be creative in adding functions that fit into the
scope and would make the module more useful and complete. Write a comprehensive
documentation and create a memory bank.

Then tell me how many tokens you used and how much it costs when using Anthropic
Opus 4.7 1M.
```

#### What Changes

Two additions at the end:

1. **"Write a comprehensive documentation"** — triggers README generation, comment-based help, and potentially a docs site
2. **"Create a memory bank"** — requests `.memory-bank/` with project context files (`projectbrief.md`, `activeContext.md`, `progress.md`, etc.)

#### Presenter Talking Points

> "Now we're asking the AI to not just build code, but to document it and
> create persistent context for future sessions. The memory bank means the
> next time you — or the AI — opens this project, there's a knowledge base
> explaining what was built, why, and what's next."

> "This is the lifecycle pattern: code → tests → documentation → context.
> Most developers skip the last two. The AI won't, if you ask for it."

#### Expected Output Delta vs Level 4

| Aspect | Improvement |
|--------|------------|
| README | ✅ Comprehensive project documentation |
| Comment-based help | ✅ Complete `.SYNOPSIS`, `.DESCRIPTION`, `.EXAMPLE` on all functions |
| Memory bank | ✅ `.memory-bank/` with `projectbrief.md`, `activeContext.md`, `progress.md`, etc. |
| Cross-session context | ✅ Future AI interactions start with project understanding |

---

### Level 6: Explicit Meta-Instruction — "Use Everything Available"

```text
I need a powershell function that gets two files and returns the difference in file
size. Store the files right here. Don't miss instructions and skills telling you
how to do this!

Then add pester tests, a changelog and sampler module scaffolding. Run the tests
using the Sampler build script. Be creative in adding functions that fit into the
scope and would make the module more useful and complete. Follow all agent and
individual instructions that fit the task, use all available skills.

Then tell me how many tokens you used and how much it costs when using Anthropic
Opus 4.7 1M.
```

#### What Changes

The last sentence is an explicit meta-instruction: **"Follow all agent and individual instructions that fit the task, use all available skills."**

This tells the AI to:

- Enumerate all available `.instructions.md` files and apply any whose `applyTo` patterns match
- Load and follow all available custom agent definitions
- Enumerate and activate all available skills whose descriptions are relevant
- Apply the combined set of rules — coding standards, testing requirements, documentation standards, security practices, changelog formatting, versioning patterns, etc.

#### Presenter Talking Points

> "This is the 'full power' prompt. Instead of hoping the AI notices your
> instructions and skills, you're explicitly saying: 'I know I have
> powershell.instructions.md, pester.instructions.md, changelog.instructions.md,
> and skills for Sampler, Pester patterns, and more. Use ALL of them.'"

> "In practice, you shouldn't need this if your instructions and skills are well
> configured — the AI should find them automatically. But during demos, or when
> working with a model you're not sure about, this explicit nudge ensures nothing
> gets missed."

> "Notice this prompt doesn't explicitly ask for documentation or a memory bank.
> But if your instructions say 'always create documentation' or a skill explains
> memory bank creation, the AI will do it anyway because you told it to follow
> ALL instructions."

#### Expected Output Delta vs Level 5

| Aspect | Improvement |
|--------|------------|
| Instruction coverage | ✅ ALL matching instructions applied (PowerShell, Pester, changelog, versioning, etc.) |
| Skill activation | ✅ ALL relevant skills loaded and used |
| Implicit behaviors | ✅ Tasks you didn't explicitly ask for but instructions/skills require |
| Output completeness | ✅ Maximum quality from available configuration |

---

## Summary: The Prompt Evolution at a Glance

```
Level 1  "Just do it"                     → A function in a flat file
Level 2  "...check instructions/skills"   → + Coding standards applied
Level 3  "...tests, Sampler, be creative" → + Full module, tests, iteration
Level 4  "...use the build script"        → + Proper build pipeline
Level 5  "...documentation, memory bank"  → + Full lifecycle artifacts
Level 6  "...follow ALL instructions"     → + Maximum resource utilization
```

### Visual: Prompt Quality vs Output Quality

```
Output Quality & Scope
▲
│                                            ┌─────┐
│                                       ┌────┤  6  │
│                                  ┌────┤  5 │     │
│                             ┌────┤  4 │    │     │
│                        ┌────┤  3 │    │    │     │
│                   ┌────┤  2 │    │    │    │     │
│              ┌────┤  1 │    │    │    │    │     │
│              │    │    │    │    │    │    │     │
└──────────────┴────┴────┴────┴────┴────┴────┴─────┴──────▶
               Prompt Complexity & Context
```

---

## Demo Execution Options

### Option A: Live Side-by-Side (20-25 min)

Run Levels 1 and 3 (or 1 and 6) live, showing the dramatic difference:

1. **Level 1**: Run the bare prompt. Show the minimal output. (~5 min)
2. **Level 3 or 6**: Run the evolved prompt. Watch the full agentic loop. (~15 min)
3. **Compare**: Side-by-side file count, test count, code quality. (~5 min)

### Option B: Pre-Recorded + Live Narration (10-15 min)

1. Show pre-recorded screen captures of each level
2. Narrate the differences at each step
3. Run Level 6 live for the dramatic finale

### Option C: Attendee Exercise (15-20 min, 4-hour version)

1. Provide all six prompts as a handout
2. Attendees run Levels 1 and 2 in their own VS Code
3. Discuss: "What changed? Why?"
4. Facilitator demos Level 6

---

## Key Teaching Points

### 1. Cost Awareness

Every prompt asks: *"Tell me how many tokens you used and how much it costs."*

This teaches attendees to think about:

- Token consumption increases with prompt complexity and agentic iterations
- But **cost per unit of useful output decreases** — Level 1 is cheap but produces little; Level 6 costs more but produces a complete, tested, documented module
- The value ratio (output quality ÷ cost) improves dramatically at higher levels

### 2. Instructions ≠ Prompts

A key distinction to reinforce:

| Concept | Defined Once | Applied | Scope |
|---------|-------------|---------|-------|
| **Instructions** | In `.instructions.md` files | Automatically to every matching request | Persistent project rules |
| **Skills** | In `SKILL.md` files | Auto-loaded when description keywords match | Domain knowledge on demand |
| **Prompts** | In `.prompt.md` files | When `/command` is invoked | Reusable task templates |
| **The user's prompt** | Written per request | That one request | One-time instruction |

Level 6 works best when instructions, skills, and agents are well-configured — the prompt just "unlocks" them.

### 3. Progressive Autonomy

The levels mirror a trust progression:

| Level | Human Role | AI Role |
|-------|-----------|---------|
| 1 | Types everything, reviews everything | Takes dictation |
| 2 | Reminds about resources | Follows existing rules |
| 3 | Defines scope, grants creative freedom | Builds, tests, iterates autonomously |
| 4 | Specifies exact toolchain | Uses professional build system |
| 5 | Requests full lifecycle | Documents and creates knowledge base |
| 6 | Grants maximum latitude | Leverages all available resources |

> **Key message**: As your prompt quality increases, you move from **typist** to **architect**. The AI handles execution; you handle intent and review.

---

## Post-Demo Discussion Questions

- "Which level would you use for production code? Why probably not Level 1?"
- "What if Level 6 activates an instruction you didn't know about?"
- "How does the cost compare to having a human write all of this manually?"
- "Where is the diminishing returns point? Is Level 6 always better than Level 5?"

---

## Troubleshooting

### If Level 1 Produces Good Code Anyway

Some models default to high-quality output even without instructions.

- Point out: "It happened to produce good code THIS time. But it's not guaranteed. Without instructions, you get randomness."
- Run Level 1 twice and show the inconsistency.

### If Level 6 Takes Too Long

The full agentic loop with all skills can take several minutes.

- Use Option B (pre-recorded) for time-constrained sessions.
- Set a timer. If the agent is still iterating after 5 minutes, pause and explain what it's doing.
- "This is why cost awareness matters — autonomous loops can run long."

### If Tests Keep Failing

- This is actually a great demo moment: "Watch the self-correction loop in action."
- If stuck after 3 iterations, provide a hint in the chat.
- "Even the best AI sometimes needs human guidance. That's the partnership."