---
marp: true
theme: default
paginate: true
backgroundColor: #1a1a2e
color: #eaeaea
style: |
  section {
    font-family: 'Segoe UI', Arial, sans-serif;
  }
  h1 {
    color: #00d4ff;
  }
  h2 {
    color: #00d4ff;
  }
  code {
    background-color: #16213e;
  }
  table {
    font-size: 0.8em;
  }
---

# Agentic Coding
## The Future of AI-Assisted Development

*Your Name*
*Date*

---

# How Do You Use AI for Coding Today?

🤔 **Quick Poll:**

- **A)** Code autocomplete (Copilot, Tabnine)
- **B)** Chat assistants (ChatGPT, Claude)  
- **C)** AI agents (Copilot Agent Mode, Cursor, Claude Code)
- **D)** Not yet using AI for coding

---

# AI Coding Has Evolved

| Wave 1 (2021-22) | Wave 2 (2023-24) | Wave 3 (2024-Now) |
|------------------|------------------|-------------------|
| **Autocomplete** | **Chat Assist** | **Agentic** |
| "Complete this line" | "Answer my question" | "Do this task for me" |
| Single line suggestions | Copy-paste workflow | Autonomous execution |

---

# Why Agentic Coding is Possible NOW

### Technology Advances
- Larger context windows (100K+ tokens)
- Better reasoning capabilities
- Tool use abilities in LLMs

### Tooling Advances
- AI agents with file system access
- Terminal command execution
- Checkpoint/rollback systems

---

# Today's Journey

1. **What Makes Coding "Agentic"**
2. **The Power of Context** (Git)
3. **Controlling AI Behavior** (Instruction Files)
4. **Self-Verification** (Automated Testing)
5. **Practical Application** (Live Demo)

---

# What IS an Agent?

| Property | Description |
|----------|-------------|
| **Goals** | Has an objective to accomplish |
| **Context** | Understands its environment |
| **Tools** | Can take actions in the world |
| **Autonomy** | Makes decisions independently |
| **Iteration** | Can refine based on feedback |

> An agentic AI doesn't just **suggest** code—it **writes, tests, and fixes** code.

---

# Traditional AI vs Agentic AI

### Traditional AI
```
You ask → AI suggests → You copy → You run → You fix
```

### Agentic AI
```
You describe → AI reads project → AI creates files → 
AI runs tests → AI fixes issues → Done ✅
```

**Agent does most of the work. You review and approve.**

---

# The Agentic Loop

```
OBSERVE → PLAN → ACT → VERIFY → ITERATE
   │        │       │       │        │
   │        │       │       │        └─ Fix issues
   │        │       │       └─ Run tests
   │        │       └─ Write code
   │        └─ Decide approach
   └─ Read repo structure
```

---

# Your Role Changes

| Before (Traditional) | After (Agentic) |
|---------------------|-----------------|
| You **type** code | You **describe** intent |
| You **implement** solutions | You **review** solutions |
| You **run** tests | Agent **runs** tests |
| You **debug** failures | Agent **debugs** failures |

> From **typist** to **architect and reviewer**

---

# Context: Why Git Matters

### Without context:
- ❌ Generic code that doesn't fit
- ❌ Wrong naming conventions
- ❌ Inconsistent patterns

### With context:
- ✅ Code matches your style
- ✅ Correct conventions
- ✅ Follows existing patterns

> **Git gives AI understanding of YOUR project**

---

# Git Provides Two Things

1. **Context**
   - Repository structure
   - Existing code patterns
   - Configuration files
   - README purpose

2. **Traceability**
   - See exactly what AI changed
   - Review diffs before committing
   - Rollback if needed

---

# Instruction Files (copilot-instructions.md)

```markdown
# Project Rules

## Testing
- Create Pester tests for new functions
- Run Invoke-Pester before completion
- Do not finish until all tests pass

## Code Style  
- Use [CmdletBinding()] on functions
- Include error handling
```

> **Define once, apply to every request**

---

# Before and After copilot-instructions.md

### WITHOUT copilot-instructions.md
```powershell
function Test-Config {
    param($Path)
    Get-Content $Path | ConvertFrom-Json
}
```
*Minimal, no tests, no help*

### WITH copilot-instructions.md
*Full implementation with CmdletBinding, help, error handling, AND tests*

---

# Self-Verification

```
Agent writes code
        ↓
Agent writes tests
        ↓
Agent runs tests
        ↓
    Pass? ──→ Done ✅
        │
        No
        ↓
Agent fixes code → Run tests again
```

> Tests transform "I think it works" into "I proved it works"

---

# When to Use Agentic Coding

### Great For ✅
- Boilerplate & scaffolding
- Test generation
- Documentation
- Refactoring

### Be Careful ⚠️
- Complex business logic
- Security-sensitive code

### Avoid ❌
- Code you can't review
- No way to verify results

---

# Decision Framework

1. **Can I verify the result?**
   - No → Don't use AI

2. **Do I understand the domain?**
   - No → Learn first

3. **Is it security-critical?**
   - Yes → Extra review

4. **Can I break into testable pieces?**
   - Yes → Proceed

---

# The Human Role Remains

### You are:
- **Architect** - Define what to build
- **Reviewer** - Evaluate generated code
- **Judge** - Decide when to use AI
- **Owner** - Responsible for quality

> "AI wrote it" is not an excuse

---

# Key Takeaways

1. **Agentic coding** = AI that acts, not just suggests
2. **Git** = Context + Traceability
3. **Instruction files** = Consistent quality
4. **Automated testing** = AI proves its work
5. **Your judgment** = Still essential

---

# Getting Started

### This Week:
1. ✅ Enable Copilot Agent Mode in VS Code
2. ✅ Create a basic copilot-instructions.md
3. ✅ Try one simple task
4. 📝 Apply to a real (low-risk) task
5. 📝 Review and refine

---

# You + AI > You Alone

| Your Expertise | AI Capabilities |
|----------------|-----------------|
| Domain knowledge | Speed of execution |
| Design judgment | Pattern recognition |
| Quality standards | Comprehensive testing |
| Review capability | Tireless iteration |

**= 10x Productivity**

---

# Thank You!

## Remember:

> You become the **architect** and **reviewer**.
> AI becomes your **tireless implementer**.

**Start small. Build confidence. Transform your workflow.**

---

# Questions?

*[Your Contact Info]*
*[Your Email]*
*[Materials Download Link]*