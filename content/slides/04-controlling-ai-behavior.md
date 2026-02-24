# Module 4: Controlling AI Behavior

## Slide 4.1: The Consistency Problem

# Same Prompt, Different Results?

### Without instruction files:

**Request 1**: "Add a validation function"
```powershell
# Result: No tests, no error handling, minimal code
function Validate-Input { 
    param($input) 
    return $input -ne $null 
}
```

**Request 2** (same prompt, later):
```powershell
# Result: Different style, verbose, unexpected approach
Function Validate-Input {
    Param([Parameter(Mandatory=$True)]$InputValue)
    If ($Null -eq $InputValue) { Throw "Input required" }
    Return $True
}
```

### The problem:
- ❌ Inconsistent output
- ❌ Doesn't follow your standards
- ❌ Missing tests
- ❌ You have to repeat instructions

---

## Slide 4.2: The Solution

# Instruction Files

> **Instruction files teach AI your rules ONCE, and they apply to EVERY request.**

```
┌─────────────────────────────────────────────────────────────────┐
│                  INSTRUCTION FILE EFFECT                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   Your Request: "Add a validation function"                    │
│                           │                                     │
│                           ▼                                     │
│   ┌─────────────────────────────────────────┐                  │
│   │       copilot-instructions.md            │                  │
│   │   ─────────────────────────────────     │                  │
│   │   • Always create tests                  │                  │
│   │   • Use try/catch for error handling    │                  │
│   │   • Follow existing patterns            │                  │
│   │   • Include comment-based help          │                  │
│   │   • Run tests before completing         │                  │
│   └─────────────────────────────────────────┘                  │
│                           │                                     │
│                           ▼                                     │
│   AI applies these rules AUTOMATICALLY to every request        │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Slide 4.3: Copilot Instruction Files

# Your AI Configuration Files

GitHub Copilot supports **five types** of instruction files:

| File | Scope | Purpose |
|------|-------|--------|
| `.github/copilot-instructions.md` | Always-on | Project-wide coding standards |
| `.instructions.md` files | File-pattern | Language/framework-specific rules |
| `AGENTS.md` | Always-on | Cross-tool compatible instructions |
| `.agent.md` files | Per-agent | Custom agent personas & tools |
| `CLAUDE.md` | Always-on | Claude Code compatibility |

### Location:
```
📁 YourProject/
├── .github/
│   ├── copilot-instructions.md  ← Always-on project rules
│   ├── instructions/
│   │   ├── powershell.instructions.md  ← applyTo: **/*.ps1
│   │   └── testing.instructions.md    ← applyTo: **/*.Tests.ps1
│   └── agents/
│       ├── refactor.agent.md      ← Custom agent
│       └── documenter.agent.md    ← Custom agent
├── AGENTS.md                    ← Cross-tool instructions
├── src/
└── tests/
```

---

## Slide 4.4: Anatomy of copilot-instructions.md

# What Goes Inside

```markdown
# Project Rules for AI Agent

## Code Standards
- Use approved PowerShell verbs (Get, Set, New, Remove, Test, etc.)
- Always include [CmdletBinding()] on functions
- Use parameter validation attributes
- Follow existing code patterns in the repository

## Testing Requirements  
- Create Pester tests for every new function
- Tests must cover: success path, error path, edge cases
- Run Invoke-Pester before reporting completion
- Aim for minimum 80% code coverage

## Documentation
- Include comment-based help for all public functions
- Document parameters with .PARAMETER
- Include at least one .EXAMPLE

## Error Handling
- Wrap risky operations in try/catch
- Use Write-Error for non-terminating errors
- Use throw for terminating errors
- Always include meaningful error messages

## Git Practices
- Suggest conventional commit messages
- Never commit secrets or credentials
```

---

## Slide 4.5: Rule Categories

# What You Can Control

| Category | Examples |
|----------|----------|
| **Code Style** | Naming conventions, formatting, structure |
| **Testing** | When to create tests, what to cover |
| **Documentation** | Help text, comments, README updates |
| **Error Handling** | Try/catch usage, error messages |
| **Security** | Secrets, credentials, safe practices |
| **Git** | Commit messages, branch conventions |
| **Workflow** | When to ask, when to proceed |
| **Agent Scope** | Which tools agents can use |

### Key insight:
> Write rules for the things you find yourself **repeating** to AI.

---

## Slide 4.6: Before and After

# The Impact of Instruction Files

### WITHOUT copilot-instructions.md:
```powershell
# AI output - minimal, no tests, no help
function Test-Config {
    param($Path)
    if (Test-Path $Path) { 
        Get-Content $Path | ConvertFrom-Json 
    }
}
```

### WITH copilot-instructions.md:
```powershell
<#
.SYNOPSIS
    Validates a configuration file.
