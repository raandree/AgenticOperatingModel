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
│     copilot-instructions.md teaches AI your rules & standards  │
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
> Instruction files (copilot-instructions.md, .instructions.md) define standards. Custom agents (.agent.md) define specialized roles.

### 4. How can I trust AI-generated code?
> Automated testing lets AI verify its own work, plus human review.

### 5. When should I use agentic coding?
> For well-defined tasks where you can verify results.

---

## Slide 10.3: Getting Started

# Start Small, Build Confidence

### Week 1: Setup
```
□ Enable Copilot Agent Mode in VS Code (chat.agent.enabled)
□ Create your first .github/copilot-instructions.md
□ Try the /init command to auto-generate instructions
□ Try one simple task in Agent mode
```

### Week 2: Practice
```
□ Use agentic workflow on a real (low-risk) task
□ Create a .instructions.md file for your language
□ Create a custom agent (.agent.md) for a common workflow
□ Watch the self-verification loop in action
□ Review diffs carefully
```

### Week 3: Integrate
```
□ Add copilot-instructions.md to a team project
□ Share custom agents with colleagues via .github/agents/
□ Try background or cloud agent for a well-defined task
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

## Slide 10.5: Building Your copilot-instructions.md

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

> **Tip**: Use `/init` in chat to auto-generate a starting point!

---

## Slide 10.6: Resources

# Where to Learn More

### GitHub Copilot (Primary Focus)
- **Agent Mode Docs**: https://code.visualstudio.com/docs/copilot/agents/overview
- **Custom Instructions**: https://code.visualstudio.com/docs/copilot/customization/custom-instructions
- **Custom Agents**: https://code.visualstudio.com/docs/copilot/customization/custom-agents
- **Tools & MCP**: https://code.visualstudio.com/docs/copilot/agents/agent-tools
- **Coding Agent (Cloud)**: https://docs.github.com/copilot/using-github-copilot/using-copilot-coding-agent
- **Agentic Workflows**: https://github.github.com/gh-aw/

### Alternative Agentic Tools
- **Cline**: https://github.com/cline/cline (Open-source, 58K+ stars)
- **Cursor**: https://cursor.com (Dedicated AI editor, v2.5+)
- **Windsurf**: https://windsurf.com (Cascade agent)
- **Claude Code**: https://code.claude.com (Terminal + IDE)

### Model Context Protocol (MCP)
- **Specification**: https://modelcontextprotocol.io
- **Servers**: https://github.com/modelcontextprotocol/servers

### PowerShell + AI
- PowerShell Community Discord
- r/PowerShell on Reddit
- PowerShell.org forums

### This Presentation
- Slides and materials: [Your URL]
- Sample instruction files: [Your URL]
- Demo projects: [Your URL]

---

## Slide 10.7: Sample Instruction File Library

# Templates for Common Scenarios

### Available Templates:

| Template | File | Purpose |
|----------|------|--------|
| PowerShell Module | `copilot-instructions.md` | Module development standards |
| Pester Testing | `testing.instructions.md` | Test-focused rules |
| Documentation | `documenter.agent.md` | Documentation agent |
| Refactoring | `refactor.agent.md` | Safe refactoring agent |
| DevOps Pipeline | `devops.instructions.md` | CI/CD and pipeline code |

### Where to Get Them:
- Included in presentation materials
- Use `/init` to auto-generate from your codebase
- Share improvements via Git

---

## Slide 10.8: The Future

# Where Agentic Coding Is Going

### Already Here (Feb 2026):
- **Cloud agents** creating PRs autonomously (Copilot Coding Agent, Cursor Cloud Agents)
- **Multi-agent systems** with subagents and skills (Cline v3.58+, Cursor 2.5)
- **Agentic CI/CD workflows** in Markdown (GitHub Agentic Workflows)
- **Universal tool protocol** via MCP (Linux Foundation standard)
- **Cross-IDE support** (VS Code, JetBrains, Visual Studio, Xcode, Eclipse, Zed)
- **1M+ token context windows** (Claude Opus 4.6 on Vertex)

### Near-Term (Next 6 months):
- Better multi-agent collaboration and orchestration
- Agent-to-agent delegation across tools
- Deeper CI/CD and DevOps integration
- Domain-specific agent configurations
- Improved self-correction with verification loops

### Medium-Term (6-18 months):
- Self-driving codebases (Cursor research direction)
- AI-native development environments
- Agents managing entire project lifecycles
- Cross-repository understanding and refactoring

> **The tools are evolving fast. Your judgment stays essential.**

---

## Slide 10.9: Call to Action

# What to Do This Week

### Immediate (Today/Tomorrow):
1. ✅ Enable Copilot Agent Mode in VS Code
2. ✅ Create a basic copilot-instructions.md (or use `/init`)
3. ✅ Try one simple task with Agent mode

### This Week:
4. 📝 Apply to a real (low-risk) work task
5. 📝 Create a custom agent for a frequent workflow
6. 📝 Share your instruction files with a colleague

### Ongoing:
7. 🔄 Build your prompt patterns
8. 🔄 Iterate on your instruction files and custom agents
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
4. **Custom agents** = Specialized AI behaviors
5. **Automated testing** = AI proves its work
6. **Your judgment** = Still essential

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