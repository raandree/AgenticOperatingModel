# Agentic Coding Quick Reference

## The Agentic Loop

```
OBSERVE → PLAN → ACT → VERIFY → ITERATE
   │        │       │       │        │
   │        │       │       │        └─ Fix issues, repeat
   │        │       │       └─ Run tests, check results
   │        │       └─ Write code, create files
   │        └─ Decide what to create/modify
   └─ Read repo structure, analyze patterns
```

---

## Key Concepts

| Concept | Definition |
|---------|------------|
| **Agentic Coding** | AI that autonomously executes multi-step tasks |
| **Context** | Repository structure, existing code, patterns |
| **Self-Verification** | AI runs tests to prove its own work |
| **Instruction Files** | copilot-instructions.md defines your standards |
| **Custom Agents** | .agent.md files for specialized AI behaviors |
| **Skills** | SKILL.md files with domain knowledge loaded on demand |
| **Prompt Files** | .prompt.md files for reusable /slash commands |
| **Agent Handoffs** | Agents delegating to other agents (Dev → QA → Prod) |
| **Traceability** | Git tracks all AI changes |

---

## Essential copilot-instructions.md Template

```markdown
# Project Rules

## Testing
- Create Pester tests for new functions
- Run Invoke-Pester before completion
- Do not finish until all tests pass

## Code Style
- Use [CmdletBinding()] on all functions
- Include parameter validation
- Follow existing patterns in codebase

## Error Handling
- Use try/catch for risky operations
- Provide meaningful error messages
```

---

## Effective Prompts

### Good Prompts ✅
```
"Add a function to validate JSON config files. 
Include comprehensive tests and error handling."
```

```
"Generate Pester tests for Get-UserData covering:
valid input, invalid input, null, empty string"
```

```
"Refactor Initialize-Database to add retry logic
with exponential backoff. Keep existing tests passing."
```

### Avoid ❌
```
"Fix the code"                    (Too vague)
"Make it better"                  (Unmeasurable)
"Write something like that thing" (No context)
```

---

## When to Use Agentic Coding

### Great For ✅
- Boilerplate & scaffolding
- Test generation
- Documentation
- Refactoring
- CRUD operations
- Config files

### Be Careful ⚠️
- Complex business logic
- Security-sensitive code
- Performance-critical paths
- Integration code

### Avoid ❌
- Code you can't review
- No way to verify results
- High-stakes without testing

---

## Decision Framework

```
1. Can I verify the result?
   NO → Don't use AI
   YES → Continue

2. Do I understand the domain?
   NO → Learn first
   YES → Continue

3. Is it security-critical?
   YES → Extra review
   NO → Continue

4. Can I break into testable pieces?
   NO → Rethink approach
   YES → Proceed
```

---

## Git Workflow with AI

```bash
# Before AI work
git status              # Clean working directory
git checkout -b ai/feature-name

# After AI work
git diff                # Review ALL changes
git add -p              # Add selectively
git commit -m "feat: description

🤖 Generated with Copilot Agent Mode assistance"
```

---

## Copilot Agent Mode Quick Reference

| Action | How |
|--------|-----|
| Open Agent Mode | Select "Agent" from chat agent picker |
| New Session | Click + in Chat view |
| Plan Mode | Select "Plan" from agent picker |
| Ask Mode | Select "Ask" from agent picker |
| Custom Agent | Select from agent dropdown |
| Hand Off | Switch agent type from dropdown |
| Background Agent | Select "Background" to run in worktree |
| Cloud Agent | Select "Cloud" for PR-based workflow |
| Enable Tools | Click Configure Tools in chat input |
| Auto-generate Instructions | Type `/init` in chat |

## Chat Shortcuts

| Command | Action |
|---------|--------|
| `/init` | Generate workspace instructions from your codebase |
| `/agents` | Configure Custom Agents menu |
| `/instructions` | Configure Instructions and Rules menu |
| `/skills` | Configure Skills menu |
| `/prompts` | Configure Prompt Files menu |
| `/YourPromptName` | Run a prompt file as a slash command |

## Recommended VS Code Settings

