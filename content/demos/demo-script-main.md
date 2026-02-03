# Main Demo Script: Agentic Workflow in Action

## Overview

This is the primary demonstration that showcases all agentic coding concepts working together. Use this for:
- The synthesis demo in the 2-hour session (15 min)
- The extended live build in the 4-hour session (30-35 min)

## Demo Environment Setup

### Before the Presentation

1. **Create empty demo directory**:
   ```powershell
   mkdir C:\Demo\AgenticDemo
   cd C:\Demo\AgenticDemo
   git init
   ```

2. **Have VS Code ready** with:
   - Cline extension installed and configured
   - Clean Cline chat history
   - Terminal visible
   - Explorer visible

3. **Pre-create .clinerules** (or create live for effect):
   ```
   Create file: .clinerules
   Content: See below
   ```

4. **Test your API connection** before going live

---

## Demo .clinerules File

```markdown
# AgenticDemo Project Rules

## Code Standards
- Use approved PowerShell verbs (Get, Set, Test, New, etc.)
- Always include [CmdletBinding()] on all functions
- Use parameter validation attributes (Mandatory, ValidateNotNullOrEmpty)
- Follow existing patterns in the codebase

## Testing Requirements
- Create Pester tests for every new function
- Place tests in tests/ directory with naming: [Function].Tests.ps1
- Tests must cover: success path, error cases, edge cases
- Run Invoke-Pester before reporting completion
- Do not finish until all tests pass

## Documentation
- Include comment-based help (.SYNOPSIS, .PARAMETER, .EXAMPLE)
- Minimum one example per public function

## Error Handling
- Use try/catch for operations that can fail
- Provide meaningful error messages
- Use Write-Error for non-terminating, throw for terminating

## Project Structure
- Public functions in source/Public/
- Private helpers in source/Private/
- Tests in tests/
```

---

## Demo Part 1: Setup (3-5 minutes)

### Talking Points While Doing This:

> "Let's start with nothing but an empty Git repository. This is what the AI sees right now - absolutely nothing. Watch how it will build understanding as we add structure."

### Actions:

1. **Show empty directory**:
   ```powershell
   dir    # Shows nothing
   ```

