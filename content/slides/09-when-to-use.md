# Module 9: When to Use (and Not Use) Agentic AI

## Slide 9.1: The Judgment Question

# When Is Agentic Coding Right?

### The honest truth:
> **Agentic coding is powerful but not universal.**
> Good judgment about when to use it matters.

### This module covers:
- Where agentic coding excels ✅
- Where to be careful ⚠️
- Where to avoid it ❌
- The human role that remains

---

## Slide 9.2: Where It Excels

# Agentic Coding Shines Here ✅

| Task Type | Why It Works Well |
|-----------|-------------------|
| **Boilerplate/Scaffolding** | Repetitive, well-defined patterns |
| **Test Generation** | Systematic, comprehensive coverage |
| **Documentation** | Reading code, generating help text |
| **Refactoring** | Pattern-based transformations |
| **CRUD Operations** | Standard patterns, predictable |
| **Config Files** | Template-based, format-specific |
| **Build Scripts** | Common patterns, platform-specific |

### Common thread:
> **Well-defined tasks with verifiable outcomes.**

---

## Slide 9.3: Boilerplate & Scaffolding

# Perfect for AI ✅

### Examples:
- Module structure creation
- Function template with parameters
- Error handling wrappers
- Logging infrastructure
- Pipeline scaffolding

### Why it works:
```
┌─────────────────────────────────────────┐
│  Boilerplate = Pattern + Customization  │
├─────────────────────────────────────────┤
│                                         │
│  AI excels at:                          │
│  • Recognizing patterns                 │
│  • Applying them consistently           │
│  • Customizing to your context          │
│  • Generating quickly                   │
│                                         │
│  You would spend time on:               │
│  • Typing repetitive code               │
│  • Remembering exact syntax             │
│  • Copy-pasting from templates          │
│                                         │
└─────────────────────────────────────────┘
```

---

## Slide 9.4: Test Generation

# AI Test Generation ✅

### Why it works:
- Tests follow predictable patterns
- Coverage can be verified automatically
- Edge cases are systematic to enumerate
- Tests validate themselves (pass/fail)

### Example prompt:
```
"Generate comprehensive Pester tests for the 
Get-ConfigValue function, covering:
- Valid configurations
- Missing keys
- Invalid file formats  
- Null and empty inputs"
```

### Result:
Thorough test coverage in minutes vs. hours.

---

## Slide 9.5: Documentation

# Let AI Read & Document ✅

### What AI does well:
- Read existing code and understand it
- Generate comment-based help
- Create README content
- Write usage examples
- Update manifests

### Why it works:
```
AI reads:                 AI produces:
─────────                ────────────
Your code         ──▶    .SYNOPSIS
Function params   ──▶    .PARAMETER docs  
Error handling    ──▶    .EXAMPLE usage
Return types      ──▶    README sections
```

> AI is excellent at the tedious work of reading and summarizing.

---

## Slide 9.6: Where to Be Careful

# Proceed with Caution ⚠️

| Task Type | Why Caution Needed |
|-----------|-------------------|
| **Complex Business Logic** | AI may misunderstand requirements |
| **Performance-Critical** | May not optimize correctly |
| **Security-Sensitive** | Subtle vulnerabilities possible |
| **Integration Code** | External systems are unpredictable |
| **Legacy Systems** | Context may be incomplete |

### Mitigation:
- Extra review time
- More specific prompts
- Smaller increments
- More comprehensive testing

---

## Slide 9.7: Complex Business Logic

# Be More Careful Here ⚠️

### The risk:
```
Your domain knowledge          AI's understanding
═══════════════════════        ════════════════════
"Accounts must reconcile       "I'll check numbers
 using FIFO method with        match somehow"
 30-day lookback and
 cross-entity netting"
```

### AI might:
- Miss edge cases you haven't specified
- Implement wrong interpretation
- Not understand business rules

### Mitigation:
- Be extremely specific in requirements
- Write tests FIRST as specifications
- Review logic carefully, not just syntax
- Break into smaller, verifiable pieces

---

## Slide 9.8: Security-Sensitive Code

# Extra Scrutiny Required ⚠️

### Security risks with AI-generated code:
- Improper input validation
- Missing authentication checks
- Insecure default configurations
- Exposed sensitive data
- SQL injection vulnerabilities
- Credential handling mistakes

