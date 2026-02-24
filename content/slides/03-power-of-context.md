# Module 3: The Power of Context

## Slide 3.1: The Context Problem

# Why Context Changes Everything

### Without context, AI produces:
- ❌ Generic code that doesn't fit your project
- ❌ Wrong naming conventions
- ❌ Inconsistent patterns
- ❌ Missing project-specific requirements

### With context, AI produces:
- ✅ Code that matches your existing style
- ✅ Correct naming conventions
- ✅ Consistent with existing patterns
- ✅ Aware of project requirements

> **Context is what transforms a generic AI into YOUR coding partner.**

---

## Slide 3.2: Git is the Context Provider

# Git Gives AI a Brain

```
┌─────────────────────────────────────────────────────────────────┐
│                     GIT AS AI CONTEXT                           │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   Your Git Repository                                           │
│   ═══════════════════                                          │
│                                                                 │
│   ┌─────────────────┐      ┌─────────────────────────────┐    │
│   │ File Structure  │──────│ "This is how code is        │    │
│   │                 │      │  organized in this project" │    │
│   └─────────────────┘      └─────────────────────────────┘    │
│                                                                 │
│   ┌─────────────────┐      ┌─────────────────────────────┐    │
│   │ Existing Code   │──────│ "This is the style and      │    │
│   │                 │      │  patterns used here"        │    │
│   └─────────────────┘      └─────────────────────────────┘    │
│                                                                 │
│   ┌─────────────────┐      ┌─────────────────────────────┐    │
│   │ Config Files    │──────│ "These are the rules and    │    │
│   │                 │      │  dependencies"              │    │
│   └─────────────────┘      └─────────────────────────────┘    │
│                                                                 │
│   ┌─────────────────┐      ┌─────────────────────────────┐    │
│   │ Commit History  │──────│ "This is what's been        │    │
│   │                 │      │  worked on recently"        │    │
│   └─────────────────┘      └─────────────────────────────┘    │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Slide 3.3: What the Agent Observes

# Repository as Knowledge Base

```
📁 YourProject/
│
├── 📁 src/
│   ├── 📁 Public/                 ──▶ "Exported functions go here"
│   │   ├── Get-Something.ps1
│   │   └── Set-Something.ps1
│   └── 📁 Private/                ──▶ "Internal helpers here"
│       └── Initialize-Module.ps1
│
├── 📁 tests/                      ──▶ "Tests mirror src structure"
│   ├── Get-Something.Tests.ps1
│   └── Set-Something.Tests.ps1
│
├── � .github/
│   ├── 📄 copilot-instructions.md  ──▶ "AI rules"
│   └── 📁 instructions/
│       └── 📄 powershell.instructions.md
├── 📄 YourModule.psd1             ──▶ "Module metadata"
├── 📄 YourModule.psm1             ──▶ "Root module"
├── 📄 README.md                   ──▶ "Project purpose"
└── 📄 .gitignore                  ──▶ "What to ignore"
```

### The agent learns:
- Public vs Private function locations
- Test file naming conventions
- Module structure patterns

---

## Slide 3.4: Pattern Recognition

# AI Learns From Your Codebase

### When agent reads your existing code:

```powershell
# Existing function in your project
function Get-UserData {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$UserId
    )
    
    try {
        # Implementation
    }
    catch {
        Write-Error "Failed to get user data: $_"
        throw
    }
}
```

### Agent observes patterns:
- ✅ Uses `[CmdletBinding()]`
- ✅ Uses `[Parameter(Mandatory)]`
- ✅ Uses `[ValidateNotNullOrEmpty()]`
- ✅ Wraps in try/catch
- ✅ Uses `Write-Error` before throw

### New code will match these patterns!

---

## Slide 3.5: The README Effect

# README Provides Purpose

```markdown
# ConfigValidator Module

A PowerShell module for validating configuration files
against defined schemas.

## Features
- JSON schema validation
- YAML configuration support
- Custom validation rules
- Detailed error reporting

## Usage
```powershell
Test-ConfigFile -Path ./config.json -Schema ./schema.json
` ``
```

### What agent learns:
- This is a **validation** module
- It works with **JSON and YAML**
- Functions should provide **detailed error reporting**
- Naming pattern: `Test-*`, `Validate-*`

> Your README isn't just documentation—it's AI context.

---

## Slide 3.6: Configuration File Context

# Manifests & Configs Inform AI

### Module Manifest (.psd1):
```powershell
@{
    ModuleVersion = '1.0.0'
    FunctionsToExport = @('Test-*', 'Get-*', 'Set-*')
    RequiredModules = @('PSYaml')
}
```

### Agent learns:
- Function naming patterns to follow
- Dependencies available to use
- Export conventions

### Other config files:
- `PSScriptAnalyzer.settings.psd1` → Code style rules
- `.editorconfig` → Formatting preferences
- `pester.config.ps1` → Testing conventions

---

## Slide 3.7: Traceability - The Git Advantage

# Knowing What AI Changed

This is **critical** for trust:

```
┌─────────────────────────────────────────────────────────────────┐
│                    TRACEABILITY FLOW                            │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Before Agent Work          After Agent Work                   │
│  ─────────────────          ────────────────                   │
│                                                                 │
│  📁 Your Repo                📁 Your Repo                      │
│  └── (existing files)        ├── (existing files)              │
│                              ├── + New file 1    ← NEW         │
│                              ├── + New file 2    ← NEW         │
│                              └── ~ Modified file ← CHANGED     │
│                                                                 │
│                     ┌───────────────────┐                      │
│                     │    git diff       │                      │
│                     └─────────┬─────────┘                      │
│                               │                                 │
│                               ▼                                 │
│                     ┌───────────────────┐                      │
│                     │ EXACTLY what      │                      │
│                     │ agent changed     │                      │
│                     └───────────────────┘                      │
│                                                                 │
│  YOU SEE: Every line added, modified, or deleted               │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Slide 3.8: Demo - Git Diff

