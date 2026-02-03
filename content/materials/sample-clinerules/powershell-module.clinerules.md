# PowerShell Module Development Rules

## Code Standards

### Function Structure
- Use approved PowerShell verbs (Get, Set, New, Remove, Test, Invoke, etc.)
- Always include `[CmdletBinding()]` on all functions
- Use `[Parameter()]` attributes with appropriate decorators
- Include parameter validation: `[ValidateNotNullOrEmpty()]`, `[ValidateSet()]`, etc.
- Follow the existing naming conventions in the codebase

### Code Style
- Use PascalCase for function names and parameters
- Use consistent indentation (4 spaces preferred)
- Include meaningful comments for complex logic
- Follow PSScriptAnalyzer rules

### Module Structure
- Place public (exported) functions in `src/Public/`
- Place private (internal) functions in `src/Private/`
- One function per file, file name matches function name
- Root module (.psm1) should dot-source all function files

## Testing Requirements

### Test Creation
- Create Pester tests for every new public function
- Place tests in `tests/` directory
- Test file naming: `[FunctionName].Tests.ps1`

### Test Coverage
- Tests must cover: success path, error handling, edge cases
- Include tests for null and empty inputs
- Test parameter validation behavior
- Test error message content where appropriate

### Test Execution
- Run `Invoke-Pester` before reporting completion
- All tests must pass before finishing
- If tests fail, analyze the failure and fix the code
- Report test results summary to user

## Documentation

### Comment-Based Help
- Include `.SYNOPSIS` with brief description
- Include `.DESCRIPTION` for detailed explanation (if needed)
- Document all parameters with `.PARAMETER`
- Include at least one `.EXAMPLE` with realistic usage
- Add `.OUTPUTS` and `.NOTES` where helpful

### README
- Update README.md when adding new features
- Include installation and usage instructions
- Document prerequisites and dependencies

## Error Handling

### Exception Handling
- Use try/catch for operations that can fail
- Provide meaningful error messages
- Include context in error messages (what operation failed, with what input)

### Error Types
- Use `Write-Error` for non-terminating errors
- Use `throw` for terminating errors
- Use `Write-Warning` for recoverable issues
- Use `Write-Verbose` for diagnostic information

## Git Practices

### Commits
- Suggest conventional commit messages (feat:, fix:, docs:, refactor:)
- Include description of what was added/changed
- Keep commits atomic and focused

### Security
- Never commit secrets, credentials, or API keys
- Never include personal information
- Use SecretManagement module references for sensitive data

## Execution Style

### Approach
- Analyze existing code patterns before creating new code
- Match the style of existing functions in the module
- Consider dependencies and imports needed
- Create files in appropriate locations

### Verification
- Run tests automatically after code changes
- Run PSScriptAnalyzer if available
- Report what was created/modified
- Include test results in completion report