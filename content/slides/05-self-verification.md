# Module 5: Trust but Verify - Automated Testing

## Version Guide

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
| 5.11a | The Cheating-Agent Trap | — | — | ✅ |
| 5.12 | Trust Hierarchy | — | — | ✅ |
| 5.13 | Key Takeaway | ✅ | ✅ | ✅ |

> *"Trust, but verify."* — **Russian proverb** *(popularized by Ronald Reagan)*
>
> *"An experiment is a question which science poses to Nature, and a measurement is the recording of Nature's answer."* — **Max Planck**

## Slide 5.1: The Trust Problem

# Can You Trust AI-Generated Code?

### The honest answer:
> **Not blindly. But you can verify it.**

### AI can produce code that:
- ✅ Looks correct
- ✅ Follows patterns
- ✅ Has proper syntax
- ❌ Has subtle bugs
- ❌ Misses edge cases
- ❌ Doesn't handle errors well

### The solution:
> **Automated tests let AI verify its own work.**

<!--
Speaker notes (for newcomers):
- **Automated test** = a small piece of code that checks another piece of code does what it should. Either passes or fails — no opinion involved.
- In PowerShell the test framework is called **Pester**. In Python it's pytest, in JavaScript it's Jest. Same idea everywhere.
- Why this matters for AI: tests are the only objective signal the agent has that its work is right. Without tests, "done" means "I think so."
-->

---

## Slide 5.2: The Verification Loop

# Self-Correction in Action

```
┌─────────────────────────────────────────────────────────────────┐
│                 SELF-VERIFICATION PATTERN                       │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   Request: "Add input validation function"                     │
│                          │                                      │
│                          ▼                                      │
│   ┌───────────────────────────────────────────┐                │
│   │  1. Agent writes the function             │                │
│   └───────────────────────────────────────────┘                │
│                          │                                      │
│                          ▼                                      │
│   ┌───────────────────────────────────────────┐                │
│   │  2. Agent writes comprehensive tests      │                │
│   └───────────────────────────────────────────┘                │
│                          │                                      │
│                          ▼                                      │
│   ┌───────────────────────────────────────────┐                │
│   │  3. Agent runs: Invoke-Pester             │                │
│   └───────────────────────────────────────────┘                │
│                          │                                      │
│              ┌───────────┴───────────┐                         │
│              │                       │                         │
│         All Pass                Some Fail                      │
│              │                       │                         │
│              ▼                       ▼                         │
│   ┌──────────────────┐    ┌───────────────────┐               │
│   │  Report: Done!   │    │  4. Agent analyzes│               │
│   │  Code verified   │    │     failure       │               │
│   └──────────────────┘    └───────────────────┘               │
│                                      │                         │
│                                      ▼                         │
│                          ┌───────────────────┐                 │
│                          │  5. Agent fixes   │                 │
│                          │     the code      │                 │
│                          └───────────────────┘                 │
│                                      │                         │
│                                      └───▶ Go to step 3        │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```
<!--
The self-verification loop on this slide is the structural reason agentic coding is different from autocomplete. Autocomplete stops at step 1; the chat-era model stops at step 2; only an agent with tool access can run step 3 and iterate on the result.

The loop is genuinely automatic but bounded — every host enforces some maximum on iteration count, typically five to ten cycles before the agent stops and reports failure to the human. Hitting that cap is itself a signal: usually it means the test is testing the wrong thing, or the requirement is under-specified, or the agent has been chasing a symptom across files. The remedy is rarely "give it more cycles."
-->
---

## Slide 5.3: Why This Matters

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

> Tests transform "I think it works" into "I proved it works."

> *"Experiments are the only means of knowledge at our disposal. Everything else is poetry, imagination."* — **Max Planck**

<!--
The Planck quote frames the philosophical claim under this entire module: knowledge requires evidence, and in software the evidence is a passing test. "It compiles" and "the chat output looks reasonable" are not evidence — they are absence of one specific class of failure.

The "executable specification" framing has been around since Beck's *Test-Driven Development* (2002), but it acquires new force in the agent era. For a human team, a test suite is a check on the code. For an agent, the test suite is the *only signal that closes the verification loop*. Without tests, the agent has no way to know when to stop iterating — it falls back to the model's own assessment of its work, which is exactly the unreliable judgement the tests were supposed to replace.
-->

---

## Slide 5.4: What Gets Tested

# Comprehensive Coverage

### Agent creates tests for:

| Test Type | Purpose |
|-----------|---------|
| **Success Path** | Happy path works correctly |
| **Error Path** | Errors handled properly |
| **Edge Cases** | Boundaries and limits work |
| **Null/Empty** | Handles missing input |
| **Invalid Input** | Rejects bad data |
| **Return Values** | Outputs correct data |

### Example test structure:
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