### Guidance:
```markdown
## In Your copilot-instructions.md

## Security Rules
- Never hardcode credentials or secrets
- Always validate and sanitize input
- Use parameterized queries for databases
- Implement proper authentication checks
- Log security-relevant events
- Follow principle of least privilege
```

### Always:
- Security review AI-generated code
- Run security scanners
- Test authentication paths
- Verify secret handling

---

## Slide 9.8a: Agent Security & Boundaries

# What Can the Agent Do?

### Understanding agent capabilities:

```
┌─────────────────────────────────────────────────────────────────┐
│                   AGENT CAPABILITY BOUNDARIES                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   ✅ WHAT AGENTS CAN DO                                        │
│   ─────────────────────                                        │
│   • Read and write files in the workspace                      │
│   • Execute terminal commands                                  │
│   • Search and analyze code                                    │
│   • Install packages and dependencies                          │
│   • Access MCP servers (databases, APIs, web)                  │
│   • Create, modify, and delete files                           │
│                                                                 │
│   ⚠️ SAFEGUARDS THAT EXIST                                     │
│   ─────────────────────────                                     │
│   • Tool approval prompts (manual/auto modes)                  │
│   • Terminal sandboxing (file system + network restrictions)    │
│   • Checkpoint/rollback system for undo                        │
│   • Commands require user confirmation (by default)            │
│   • No access outside workspace (unless configured)            │
│                                                                 │
│   🔒 HOW TO RESTRICT                                           │
│   ───────────────────                                           │
│   • Set tool approval to "Ask always" for sensitive operations │
│   • Limit terminal access in VS Code settings                  │
│   • Use .gitignore to hide sensitive files from context        │
│   • Define security rules in copilot-instructions.md           │
│   • Restrict MCP server permissions                            │
│   • Use organization policies for team-wide guardrails         │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Key question to ask yourself:
> "What is the worst thing the agent could do with the access I've given it?"

---

## Slide 9.8b: The Cardinal Rule

# Know What You Are Doing

> Even when it looks like programming is no longer required, understanding the underlying code and infrastructure remains **essential**.

### Why understanding still matters:

| Without Understanding | With Understanding |
|----------------------|--------------------|
| Can't review AI output | Catch errors and vulnerabilities |
| Can't debug failures | Know where to look |
| Can't make design decisions | Guide AI toward better solutions |
| Blind trust in generated code | Informed trust based on review |
| Helpless when AI is wrong | Can correct and improve |

### The paradox:
```
┌─────────────────────────────────────────┐
│                                         │
│   AI makes you FASTER                   │
│   but NOT more knowledgeable.           │
│                                         │
│   You must invest in understanding      │
│   BEFORE you automate.                  │
│                                         │
│   The better you understand the code,   │
│   the better you can direct the agent.  │
│                                         │
└─────────────────────────────────────────┘
```

> **You are the pilot. AI is the autopilot. You still need to know how to fly.**

---

## Slide 9.9: When to Avoid

# Don't Use Agentic Coding Here ❌

| Scenario | Why Not |
|----------|---------|
| **Code you don't understand** | Can't review effectively |
| **No way to verify results** | Can't test means can't trust |
| **High-stakes first attempt** | Production without testing |
| **Highly novel problems** | No patterns to learn from |
| **Compliance-critical without review** | Regulatory requirements |

### The rule:
> **If you can't verify it, don't generate it.**

---

## Slide 9.10: The Understanding Problem

# Don't Generate What You Can't Review

```
┌─────────────────────────────────────────────────────────────────┐
│                    THE UNDERSTANDING TRAP                       │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   Scenario: You ask AI to generate code in a language          │
│   or domain you don't understand.                              │
│                                                                 │
│   AI generates:                                                │
│   ─────────────                                                │
│   [Complex code that looks right]                              │
│                                                                 │
│   You see:                                                     │
│   ────────                                                     │
│   "Looks like code... probably fine?" 🤷                       │
│                                                                 │
│   Reality:                                                     │
│   ────────                                                     │
│   Could be brilliant or disastrous.                            │
│   YOU CAN'T TELL.                                              │
│                                                                 │
│   DANGER: Code in production you don't understand.             │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Slide 9.11: The Human Role

# What You Still Do

### You are NOT replaced. Your role shifts.

