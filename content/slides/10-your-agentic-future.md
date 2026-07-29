# Module 10: Your Agentic Future

## Version Guide

| Slide | Title | 1h | 2h | 4h |
|-------|-------|:---:|:---:|:---:|
| 10.1 | Recap | — | — | ✅ |
| 10.2 | The Five Questions | — | — | ✅ |
| 10.3 | Getting Started | ✅ | ✅ | ✅ |
| 10.4 | Your First Task | — | ✅ | ✅ |
| 10.5 | Building copilot-instructions.md | — | — | ✅ |
| 10.5a | Cross-Machine Sync | — | — | ✅ |
| 10.6 | Resources | ✅ | ✅ | ✅ |
| 10.7 | Sample Instruction Library | — | — | ✅ |
| 10.7a | With AI, Not From AI | — | — | ✅ |
| 10.8 | The Future | — | — | ✅ |
| 10.9 | Call to Action | ✅ | ✅ | ✅ |
| 10.10 | Final Thought | — | — | ✅ |
| 10.11 | Q&A | — | — | ✅ |
| 10.12 | Thank You | ✅ | ✅ | ✅ |

> *"The journey of a thousand miles begins with a single step."* — **Lao Tzu**

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

<!--
The five concepts on this slide are the load-bearing ones in the curriculum. Each maps to a module: agentic coding (M2), context (M3), instructions (M4), self-verification (M5), judgement (M9). The other modules — advanced capabilities (M8), beyond code (M11), the lab as sandbox (M12) — are extensions; these five are the foundation.

The ordering also matters. The agentic loop is the prerequisite vocabulary; context is what makes the loop produce useful output; instructions are how that context becomes durable; self-verification is what closes the loop; judgement is what decides whether the loop should run at all. A team that internalises only one of these in isolation tends to misuse the others; the value compounds when all five are present.
-->

---

## Slide 10.2: The Five Questions

# Can You Answer These?

### 1. What is agentic coding?
> AI that autonomously executes multi-step coding tasks, using context to plan, act, verify, and iterate.

### 2. Why does Git matter for AI?
> Git provides context (structure, patterns) and traceability (what changed).

### 3. How do I control AI behavior?
> Instruction files (copilot-instructions.md, .instructions.md) define standards. Custom agents (.agent.md) define specialized roles. Skills add domain knowledge. Prompts create reusable commands. Handoffs chain agents together.

### 4. How can I trust AI-generated code?
> Automated testing lets AI verify its own work, plus human review.

### 5. When should I use agentic coding?
> For well-defined tasks where you can verify results.

<!--
The five questions are a self-test the audience can run privately. Each one has a precise answer the curriculum supplied, and inability to answer any of them is a signal to revisit that module before adopting the practice in their own work. The questions are short enough to take home; the answers are the operating model in summary form.

The questions also form a useful interview pattern — teams adopting agentic tooling can use this list when hiring or onboarding to test whether a candidate has actually internalised the concepts or merely heard the vocabulary. The third question ("how do I control AI behaviour?") and the fifth ("when should I use agentic coding?") are the ones that most distinguish reflective practitioners from enthusiastic adopters.
-->

---

## Slide 10.3: Getting Started

# Start Small, Build Confidence

### Week 1: Setup
```
□ Enable Copilot Agent Mode in VS Code (chat.agent.enabled)
□ Enable recommended settings:
  - chat.includeApplyingInstructions: true
  - chat.includeReferencedInstructions: true
  - github.copilot.chat.agent.thinkingTool: true
  - github.copilot.chat.search.semanticTextResults: true
□ Create your first .github/copilot-instructions.md
□ Try the /init command to auto-generate instructions
□ Try one simple task in Agent mode
```

### Week 2: Practice
```
□ Use agentic workflow on a real (low-risk) task
□ Create a .instructions.md file for your language
□ Create a custom agent (.agent.md) for a common workflow
□ Create a prompt file (.prompt.md) for a repeated task
□ Watch the self-verification loop in action
□ Review diffs carefully
```

### Week 3: Integrate
```
□ Add copilot-instructions.md to a team project
□ Share custom agents with colleagues via .github/agents/
□ Try agent handoffs (Dev → Security Review)
□ Try background or cloud agent for a well-defined task
□ Establish team conventions for AI use
□ Build your prompt patterns library
```

<!--
The three-week ramp is a deliberate pacing recommendation, not a fixed schedule. Most engineers can compress the first week into a day if they already use Copilot in chat or completion mode; the more important variable is the *progression* (alone → with real work → with the team) rather than the calendar.