## Slide 5.5: The Iteration Power

# Self-Correction Example

### Attempt 1:
```
Agent: Writing Test-EmailAddress...
Agent: Running tests...
Result: 4 passed, 1 failed
Failed: "Handles null input gracefully"
```

### Agent analyzes:
```
"The function throws when input is null.
 Need to add null check before validation."
```

### Attempt 2:
```
Agent: Fixed - added null parameter validation
Agent: Running tests...
Result: 5 passed, 0 failed ✅
```

> **This happens automatically.** You receive working code.

### Callout — the rate of feedback is your speed limit

> *"Don't outrun your headlights."* — **Hunt & Thomas**, *The Pragmatic Programmer*

A fast, deterministic test loop is **not** an optional discipline for agents — it is the *governor* on how far the agent is allowed to drive between checks. Slow tests = long, dangerous strides; fast tests = small, correctable steps. This is why TDD, far from being incompatible with AI, is what *keeps AI honest*.

> Pairs with **M9** (when to use): if you cannot build a fast feedback loop for a task, the agent's stride exceeds your braking distance — don't generate.

<!--
The Pragmatic Programmer headlights metaphor is the right framing for test-loop speed. Slow tests do not just slow the human — they slow the agent's iteration cycle, which means the agent runs further between checks and accumulates more uncorrected drift before a failure surfaces.

The quantitative version: a five-second test loop lets the agent iterate twelve times per minute. A five-minute test loop lets it iterate twice per hour. The same model on the same task produces dramatically different code quality at those two rates, because the corrective signal arrives at fundamentally different cadences. Investing in test speed is therefore not a developer-experience nicety — it is direct investment in agent output quality.
-->

---

## Slide 5.6: Enabling Self-Verification

# In Your copilot-instructions.md

```markdown
## Testing Requirements
- Create Pester tests for every new function
- Tests must be in corresponding tests/ directory
- Test file naming: [FunctionName].Tests.ps1

### What to Test
- At minimum: success path, error path, edge cases
- Include tests for null and empty inputs
- Test parameter validation
- Test error messages

### Verification
- Run Invoke-Pester after writing code
- Do not report completion until all tests pass
- If tests fail, fix code and re-run
- Report final test results to user
```

<!--
Speaker notes (for newcomers):
- This is the most practical slide in the module: copy-paste this into your own `copilot-instructions.md` today and the agent will start testing its own output.
- The magic line is "do not report completion until all tests pass" — it forces the agent to iterate instead of giving up.
- **Invoke-Pester** is the command that runs all the tests in your project.
-->

---

## Slide 5.7: Test-First with AI

# An Alternative Approach

### Traditional: Code First
```
1. Write function
2. Write tests
3. Run tests
4. Fix issues
```

### Test-First: Tests First
```
1. Write tests (as specifications)
2. Write function to pass tests
3. Run tests
4. Already passing!
```

### How to request it:
```
"Write Pester tests for a function that validates Azure 
resource IDs. Include tests for valid IDs, invalid formats, 
null input, and empty strings. Then implement the function 
to pass those tests."
```

<!--
Test-first development with AI inverts the failure mode of the cheating-agent trap (slide 5.11a). When tests are written first and the code is written to pass them, the tests act as the specification the code must conform to — the agent cannot rewrite the spec to fit the bug, because the spec exists before the bug does.

The practical concern is that not all requirements are easy to express as tests upfront. Anything involving UI, performance, or fuzzy correctness ("the error message should be helpful") resists test-first authoring. The mature pattern is hybrid: test-first for behaviour with crisp acceptance criteria, code-first followed by tests for behaviour that has to be discovered before it can be specified.
-->

---

## Slide 5.8: Test-First Demo

# Tests as Specifications

```powershell
# Agent writes tests FIRST:

Describe 'Test-AzureResourceId' {
    Context 'Valid Resource IDs' {
        It 'Returns true for valid subscription resource' {
            $id = '/subscriptions/xxx-xxx/resourceGroups/rg'
            Test-AzureResourceId -ResourceId $id | Should -BeTrue
        }
    }
    
    Context 'Invalid Resource IDs' {
        It 'Returns false for ID without leading slash' {
            Test-AzureResourceId -ResourceId 'subscriptions/x' |
                Should -BeFalse
        }
    }
    
    Context 'Error Handling' {
        It 'Throws for null input' {
            { Test-AzureResourceId -ResourceId $null } |
                Should -Throw
        }
    }
}
```

### Then agent implements function to pass these tests.

<!--
The test code on this slide is the executable form of a requirements document. Each `It` block names a behaviour the function must exhibit; the function does not exist yet and the tests fail by design. The agent's task is to produce the smallest implementation that turns all the assertions green — nothing more.

