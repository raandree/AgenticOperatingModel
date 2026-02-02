# Mastering Agentic Coding for PowerShell Developers & DevOps Engineers

## Presentation Agenda

**Presenter**: [Your Name]
**Duration**: 2-4 hours (flexible format)
**Tool Focus**: Cline (VS Code Extension)
**Audience**: PowerShell Developers, DevOps Engineers

---

## Quick Navigation

- [2-Hour Core Agenda](#2-hour-core-agenda) - Essential content
- [4-Hour Extended Agenda](#4-hour-extended-agenda) - Full workshop
- [Module Descriptions](#module-descriptions) - Detailed breakdowns
- [Demo Scenarios](#demo-scenarios) - Live coding plans

---

## 2-Hour Core Agenda

*Focused session covering essential agentic coding concepts*

| Time | Duration | Module | Type |
|------|----------|--------|------|
| 0:00 | 10 min | **Welcome & Introduction** | Presentation |
| 0:10 | 15 min | **What is Agentic Coding?** | Presentation + Demo |
| 0:25 | 20 min | **Git as AI Context Provider** | Presentation + Demo |
| 0:45 | 10 min | ☕ **Break** | - |
| 0:55 | 25 min | **Instruction Files & Agent Configuration** | Demo + Hands-on |
| 1:20 | 25 min | **Automated Testing for Self-Verification** | Demo |
| 1:45 | 15 min | **Wrap-up, Q&A & Next Steps** | Discussion |
| **2:00** | - | **End** | - |

### 2-Hour Flow Summary

```
┌────────────────────────────────────────────────────────────────────┐
│  0:00-0:45          │  BREAK  │  0:55-1:45          │  1:45-2:00  │
├────────────────────────────────────────────────────────────────────┤
│  FOUNDATIONS        │  10min  │  PRACTICAL          │  WRAP-UP    │
│  • What is Agentic  │         │  • Instruction      │  • Summary  │
│  • Git as Context   │         │  • Testing          │  • Q&A      │
│  • Core Concepts    │         │  • Live Demo        │  • Resources│
└────────────────────────────────────────────────────────────────────┘
```

---

## 4-Hour Extended Agenda

*Full workshop with hands-on exercises and advanced topics*

### Morning Session (2 hours)

| Time | Duration | Module | Type |
|------|----------|--------|------|
| 0:00 | 10 min | **Welcome & Introduction** | Presentation |
| 0:10 | 20 min | **What is Agentic Coding?** | Presentation + Demo |
| 0:30 | 25 min | **Git as AI Context Provider** | Presentation + Demo |
| 0:55 | 10 min | ☕ **Break** | - |
| 1:05 | 30 min | **Cline Deep Dive: Setup & Configuration** | Demo + Hands-on |
| 1:35 | 25 min | **Instruction Files & .clinerules** | Demo + Exercise |
| 2:00 | - | 🍽️ **Lunch Break (if applicable)** | - |

### Afternoon Session (2 hours)

| Time | Duration | Module | Type |
|------|----------|--------|------|
| 2:00 | 35 min | **Automated Testing with Pester** | Demo + Exercise |
| 2:35 | 10 min | ☕ **Break** | - |
| 2:45 | 30 min | **Live Build: PowerShell Module from Scratch** | Live Coding |
| 3:15 | 20 min | **Advanced Topics: MCP, Custom Modes, DevOps** | Presentation + Demo |
| 3:35 | 15 min | **Best Practices & Common Pitfalls** | Discussion |
| 3:50 | 10 min | **Wrap-up, Resources & Q&A** | Discussion |
| **4:00** | - | **End** | - |

### 4-Hour Flow Summary

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           MORNING (2 Hours)                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│  0:00-0:55     │ BREAK │  1:05-2:00                                         │
│  FOUNDATIONS   │ 10min │  CONFIGURATION                                     │
│  • Intro       │       │  • Cline Setup                                     │
│  • Agentic     │       │  • Instruction Files                               │
│  • Git Context │       │  • Hands-on Exercise                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                    LUNCH BREAK (Optional)                                    │
├─────────────────────────────────────────────────────────────────────────────┤
│                          AFTERNOON (2 Hours)                                 │
├─────────────────────────────────────────────────────────────────────────────┤
│  2:00-2:35     │ BREAK │  2:45-3:35          │  3:35-4:00                   │
│  TESTING       │ 10min │  PRACTICE           │  WRAP-UP                     │
│  • Pester      │       │  • Live Module Build│  • Best Practices            │
│  • Self-Verify │       │  • Advanced Topics  │  • Q&A                       │
│  • Exercise    │       │  • MCP & DevOps     │  • Resources                 │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Module Descriptions

### Module 1: Welcome & Introduction (10 min)

**Objectives**:
- Set expectations for the session
- Establish baseline knowledge of attendees
- Preview the learning journey

**Content**:
- Speaker introduction
- Quick poll: Who has used AI coding tools?
- Session objectives and agenda overview
- How to ask questions (throughout vs. dedicated Q&A)

**Materials**: Opening slides, poll tool (if virtual)

---

### Module 2: What is Agentic Coding? (15-20 min)

**Objectives**:
- Distinguish agentic AI from autocomplete/chat
- Understand the agent execution loop
- See why this matters for productivity

**Content**:

1. **The AI Coding Evolution** (5 min)
   - Autocomplete (single line suggestions)
   - Chat assistants (copy-paste workflow)
   - **Agentic coding** (autonomous task execution)

2. **The Agent Loop** (5 min)
   ```
   Plan → Execute → Verify → Iterate
   ```
   - Agents analyze context before acting
   - Agents take multi-step actions
   - Agents can verify their own work
   - Agents iterate until complete

3. **Quick Demo: Traditional vs Agentic** (5-10 min)
   - Show: Asking Copilot to add a function (copy-paste)
   - Show: Asking Cline to add a function (autonomous)
   - Highlight: File creation, test generation, execution

**Key Takeaway**: Agentic coding lets AI be your pair programmer, not just your autocomplete.

**Materials**: Slides with diagrams, VS Code with both Copilot and Cline

---

### Module 3: Git as AI Context Provider (20-25 min)

**Objectives**:
- Understand how Git provides context to AI agents
- Learn Git practices that improve AI effectiveness
- Establish traceability for AI-generated code

**Content**:

1. **Repository Structure as Context** (7 min)
   - How Cline reads directory structure
   - Why file naming conventions matter
   - The role of README, manifests, and configs
   - **Demo**: Show Cline's initial project analysis

2. **Git History as Context** (5 min)
   - Recent commits inform AI understanding
   - Patterns learned from history
   - Why consistent commit messages help
   - **Demo**: Show how context improves suggestions

3. **Traceability: Tracking AI Changes** (8 min)
   - Cline's checkpoint system
   - Git diff for reviewing AI changes
   - Commit strategies for AI work
   - **Demo**: Make a change, review diff, commit with context

4. **Best Practices** (5 min)
   - Initialize Git before AI work
   - Commit frequently (logical units)
   - Use meaningful commit messages
   - Consider branch strategies (ai/feature-name)

**Key Takeaway**: Git isn't just version control—it's how you give AI the context it needs and maintain accountability.

**Materials**: Slides, demo repo with history, live Git operations

---

### Module 4: Cline Deep Dive (30 min) *[Extended version only]*

**Objectives**:
- Set up Cline for optimal PowerShell development
- Understand Cline's interface and capabilities
- Configure API provider and settings

**Content**:

1. **Installation & API Setup** (10 min)
   - Installing Cline extension
   - Configuring API provider (Claude/OpenAI/Azure)
   - Model selection considerations
   - Cost awareness and token limits

2. **Interface Tour** (10 min)
   - Chat panel and history
   - Plan vs Act modes
   - Checkpoints and rollback
   - Approval settings (auto vs manual)

3. **Hands-on: First Cline Task** (10 min)
   - Attendees follow along
   - Simple task: "Create a hello world script"
   - Experience the full agentic loop

**Materials**: Setup guide handout, demo environment

---

### Module 5: Instruction Files & .clinerules (25-30 min)

**Objectives**:
- Master .clinerules for project-specific AI behavior
- Create custom chat modes for different tasks
- Establish team-wide consistency

**Content**:

1. **Why Instruction Files Matter** (5 min)
   - Same prompt, different results without context
   - Team consistency
   - Project-specific requirements
   - Reducing repetitive instructions

2. **Anatomy of .clinerules** (10 min)
   ```markdown
   # .clinerules example structure
   
   ## Code Standards
   - Use approved PowerShell verbs
   - Follow PSScriptAnalyzer rules
   
   ## Testing Requirements
   - All functions need Pester tests
   - Minimum 80% coverage
   
   ## Git Practices
   - Conventional commits
   - Never commit secrets
   ```
   - **Demo**: Create .clinerules for PowerShell project
   - Show impact on AI output

3. **Custom Chat Modes** (10 min)
   - `.clinerules/chatmodes/*.chatmode.md`
   - Creating specialized agents:
     - Refactoring agent
     - Documentation agent
     - Debug agent
   - **Demo**: Switch between modes

4. **Exercise: Write Your Own .clinerules** (5 min)
   - Attendees create basic .clinerules
   - Share and discuss examples

**Key Takeaway**: Instruction files are how you teach AI your project's rules and preferences.

**Materials**: Sample .clinerules templates, exercise worksheet

---

### Module 6: Automated Testing for Self-Verification (25-35 min)

**Objectives**:
- Integrate Pester tests with agentic workflows
- Enable AI to verify its own code
- Implement test-first development with AI

**Content**:

1. **The Self-Verification Pattern** (5 min)
   ```
   Agent writes code → Agent runs tests → Agent fixes failures → Report success
   ```
   - Why this matters: AI can iterate autonomously
   - Trust but verify: Tests as guardrails

2. **Pester Integration Demo** (15 min)
   - Request: "Add a function that validates Azure resource IDs"
   - Observe: Agent writes function AND tests
   - Watch: Agent runs Invoke-Pester
   - See: Agent fixes any failures
   - **Live Demo**: Full cycle with real Pester execution

3. **Test-First with AI** (10 min)
   - Telling AI to write tests first
   - Using tests as specifications
   - **Demo**: "Write tests for a config validator, then implement"

4. **PSScriptAnalyzer Integration** (5 min)
   - Adding lint checking to verification
   - Custom rules in .clinerules
   - **Demo**: Show lint failure → auto-fix

**Key Takeaway**: Automated testing lets AI verify its own work, reducing errors and building confidence.

**Materials**: Demo module with Pester tests, PSScriptAnalyzer config

---

### Module 7: Live Build - PowerShell Module from Scratch (30 min) *[Extended version]*

**Objectives**:
- Experience full agentic workflow end-to-end
- See Git, testing, and instructions working together
- Build confidence in the approach

**Scenario**: Build a "PSConfigValidator" module for validating configuration files

**Live Coding Steps**:

1. **Setup** (3 min)
   - Create new directory
   - Initialize Git
   - Add .clinerules

2. **Initial Module Creation** (7 min)
   - Request: "Create a PowerShell module structure for PSConfigValidator"
   - Watch: Agent creates folders, manifest, root module

3. **Add Core Function** (10 min)
   - Request: "Add Test-JsonConfig function with Pester tests"
   - Watch: Agent creates function with validation
   - Watch: Agent creates comprehensive tests
   - Watch: Agent runs and passes tests

4. **Add Feature** (5 min)
   - Request: "Add support for YAML configs"
   - Watch: Agent analyzes existing patterns
   - Watch: Agent implements consistently

5. **Documentation** (5 min)
   - Request: "Add comment-based help and README"
   - Watch: Agent generates documentation

**Outcome**: Complete, tested, documented module in ~30 minutes

**Materials**: Empty directory, .clinerules template

---

### Module 8: Advanced Topics (20 min) *[Extended version]*

**Objectives**:
- Introduce MCP servers for extended capabilities
- Cover DevOps pipeline integration
- Discuss team workflows

**Content**:

1. **MCP Servers** (7 min)
   - What is Model Context Protocol?
   - Useful MCP servers:
     - File system operations
     - Database connections
     - API integrations
   - **Demo**: Using an MCP tool

2. **DevOps Pipeline Integration** (8 min)
   - AI-generated code in CI/CD
   - Pipeline-compatible output
   - Azure DevOps / GitHub Actions examples
   - Pre-commit hooks for AI code

3. **Team Workflows** (5 min)
   - Sharing .clinerules in repo
   - Code review for AI changes
   - Branch strategies
   - Knowledge sharing

**Materials**: Sample pipeline YAML, MCP server examples

---

### Module 9: Best Practices & Common Pitfalls (15 min)

**Objectives**:
- Learn from common mistakes
- Establish good habits
- Know when NOT to use agentic coding

**Content**:

1. **Do's** ✅
   - Always work in a Git repository
   - Write clear, specific prompts
   - Review diffs before committing
   - Use .clinerules for consistency
   - Have tests before complex changes
   - Iterate in small steps

2. **Don'ts** ❌
   - Don't skip code review for AI code
   - Don't commit without testing
   - Don't share API keys in prompts
   - Don't trust blindly—verify
   - Don't use for security-critical code without review

3. **When Agentic Coding Shines** 🌟
   - Boilerplate and scaffolding
   - Test generation
   - Documentation
   - Refactoring
   - Learning new patterns

4. **When to Be Cautious** ⚠️
   - Complex business logic
   - Security-sensitive code
   - Performance-critical paths
   - Integration with legacy systems

**Materials**: Best practices handout, anti-pattern examples

---

### Module 10: Wrap-up & Resources (10-15 min)

**Objectives**:
- Summarize key learnings
- Provide resources for continued learning
- Answer remaining questions

**Content**:

1. **Key Takeaways Recap**
   - Agentic coding = AI as collaborator
   - Git provides context and traceability
   - Instruction files ensure consistency
   - Testing enables self-verification

2. **Resources**
   - Cline documentation
   - Sample .clinerules repository
   - PowerShell + AI community resources
   - Presenter contact info

3. **Q&A Session**
   - Open floor for questions
   - Address specific scenarios

4. **Call to Action**
   - Try it on a real project this week
   - Start with a small, low-risk task
   - Build your .clinerules iteratively

**Materials**: Resource links handout, feedback form

---

## Demo Scenarios

### Demo 1: Traditional vs Agentic Comparison

**Duration**: 5 minutes
**Purpose**: Show the paradigm shift

**Traditional (Copilot-style)**:
1. Open file, start typing
2. Accept autocomplete suggestions
3. Copy from chat to editor
4. Manually run tests
5. Fix errors manually

**Agentic (Cline)**:
1. Describe what you need
2. AI creates files, writes code
3. AI runs tests automatically
4. AI fixes issues
5. Review and commit

### Demo 2: Git Context in Action

**Duration**: 10 minutes
**Purpose**: Show how Git improves AI understanding

**Setup**: Existing module with consistent patterns

**Steps**:
1. Show repository structure
2. Show recent commit history
3. Ask Cline to add a new function
4. Highlight how it matches existing patterns
5. Show the diff before committing

### Demo 3: .clinerules Impact

**Duration**: 8 minutes
**Purpose**: Show instruction files changing behavior

**Steps**:
1. Request function WITHOUT .clinerules
2. Show output (may lack tests, help, etc.)
3. Add .clinerules with requirements
4. Request same function
5. Compare outputs

### Demo 4: Pester Self-Verification Loop

**Duration**: 12 minutes
**Purpose**: Show testing integration

**Steps**:
1. Request a function that validates input
2. Watch agent write function AND tests
3. Watch agent run Invoke-Pester
4. Observe any failures
5. Watch agent fix and re-run
6. Celebrate green tests 🎉

### Demo 5: Full Module Build (Extended Session)

**Duration**: 25 minutes
**Purpose**: End-to-end experience

**Steps**: See Module 7 description

---

## Handouts & Materials

### For Attendees

1. **Setup Checklist**
   - VS Code installation
   - Cline extension
   - PowerShell 7.x
   - Pester 5.x
   - Git
   - API key (optional for exercises)

2. **Quick Reference Card**
   - Cline keyboard shortcuts
   - Common prompts for PowerShell
   - .clinerules template

3. **Sample .clinerules Collection**
   - PowerShell module development
   - Pester testing
   - Documentation standards

4. **Resource Links**
   - Cline documentation
   - Community resources
   - Further learning

### For Presenter

1. **Demo environment checklist**
2. **Backup recordings**
3. **Troubleshooting guide**
4. **Time management cues**

---

## Timing Flexibility Notes

### If Running Short on Time

- **Skip**: Extended Cline setup (assume pre-installed)
- **Shorten**: Best practices to 5 min highlights
- **Combine**: Demos into single comprehensive example

### If Running Long on Time

- **Expand**: Q&A between modules
- **Add**: Hands-on exercise for .clinerules
- **Include**: Advanced MCP demonstration
- **Discuss**: Specific attendee scenarios

### Natural Break Points

- After Module 3 (Git) - Good 2-hour stopping point
- After Module 6 (Testing) - Good 3-hour stopping point
- After Module 7 (Live Build) - Good 3.5-hour stopping point

---

## Post-Session Follow-up

1. **Share materials** (slides, samples, links)
2. **Collect feedback** (survey link)
3. **Offer office hours** (optional follow-up session)
4. **Create community** (Slack/Discord/Teams channel)

---

*Agenda Version: 1.0 | Created: 2026-02-02*