| Setting | Value | Purpose |
|---------|-------|---------|
| `chat.includeApplyingInstructions` | `true` | Auto-apply `.instructions.md` files when `applyTo` glob matches |
| `chat.includeReferencedInstructions` | `true` | Follow Markdown links in instruction files |
| `github.copilot.chat.agent.thinkingTool` | `true` | Enable reasoning tool for complex problems |
| `github.copilot.chat.search.semanticTextResults` | `true` | Improve search results with semantic matching |

---

## Test-First Pattern

```
1. "Write Pester tests for [function] covering:
    - Valid input
    - Invalid input
    - Edge cases
    - Error handling"

2. "Now implement [function] to pass those tests"

3. Agent runs tests and iterates until green
```

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| Inconsistent output | Add copilot-instructions.md with specific rules |
| Tests not running | Add test execution rule to copilot-instructions.md |
| Wrong patterns | Show existing code as example |
| Too verbose | Request "minimal" or "concise" |
| Wrong language | Specify PowerShell explicitly |

---

## Resources

- **Copilot Agent Mode**: https://code.visualstudio.com/docs/copilot/agents/overview
- **Custom Instructions**: https://code.visualstudio.com/docs/copilot/customization/custom-instructions
- **Custom Agents**: https://code.visualstudio.com/docs/copilot/customization/custom-agents
- **Agent Tools & MCP**: https://code.visualstudio.com/docs/copilot/agents/agent-tools
- **Copilot Coding Agent**: https://docs.github.com/copilot/using-github-copilot/using-copilot-coding-agent
- **Agentic Workflows**: https://github.github.com/gh-aw/
- **Alternative Tools**: Cline (github.com/cline/cline), Cursor (cursor.com), Claude Code (code.claude.com)
- **MCP Standard**: https://modelcontextprotocol.io
- **Pester Docs**: https://pester.dev
- **PSScriptAnalyzer**: https://github.com/PowerShell/PSScriptAnalyzer

---

## Copilot Customization Ecosystem

| # | Type | File | When It Activates |
|---|------|------|--------------------|
| 1 | **Project Instructions** | `.github/copilot-instructions.md` | Every chat request |
| 2 | **Pattern-Matched** | `.github/instructions/*.instructions.md` | When `applyTo` glob matches |
| 3 | **Custom Agents** | `.github/agents/*.agent.md` | When agent is selected |
| 4 | **Skills** | `.github/skills/*/SKILL.md` | Auto-detected by description keywords |
| 5 | **Prompt Files** | `.github/prompts/*.prompt.md` | When `/command` is typed |
| 6 | **Cross-Tool** | `AGENTS.md` / `CLAUDE.md` | Always-on |

### Other Tools' Instruction Files

| Tool | File | Purpose |
|------|------|---------||
| **Cline** | `.clinerules/*.md` | Project-specific rules |
| **Claude Code** | `CLAUDE.md` | Project instructions |
| **Cursor** | `.cursor/rules/*.md` | Project rules |
| **Windsurf** | Memories + Rules | Project context |

### Cross-Machine Sync (Advanced)

Share your customizations across machines via OneDrive:

```jsonc
// VS Code settings.json
"chat.agentFilesLocations":        { "~/OneDrive/MyCopilot/Agents": true }
"chat.instructionsFilesLocations": { "~/OneDrive/MyCopilot/Instructions": true }
"chat.agentSkillsLocations":       { "~/OneDrive/MyCopilot/Skills": true }
"chat.promptFilesLocations":       { "~/OneDrive/MyCopilot/Prompts": true }
```

---

## The Five Questions

1. **What is agentic coding?**
   > AI that autonomously plans, executes, and verifies

2. **Why does Git matter?**
   > Context + Traceability

3. **How to control AI?**
   > Instructions, agents, skills, prompts, and handoffs

4. **How to trust AI code?**
   > Automated testing + human review

5. **When to use it?**
   > Verifiable tasks with clear patterns

---

## Remember

```
┌─────────────────────────────────────────┐
│                                         │
│   YOU = Architect + Reviewer + Judge    │
│   AI = Implementer + Tester + Iterator  │
│                                         │
│   You + AI > You Alone                  │
│                                         │
└─────────────────────────────────────────┘
```

**Start small. Build confidence. Transform your workflow.**