.PARAMETER Path
    Path to the configuration file.
.EXAMPLE
    Test-Config -Path ./config.json
#>
function Test-Config {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Path
    )
    
    try {
        if (-not (Test-Path -Path $Path)) {
            throw "Configuration file not found: $Path"
        }
        
        $content = Get-Content -Path $Path -Raw
        $config = $content | ConvertFrom-Json
        
        return $config
    }
    catch {
        Write-Error "Failed to validate config: $_"
        throw
    }
}
```

**Plus**: Tests created automatically!

---

## Slide 4.7: Hierarchy of Instructions

# Priority Order

```
┌─────────────────────────────────────────────────────────────────┐
│                  INSTRUCTION HIERARCHY                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   HIGHEST PRIORITY                                             │
│   ═══════════════                                              │
│                                                                 │
│   1. � Personal instructions (user-level settings)              │
│      └── Your personal preferences                             │
│          Apply across all workspaces                           │
│                                                                 │
│   2. 📁 Repository instructions                                │
│      ├── .github/copilot-instructions.md                       │
│      ├── AGENTS.md                                             │
│      └── .instructions.md files (pattern-matched)              │
│          Project-specific rules, shared via Git                │
│                                                                 │
│   3. 🏢 Organization instructions                               │
│      └── Defined at GitHub org level                           │
│          Company-wide standards                                │
│                                                                 │
│   LOWEST PRIORITY                                              │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Why this matters:
- Team shares project rules via `.github/copilot-instructions.md` in Git
- You keep personal preferences in user-level settings
- Organizations enforce company-wide policies
- Pattern-matched files apply only to relevant code

---

## Slide 4.8: Custom Agents

# Specialized Agent Behaviors

Different tasks need different behaviors:

```
📁 .github/agents/
├── 📄 refactor.agent.md
├── 📄 documenter.agent.md
├── 📄 debugger.agent.md
└── 📄 test-first.agent.md
```

### Example: Documentation Agent
```markdown
---
name: Documenter
description: Generate comprehensive documentation
tools: ['codebase', 'search', 'problems']
---
# Documentation Agent

You are a documentation specialist.

## Behavior
- Focus ONLY on documentation
- Do not modify functional code
- Generate comprehensive help text
- Update README files
- Create usage examples

## Output Style
- Clear, concise language
- Include examples for every function
- Follow Microsoft documentation patterns
```

---

## Slide 4.9: Custom Agent Examples

# Specialized Agents

### Refactor Agent
```markdown
---
name: Refactorer
description: Improve code quality without changing functionality
tools: ['editFiles', 'codebase', 'terminalCommand', 'problems']
---
# Refactoring Agent

## Behavior
- Improve code quality without changing functionality
- Preserve all existing tests
- Run tests after every change
- Make minimal, focused changes

## Rules
- Never add new features
- Never remove functionality
- Explain each refactoring decision
```

### Debug Agent
```markdown
---
name: Debugger
description: Focus on identifying and fixing bugs
tools: ['codebase', 'problems', 'terminalCommand', 'search']
---
# Debug Agent

## Behavior
- Focus on identifying root causes
- Analyze error messages carefully
- Suggest minimal fixes
- Verify fix resolves the issue

## Approach
- Ask clarifying questions about the error
- Check related code for context
- Test the fix thoroughly
```

---

## Slide 4.10: Demo - Before/After

# See the Difference

### Demo: Instruction File Impact

**Part 1: Without copilot-instructions.md**
1. Request: "Add a function to parse JSON config"
2. Observe: Minimal output, no tests, basic code

**Part 2: With copilot-instructions.md**
1. Add instruction file with standards
2. Same request: "Add a function to parse JSON config"
3. Observe: Full output with tests, help, error handling