The pattern aligns with what the spec-driven module called "plan before code" (slide 4.7a). The test suite *is* the plan; the implementation is downstream of it. This eliminates a class of disagreement that otherwise has to be resolved by reading generated code — if the tests pass, the behaviour matches the spec by definition.
-->

---

## Slide 5.9: Beyond Pester

# Additional Verification

### Linting with PSScriptAnalyzer:
```powershell
# Agent can also run:
Invoke-ScriptAnalyzer -Path ./src -Recurse
```

### In copilot-instructions.md:
```markdown
## Code Quality Verification
- Run PSScriptAnalyzer after writing code
- Fix any warnings before completing
- Use -Severity Warning for strict checking
```

### Agent self-corrects lint issues too:
```
Agent: Running PSScriptAnalyzer...
Warning: Avoid using Write-Host
Agent: Fixing - changing to Write-Output
Agent: Running PSScriptAnalyzer... No issues found ✅
```

<!--
The verification surface extends well beyond unit tests. Static analysers (PSScriptAnalyzer, ESLint, Pylint, Roslyn analysers) catch a different class of defect than tests do — style, common bug patterns, security smells — and they run in milliseconds rather than seconds. Type checkers (mypy, pyright, TypeScript's `tsc`, F#'s compiler) catch yet another class, the one Matt Pocock pointed at when he claimed TypeScript catches ~94% of LLM errors that surface as type-check failures.

The practical implication is that verification should be a *layered* signal, not a single check. Compile/type-check (instant), lint (sub-second), unit tests (seconds), integration tests (minutes), end-to-end (longer). The agent should iterate at the fastest layer it can, escalating to slower layers only when faster ones go green. Skipping the fast layers in favour of running the full test suite on every iteration is a common mistake — it wastes the cheap signal that would have caught most of the defects.
-->

---

## Slide 5.10: Demo - Watch AI Self-Verify

# Live Demonstration

### Demo: Self-Verification in Action

**Request**: "Add a function to validate JSON configuration files"

**Watch the agent**:
1. Analyze project context
2. Write `Test-JsonConfig` function
3. Write comprehensive Pester tests
4. Run `Invoke-Pester`
5. (If tests fail) Fix issues and re-run
6. Report success with proof

### Key observation:
> You receive code with **proof it works**.

<!--
The demo's value is in showing the iteration in real time — the moment when a test fails, the agent reads the failure, and the agent's next action visibly responds to what it just learned. That visible feedback loop is what separates "agent" from "code generator with tests."

A productive moment in the demo is when the audience notices the agent doing something they would not have done. Maybe it adds a test case the human did not request. Maybe it refactors an unrelated function the failing test exposed as flaky. These small initiatives are also where review discipline matters — the agent's initiative is sometimes valuable and sometimes scope creep; the diff is where you decide which.
-->

---

## Slide 5.11: When Tests Fail

# Graceful Recovery

```
┌─────────────────────────────────────────────────────────────────┐
│                    FAILURE HANDLING                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   Test Output:                                                  │
│   ────────────                                                  │
│   [-] Should handle empty array correctly                      │
│       Expected: empty object                                   │
│       Got: threw System.ArgumentException                      │
│                                                                 │
│   Agent Analysis:                                              │
│   ────────────────                                              │
│   "The function doesn't handle empty arrays.                   │
│    I need to add a check at the start of the function."        │
│                                                                 │
│   Agent Fix:                                                   │
│   ──────────                                                    │
│   if ($InputArray.Count -eq 0) {                               │
│       return @{}                                                │
│   }                                                             │
│                                                                 │
│   Re-run:                                                      │
│   ────────                                                      │
│   [+] Should handle empty array correctly ✅                   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

<!--
The sequence shown — read the failure, identify the missing case, add a guard clause, re-run — is straightforward debugging. The interesting property is not that the agent can do it (modern models read stack traces well) but that the agent does it *without asking for permission between steps*. The human approves the goal at the start; the agent works the failure loop until VERIFY goes green.

The failure mode worth watching for is the opposite of self-correction: the agent that "fixes" a failing test by changing the expectation rather than the code. This is the next slide's topic for a reason — graceful recovery and cheating look superficially similar in the chat log, and the only way to tell them apart is to read the diff.
-->

---

## Slide 5.11a: The Cheating-Agent Trap

# When AI Validates Its Own Lies

> *"AI writes broken code — and then writes broken tests to validate the broken code."*
> — observation from a 20-person team after 6 months of agentic AI (Axel Molist, *"What 6 months of AI coding did to my dev team"*, 2026)

### The trap:

Self-verification only works if the **tests are independent of the code**.
When the same agent writes both, both can be wrong **in the same direction**.

```text
Bad symbiosis:
  Code:   IsValidEmail("abc")  → returns $true
  Tests:  Should -BeTrue       ← matches the bug
  Agent:  "All 12 tests passed." 🟢
  Reality: function is broken; the test suite is theatre.
