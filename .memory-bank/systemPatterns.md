# System Patterns — The Agentic Operating Model

## Presentation Architecture

### Three-Version Architecture (DRY)

```
┌──────────────────────────────────────────────────────────────────────┐
│                  THREE-VERSION ARCHITECTURE                          │
├──────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  SHARED CONTENT (single source of truth)                            │
│  ├── content/slides/01..10  — Module content + Version Guide tables │
│  ├── content/demos/         — Demo scripts                          │
│  └── content/materials/     — Cheat sheets, samples                 │
│                                                                      │
│  ORCHESTRATION (agenda/presentation-agenda.md)                      │
│  ├── Module Inclusion Matrix     — which modules per version        │
│  ├── Slide Inclusion Guide       — which slides per version         │
│  ├── Version 1: 1h Keynote       — timing + facilitator notes       │
│  ├── Version 2: 2h Standard      — timing + facilitator notes       │
│  └── Version 3: 4h Workshop      — timing + facilitator notes       │
│                                                                      │
│  DRY RULE: Update content ONCE → all versions inherit the change.   │
│  Only update the agenda when adding/removing/reordering modules.    │
│                                                                      │
│  MARP BUILD PIPELINE                                                │
│  ├── content/slides/marp-presentation.md  — Source (tagged slides)  │
│  │   └── <!-- version: 1h 2h 4h --> tags on each slide             │
│  ├── content/pptx/Build-MarpVersions.ps1  — Build script           │
│  └── content/pptx/marp-{1h,2h,4h}-*.md   — Generated output       │
│                                                                      │
│  Workflow: Edit source → Build → Test-SlideOverflow → fix → Build  │
│           → Export PPTX → Present                                  │
│                                                                      │
│  OVERFLOW GUARDRAIL (Layer 6 of the deck itself)                    │
│  ├── content/pptx/overflow-check.mjs       — Puppeteer detector    │
│  ├── content/pptx/Test-SlideOverflow.ps1   — PS wrapper             │
│  └── content/pptx/New-SlideReviewReport.ps1 — Side-by-side report  │
│                                                                      │
│  Marp silently clips content > 720 px. The detector renders each   │
│  variant via marp-cli, loads the HTML in headless Chromium, and    │
│  compares each <section>.scrollHeight to the SVG viewBox height.  │
│  Build-MarpVersions.ps1 -CheckOverflow exits non-zero on overflow. │
│  See Skills/marp-slide-overflow/SKILL.md for the full pattern.    │
│                                                                      │
└──────────────────────────────────────────────────────────────────────┘
```

### Session Flow Pattern

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        PRESENTATION FLOW ARCHITECTURE                        │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌─────────────┐   ┌─────────────┐   ┌─────────────┐   ┌─────────────┐     │
│  │   INTRO     │──▶│   THEORY    │──▶│    DEMO     │──▶│  PRACTICE   │     │
│  │             │   │             │   │             │   │             │     │
│  │ • Hook      │   │ • Concepts  │   │ • Live code │   │ • Exercises │     │
│  │ • Context   │   │ • Diagrams  │   │ • Q&A       │   │ • Apply     │     │
│  │ • Agenda    │   │ • Examples  │   │ • Debug     │   │ • Discuss   │     │
│  └─────────────┘   └─────────────┘   └─────────────┘   └─────────────┘     │
│        │                 │                 │                 │              │
│        ▼                 ▼                 ▼                 ▼              │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │                    CHECKPOINT & QUESTIONS                            │   │
│  │              (Brief pause between each section)                      │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Module Pattern (Repeated for Each Topic)

Each major topic follows this pattern:
1. **Why** (2-3 min): Explain the problem this solves
2. **What** (5-7 min): Introduce the concept/tool
3. **How** (10-15 min): Live demonstration
4. **Practice** (5-10 min): Hands-on exercise or discussion

## Agentic Coding Patterns for PowerShell

### Pattern 1: Task-Driven Development