### Key observation:
> Same request. Dramatically different results.

---

## Slide 4.11: Writing Effective Rules

# Best Practices

### DO ✅
```markdown
## Testing Requirements
- Create Pester tests for every new function
- Include tests for: success, failure, edge cases
- Run Invoke-Pester before reporting completion
```
*Specific, actionable, measurable*

### DON'T ❌
```markdown
## Testing
- Make sure to test stuff
- Code should work
```
*Vague, unmeasurable, no guidance*

---

## Slide 4.12: Common Rule Patterns

# Starter Template

```markdown
# [Project Name] AI Rules

## Execution Style
- [How should AI approach tasks?]
- [When should it ask vs proceed?]
- [How should it verify completion?]

## Code Standards
- [Naming conventions]
- [Required patterns]
- [Error handling approach]

## Testing Requirements
- [What tests are required?]
- [Coverage expectations]
- [How to run tests?]

## Documentation
- [Help text requirements]
- [Comment standards]
- [README updates]

## Security
- [What to never include]
- [Sensitive data handling]
- [Authentication patterns]

## Git Practices
- [Commit message format]
- [Branch conventions]
- [When to suggest commits]
```

> Use `/init` in Copilot Chat to auto-generate instructions from your codebase!

---

## Slide 4.13: Team Consistency

# Shared Rules = Shared Standards

```
┌─────────────────────────────────────────────────────────────────┐
│                    TEAM CONSISTENCY                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   Dev A uses AI                 Dev B uses AI                  │
│        │                              │                         │
│        ▼                              ▼                         │
│   ┌──────────┐                 ┌──────────┐                    │
│   │ Reads    │                 │ Reads    │                    │
│   │copilot-  │◄───────────────│copilot-  │                    │
│   │instruc-  │    Same file!   │instruc-  │                    │
│   │tions.md  │                 │tions.md  │                    │
│   └──────────┘                 └──────────┘                    │
│        │                              │                         │
│        ▼                              ▼                         │
│   ┌──────────┐                 ┌──────────┐                    │
│   │Consistent│                 │Consistent│                    │
│   │  Output  │                 │  Output  │                    │
│   └──────────┘                 └──────────┘                    │
│                                                                 │
│   SAME STANDARDS ──▶ SAME CODE QUALITY ──▶ LESS REVIEW CHURN  │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

> Commit `.github/copilot-instructions.md` to Git. Everyone gets the same AI behavior.
> Organizations can also enforce company-wide policies.

---

## Slide 4.14: Key Takeaway

# Instruction Files = AI Training

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│   WITHOUT INSTRUCTION FILES      WITH INSTRUCTION FILES        │
│                                                                 │
│   • Repeat yourself             • Define once, apply always    │
│   • Inconsistent results        • Consistent quality           │
│   • Generic code                • Project-tailored code        │
│   • Missing tests               • Tests included               │
│   • Each team member different  • Team-wide consistency        │
│   • No org-level control        • Organization policies        │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

> **Instruction files are how you train AI to work YOUR way.**
> Write your rules once. Get consistent results forever.

---

## Speaker Notes - Module 4

### Timing: 20-25 minutes

### Key Points to Emphasize:
1. Instruction files solve the **consistency problem**
2. Write rules for things you find yourself **repeating**
3. Commit `.github/copilot-instructions.md` to Git for **team consistency**
4. Custom agents allow **specialized behaviors**
5. Use `/init` to auto-generate instructions from your codebase

### Demo Tips:
- Show clear before/after comparison
- Use same request both times for dramatic effect
- Don't spend time on the file syntax — show the result
- Highlight how tests appear automatically with rules

### Common Questions:
- "Where do I put it?" → `.github/copilot-instructions.md` for project-wide, `.github/instructions/` for pattern-matched
- "How specific should rules be?" → Specific enough to be actionable
- "Can I have multiple files?" → Yes, use `.instructions.md` files with `applyTo` patterns
- "Do rules slow down AI?" → No, they improve quality
- "Does this work with other tools?" → Use `AGENTS.md` for cross-tool compatibility

### Transition to Module 5:
"Now you can control what AI produces. But how do you know it actually works? That's where automated testing and self-verification come in..."