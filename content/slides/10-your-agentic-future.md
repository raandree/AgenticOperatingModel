# Module 10: Your Agentic Future

## Slide 10.1: Recap

# What We've Learned

```
┌─────────────────────────────────────────────────────────────────┐
│                     KEY CONCEPTS                                │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  1. AGENTIC CODING                                             │
│     AI that plans, executes, and verifies autonomously         │
│                                                                 │
│  2. CONTEXT IS POWER                                           │
│     Git gives AI understanding and you traceability            │
│                                                                 │
│  3. INSTRUCTION FILES                                          │
│     .clinerules teaches AI your rules and standards            │
│                                                                 │
│  4. SELF-VERIFICATION                                          │
│     Automated testing lets AI prove its work                   │
│                                                                 │
│  5. JUDGMENT MATTERS                                           │
│     Know when to use it and when to be careful                 │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Slide 10.2: The Five Questions

# Can You Answer These?

### 1. What is agentic coding?
> AI that autonomously executes multi-step coding tasks, using context to plan, act, verify, and iterate.

### 2. Why does Git matter for AI?
> Git provides context (structure, patterns) and traceability (what changed).

### 3. How do I control AI behavior?
> Instruction files (.clinerules) define standards and expectations.

### 4. How can I trust AI-generated code?
> Automated testing lets AI verify its own work, plus human review.

### 5. When should I use agentic coding?
> For well-defined tasks where you can verify results.

---

## Slide 10.3: Getting Started

# Start Small, Build Confidence

### Week 1: Setup
```
□ Install Cline extension in VS Code
□ Configure API provider
□ Create your first .clinerules file
□ Try one simple task
```

### Week 2: Practice
```
□ Use agentic workflow on a real (low-risk) task
□ Experiment with instruction file rules
□ Watch the self-verification loop in action
□ Review diffs carefully
```

### Week 3: Integrate
```
□ Add .clinerules to a team project
□ Share your configuration with colleagues
□ Establish team conventions for AI use
□ Build your prompt patterns library
```

---

## Slide 10.4: Your First Task

# Suggested Starting Points

### Easy Wins (Start Here):
- Generate Pester tests for existing function
- Add comment-based help to undocumented code
- Create module scaffolding from scratch
- Refactor function to add error handling

### Example Prompt to Try:
```
"I have a PowerShell function called Get-ServerStatus.
Generate comprehensive Pester tests covering:
- Valid server names
- Invalid server names  
- Unreachable servers
- Null and empty inputs"
```

### Expected outcome:
Working tests in minutes, verified by the agent.

---

## Slide 10.5: Building Your .clinerules

# Start Simple, Iterate

### Version 1 (Start Here):
```markdown
# Project Rules

## Testing
- Create Pester tests for new functions
- Run Invoke-Pester before completion

## Code Style
- Use [CmdletBinding()] on all functions
- Include error handling
```

### Version 2 (After Experience):
```markdown
# Project Rules

## Testing
- Create Pester tests for new functions
- Tests must cover success, failure, edge cases
- Run Invoke-Pester before completion
- Do not finish until all tests pass

## Code Style
- Use [CmdletBinding()] on all functions
- Include [Parameter()] attributes
- Use ValidateNotNullOrEmpty where appropriate
- Include comment-based help with examples