The single most-skipped step in this list is `/init`. Teams routinely write their first `copilot-instructions.md` from scratch, miss conventions that the agent's auto-scan would have surfaced, and end up with a file that misses what the codebase already implies. The `/init` output is rarely the final file, but it is almost always a better starting point than a blank page.
-->

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

<!--
The four "easy wins" on this slide are deliberately uninspiring. They are the tasks engineers already know they should do and tend to put off — missing tests, missing documentation, untouched scaffolding, error handling that never quite got added. The agent removes the activation cost and the engineer gets the closure of finally addressing the backlog.

The pattern is psychological as well as practical. A first successful agent task on a real piece of work converts more skeptics than any demo can. The win does not have to be impressive; it has to be *theirs* — their codebase, their problem, their improvement. The training's job is to make sure the first task is structured so that success is the overwhelmingly likely outcome.
-->

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

<!--
The progression from V1 to V2 is the realistic shape of an instruction file's evolution. V1 is the minimum viable rulebook — short enough to write in five minutes, specific enough to be enforceable. V2 is what the same file looks like after a few weeks of catching the agent doing things the team did not want.

The discipline that matters is *additive iteration*. Every new rule should answer the question "what behaviour did the agent produce in the last week that I want to prevent next week?" Rules added speculatively ("we should probably have a rule about X") rarely improve output because the agent had no problem with X to begin with. The file gets stronger by responding to observed failures, not by enumerating imagined ones.
-->

---

## Slide 10.5a: Cross-Machine Customization Sync

# Share Your Setup Across Machines

VS Code lets you redirect all five customization locations to a synced folder (e.g., OneDrive):

```powershell
# Setup-CopilotSettings.ps1 — run once per machine
$settingsPath = "$env:APPDATA\Code\User\settings.json"

# Back up existing settings
Copy-Item $settingsPath "$settingsPath.$(Get-Date -Format 'yyyyMMdd-HHmmss').bak"

$settings = Get-Content $settingsPath -Raw | ConvertFrom-Json

# Point all 5 customization types to OneDrive
$settings | Add-Member -NotePropertyName 'chat.agentFilesLocations' `
    -NotePropertyValue @{ '~/OneDrive/CopilotAtelier/Agents' = $true } -Force
$settings | Add-Member -NotePropertyName 'chat.instructionsFilesLocations' `
    -NotePropertyValue @{ '~/OneDrive/CopilotAtelier/Instructions' = $true } -Force
$settings | Add-Member -NotePropertyName 'chat.agentSkillsLocations' `
    -NotePropertyValue @{ '~/OneDrive/CopilotAtelier/Skills' = $true } -Force
$settings | Add-Member -NotePropertyName 'chat.promptFilesLocations' `
    -NotePropertyValue @{ '~/OneDrive/CopilotAtelier/Prompts' = $true } -Force
$settings | Add-Member -NotePropertyName 'chat.hookFilesLocations' `
    -NotePropertyValue @{ '~/OneDrive/CopilotAtelier/Hooks' = $true } -Force

# Enable recommended feature flags
$settings | Add-Member -NotePropertyName 'chat.includeApplyingInstructions' `
    -NotePropertyValue $true -Force
$settings | Add-Member -NotePropertyName 'github.copilot.chat.agent.thinkingTool' `
    -NotePropertyValue $true -Force

