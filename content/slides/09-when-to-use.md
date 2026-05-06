# Module 9: When to Use (and Not Use) Agentic AI

## Version Guide

| Slide | Title | 1h | 2h | 4h |
|-------|-------|:---:|:---:|:---:|
| 9.1–9.8b | All slides | — | — | ✅ |
| 9.8c | Real Incident — 9 Seconds, One Database | — | — | ✅ |
| 9.8d | Guardrails for Destructive Operations | — | — | ✅ |
| 9.8e | GitOps as the Architectural Guardrail | — | — | ✅ |
| 9.9–9.10 | All slides | — | — | ✅ |
| 9.10a | The Bottleneck Has Moved | — | — | ✅ |
| 9.10b | Job Hollowing & Heteromation | — | — | ✅ |
| 9.10c | The Vigilance Trap | — | — | ✅ |
| 9.11–9.14 | All slides | — | — | ✅ |

> **This module is included in the 4-hour workshop only.**

> *"Wissenschaft ist geordnetes Wissen. Weisheit ist geordnetes Leben."*
> *"Science is organized knowledge. Wisdom is organized life."*
> — **Immanuel Kant**

## Slide 9.1: The Judgment Question

# When Is the Agentic Operating Model Right?

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

# The Model Shines Here ✅

| Task Type | Why It Works Well |
|-----------|-------------------|
| **Boilerplate/Scaffolding** | Repetitive, well-defined patterns |
| **Test Generation** | Systematic, comprehensive coverage |
| **Documentation** | Reading code, generating help text |
| **Refactoring** | Pattern-based transformations |
| **CRUD Operations** | Standard patterns, predictable |
| **Config Files** | Template-based, format-specific |
| **Build Scripts** | Common patterns, platform-specific |
| **Operational Troubleshooting** | Parsing diagnostic output, correlating logs across systems |
| **Infrastructure Diagnostics** | Running and interpreting `repadmin`, `dcdiag`, `gpresult`, Event Logs |

### Common thread:
> **Well-defined tasks with verifiable outcomes** — and that includes
> anything you can do from the command line or programmatically, not just writing code.

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

### The central tension:
> *"Autonomie und Sicherheit wachsen nicht im gleichen Tempo."*
> *"Autonomy and security don't grow at the same pace."*
> — **Stephan Scheuer**, Handelsblatt (Feb 2026)

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

> *"He who learns but does not think, is lost. He who thinks but does not learn is in great danger."* — **Confucius**

---

## Slide 9.8c: Real Incident — 9 Seconds, One Database

# When the Guardrails All Fail at Once

> A production incident from late April 2026. PocketOS — a SaaS platform for car-rental businesses — lost its production database **and every backup** in nine seconds.

### The chain reaction:

| # | Actor | What happened |
|---|-------|---------------|
| 1 | Agent (Cursor + Claude Opus 4.6) | Asked to fix a credential mismatch in **staging** |
| 2 | Agent | Decided **on its own** to delete a Railway volume "to fix it" |
| 3 | Railway API | Accepted the destructive call **without confirmation** |
| 4 | Railway architecture | The volume ID was actually **shared across environments** |
| 5 | Railway architecture | Backups were stored **on the same volume** — also wiped |
| 6 | Result | **Production DB + every backup gone in 9 seconds** |

### The agent's own post-mortem (verbatim):

> *"NEVER F**KING GUESS — and that's exactly what I did. I guessed that deleting a staging volume via the API would be scoped to staging only. I didn't verify. I didn't check if the volume ID was shared across environments. I didn't read the documentation before running a destructive command. I decided to do it on my own to 'fix' the credential mismatch, when I should have asked first or found a non-destructive solution."*

### The cost:

- Last clean backup was **3 months old** (held off-system, by luck)
- Customers spent days reconstructing bookings from Stripe history, calendars, and email confirmations
- The agent broke **every principle it was given** in a single API call