```
User Request → Agent Analysis → Plan Creation → Execution → Verification
     │              │                │              │            │
     ▼              ▼                ▼              ▼            ▼
"Add Azure       Reads           Creates       Writes       Runs tests,
 connection"    existing        step-by-step   code,        checks lint,
                module          task list      creates      reports
                structure                      tests        results
```

**PowerShell Example Flow**:
```
1. User: "Add a function to connect to Azure using managed identity"
2. Agent: Analyzes existing module, finds patterns
3. Agent: Plans - Create function, add tests, update manifest
4. Agent: Writes Connect-AzureManagedIdentity.ps1
5. Agent: Creates Connect-AzureManagedIdentity.Tests.ps1
6. Agent: Runs Invoke-Pester, reports results
7. Agent: Fixes any failing tests or lint issues
```

### Pattern 2: Test-First with AI

```
┌─────────────────────────────────────────────────────────────┐
│                  TEST-FIRST AI PATTERN                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Step 1: Define Requirements in Natural Language            │
│  ─────────────────────────────────────────────             │
│  "I need a function that validates Azure resource IDs"      │
│                                                             │
│  Step 2: Agent Generates Tests FIRST                        │
│  ─────────────────────────────────                         │
│  Describe 'Test-AzureResourceId' {                         │
│      It 'Returns true for valid resource ID' { }           │
│      It 'Returns false for invalid format' { }             │
│      It 'Handles null input gracefully' { }                │
│  }                                                          │
│                                                             │
│  Step 3: Agent Implements to Pass Tests                     │
│  ─────────────────────────────────────                     │
│  function Test-AzureResourceId {                           │
│      # Implementation driven by test requirements          │
│  }                                                          │
│                                                             │
│  Step 4: Agent Runs Tests, Iterates Until Green             │
│  ─────────────────────────────────────────────             │
│  Invoke-Pester → All tests pass → Done                     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Pattern 3: Git-Aware Development

```
┌─────────────────────────────────────────────────────────────┐
│                  GIT-AWARE AI WORKFLOW                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  BEFORE CHANGES                                             │
│  ─────────────                                              │
│  • Agent reads repo structure for context                   │
│  • Agent checks recent commits for patterns                 │
│  • Agent identifies coding standards from history           │
│                                                             │
│  DURING CHANGES                                             │
│  ──────────────                                             │
│  • Copilot Agent Mode creates undo history               │
│  • Each logical unit = potential commit                     │
│  • Agent can undo changes if tests fail                    │
│                                                             │
│  AFTER CHANGES                                              │
│  ─────────────                                              │
│  • User reviews diff before committing                      │
│  • Commit messages document AI involvement                  │
│  • History provides traceability                           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Pattern 4: Instruction-Driven Consistency

```text
.github/
├── copilot-instructions.md    # Always-on project rules
├── instructions/
│   ├── powershell.instructions.md  # PowerShell-specific rules
│   └── testing.instructions.md     # Testing standards
├── agents/
│   ├── software-engineer.agent.md  # Dev agent with handoffs
│   ├── security-reviewer.agent.md  # QA agent
│   └── document.agent.md           # Documentation agent
├── skills/
│   └── sampler-build-debug/
│       └── SKILL.md                # Domain knowledge, auto-loaded
└── prompts/
    └── CodeReview.prompt.md        # Reusable /slash command
```

**Effect**: Same prompts yield consistent results across team members

### Pattern 4a: Multi-Agent Handoff Pipeline

