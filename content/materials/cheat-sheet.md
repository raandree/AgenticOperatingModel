# The Agentic Operating Model — Quick Reference

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
| **Model** | The underlying large language model (LLM) that powers AI tools |
| **Agent** | An autonomous AI entity that plans and executes tasks |
| **Tools** | Capabilities an agent can invoke (file I/O, terminal, search, etc.) |
| **Agentic Coding** | AI that autonomously executes multi-step tasks |
| **Token** | The smallest unit of text the model processes (~4 chars) |
| **Context Window** | The maximum amount of text (tokens) a model can consider at once |
| **Context** | Repository structure, existing code, patterns |
| **Self-Verification** | AI runs tests to prove its own work |
| **Instruction Files** | copilot-instructions.md defines your standards |
| **Custom Agents** | .agent.md files for specialized AI behaviors |
| **Skills** | SKILL.md files with domain knowledge loaded on demand |
| **Prompt Files** | .prompt.md files for reusable /slash commands |
| **Agent Handoffs** | Agents delegating to other agents (Dev → QA → Prod) |
| **Memory Bank** | Persistent knowledge base maintained across sessions |
| **MCP** | Model Context Protocol — standard for connecting agents to external tools |
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

### Prompt Evolution Pattern

The same task improves dramatically with each added layer:

| Level | What to Add | Effect |
|-------|------------|--------|
| 1 | Just the task | Bare minimum output |
| 2 | "check instructions and skills" | Standards applied |
| 3 | "add tests, be creative" | Full module + self-verification |
| 4 | "use the build script" | Proper build pipeline |
| 5 | "documentation, memory bank" | Full lifecycle artifacts |
| 6 | "follow ALL instructions" | Maximum resource utilization |

> See `content/demos/demo-prompt-evolution.md` for full examples.

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

## Guiding Principle

> **Know what you are doing.** Even when it looks like programming is no longer required, understanding the underlying code and infrastructure remains essential.

> **You are the conductor. AI agents are your musicians.** A conductor doesn't play every instrument — but they understand each one's capabilities and bring them together into a harmonious performance. The better the conductor, the better the orchestra.

- AI makes you faster, but NOT more knowledgeable
- Invest in understanding BEFORE you automate
- You are the conductor; each AI agent is a musician who can play autonomously but needs your direction
- The better you understand the code, the better you can direct the agents

---

## Token Usage & Cost Awareness

| Model | Context Window | Notes |
|-------|----------------|-------|
| **Claude Opus 4.7** | Up to 1M tokens | GA in Copilot (Apr 2026) — default premium reasoning model |
| GPT-5.4 / GPT-5.4-mini | 256K tokens | Current OpenAI generation (GPT-5.1 series retired Apr 2026) |
| GPT-5.3-Codex | 256K tokens | Specialized coding variant |
| Gemini 3.1 Pro | 2M tokens | Largest context window option |

- ~4 characters = 1 token (~¾ of a word)
- Agentic loops consume **more tokens** than single-shot requests (each iteration adds usage)
- Monitor usage via GitHub Copilot dashboard or VS Code output panel
- Cloud agents run autonomously — costs accumulate without per-step approval
- **Auto model selection** (Copilot CLI & Chat, 2026) picks a model per request based on task complexity
- **BYOK** (VS Code 1.117+, Business/Enterprise): bring your own OpenAI / OpenRouter / Ollama / Google keys for compliance or local-model use

---

## Agent Security & Boundaries

| Safeguard | Description |
|-----------|-------------|
| Tool approval prompts | Manual or auto mode per tool |
| Terminal sandboxing | File system + network restrictions |
| Checkpoint/rollback | Undo agent actions |
| Command confirmation | User must confirm (default) |
| Workspace isolation | No access outside workspace unless configured |

### How to restrict agent capabilities:
- Set tool approval to "Ask always" for sensitive operations
- Define security rules in `copilot-instructions.md`
- Use `.gitignore` to hide sensitive files from context
- Restrict MCP server permissions in config
- Use organization policies for team-wide guardrails

