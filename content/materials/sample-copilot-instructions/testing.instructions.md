---
applyTo: "**/*.Tests.ps1"
---

# Pester Test File Instructions

> This is a sample `.github/instructions/testing.instructions.md` file.
> It applies ONLY when editing Pester test files matching `**/*.Tests.ps1`.
> Place in `.github/instructions/` directory.

## Pester Version

- Use Pester 5.x syntax exclusively
- Never use Pester 4.x patterns (no `Assert-*`, no `-TestName`)
- Use `Should -Be`, `Should -Throw`, etc.

## Test File Structure

```powershell
BeforeAll {
    $modulePath = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
    Import-Module $modulePath -Force
}

Describe 'Function-Name' {

    Context 'When called with valid parameters' {
        It 'Should return the expected result' {
            # Arrange / Act / Assert
        }
    }

    Context 'When called with invalid parameters' {
        It 'Should throw for null input' {
            { Function-Name -Name $null } | Should -Throw
        }
    }

    Context 'Edge cases' {
        It 'Should handle empty string' {
            Function-Name -Name '' | Should -BeNullOrEmpty
        }
    }
}
```

## Required Coverage

Every test file must include:

- **Success path**: At least one test for normal operation
- **Error path**: Test error handling and exceptions
- **Edge cases**: Null, empty, boundary values
- **Parameter validation**: Test mandatory and validated parameters

## Mocking Rules

- Mock external dependencies (file system, network, APIs)
- Use `InModuleScope` when mocking private functions
- Verify mock calls with `Should -Invoke`
- Never call real external services in unit tests

## Test Naming

- `Describe` block: Function name (e.g., `'Get-UserData'`)
- `Context` block: Scenario (e.g., `'When user exists'`)
- `It` block: Expected behavior (e.g., `'Should return user object'`)

## Assertions

- Use the most specific assertion available
- Prefer `Should -BeExactly` over `Should -Be` for strings
- Use `Should -HaveCount` for collections
- Use `Should -Throw -ExpectedMessage` to verify error messages