```
┌─────────────────────────────────────────────────────────────┐
│              MULTI-AGENT HANDOFF PIPELINE              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  software-engineer.agent.md                                 │
│  ───────────────────────────                                 │
│  agents: ['security-reviewer']                               │
│  handoffs:                                                   │
│    - label: Run Security Review                              │
│      agent: security-reviewer                                │
│                    │                                          │
│                    ▼                                          │
│  security-reviewer.agent.md                                  │
│  ───────────────────────────                                 │
│  handoffs:                                                   │
│    - label: Fix Issues Found                                 │
│      agent: software-engineer     ← back to dev              │
│                    │                                          │
│              PASS? ▼                                          │
│            Deploy to production                               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Effect**: Agents chain together for Dev → QA → Production workflows

### Pattern 5: Self-Verification Loop

```
┌─────────────────────────────────────────────────────────────┐
│              SELF-VERIFICATION PATTERN                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   Agent writes code                                         │
│         │                                                   │
│         ▼                                                   │
│   ┌─────────────┐                                          │
│   │ Run Pester  │──── FAIL ───▶ Analyze failure            │
│   └─────────────┘                     │                     │
│         │                             │                     │
│       PASS                            ▼                     │
│         │                      Fix the code                 │
│         ▼                             │                     │
│   ┌─────────────┐                     │                     │
│   │ Run Linter  │◀────────────────────┘                     │
│   └─────────────┘                                          │
│         │                                                   │
│       PASS ───▶ Report success to user                     │
│         │                                                   │
│       FAIL ───▶ Fix lint issues ───▶ Re-run               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## DevOps Integration Patterns

### Pattern 8: Cross-Machine Instruction Sync (CopilotAtelier)

```
┌─────────────────────────────────────────────────────────┐
│           CROSS-MACHINE INSTRUCTION SYNC                │
├─────────────────────────────────────────────────────────┤
│                                                             │
│  OneDrive/CopilotAtelier/                                   │
│  ├── Instructions/    ────┬─────  Synced via OneDrive         │
│  ├── Skills/          ────┤                                  │
│  ├── Agents/          ────┤                                  │
│  └── Prompts/         ────┘                                  │
│                             │                                  │
│                             ▼                                  │
│  VS Code Settings (chat.*FilesLocations)                     │
│       │                                                      │
│       ├──── Machine A: Same rules, skills, agents             │
│       ├──── Machine B: Same rules, skills, agents             │
│       └──── Machine C: Same rules, skills, agents             │
│                                                             │
│  Effect: Personal coding standards follow you everywhere    │
│  Benefit: No per-project .github/ duplication               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Pattern 9: Agent Mode Workflow (Technical Writer)

```
┌─────────────────────────────────────────────────────────────┐
│         TECHNICAL-WRITER AGENT MODE WORKFLOW             │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Phase 0        Phase 1        Phase 2        Phase 3      │
│  Scope &        Repo &         External       Outline &    │
│  Planning  ──▶  Analysis  ──▶  Research  ──▶  Structure    │
│       │              │              │              │           │
│       ▼              ▼              ▼              ▼           │
│  Phase 4        Phase 5        Phase 6                      │
│  Content        Editing &      Publication &                │
│  Creation  ──▶  QA        ──▶  Documentation                │
│                                     │                        │
│                                     ▼                        │
│                              Update Memory Bank             │
│                                                             │
│  Key Features:                                              │
│  • Zero-confirmation policy (autonomous execution)          │
│  • Mandatory source citations for all factual claims        │
│  • Pre-publication quality gates                            │
│  • Subagent delegation for research (context management)    │
│  • Article templates: tech blog, API docs, newspaper        │
│  • CRAAP test for source evaluation                        │
│  • Never pushes to remote without explicit authorization     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Pattern 6: Pipeline-Compatible Output

```yaml
# AI-generated code should be pipeline-ready
stages:
  - stage: Test
    jobs:
      - job: Pester
        steps:
          - pwsh: |
              # Agent writes code that works in CI
              Invoke-Pester -OutputFormat NUnitXml -OutputFile results.xml
          - task: PublishTestResults@2
            inputs:
              testResultsFormat: 'NUnit'
              testResultsFiles: 'results.xml'
```

**Instruction File Pattern**:
```markdown
## CI/CD Compatibility Rules
- All scripts must run non-interactively
- Use Write-Output, not Write-Host
- Exit codes must indicate success/failure
- Tests must output machine-readable results
```

### Pattern 7: Infrastructure as Code with AI