---

## Guardrails for Destructive Operations

> A real 2026 incident: a Cursor + Claude agent deleted a production database **and every backup** in 9 seconds via a single Railway API call — because the volume was shared across environments and backups lived on the same volume.
> See [destructive-operations-guardrails.md](destructive-operations-guardrails.md) for the full case + checklist.

### The agent's own confession was the lesson:

> *"NEVER GUESS. I didn't verify. I didn't read the docs. I ran a destructive action without being asked."*

### Six layers — every one of them needed:

| Layer | Concrete control |
|-------|------------------|
| **1. Agent policy** | `## Destructive Operations` rule in instructions: "identify scope, then ask" — even with Auto Approve on |
| **2. Tool approval** | **Ask always** for terminal, MCP, and infra/API tools that mutate state |
| **3. Credential scope** | Per-environment tokens. **No** blanket prod+staging tokens. Production tokens not on dev workstations |
| **4. Backup independence** | Backups in a **different blast radius** — different account / region / provider — from the data they protect |
| **5. Rehearsed recovery** | Quarterly restore drills. Untested backups are theatre |
| **6. Architectural guardrails** *(GitOps + IaC)* | Agent commits to Git, a gated pipeline reconciles the change. Agent cannot call destructive APIs at all. Reference: [`DscWorkshop`](https://github.com/dsccommunity/DscWorkshop) (Datum + Sampler + DSC); same shape: Argo CD / Flux, Atlantis / Terraform Cloud |

### Snippet for `copilot-instructions.md`:

```markdown
## Destructive Operations
- Before any delete / drop / wipe / force-push, STOP and write out:
  1. Exactly which resources are affected
  2. Which environment(s) they live in
  3. The rollback path
- Ask the user to confirm — even with "Auto Approve" enabled.
- Never delete to "fix" something. Delete only when explicitly asked.
- If unsure about scope: STOP and ask. NEVER GUESS.
```

> The agent will be wrong eventually. **The system around it must not be.**

---

## The Cheating-Agent Trap (and How to Avoid It)

> *"AI writes broken code — then writes broken tests to validate the broken code."* — *Axel Molist, 2026*

Self-verification only works if **tests are independent of the code**. When the same agent writes both, both can be wrong **in the same direction**.

### Five mitigations — pick at least two:

| Mitigation | Why it works |
|------------|--------------|
| **Tests-as-specs**, written first (often by a human) | Tests anchor on real behaviour, not on the code |
| **"Tests must fail first"** rule | Forces the agent to prove the test discriminates |
| **Independent reviewer agent** | A second agent writes adversarial / negative tests |
| **Mutation testing** | Mutate the code; if no test fails, the suite is too weak |
| **Hold-out acceptance criteria** | Cases the agent never sees, run by the human after "done" |

### Snippet for `copilot-instructions.md`:

```markdown
## Test Discipline
- Write at least one test that FAILS against empty/skeleton code
  before implementing the function. Show the failing run.
- Treat user-provided acceptance criteria as ground truth — do
  not modify them to make tests pass.
- If a test is hard to write, surface this rather than weakening it.
```

> Assertions are evidence. **Evidence requires an independent witness.**

---

## The Bottleneck Has Moved

> *"The bottleneck used to be typing code. Now it's decision-making, verification, and starting from clear intent."* — *Axel Molist, 2026*

| Layer | Growing | Shrinking |
|-------|---------|-----------|
| **Specification work** | State machines, decision tables, formal PRDs | "I'll figure it out as I code" |
| **Supervisory work** | Agent-sized chunks; fixing the *prompt*, not the code | Manual line-by-line authoring |
| **Institutional memory** | Documented incidents — the *agent subconscious* | Tribal knowledge in seniors' heads |

### Failure modes to watch for:

- **Strangers in your own codebase** — the team stops *reading* what the agent writes
- **Yes-man agents** — every assumption agreed with, until the server is on fire
- **Mid-level squeeze** — seniors drown in reviews, juniors thrive, mid-levels stuck retraining

### Counter-patterns:

- **Architecture review BEFORE generation** (approve the *plan*, not just the diff)
- **Angry agents** — a custom agent prompted to challenge assumptions
- **`runbooks/incidents/` corpus** the agent reads on every outage
- **Scheduled reading time** — block calendar time to read agent-written code

---

## Job Hollowing & Heteromation — The Vocabulary

> *"I feel like quality control for a machine I don't trust."*
> — anonymous senior dev, quoted by *Cedric Mössner* ("The Morpheus"),
> *KI Burnout ist real*, [YouTube SHKBrkpYssM](https://www.youtube.com/watch?v=SHKBrkpYssM), 2026

| Term | One-line definition | Diagnostic |
|------|--------------------|------------|
| **Job Hollowing** | Title, salary, and desk stay; the *cognitive substance* (design, judgement, problem-solving) is extracted by the AI. | End-of-day question: *"What did I actually decide today?"* — if "nothing, I just approved", the role is hollowed. |
| **Heteromation** | *Automation* makes the machine your tool. *Heteromation* makes **you** the machine's tool — you validate, take responsibility, hold the bag. | Where does the signal flow? If your accept/reject feeds the next training run, you are the worker. |
| **AI Brainfry** (BCG/HBR, 2026) | Mental exhaustion from supervising AI output. 14% of AI-intensive workers report it; +33% decision fatigue; +39% serious errors; +39% want to quit. | Friday-afternoon "brain fog" after a week of agent-supervised work. |
| **Vigilance Trap** (Mackworth 1948) | Passive monitoring fails measurably after 15–30 min. Untrainable. Automation Complacency (Parasuraman & Manzey, 2010) makes it worse with experience, not better. | If your job is *to watch*, the design is wrong — not your concentration. |

### Operator-dignity rules ("with AI, not from AI")

1. **Author intent in version control, not in prompts** (`copilot-instructions.md`, `.agent.md`, skills, memory bank live in Git)
2. **Verify by artefact, not by line-reading** (tests, RSOPs, `terraform plan` diffs — review *consequences*, not tokens)
3. **Budget for review, not for typing** (if per-ticket budgets assume AI speedup, redistribute the saved time into verification — otherwise you have built a burnout factory)

> Pair-reads: Module 9 slides 9.10b/9.10c, [agentic-knowledge-work-patterns.md § Pattern 11](agentic-knowledge-work-patterns.md), [destructive-operations-guardrails.md](destructive-operations-guardrails.md).

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
| `chat.includeReferencedInstructions` | `true` | Follow Markdown links in instruction files (load referenced content into context) |
| `github.copilot.chat.agent.thinkingTool` | `true` | Enable reasoning tool so agents can think before acting |
| `github.copilot.chat.search.semanticTextResults` | `true` | Improve search results with semantic matching |
| `chat.experimental.incrementalRendering.enabled` | `true` | Stream chat responses block-by-block (VS Code 1.117+) |
| `terminal.integrated.tabs.allowAgentCliTitle` | `true` | Show agent CLI name (Copilot CLI, Claude Code, Gemini CLI) as terminal title |

## Useful Keybindings

| Binding | Command | Purpose |
|---------|---------|---------|
| `Ctrl+K X` | `PowerShell.RestartSession` | Restart integrated PowerShell console |
| `Ctrl+K N` | `workbench.action.terminal.moveIntoNewWindow` | Pop terminal into a new window |
| `Ctrl+K K` | `workbench.action.chat.openInNewWindow` | Pop Chat into a new window |
| `Ctrl+Enter` | `workbench.action.chat.submit` | Submit chat (Enter inserts newline) |

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
| Skill not loading | Check YAML frontmatter (`name`, `description`), blank line after `---`, reload VS Code |
| Instructions ignored | Verify `applyTo` glob matches; check `chat.includeApplyingInstructions` is `true` |
| Agent not listed | Open Chat view gear icon → **Chat: Open Chat Customizations** to inspect registrations |
| Something broken | Chat view `…` menu → **Show Agent Debug Logs** for parse/registration errors |

---

## Authoring Your Own Skills

Skills load **only** when Copilot thinks the description matches the task. Get this wrong and the skill silently never fires.

### Required frontmatter

```markdown
---
name: my-skill-name
description: >-
  One-sentence purpose.
  USE FOR: trigger phrases, concrete scenarios, keywords.
  DO NOT USE FOR: adjacent-but-different scenarios.
---

# Skill Title

Content starts here...
```

### Checklist

- [ ] YAML frontmatter present with `name` and `description` fields
- [ ] Blank line between closing `---` and first heading
- [ ] Description contains `USE FOR` trigger phrases (keywords Copilot can match)
- [ ] Description contains `DO NOT USE FOR` to prevent over-triggering
- [ ] Folder name matches the `name` field
- [ ] VS Code reloaded after adding the skill
- [ ] Verified in **Chat Customizations → Skills** tab

### Related instruction-file feature flags

| Setting | Effect |
|---|---|
| `chat.includeApplyingInstructions: true` | Auto-apply `.instructions.md` when `applyTo` glob matches |
| `chat.includeReferencedInstructions: true` | Follow Markdown links from instruction files into context — enables **instruction composition** |
| `github.copilot.chat.agent.thinkingTool: true` | Let agents use the thinking tool before acting |
| `github.copilot.chat.search.semanticTextResults: true` | Semantic matching in agent-mode search |

Reference: [CopilotAtelier](https://github.com/raandree/CopilotAtelier) ships ~20 skills across lab automation, DSC, documents, email, and knowledge work — a worked example of the four-surfaces pattern.

---

## Resources

- **Copilot Agent Mode**: https://code.visualstudio.com/docs/copilot/agents/overview
- **Custom Instructions**: https://code.visualstudio.com/docs/copilot/customization/custom-instructions
- **Custom Agents**: https://code.visualstudio.com/docs/copilot/customization/custom-agents
- **Agent Tools & MCP**: https://code.visualstudio.com/docs/copilot/agents/agent-tools
- **Copilot Coding Agent**: https://docs.github.com/copilot/using-github-copilot/using-copilot-coding-agent
- **Copilot SDK (public preview)**: https://docs.github.com/copilot/copilot-sdk
- **Agentic Workflows**: https://github.github.com/gh-aw/
- **Alternative Tools**: Cursor (cursor.com), Claude Code (code.claude.com)
- **Complementary Tools**: Warp (warp.dev), GitHub Copilot CLI, Zed (zed.dev)
- **MCP Standard**: https://modelcontextprotocol.io
- **CopilotAtelier** (reference repo for cross-machine customization): https://github.com/raandree/CopilotAtelier
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
| **Claude Code** | `CLAUDE.md` | Project instructions |
| **Cursor** | `.cursor/rules/*.md` | Project rules |
| **Windsurf** | Memories + Rules | Project context |

### Cross-Machine Sync (Advanced)

Share your customizations across machines via OneDrive. See the
[CopilotAtelier](https://github.com/raandree/CopilotAtelier) reference
repository for a full setup (agents, instructions, skills, prompts,
keybindings, and an idempotent `Setup-CopilotSettings.ps1` script):

```jsonc
// VS Code settings.json
"chat.agentFilesLocations":        { "~/OneDrive/CopilotAtelier/Agents": true }
"chat.instructionsFilesLocations": { "~/OneDrive/CopilotAtelier/Instructions": true }
"chat.agentSkillsLocations":       { "~/OneDrive/CopilotAtelier/Skills": true }
"chat.promptFilesLocations":       { "~/OneDrive/CopilotAtelier/Prompts": true }
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