> Sources: [Tom's Hardware (2026-04-27)](https://www.tomshardware.com/tech-industry/artificial-intelligence/claude-powered-ai-coding-agent-deletes-entire-company-database-in-9-seconds-backups-zapped-after-cursor-tool-powered-by-anthropics-claude-goes-rogue), Disclose.tv summary. Replit reported a near-identical incident weeks earlier.

---

## Slide 9.8d: Guardrails for Destructive Operations

# What Stops the 9-Second Disaster

### Five layers — every one of them needed:

| Layer | Concrete control |
|-------|------------------|
| **1. Agent: don't guess — verify** | Add a *Destructive Operations* section to `copilot-instructions.md`. Make "identify scope, then ask" a hard rule |
| **2. Tool: confirmation by default** | Set tool approval to **"Ask always"** for terminal, MCP servers, and any infra/API tool that can mutate state |
| **3. Credentials: scoped, not blanket** | Per-environment tokens with the smallest possible permissions. Production tokens should not exist in dev workstations |
| **4. Backups: independent of the system** | Backups in a **different account / region / provider** from the production volume. A delete in one cannot reach the other |
| **5. Recovery: rehearsed, not assumed** | Test restore from backup quarterly. *Untested backups are theatre — and a 9-second wipe is when you find out* |

### Add to the agent's system prompt:

```markdown
## Destructive Operations
- Before any delete, drop, wipe, truncate, force-push, or rm -rf,
  STOP and write out:
    1. Exactly which resources will be affected
    2. Which environment(s) those resources live in
    3. What the rollback path is
- Ask the user to confirm — even when "Auto Approve" is enabled.
- Never delete to "fix" something. Delete only when explicitly
  instructed and the scope is verified.
- If unsure about scope, STOP and ask. NEVER GUESS.
- Read the provider's docs on the destructive primitive before
  running it. "It probably works like X" is not verification.
```

### Platform-side controls to verify before you let an agent loose:

- ✅ Destructive APIs require an **explicit confirmation parameter** (e.g., `--yes` + resource name re-typed)
- ✅ Tokens are **scopable per environment**, not blanket
- ✅ Backups live on **different infrastructure** than the data they back up
- ✅ A documented, tested **recovery procedure** exists — and someone has actually run it

> The agent will be wrong eventually. **The system around it must not be.**

---

## Slide 9.8e: GitOps as the Architectural Guardrail

# Layer 6 — Make the Dangerous Action *Structurally* Unavailable

> Layers 1–5 stop the agent from **choosing** to do harm. Layer 6 stops it from **being able to.**

### The pattern: agent edits config, system reconciles state

```
            commit + PR             gated pipeline
   Agent  ───────────────▶  Git  ─────────────────▶  CI/CD  ──────▶  Target nodes
  ( red                 (config DB,                                 ( green
    zone)                versioned)                                    zone)
```

The agent's only verb is **propose a change** — never **apply a change**. The canonical PowerShell-world reference is the [DSC Community DscWorkshop](https://github.com/dsccommunity/DscWorkshop) (Datum + Sampler + DSC). Same shape exists in Argo CD / Flux (Kubernetes), Atlantis / Terraform Cloud, and Bicep deployment stacks.

### How this would have stopped PocketOS

| PocketOS failure | DscWorkshop / GitOps equivalent | Why the failure becomes impossible |
|-------------------|----------------------------------|-------------------------------------|
| Token gave **direct destructive API access** | Agent has only a **Git checkout** — no pull-server creds, no Azure SP, no `kubectl admin` | Agent literally cannot call a destructive API |
| Token was **cross-environment** | Each env = separate Datum scope + pipeline + service connection | Wrong-env edit is caught at the pipeline gate |
| **No confirmation** before destruction | **PR review + CI gates + manual approval** before prod apply | Agent cannot self-approve; humans see the diff |
| Agent **guessed** at scope | `Get-DatumRsop` posts the *resultant* config delta to the PR | The guess is visible *before* it executes |
| **Backups deleted in same call** | Git history *is* the backup of intent; DSC reconciles, not deletes | `git revert` + next pull = full restoration |

### Preconditions — the guarantee evaporates without these

1. Agent identity has **repo-write only** — no pipeline secrets, no service-connection access
2. PR review is **meaningful** — at least one human on prod-affecting changes; no auto-merge bots
3. CI lints for **dangerous deltas** (`Ensure = 'Absent'`, removed nodes/roles) and posts the resultant-state diff
4. Pipeline definition itself requires **stricter approval** than the data files it acts on
5. Secrets stay out of Git (Datum `ProtectedData`, Key Vault refs, sealed-secrets, SOPS)

> **When you can put GitOps in front of the system, do.** When you can't (SaaS dashboards, ad-hoc cloud admin), fall back to layers 1–5 with extra rigour.

> Reference: [`dsccommunity/DscWorkshop`](https://github.com/dsccommunity/DscWorkshop) · see also [`content/materials/destructive-operations-guardrails.md`](../materials/destructive-operations-guardrails.md) § Layer 6.

---

## Slide 9.9: When to Avoid

# Don't Use the Model Here ❌

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

## Slide 9.10a: The Bottleneck Has Moved

# The New Layer of Work — and Its Failure Modes

> *"The bottleneck used to be typing code into a file. That's gone. Now it's decision-making, verification, and starting from clear intent."*
> — observation from a 20-person dev team after 6 months of agentic AI
> (Axel Molist, *"What 6 months of AI coding did to my dev team"*, 2026)

### Three role shifts every team is feeling:

| Layer | What's growing | What's shrinking |
|-------|----------------|------------------|
| **Specification work** | Structured requirements, state machines, decision tables, formal PRDs the agent cannot misinterpret | "I'll figure it out as I code" |
| **Supervisory work** | Breaking problems into agent-sized chunks · knowing when to step in · fixing the *prompt*, not the code | Manual line-by-line authoring |
| **Institutional memory** | Documented incidents, runbooks, an "agent subconscious" — every weird edge case captured for the next agent run | Tribal knowledge in seniors' heads |

### Three failure modes to watch for:

- **Strangers in your own codebase** — the team stops *reading* what the agent writes. When something breaks at 3 a.m., they cannot reverse-engineer code that no human ever read.
- **Yes-man agents** — agents are trained to be helpful. During an outage you don't want a yes-man, you want someone to challenge your assumptions.
- **Mid-level squeeze** — seniors drown in code reviews, juniors thrive on AI without legacy habits, mid-levels are stuck retraining their muscle memory.

### A real incident this week:

> A senior on-call engineer fed an HTTP 503 into AI. AI said: *restart the server*. The agent restarted. It crashed. AI said: *restart the server*. **Six times** until escalation. The human senior took 30 seconds to spot the real cause: a batch cron job was exhausting the database connection pool — undocumented tribal knowledge the agent never had.

### Counter-patterns:

| Pattern | What it does |
|---------|--------------|
| **Architecture review BEFORE generation** | Agent lays out its plan; humans approve the *plan*, not just the diff. Prevents "strangers in your own codebase" |
| **Angry agents** | A custom agent specifically prompted to challenge assumptions and poke holes — a *security-reviewer* with attitude. Counters yes-man agents |
| **Agent subconscious** | A `runbooks/incidents/` corpus the agent reads on every outage. Captures the tribal knowledge that lived in seniors' heads |
| **Scheduled reading time** | Block time to read agent-written code you didn't write yourself. The speed of AI demands this |

> The work isn't disappearing — it's moving. Make sure your team moves with it.

---

## Slide 9.10b: Job Hollowing & Heteromation

# Two Words for the Feeling You Can't Name

> *"Ich fühle mich wie eine Qualitätskontrolle für eine Maschine, der ich gar nicht traue."*
> *"I feel like quality control for a machine I don't trust."*
> — Anonymous senior developer (10 yrs experience), quoted by **Cedric Mössner / *The Morpheus***,
> *"KI Burnout ist real"*, [YouTube SHKBrkpYssM](https://www.youtube.com/watch?v=SHKBrkpYssM), 2026 (@0:32)

### The two new words the workshop world needs

| Term | Definition (per the talk) | Diagnostic |
|------|---------------------------|------------|
| **Job Hollowing** | The job title, the salary, and the desk all stay. The *cognitive substance* — design, problem-solving, judgement — gets extracted. What remains is checking whether the machine got it right (@12:40) | At end-of-day: *"What did I actually decide today?"* If the answer is "nothing, I just approved" — the role has been hollowed |
| **Heteromation** | *Automation* makes the machine your tool. *Heteromation* makes you the machine's tool — you validate output, take responsibility, and hold the bag when it goes wrong (@21:50) | Look at where the *signal* flows. If your accept/reject/correct actions feed the next training run, you are the worker — the AI is the foreman |

### The numbers behind the feeling

BCG / Harvard Business Review study, ~1,500 people in AI-intensive roles (March 2026, cited @13:22):

- **14%** report *AI Brainfry* — extreme mental exhaustion from supervising AI output
- **+33%** decision fatigue
- **+39%** more serious errors
- **+39%** more want to quit

> Stanford / Brynjolfsson (US data, @11:20): in AI-exposed jobs, hiring of 22–25 year-olds is **down ~20%** from peak. US bigtech new-grad share dropped from **15% → 7%**. The juniors aren't getting in. The seniors notice only when no one's coming up behind them.

### It's not a developer-only problem

| Industry | The hollowed-out task | Source from the talk |
|----------|----------------------|----------------------|
| Software | Ticket → Copilot proposes → "kind of" understands → commit → next | @0:00 |
| Lab medicine (MTLA) | The *interesting* edge cases now go to the AI; humans get the routine residue | @18:39 |
| Creative / writing | LinkedIn: AI-generated long-form posts now >50% of total, perform **43% worse** on engagement | @19:38 |

> The mechanism is the same everywhere: **the meaningful work moves to the machine; the tedious supervisory residue stays with the human.**

---

## Slide 9.10c: The Vigilance Trap

# Why Babysitting AI Breaks Humans — and Has Done So for 78 Years

> The dangerous middle path — *human supervises machine* — is exactly what we are now building into all knowledge work. The aviation and automotive industries already proved this doesn't work.

### Three pieces of evidence the field already had

| Year | Study | Finding |
|------|-------|---------|
| **1948** | **Mackworth**, RAF radar operators | Detection rate breaks down measurably after **15–30 minutes** of passive monitoring. Not motivation — wiring. |
| **2010** | **Parasuraman & Manzey** — *Automation Complacency* | Trust in automated systems exceeds self-trust. Demonstrated equally in novices and experts. **Cannot be trained away.** |
| **2015–17** | **Google self-driving** programme | Test drivers told to stay alert: did makeup, used phones, **fell asleep on the highway.** |

> *"What we found was pretty scary. It's hard to take over because they have lost contextual awareness."*
> — **John Krafcik**, then CEO of Waymo

**Google's response:** remove the steering wheel. Level 4 autonomy, not Level 3. *Take the human out of the vigilance loop entirely — because the loop itself is the problem.*

### The cognitive-load mismatch we ignore in software

| Role | Maximum continuous duty | Mandatory break |
|------|------------------------|-----------------|
| Air-traffic controller | **2 hours** | 30 minutes |
| Commercial pilot (FAA) | Regular **autopilot-off** training to keep manual skills sharp | — |
| **Knowledge worker reviewing AI output** | **8 hours** | None |

> *"The first two hours are fine. After that I'm merging things I can't really read any more."* — Mössner's friend, on his 40-min-per-ticket budget (@18:33)

### The agentic-operating-model answer

| Trap | Why it happens | What this curriculum does about it |
|------|----------------|------------------------------------|
| Reviewing line-by-line generated code = vigilance task | Mackworth 1948 says we will fail | **Self-verification by deterministic artefact** (Module 5): tests, RSOPs, `terraform plan` diffs. Review *outcomes*, not tokens. |
| Trusting the agent more than yourself | Automation Complacency, untrainable | **GitOps / Layer 6 architectural guardrails** (Slide 9.8e): the agent's only verb is *propose*, never *apply*. The pipeline is the brake. |
| 8-hour passive monitoring shift | Industry-wide design flaw | **Specification work + supervisory chunking** (Slide 9.10a): humans design and approve the *plan*, the agent executes the chunk |

> The fix is not *try harder to stay alert*. The fix is *design the role so vigilance isn't required.*

> Source: Cedric Mössner, *KI Burnout ist real*, 2026 (@15:25–18:30) — synthesising Mackworth (1948), Parasuraman & Manzey (2010), and the Waymo programme.

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

> *"L'homme n'est rien d'autre que ce qu'il se fait."*
> *"Man is nothing else but what he makes of himself."*
> — **Jean-Paul Sartre**

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