## Error Handling
- Use try/catch for risky operations
- Provide meaningful error messages
- Use Write-Error for non-terminating errors
```

---

## Slide 10.6: Resources

# Where to Learn More

### Cline Documentation
- **Official Docs**: https://docs.cline.bot
- Features, configuration, best practices

### Community
- **GitHub**: https://github.com/cline/cline
- Issues, discussions, feature requests

### PowerShell + AI
- PowerShell Community Discord
- r/PowerShell on Reddit
- PowerShell.org forums

### This Presentation
- Slides and materials: [Your URL]
- Sample .clinerules: [Your URL]
- Demo projects: [Your URL]

---

## Slide 10.7: Sample .clinerules Library

# Templates for Common Scenarios

### Available Templates:

| Template | Purpose |
|----------|---------|
| `powershell-module.md` | PowerShell module development |
| `pester-testing.md` | Test-focused rules |
| `documentation.md` | Documentation generation |
| `refactoring.md` | Safe refactoring practices |
| `devops-pipeline.md` | CI/CD and pipeline code |

### Where to Get Them:
- Included in presentation materials
- Adapt for your specific needs
- Share improvements with team

---

## Slide 10.8: The Future

# Where Agentic Coding Is Going

### Near-Term (Now - 6 months):
- Better context understanding
- Improved self-correction
- More tools and integrations
- Lower costs

### Medium-Term (6-18 months):
- Multi-agent collaboration
- Longer autonomous sessions
- CI/CD integration
- Domain-specific agents

### Long-Term:
- AI-native development environments
- Continuous AI-assisted improvement
- New development paradigms

> **The tools will improve. Your judgment stays essential.**

---

## Slide 10.9: Call to Action

# What to Do This Week

### Immediate (Today/Tomorrow):
1. ✅ Install Cline if you haven't
2. ✅ Create a basic .clinerules
3. ✅ Try one simple task with agentic workflow

### This Week:
4. 📝 Apply to a real (low-risk) work task
5. 📝 Review and refine your .clinerules
6. 📝 Share experience with a colleague

### Ongoing:
7. 🔄 Build your prompt patterns
8. 🔄 Iterate on your instruction files
9. 🔄 Expand to more complex tasks

---

## Slide 10.10: Final Thought

# You + AI > You Alone

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│                   THE NEW EQUATION                              │
│                                                                 │
│   ┌─────────────────────────────────────────────────────────┐  │
│   │                                                         │  │
│   │     YOUR EXPERTISE                                      │  │
│   │     ──────────────                                      │  │
│   │     • Domain knowledge                                  │  │
│   │     • Design judgment                                   │  │
│   │     • Quality standards                                 │  │
│   │     • Review capability                                 │  │
│   │                                                         │  │
│   │              +                                          │  │
│   │                                                         │  │
│   │     AI CAPABILITIES                                     │  │
│   │     ───────────────                                     │  │
│   │     • Speed of execution                                │  │
│   │     • Pattern recognition                               │  │
│   │     • Comprehensive testing                             │  │
│   │     • Tireless iteration                                │  │
│   │                                                         │  │
│   │              =                                          │  │
│   │                                                         │  │
│   │     10x PRODUCTIVITY                                    │  │
│   │     ────────────────                                    │  │
│   │     Better code, faster delivery, less tedium           │  │
│   │                                                         │  │
│   └─────────────────────────────────────────────────────────┘  │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Slide 10.11: Q&A

# Questions?

### Common Topics:
- Getting started tips
- Specific use cases
- Team adoption strategies
- Cost management
- Security concerns

### Contact:
- [Your Email]
- [Your Twitter/LinkedIn]
- [Your Website]

### Materials:
- [Download link for slides]
- [Download link for samples]

---

## Slide 10.12: Thank You

# Thank You!

## Key Takeaways

1. **Agentic coding** = AI that acts, not just suggests
2. **Git** = Context + Traceability
3. **Instruction files** = Consistent, quality output
4. **Automated testing** = AI proves its work
5. **Your judgment** = Still essential

> **Start small. Build confidence. Transform your workflow.**

### Remember:
> You become the **architect** and **reviewer**.
> AI becomes your **tireless implementer**.

---

## Speaker Notes - Module 10

### Timing: 10-15 minutes (including Q&A)

### Key Points:
1. Recap the five core concepts
2. Give actionable next steps
3. Provide resources
4. Inspire action, not intimidation

### Q&A Tips:
- Common questions and answers prepared
- If stumped: "Great question, let me follow up with you"
- Time-box Q&A to stay on schedule

### Closing:
- End on empowerment, not complexity
- "Start small" message
- Thank them for their time
- Share contact info

### Post-Session:
- Share slides immediately
- Follow up on unanswered questions
- Send feedback survey
- Offer office hours if appropriate