# Module 5: Trust but Verify - Automated Testing

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