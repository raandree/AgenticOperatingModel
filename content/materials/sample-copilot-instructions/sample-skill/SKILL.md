---
name: sampler-build-debug
description: >-
  Debug and troubleshoot Sampler-based PowerShell module builds
  and Pester 5 test failures. Covers running builds safely
  (without freezing VS Code), reading Pester results, diagnosing
  common mock/assertion failures, and fixing tests.
  USE FOR: build fails, test fails, Pester errors, troubleshoot
  build, debug tests, run build, Sampler build, module build,
  Pester mock issues, VS Code freezes during build.
  DO NOT USE FOR: creating new modules from scratch, Azure
  deployments, CI/CD pipeline config.
---

# Sampler Build Debug Skill

> This is a sample `.github/skills/sampler-build-debug/SKILL.md` file.
> Place inside a folder under `.github/skills/` in your repository.
> Skills are **auto-activated** when your task matches the description keywords.

## How Skills Work

Unlike instruction files (always-on) or agents (manually selected),
skills are loaded **on demand** when Copilot detects that your request
matches the keywords in the `description` field above.

## When This Skill Activates

- User says "my build is failing"
- User says "Pester tests won't pass"
- User mentions "ModuleBuilder" or "Sampler" errors
- User reports VS Code freezing during builds

## Common Build Errors

### ModuleBuilder Compilation Failures

```
ERROR: Failed to build module 'MyModule'
```

**Cause**: Syntax error in a function file prevents compilation.

**Fix**:

1. Run `build.ps1 -ResolveDependency -Tasks build` in terminal
2. Check the error output for the offending file
3. Fix the syntax error in the source file
4. Re-run the build

### Pester Mock Scope Issues

```
CommandNotFoundException: Could not find Mock for 'Get-Something'
```

**Cause**: Mock defined in wrong scope or `InModuleScope` not used.

**Fix**:

```powershell
# Wrong - mock not visible inside module scope
Mock -CommandName Get-Something -MockWith { 'test' }

# Correct - mock inside InModuleScope
InModuleScope 'MyModule' {
    Mock -CommandName Get-Something -MockWith { 'test' }
}
```

### VS Code Freezes During Build

**Cause**: Running `Invoke-Pester` or `build.ps1` directly in the
integrated terminal blocks the VS Code UI thread.

**Fix**: Use `Start-Process` to run builds in a detached process:

```powershell
Start-Process -FilePath pwsh -ArgumentList @(
    '-NoProfile', '-NonInteractive', '-Command',
    "Set-Location '$PWD'; .\build.ps1 -Tasks test *>&1 | " +
    "Out-File -FilePath 'output\test.log' -Encoding utf8"
) -WindowStyle Hidden -PassThru
```

Then monitor `output/test.log` for completion.

## Diagnostic Steps

1. Run `build.ps1 -ResolveDependency -Tasks build`
2. Check `output/` directory for compiled module
3. Run `Invoke-Pester -Path tests/ -Output Detailed`
4. Check for `RequiredModules.psd1` version mismatches
5. Verify `build.yaml` task configuration

## Key Files to Check

| File | What to Look For |
|------|-----------------|
| `build.yaml` | Task definitions, Pester config |
| `RequiredModules.psd1` | Dependency versions |
| `source/*.psm1` | Root module dot-sourcing |
| `tests/*.Tests.ps1` | Test syntax and mocks |
| `output/testResults.xml` | Detailed test results |