# See What Changed

```diff
diff --git a/source/Public/Test-ConfigFile.ps1 b/source/Public/Test-ConfigFile.ps1
new file mode 100644
--- /dev/null
+++ b/source/Public/Test-ConfigFile.ps1
@@ -0,0 +1,45 @@
+function Test-ConfigFile {
+    [CmdletBinding()]
+    param(
+        [Parameter(Mandatory)]
+        [string]$Path,
+        
+        [Parameter(Mandatory)]
+        [string]$SchemaPath
+    )
+    
+    # ... rest of implementation
+}
```

### You can see:
- Exactly what was created
- Every line of code
- No hidden changes
- Full accountability

---

## Slide 3.9: Checkpoint System

# Rollback When Needed

```
┌─────────────────────────────────────────────────────────────────┐
│                    CHECKPOINT TIMELINE                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Time ───────────────────────────────────────────────────────▶ │
│                                                                 │
│    ●──────────●──────────●──────────●──────────●               │
│    │          │          │          │          │               │
│   Start    Checkpoint  Checkpoint  Checkpoint  Current         │
│            #1          #2          #3          State           │
│    │          │          │          │          │               │
│    ▼          ▼          ▼          ▼          ▼               │
│  Clean     Feature    Tests      Oops!      Working           │
│  State     Added      Added      Broken     Again             │
│                                                                 │
│                          │                                      │
│                          │ "I don't like this direction"       │
│                          │                                      │
│                          └────────▶ ROLLBACK TO #2             │
│                                                                 │
│  Agent: "Restored to state after tests were added"             │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

You're never stuck. You can always go back.

---

## Slide 3.10: Commit Strategies

# Documenting AI Contributions

### Option 1: Conventional Commits
```
feat(validation): add config file validation function

- Created Test-ConfigFile function
- Added comprehensive Pester tests
- Integrated with existing schema validation

🤖 Generated with Copilot Agent Mode assistance
```

### Option 2: Branch Strategy
```
main
  └── feature/add-validation
        └── ai/config-validation  ← AI works here
```

### Option 3: Co-authored Commits
```
feat: add validation function

Co-authored-by: AI Assistant <ai@example.com>
```

---

## Slide 3.11: Best Practices for Context

# Maximize AI Effectiveness

### DO ✅
- **Work in Git repos** — Always initialize Git first
- **Meaningful structure** — Organize files logically
- **Good README** — Explain project purpose
- **Consistent patterns** — AI learns from consistency
- **Descriptive names** — Files and functions

### DON'T ❌
- **Don't work outside Git** — No context, poor results
- **Don't have random file locations** — Confuses AI
- **Don't skip README** — AI needs to understand purpose
- **Don't mix styles** — Inconsistency → inconsistent output

---

## Slide 3.12: Demo - Context in Action

# Watch AI Use Context

### Demo: Adding a Function to Existing Project

1. **Show** existing project structure
2. **Show** existing code patterns
3. **Request** new function
4. **Watch** agent analyze context
5. **See** new code matching existing patterns
6. **Review** diff showing changes
7. **Commit** with meaningful message

### Key observation:
The agent produces code that **fits** because it **learned** from your repository.

---

## Slide 3.13: Key Takeaway

# Git Enables Intelligent AI

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│    WITHOUT GIT                      WITH GIT                   │
│                                                                 │
│    AI asks:                         AI knows:                  │
│    "What style?"                    "Use this style"           │
│    "Where to put it?"               "Put it here"              │
│    "What patterns?"                 "Match these patterns"     │
│    "What conventions?"              "Follow these conventions" │
│                                                                 │
│    Result:                          Result:                    │
│    Generic code                     Tailored code              │
│    Doesn't fit                      Fits perfectly             │
│    Needs rework                     Ready to commit            │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

> Git isn't just version control—it's **how you give AI understanding** 
> and **maintain accountability** for what it changes.

---

## Speaker Notes - Module 3

### Timing: 20-25 minutes

### Key Points to Emphasize:
1. **Context transforms generic AI into your coding partner**
2. AI learns from your repository: structure, patterns, conventions
3. Git provides **traceability** — you always know what changed
4. **Checkpoints** mean you can always roll back

### Demo Tips:
- Show a real repository with existing patterns
- Have agent create something new
- Highlight how output matches existing code style
- Show git diff to prove traceability
- Demonstrate a rollback if time permits

### Common Questions:
- "Does it read ALL files?" → It reads relevant files based on task
- "What about large repos?" → Smart context selection
- "Private/sensitive files?" → Can use .gitignore patterns

### Transition to Module 4:
"Context helps AI understand your project. But how do you teach it your specific rules? That's what custom instructions and instruction files are for..."