```
┌─────────────────────────────────────────┐
│           THE HUMAN ROLE                │
├─────────────────────────────────────────┤
│                                         │
│  ARCHITECT                              │
│  ─────────                              │
│  • Define what to build                 │
│  • Make design decisions                │
│  • Choose approaches                    │
│                                         │
│  REVIEWER                               │
│  ────────                               │
│  • Evaluate generated code              │
│  • Check for correctness                │
│  • Verify security                      │
│                                         │
│  JUDGE                                  │
│  ─────                                  │
│  • Decide when to use AI                │
│  • Know your limits                     │
│  • Accept or reject results             │
│                                         │
│  OWNER                                  │
│  ─────                                  │
│  • Responsible for code quality         │
│  • Accountable for outcomes             │
│  • Maintain understanding               │
│                                         │
└─────────────────────────────────────────┘
```

---

## Slide 9.12: The Review Responsibility

# "AI Wrote It" Is Not an Excuse

### Your code review responsibility:
- Understand what was generated
- Verify logic correctness
- Check security implications
- Ensure it meets requirements
- Test beyond automated tests

### The diff is your friend:
```diff
+ function Get-SecureValue {
+     param([string]$Key)
+     # AI generated - I reviewed this:
+     # ✓ Input validated
+     # ✓ No secrets exposed
+     # ✓ Error handling correct
```

> **You commit it, you own it.**

---

## Slide 9.13: Decision Framework

# Should I Use Agentic AI?

```
┌─────────────────────────────────────────────────────────────────┐
│                   DECISION FRAMEWORK                            │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   Ask yourself:                                                │
│                                                                 │
│   1. Can I verify the result?                                  │
│      NO ──▶ Don't use AI generation                            │
│      YES ──▶ Continue                                          │
│                                                                 │
│   2. Do I understand the domain well enough to review?         │
│      NO ──▶ Learn first, or get expert review                  │
│      YES ──▶ Continue                                          │
│                                                                 │
│   3. Is this security or safety critical?                      │
│      YES ──▶ Extra review required, smaller chunks             │
│      NO ──▶ Continue                                           │
│                                                                 │
│   4. Are there established patterns to follow?                 │
│      NO ──▶ Be very specific, expect more iteration            │
│      YES ──▶ Good fit for AI                                   │
│                                                                 │
│   5. Can I break this into testable pieces?                    │
│      NO ──▶ Rethink approach                                   │
│      YES ──▶ Proceed with agentic workflow                     │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Slide 9.14: Key Takeaway

# Power Requires Judgment

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│   AGENTIC CODING IS A TOOL                                     │
│                                                                 │
│   Like any powerful tool:                                      │
│                                                                 │
│   ✅ Use for the right job                                     │
│   ✅ Know its limitations                                      │
│   ✅ Verify results                                            │
│   ✅ Maintain your expertise                                   │
│   ✅ Take responsibility                                       │
│                                                                 │
│   ❌ Don't use blindly                                         │
│   ❌ Don't skip review                                         │
│   ❌ Don't generate what you can't verify                      │
│   ❌ Don't abandon understanding                               │
│                                                                 │
│   You are MORE valuable with AI, not less.                     │
│   But only if you use it wisely.                               │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

> **AI is a powerful tool. Like all powerful tools, it requires judgment.**

---

## Speaker Notes - Module 9

### Timing: 15-20 minutes

### Key Points to Emphasize:
1. Agentic coding is powerful but not universal
2. Works best for **well-defined, verifiable** tasks
3. Be extra careful with security and complex logic
4. **If you can't verify it, don't generate it**
5. Your role shifts to architect/reviewer/judge/owner
6. **Know what you are doing** — understanding the code remains essential even when AI writes it
7. Agent security: Understand what the agent CAN do and restrict where needed

### Common Questions:
- "Will AI replace me?" → No, it changes your role, you're more valuable
- "What about liability?" → You own what you commit
- "How do I know when to use it?" → Decision framework
- "What about security?" → Extra review, specific rules, and agent sandboxing
- "What if the agent does something destructive?" → Safeguards (tool approval, sandboxing, checkpoints)

### Tone:
- Be honest about limitations
- Not fear-mongering, just realistic
- Empower with good judgment

### Transition to Module 10:
"Now that you know when and how to use agentic coding, let's talk about your next steps..."