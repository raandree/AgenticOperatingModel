---
applyTo: "**/*.ps1,**/*.psm1,**/*.psd1"
---

# PowerShell File Instructions

> This is a sample `.github/instructions/powershell.instructions.md` file.
> It applies ONLY when editing PowerShell files matching the `applyTo` pattern.
> Place in `.github/instructions/` directory.

## Code Style

- Use `[CmdletBinding()]` on all functions
- Use approved verbs from `Get-Verb`
- Include `[Parameter()]` attributes with validation
- Use PascalCase for function names and parameters
- Use 4-space indentation
- Follow PSScriptAnalyzer rules

## Function Template

```powershell
function Verb-Noun
{
    <#
        .SYNOPSIS
            Brief description.

        .DESCRIPTION
            Detailed description.

        .PARAMETER Name
            Parameter description.

        .EXAMPLE
            Verb-Noun -Name 'Example'

            Example description.
    #>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
    )

    # Implementation
}
```

## Error Handling

- Use `try/catch` for operations that can fail
- Use `Write-Error` for non-terminating errors
- Use `throw` for terminating errors
- Include context in error messages

## Testing

- Every public function must have a corresponding `.Tests.ps1` file
- Run `Invoke-Pester` to verify changes
- Fix any failing tests before completing