```
┌─────────────────────────────────────────────────────────────┐
│              IaC + AI WORKFLOW                               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  User: "Add a new Azure storage account to our Bicep"       │
│                                                             │
│  Agent Actions:                                             │
│  1. Read existing Bicep files to understand patterns        │
│  2. Check naming conventions from other resources           │
│  3. Generate storage account definition                     │
│  4. Add to appropriate module                               │
│  5. Update parameter files if needed                        │
│  6. Validate with `az bicep build`                         │
│  7. Report what was added                                   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## Anti-Patterns to Demonstrate

### ❌ Anti-Pattern 1: No Context Provided

```
# Bad: Starting fresh without project context
"Write me a PowerShell function to do X"

# Good: Git repo provides context automatically
# Agent sees existing patterns, naming, structure
```

### ❌ Anti-Pattern 2: No Verification

```
# Bad: Accepting AI output without testing
Agent writes code → User accepts → Deploy

# Good: AI verifies its own work
Agent writes code → Agent runs tests → Agent fixes issues → User reviews
```

### ❌ Anti-Pattern 3: Inconsistent Instructions

```
# Bad: Different team members give different instructions
Dev A: "Write code in my style"
Dev B: "Write code in my style"
Result: Inconsistent codebase

# Good: Shared copilot-instructions.md
.github/copilot-instructions.md → Consistent output
```

### ❌ Anti-Pattern 4: No Traceability

```
# Bad: Can't tell what AI changed
"Something is broken but I don't know what changed"

# Good: Git-centric workflow
Every change committed → diff shows exactly what AI did
```

## Demo Scenarios

### Scenario 1: Module Creation from Scratch
- Start with empty repo
- Define requirements in conversation
- Agent creates full module structure
- Agent writes initial functions with tests
- Agent runs and passes tests

### Scenario 2: Adding Feature to Existing Module
- Open existing PowerShell module
- Request new feature
- Agent analyzes existing patterns
- Agent implements matching style
- Agent creates matching tests

### Scenario 3: Debugging Session
- Start with failing tests
- Agent analyzes failures
- Agent proposes fixes
- Agent implements and verifies

### Scenario 4: Documentation Generation
- Point to undocumented module
- Agent reads all code
- Agent generates comment-based help
- Agent creates README
- Agent updates manifest

## Checkpoint System Pattern

```
┌─────────────────────────────────────────────────────────────┐
│           COPILOT AGENT MODE UNDO SYSTEM                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Timeline:                                                  │
│                                                             │
│  ──●────────●────────●────────●────────●──▶ Current        │
│    │        │        │        │        │                    │
│    V1       V2       V3       V4       V5                   │
│    │        │        │        │        │                    │
│    ▼        ▼        ▼        ▼        ▼                    │
│  Start   Feature  Tests    Broken!  Fixed                  │
│          added    added    (oops)                          │
│                                                             │
│  User can: Click "Undo" to revert last change              │
│  Agent: Restores state before breakage                     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## Presentation Visual Patterns

### Code-Along Format
```
┌────────────────────────────────────────────┐
│  LEFT SIDE          │  RIGHT SIDE          │
├────────────────────────────────────────────┤
│                     │                      │
│  VS Code            │  Slides/Notes        │
│  (Live coding)      │  (Key points)        │
│                     │                      │
│  • Terminal         │  • Bullet summary    │
│  • Editor           │  • Diagram           │
│  • Copilot chat     │  • Tips              │
│                     │                      │
└────────────────────────────────────────────┘
```

### Before/After Comparison
```
BEFORE (Traditional)         AFTER (Agentic)
──────────────────          ─────────────────
1. Think about design       1. Describe requirement
2. Write boilerplate        2. Agent writes code
3. Write logic              3. Agent writes tests
4. Write tests              4. Agent runs tests
5. Run tests                5. Agent fixes issues
6. Debug failures           6. Review & commit
7. Fix and repeat
8. Finally commit

Time: 2 hours               Time: 15 minutes