$settings | ConvertTo-Json -Depth 10 | Set-Content $settingsPath -Encoding UTF8
Write-Host "Restart VS Code to apply changes."
```

### What You Get:
- Write an agent once, use it on every machine
- OneDrive syncs your Instructions, Agents, Skills, Prompts, and Hooks automatically
- Works alongside per-project `.github/` customizations

<!--
Speaker notes (for newcomers):
- Two layers of customisation: **per-project** (lives in `.github/` inside the repo) and **personal** (lives in your user profile, follows you everywhere).
- This slide is the personal layer. Use OneDrive / Dropbox / iCloud — doesn't matter which.
- The script looks scary but only does one thing: tell VS Code "look in this synced folder for my instructions."
- Always back up `settings.json` before running configuration scripts — the script does this automatically.
-->

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
- **Cursor**: https://cursor.com (Dedicated AI editor, v2.5+)
- **Windsurf**: https://windsurf.com (Cascade agent)
- **Claude Code**: https://code.claude.com (Terminal + IDE)

### Complementary Tools
- **Warp**: https://warp.dev (AI-native terminal with smart completions)
- **GitHub Copilot CLI**: https://docs.github.com/copilot/using-github-copilot/using-github-copilot-in-the-command-line (AI assistance on the command line)
- **Zed**: https://zed.dev (Fast, collaborative code editor with built-in AI features)

### Model Context Protocol (MCP)
- **Specification**: https://modelcontextprotocol.io
- **Servers**: https://github.com/modelcontextprotocol/servers

### PowerShell + AI
- PowerShell Community Discord
- r/PowerShell on Reddit
- PowerShell.org forums

### This Presentation
- Repository (slides, demos, materials): <https://github.com/raandree/AgenticOperatingModel>
- Sample instruction files: [content/materials/sample-copilot-instructions/](../materials/sample-copilot-instructions/)
- *Presenting your own fork? Swap in your fork's URLs here.*

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
| Code Review | `CodeReview.prompt.md` | Security review slash command |
| Build Debug | `sampler-build-debug/SKILL.md` | Build troubleshooting skill |

### Where to Get Them:
- Included in presentation materials
- Use `/init` to auto-generate from your codebase
- Share improvements via Git

<!--
The sample library is meant to be a starting point, not a finished product. Each template captures the conventions of the workshop's reference codebase; teams will need to edit the contents to match their own conventions. The templates are valuable mainly as evidence that each customisation type — instructions, agents, skills, prompts — has a concrete authoring pattern that scales beyond toy examples.

The more durable resource is the small ecosystem of public sample repositories that has grown around the agentic-tooling community in 2025–26. The training points learners at a curated few rather than attempting to keep the table on this slide exhaustive — the field moves fast enough that any printed list goes stale quickly.
-->

---

## Slide 10.7a: With AI, Not From AI

# The Stockfish Pattern — and How This Curriculum Operationalises It

> *"I want to start a private project. I'll still use AI — but* with *AI, not* from *AI."*
> — Mössner's friend, after a week off Copilot
> (Cedric Mössner, *KI Burnout ist real*, 2026, @33:37)

### Two facts the doomers leave out

| Domain | After the machine surpassed humans … | What actually happened |
|--------|--------------------------------------|------------------------|
| **Chess** (Stockfish ≫ any human) | … chess **exploded in popularity**. Not despite the engine, *because* of it. The craft was never about beating the machine. | More players, deeper analysis, more streaming, more teachers. |
| **Aviation** (autopilot ≫ manual on routine) | … the FAA still **mandates regular hand-flying practice**. Skill atrophy is a known failure mode and is actively engineered around. | Pilots stay pilots, not autopilot supervisors. |

### The difference between *with* and *from*

| Pattern | What the operator does | Operator experience | Who owns the intent |
|---------|------------------------|---------------------|--------------------|
| *Code* **from** *AI* (the burnout default) | Open ticket → accept suggestion → commit → next ticket | Vigilance, decision fatigue, hollowing | The agent (by default) |
| *Code* **with** *AI* (the operating model) | Author intent in instruction files + memory bank → agent executes a bounded plan → operator verifies the **artefact** | Author / architect / reviewer | The human, in version control |

### How this curriculum makes "with" the default

| Surface from the 4h workshop | What it gives the operator |
|------------------------------|----------------------------|
| `copilot-instructions.md` (Module 3, Slide 10.5) | The operator's *standing intent* — version-controlled, peer-reviewed |
| Custom agents `.agent.md` (Module 4, Slide 10.7) | The operator's *named patterns of work* — not one-off prompts |
| Skills (`SKILL.md`) | The operator's *durable expertise* — captured once, reused everywhere |
| Memory Bank (Module 8) | The operator's *project subconscious* — the agent reads it; the operator writes it |
| Self-verification (Module 5) | The operator reviews *consequences* (tests, plans, diffs), not *tokens* |
| GitOps / Layer 6 (Slide 9.8e) | The operator approves *intent in Git*; the system reconciles. Vigilance loop removed. |

> Each one of those surfaces moves the operator **upstream** — from *prompter* to *author of intent*. Same AI. Same speed. Completely different role.

### Closing observation from the talk

> *"Ich glaube, wenn man Menschen mit einer Passion die Möglichkeit gibt, dann kann etwas wirklich Besonderes dabei rauskommen. Genau dieses Kreative ist das, was eine KI bis heute nicht hat."* (@34:50)

> The agentic operating model isn't *AI replaces humans*. It's *humans get back to the part the AI cannot do — and version-control the intent that makes it possible.*

<!--
The Stockfish comparison is the strongest historical anchor available for the "AI does not replace the craft" claim. Computer chess engines have been superhuman since the late 1990s; the population of competitive human players is at an all-time high, the supporting industry (streaming, coaching, analysis) is the largest it has ever been, and the human game is qualitatively more interesting because the engine raised the floor on what counts as a good move. None of this was the prediction in 1997.

The with/from distinction on this slide is the single most important sentence in Module 10. "Code from AI" is the burnout pattern named in Module 9 — the human becomes a quality gate for output they did not author. "Code with AI" is the operating-model pattern — the human authors intent (in instruction files, in specs, in the Memory Bank), and the agent executes against that intent. Same agent, same model, same speed; entirely different relationship to the work. The curriculum's claim is not that the second pattern is virtuous — it is that the second pattern is the one that sustains for years rather than burning out the operator in months.
-->

---

## Slide 10.8: The Future

# Where the Agentic Operating Model Is Going

### Already Here (July 2026):
- **Claude Opus 5** current; **GPT-5.6 Sol / Terra / Luna** rolling out; **Gemini 3.6 Flash** preview; **Kimi K2.7 Code** GA
- **Copilot SDK** in public preview — build your own agents on the Copilot platform
- **BYOK in VS Code** — bring your own OpenAI / OpenRouter / Ollama / local model keys; Agent Host support is experimental
- **Signed commits from Copilot cloud agent** — verified provenance on AI-generated PRs
- **Organization custom instructions GA** — enterprise-wide Copilot guardrails
- **Research, plan, and code** mode for cloud agent (multi-phase autonomous work)
- **Fix merge conflicts in 3 clicks** via Copilot cloud agent
- **VS Code Agents window** — grouped parallel sessions, multi-chat, live read-only subagent transcripts
- **Agent observability with OpenTelemetry** — Agent, Model, Tool, hook, subagent, cost, error, and outcome traces
- **Enterprise-managed Agent policy** — approvals, sandboxing, network filters, MCP sources, plugins, and telemetry
- **Agent CLI identification in terminals** (Copilot CLI, Claude Code, Gemini CLI)
- **Remote control CLI sessions** on web and mobile (public preview)
- **Copilot CLI BYOK + local models** — run agents against local Ollama or private endpoints
- **Manage agent skills via `gh` CLI** — skills are first-class in the GitHub tooling
- **Data residency (US / EU) + FedRAMP** — enterprise compliance unblocked
- **MCP + A2A** — complementary Agent-to-Tool and independent Agent-to-Agent protocols

### Near-Term (Next 6 months):
- Better multi-agent orchestration and inter-tool agent delegation
- Deeper CI/CD and DevOps integration (agentic workflows in Markdown)
- Domain-specific agent configurations shipped as first-class artifacts
- Improved self-correction with verification loops
- Mobile-first agent management becoming the norm

### Medium-Term (6-18 months):
- Self-driving codebases (Cursor research direction)
- AI-native development environments
- Agents managing entire project lifecycles
- Cross-repository understanding and refactoring

> **The tools are evolving fast. Your judgment stays essential.**

<!--
The Already-Here section is dated deliberately — by the time the deck is delivered next quarter, half of it will be stale. The trajectory is what carries forward: better models, more provider choice (BYOK), more programmable extension surfaces, more autonomous cloud execution, more enterprise controls.

The near-term and medium-term predictions on this slide are intentionally cautious. The field has a poor record of long-horizon forecasting; "self-driving codebases" is a real Cursor research direction in 2026 but no responsible vendor commits to a date. The honest summary is that capabilities expand quarterly, the operating model stays the same, and teams that invest in the model (instructions, tests, GitOps, Memory Bank) capture each successive capability with little extra work — while teams that did not invest end up rebuilding their workflow every six months chasing the latest tool.
-->

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

<!--
The immediate / this-week / ongoing structure is calibrated to convert intent into action. Most adoption failures happen in the gap between leaving a workshop motivated and opening the editor the next morning unsure what to do first. The immediate items are deliberately small enough to complete in twenty minutes; the week-one items expand the surface; the ongoing items are the durable practice.

The order also matters. Enabling Agent Mode before writing an instruction file leaves the operator unsupervised; writing the instruction file first ensures the first agentic task already operates under the team's rules. The "share with a colleague" item in week one is the social-mechanism step — it moves the practice from individual to team without requiring a top-down rollout.
-->

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
│   │     YOUR EXPERTISE  (The Conductor)                     │  │
│   │     ───────────────────────────────                     │  │
│   │     • Domain knowledge                                  │  │
│   │     • Design judgment                                   │  │
│   │     • Quality standards                                 │  │
│   │     • Review capability                                 │  │
│   │     • Vision of the perfect result                      │  │
│   │                                                         │  │
│   │              +                                          │  │
│   │                                                         │  │
│   │     AI CAPABILITIES  (The Musicians)                    │  │
│   │     ────────────────────────────────                    │  │
│   │     • Speed of execution                                │  │
│   │     • Pattern recognition                               │  │
│   │     • Comprehensive testing                             │  │
│   │     • Tireless iteration                                │  │
│   │     • Autonomous performance                            │  │
│   │                                                         │  │
│   │              =                                          │  │
│   │                                                         │  │
│   │     A SYMPHONY  (The Result)                            │  │
│   │     ────────────────────────                            │  │
│   │     Better code, faster delivery, less tedium           │  │
│   │                                                         │  │
│   └─────────────────────────────────────────────────────────┘  │
│                                                                 │
│   "The whole is greater than the sum of its parts."            │
│                                          — Aristotle           │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Operating metaphor — sergeant and commander

> *"The AI is the tactical sergeant on the ground. You are the strategic commander above it."*
> — paraphrased from **Matt Pocock**, *"Claude Code for real engineers"*, 2026

- **Sergeant (AI)**: executes the assault, reports what it sees, surfaces casualties (failing tests, broken builds, unexpected behaviour).
- **Commander (you)**: holds the map, sets the objective, decides what counts as victory, owns the consequences.

Lose the commander and the sergeant still moves — but no longer *toward* anything. That is heteromation (M9.10b) by another name.

<!--
The Aristotle quotation (the whole is greater than the sum of its parts) is doing real work here, not just decorative. The augmentation thesis the entire training rests on is that the combination of human judgement and agent execution produces results neither would reach alone — not because of any mysterious synergy but because the two parties contribute different things. The human supplies intent, context, taste, and accountability; the agent supplies speed, breadth, patience, and tirelessness. Each is bad at the other's job.

The sergeant/commander metaphor from Matt Pocock is the operational version of the same idea. The sergeant is fast and competent but moves toward whatever objective is given; the commander is slower but decides what the objective should be. Inverting the roles — letting the agent set the objective and the human execute it — produces the heteromation pattern from Module 9: the human becomes the machine's tool. Keeping the roles the right way round is the entire operating model in one sentence.
-->

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
*(Presenter: add your own contact details before delivering.)*
- Email: _your email_
- Social: _your LinkedIn / X / Mastodon_
- Website: _your site_

### Materials:
- Repository: <https://github.com/raandree/AgenticOperatingModel>
- [Download link for samples]

<!--
The Q&A is usually where the most useful conversation of the training happens, because the questions surface what the audience has internalised versus what slid past. The five common topics listed on the slide are reliable starters when no one raises a hand first; in practice the room usually has its own opening question.

The most common genuine question after this training is some version of "how do I convince my team / my manager / my security organisation to allow this?" That question is partly about the technology but mostly about organisational change — instruction files committed to a shared repository, GitOps as a structural guardrail, Memory Bank as an audit trail. The curriculum has these answers in its body; the Q&A is where they get connected to the specific organisation in the room.
-->

---

## Slide 10.12: Thank You

# Thank You!

## Key Takeaways

1. **Agentic coding** = AI that acts, not just suggests
2. **Git** = Context + Traceability
3. **Instruction files** = Consistent, quality output
4. **Custom agents** = Specialized AI behaviors
5. **Skills & prompts** = Domain knowledge + reusable commands
6. **Agent handoffs** = Multi-agent pipelines
7. **Automated testing** = AI proves its work
8. **Your judgment** = Still essential

> **Start small. Build confidence. Transform your workflow.**

### Remember:
> You become the **architect** and **reviewer**.
> AI becomes your **tireless implementer**.

<!--
The closing slide compresses the entire training into eight bullets and one operating sentence. The sentence — "you become the architect and reviewer, AI becomes your tireless implementer" — is the line the training wants people to leave the room remembering. If everything else fades, that role assignment is what stays useful.

The Lao Tzu epigraph at the top of the module ("the journey of a thousand miles begins with a single step") is the right closing note. The training does not promise transformation; it promises a starting point and a map. The transformation, if it happens, is the result of the work the team does in the weeks after, applying the operating model to their actual codebase, on their actual problems, with their actual constraints. The training's job is done when the audience leaves knowing what to do tomorrow morning.
-->

---

## Speaker Notes - Module 10

### Timing: 10-15 minutes (including Q&A)

### Key Points:
1. Recap the core concepts (now including skills, prompts, handoffs)
2. Give actionable next steps (including VS Code settings)
3. Show cross-machine sync as an advanced pattern
4. Provide resources
5. Inspire action, not intimidation

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