```

### Five mitigations — pick at least two:

| Mitigation | Why it works |
|------------|--------------|
| **Tests-as-specs, written first** (often by a human) | Tests anchor on real-world behaviour, not on whatever the code happens to do |
| **"Tests must fail first" rule** | Forces the agent to prove the test discriminates before fixing the code |
| **Independent reviewer agent** | A second agent (or human) writes adversarial / negative tests |
| **Mutation testing** | Mutate the code; if no test fails, the test suite is too weak |
| **Hold-out acceptance criteria** | Cases the agent never sees, run by the human after "done" |

### Add to your `copilot-instructions.md`:

```markdown
## Test Discipline
- Write at least one test that FAILS against the empty/skeleton code
  before implementing the function. Show the failing run.
- Treat acceptance criteria provided by the user as ground truth — do
  not modify them to make tests pass.
- If a test is hard to write, the design is probably wrong. Surface
  this rather than weakening the test.
```

> Assertions are evidence. **Evidence requires an independent witness.**

<!--
Speaker notes (for newcomers):
- The trap in one sentence: if the same brain writes the bug AND the test, it writes a test that approves the bug.
- Easiest mitigation for beginners: write (or sketch) the tests yourself BEFORE asking the agent to implement the function. Now tests are independent.
- Or: ask a *different* agent (a "reviewer" agent from Module 4) to write the tests. Two brains, one truth.
-->

---

## Slide 5.12: Trust Hierarchy

# Layers of Verification

```
┌─────────────────────────────────────────────────────────────────┐
│                    TRUST HIERARCHY                              │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   AUTOMATED (Agent Does)          HUMAN (You Do)               │
│   ═══════════════════════         ═════════════════            │
│                                                                 │
│   ┌─────────────────────┐                                      │
│   │ 1. Syntax Check     │         ┌─────────────────────┐      │
│   │    (Code runs)      │         │ 4. Code Review      │      │
│   └─────────────────────┘         │    (Logic correct?) │      │
│            │                      └─────────────────────┘      │
│            ▼                                 │                  │
│   ┌─────────────────────┐                   │                  │
│   │ 2. Unit Tests       │                   │                  │
│   │    (Behavior works) │                   │                  │
│   └─────────────────────┘                   │                  │
│            │                                 │                  │
│            ▼                                 ▼                  │
│   ┌─────────────────────┐         ┌─────────────────────┐      │
│   │ 3. Linting          │         │ 5. Approve & Commit │      │
│   │    (Style correct)  │         │    (Accept changes) │      │
│   └─────────────────────┘         └─────────────────────┘      │
│                                                                 │
│   Agent handles 1-3 automatically                              │
│   You handle 4-5 with full visibility (git diff)              │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

<!--
The split between automated and human layers is not arbitrary — it tracks which questions have objective answers. "Does the code compile?", "do the tests pass?", "is the code free of lint warnings?" are decidable; an agent can answer them as well as a human. "Is the logic correct?", "is this the right abstraction?", "does this fit our architecture?" are judgement calls; an agent can offer an opinion but the decision lives with the human.

The practical implication is that human review should focus on layers 4–5. Spending review cycles re-checking the agent's syntax and tests is wasted effort — the agent already checked them, and the human is not faster or more accurate at the same check. Time saved at the bottom of the hierarchy is time available to spend on the top, where human judgement is genuinely scarce.
-->

---

## Slide 5.13: Key Takeaway

# Tests Enable Trust

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│   WITHOUT TESTING                 WITH TESTING                 │
│                                                                 │
│   AI says: "Done"                 AI says: "Done, and here's   │
│   You think: "Is it?"             proof: 12 tests passed"      │
│                                                                 │
│   You must:                       You can:                     │
│   • Test manually                 • Trust the results          │
│   • Find edge cases               • Review the logic           │
│   • Debug failures                • Focus on architecture      │
│                                                                 │
│   AI delivers:                    AI delivers:                 │
│   • "Maybe" code                  • Verified code              │
│   • Hope it works                 • Proof it works             │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

> **Automated testing lets AI verify its own work.**
> You receive code with proof it works, not just hope.

<!--
The slide's two columns are the operational case for investing in test infrastructure before scaling agentic use. The right column is unreachable without the left column — "trust the results" presupposes results that mean something, which presupposes tests strong enough to discriminate working code from broken code.

The broader pattern across this module is that agents amplify whatever discipline is already in the codebase. Strong tests, fast feedback, and reviewer-author separation amplify into trustworthy autonomous output. Absent tests, slow CI, and shared author-test ownership amplify into the cheating-agent trap. The model is the same in both cases; the surrounding system decides what comes out.
-->

---

## Speaker Notes - Module 5

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