2. **Create .clinerules** (if doing live):
   > "First, let me add my instruction file. This teaches the AI my standards."
   
   - Create the file with content above
   - Briefly highlight key rules (don't read everything)

3. **Point out key rules**:
   > "Notice I'm telling it: always create tests, always run them, don't finish until they pass. This is how we get self-verification."

---

## Demo Part 2: Initial Module Creation (7-10 minutes)

### The Prompt:

```
Create a PowerShell module called ConfigValidator for validating JSON and YAML configuration files. Include:
- A proper module structure
- A function to validate JSON config files against a schema
- Comprehensive tests
```

### What to Highlight While Agent Works:

1. **OBSERVE Phase**:
   > "Watch - it's reading the .clinerules first. It's learning my standards before writing anything."
   
   > "It's also checking the directory structure. Right now it sees almost nothing, so it knows to create everything from scratch."

2. **PLAN Phase** (if agent shows planning):
   > "See how it's planning what to create? It's not just diving in - it's thinking about structure."

3. **ACT Phase**:
   > "Now it's creating files. Notice I'm not copy-pasting anything. It's writing directly to the filesystem."
   
   Point out as files are created:
   - Module manifest (.psd1)
   - Root module (.psm1)
   - Function files
   - Test files
   - Folder structure

4. **VERIFY Phase**:
   > "Here's the key moment - it's running the tests automatically."
   
   > "This is self-verification. I didn't ask it to run tests - my .clinerules said to always run them."

### If Tests Pass First Try:
> "All tests passed. The agent is giving me working code, not just 'maybe' code."

### If Tests Fail (Even Better for Demo!):
> "Look - a test failed. Watch what happens next."
> "It's analyzing the failure... now it's fixing the code... and running tests again."
> "THIS is the power of agentic coding - it iterates until it works."

---

## Demo Part 3: Adding a Feature (5-7 minutes)

### The Prompt:

```
Add a function to validate YAML configuration files. Follow the same patterns as the JSON validator.
```

### What to Highlight:

1. **Context Awareness**:
   > "Notice I didn't have to explain my patterns again. It will read the existing JSON validator and match its style."

2. **Pattern Recognition**:
   > "See how it's looking at the existing code? It's learning how I structured the JSON validator."

3. **Consistency**:
   > "The YAML function matches the JSON function in style, parameters, and error handling. Same patterns, different format."

4. **New Tests**:
   > "It automatically created tests matching the pattern of existing tests."

5. **Run All Tests**:
   > "It's running ALL tests - not just new ones. Making sure it didn't break anything."

---

## Demo Part 4: Show Traceability (3-5 minutes)

### What to Show:

1. **Git Status**:
   ```powershell
   git status
   ```
   > "Look at all these new files. Every single one was created by the agent."

2. **Git Diff** (for a specific file):
   ```powershell
   git diff --no-index /dev/null source/Public/Test-JsonConfig.ps1 | head -50
   ```
   > "I can see exactly what was created. Full accountability."

3. **Highlight the Verification**:
   > "And I know it works because the tests passed. Not hope - proof."

---

## Demo Part 5: Commit (1-2 minutes)

### The Prompt (Optional):
```
Suggest a conventional commit message for these changes.
```

### Or Commit Manually:
```powershell
git add .
git commit -m "feat: add ConfigValidator module with JSON and YAML validation

- Created module structure with manifest
- Added Test-JsonConfig function with schema validation
- Added Test-YamlConfig function with schema validation  
- Comprehensive Pester tests for both functions

🤖 Generated with Cline assistance"
```

### Talking Point:
> "Now I have full git history. Anyone can see what was created, and it's documented that AI helped."

---

## Key Messages to Reinforce

Throughout the demo, return to these points:

### 1. Autonomous Execution
> "I described what I wanted. The AI handled the how."

### 2. Context Awareness  
> "It learned my patterns from the .clinerules and existing code."

### 3. Self-Verification
> "It tested its own work and fixed issues before I even saw them."

### 4. Traceability
> "Git shows me exactly what changed. No mystery."

### 5. Time Savings
> "What we just built in [X] minutes would have taken me [much longer] manually."

---

## Troubleshooting

### If API Fails:
- Have pre-built fallback project ready
- Show recorded video as backup
- Explain what would happen

### If Tests Keep Failing:
- This can be good for demo (shows iteration)
- If stuck after 2-3 tries, intervene with guidance
- "Let me give it a hint..." and add clarification

### If Agent Goes Wrong Direction:
- Use Cline's checkpoint/rollback
- "Watch me roll this back and try a different approach"
- This demonstrates the safety of the system

### If Too Slow:
- Cut to pre-recorded version
- "In interest of time, here's what happens next..."

---

## Timing Guide

| Section | 2-Hour Version | 4-Hour Version |
|---------|---------------|----------------|
| Setup | 2 min | 3-5 min |
| Initial Module | 5 min | 10-12 min |
| Add Feature | 3 min | 7-10 min |
| Traceability | 3 min | 5 min |
| Commit | 2 min | 2 min |
| **Total** | **15 min** | **30-35 min** |

---

## Post-Demo Summary Slide

After the demo, show this summary:

```
┌─────────────────────────────────────────────────────────────────┐
│                    WHAT WE JUST SAW                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   Starting Point:                                               │
│   • Empty Git repository                                       │
│   • One instruction file (.clinerules)                         │
│                                                                 │
│   Ending Point:                                                 │
│   • Complete module structure                                  │
│   • Two validated functions                                    │
│   • Comprehensive test suite                                   │
│   • All tests passing                                          │
│   • Full Git history                                           │
│                                                                 │
│   What I Did:                                                  │
│   • Described requirements in natural language                 │
│   • Reviewed the results                                       │
│   • Committed the changes                                      │
│                                                                 │
│   What AI Did:                                                 │
│   • Created all files                                          │
│   • Wrote all code                                             │
│   • Created all tests                                          │
│   • Ran tests and fixed issues                                 │
│   • Verified everything works                                  │
│                                                                 │
│   Time: ~15 minutes                                            │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