---
applyTo: "**/*.ps1,**/*.psm1"
---

# Refactoring Instructions

> This is a sample `.github/instructions/refactoring.instructions.md` file.
> It applies when editing PowerShell source files.
> Place in `.github/instructions/` directory.
>
> **Tip**: You can also use this as a custom agent instead. If you want
> refactoring rules ONLY when explicitly requested, create a
> `refactorer.agent.md` instead (see agent templates).

## Core Principle

> **Never change functionality during a refactoring.**
> Refactoring improves structure while preserving behavior.

## Before Refactoring

1. Ensure all existing tests pass (`Invoke-Pester`)
2. Understand the current behavior before changing anything
3. Make a plan — list the refactorings you will perform

## Refactoring Rules

- Make one refactoring at a time, run tests between each
- Never add new features or remove existing functionality
- Keep the public API unchanged (function names, parameters, outputs)
- Preserve backward compatibility

## Common Refactorings

### Extract Function

When a block of code does a distinct task, extract it:

```powershell
# Before
function Get-Report {
    # 50 lines of data gathering
    # 30 lines of formatting
}

# After
function Get-Report {
    $data = Get-ReportData
    Format-ReportOutput -Data $data
}
```

### Simplify Conditionals

Replace nested `if/else` with early returns or `switch`:

```powershell
# Before
if ($condition1) {
    if ($condition2) {
        # deep nesting
    }
}

# After — guard clauses
if (-not $condition1) { return }
if (-not $condition2) { return }
# main logic at top level
```

### Remove Code Duplication

Extract shared logic into a private helper function.

## After Refactoring

1. Run all tests — every test must still pass
2. Run PSScriptAnalyzer — no new warnings
3. Explain each change and why it improves the code
4. Verify no behavioral changes via `git diff`
