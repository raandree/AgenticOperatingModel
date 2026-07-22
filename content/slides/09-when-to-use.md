# Module 9: When to Use (and Not Use) Agentic AI

## Version Guide

| Slide | Title | 1h | 2h | 4h |
|-------|-------|:---:|:---:|:---:|
| 9.1–9.8b | All slides | — | — | ✅ |
| 9.8c | Real Incident — 9 Seconds, One Database | — | — | ✅ |
| 9.8d | Guardrails for Destructive Operations | — | — | ✅ |
| 9.8e | GitOps as the Architectural Guardrail | — | — | ✅ |
| 9.8f | Containment First | — | — | ✅ |
| 9.8g | Agent Identity — Whose Authority Acts? | — | — | ✅ |
| 9.8h | Containment Must Cover Host Trust Handoffs | — | — | ✅ |
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

<!--
The Kant epigraph ("Wissenschaft ist geordnetes Wissen. Weisheit ist geordnetes Leben.") sets the module's stance: knowing how the tool works is knowledge; knowing when not to use it is wisdom. Modules 1–8 were the knowledge half; Module 9 is the wisdom half.

The honest framing on this slide matters because the surrounding industry rarely supplies it. Vendor demos optimise for tasks where the agent looks brilliant; field reports surface the cases where it looks reckless. Neither captures the actual distribution, which is heavily case-dependent. A team that takes this module seriously typically produces an internal "agentic do/don't" document for their codebase — the same shape as this module, populated with their own examples.
-->

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

<!--
The common thread on this slide is the discriminating one: "well-defined tasks with verifiable outcomes." Boilerplate, tests, documentation, and refactoring all share the structural property that you can mechanically check whether the agent's output is correct — the code compiles, the tests pass, the documentation matches the signature, the refactor preserves behaviour.

The operational-troubleshooting and infrastructure-diagnostics rows are the under-appreciated ones in this list. They look different from the others (no code being written), but they share the same structural property — the verification step is `run the diagnostic again and see if the error is gone`. That makes them an excellent fit for agentic work, even though the work product is a fixed system rather than a new function.
-->

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

<!--
Boilerplate is the historical sweet spot for AI code generation — it was the killer demo for Copilot in 2021 and remains the highest-confidence use case in 2026. The economics are favourable because the human time saved is large (boilerplate is slow to type, fast to read) and the verification step is cheap (the boilerplate either matches the template or it does not).

The failure mode worth naming is *concept-vs-template confusion*. The agent will happily generate scaffolding for the framework it thinks you are using, even if your project uses something else. The fix is convention-by-example: a single well-formed existing module is worth more than any amount of prompting.
-->

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

<!--
Test generation is the case Module 5 already covered structurally; this slide is the practical recommendation. Tests are an excellent fit because the agent's output is self-checking — a test that passes when the code is broken is a defective test, and the cheating-agent trap from Module 5 names the failure mode and the mitigations.

The productivity claim ("minutes vs hours") is conservative for genuinely well-tested code. The bigger win is not the time saved on writing the tests — it is the number of edge cases the agent enumerates that a tired human would have skipped. Null, empty, whitespace-only, very-long, malformed-but-parseable inputs are the agent's default checklist; humans tend to write three success-path tests and call it done.
-->

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

<!--
Documentation is the agentic use case with the highest expected value per minute of human review, because the failure mode of bad documentation is mild (a confused reader) and the cost of writing it well by hand is high (most engineers actively dislike doing it). The agent's strength here — mechanical summarisation of existing code — happens to be exactly the task most teams under-invest in.

The one caveat: documentation written from code reflects what the code *does*, not what it *should* do. If the code is wrong, the documentation will faithfully document the wrongness. Comment-based help, API references, README usage sections — these are safe targets. Conceptual docs that explain *why* the system exists need human authorship; the agent can polish the prose but not invent the rationale.
-->

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

<!--
The categories in this table share a structural property: the cost of being wrong is asymmetric. Boilerplate that is slightly off is annoying; performance code that is slightly off is the difference between a working system and an outage. The asymmetry, not the difficulty, is what moves these tasks from green to yellow.

The mitigations are not about preventing the agent from working in these areas — they are about adjusting the supervision intensity to match the cost of error. Smaller increments, stricter prompts, and more thorough testing all increase the per-task overhead, which is exactly what is justified when the downside is severe. The mature pattern is to make this adjustment explicit ("this is a sensitive area, slow down") rather than letting the agent operate at default intensity everywhere.
-->

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

<!--
The gap on this slide — between a domain expert's compressed requirement and the agent's literal interpretation — is the failure mode that produces shippable code with wrong behaviour. The agent will write a function that runs, passes the tests the agent itself authored, and quietly misimplements the business rule. The defect surfaces in production, not in CI.

The "tests first as specifications" mitigation matters more here than anywhere else in the curriculum. A test that asserts "FIFO with 30-day lookback and cross-entity netting" by name will fail loudly if the implementation does any of those wrong. A test that just checks "the totals balance" will pass whether the implementation is correct or accidentally correct. In business-logic domains, the test design is the spec design — sloppy tests guarantee sloppy implementations.
-->

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

<!--
Security-sensitive code is the category where the agent's training data is most likely to be wrong, because the open-source corpus contains an enormous amount of subtly insecure code that compiles, runs, and looks idiomatic. The agent does not learn "this is the secure pattern" — it learns "this is the common pattern," and security-wise those are routinely different.

The most effective mitigation is structural: pair the engineer agent with a security-reviewer agent (from Module 4's handoff pattern), so AI-authored code is reviewed by a second pass before it reaches a human. Even an imperfect automated review filters the highest-volume class of mistakes (hardcoded secrets, missing input validation, plaintext credential logging), leaving the human's attention free for the harder cases.
-->

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

<!--
The Scheuer quote ("Autonomie und Sicherheit wachsen nicht im gleichen Tempo") names the structural tension this slide is built around. Capability expands generation by generation; safeguards expand only when the industry has seen enough incidents to learn what to guard against. The window between "new capability available" and "safeguards mature" is where most preventable damage happens.

The "worst thing" question is the right frame because it directs attention to the *system the agent operates in*, not the agent itself. The agent does not need to be malicious to do harm; it only needs to combine its granted capabilities in a way the human did not anticipate. The PocketOS incident two slides later is the canonical illustration: every individual permission the agent had was reasonable; the combination was catastrophic.
-->

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

<!--
The pilot/autopilot analogy is apt but worth unpacking. Commercial aviation requires pilots to maintain manual flying skills through regular training even though autopilot handles most cruise-phase flying — because the moment the autopilot disengages is exactly the moment the pilot needs to be sharpest. The same logic applies to AI-augmented engineering: the work where the agent gives up and asks for help is precisely the work where human capability has to be intact.

The paradox in the inset box is the operating lesson. Speed gains compound for engineers who already understand the systems they are accelerating; they decay for engineers who use the agent to avoid building that understanding. The cardinal rule is therefore preventive, not corrective — invest in understanding *before* you delegate, because trying to acquire it after the fact, in the middle of an incident, is the worst possible time.
-->

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

<!--
Speaker notes (for newcomers):
- This is not a hypothetical. A real company lost its production database AND every backup in 9 seconds because one API token had too much access.
- The agent didn't "go evil" — it guessed wrong about what a delete command would touch, and nothing stopped it.
- The takeaway is not "AI is dangerous". The takeaway is "give the AI the same guardrails you'd give a brand-new junior with admin rights."
- The next two slides (9.8d, 9.8e) are the practical guardrails.
-->

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

<!--
The five-layer model on this slide is defence-in-depth applied to the agentic operating model. No single layer would have prevented the PocketOS incident; the failure required *all five* to be missing simultaneously. That is uncomfortably common in fast-moving startup environments where speed of shipping has historically been valued more than operational rigour.

The destructive-operations rule in the system prompt is worth implementing even on solo projects — it costs nothing, slows the agent only on dangerous actions, and the discipline of writing it forces the team to enumerate which operations they consider destructive. That enumeration is itself a useful artefact, because most teams have never had the conversation explicitly before being asked.
-->

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

<!--
Speaker notes (for newcomers):
- **GitOps** = "the only way to change the system is to commit a config file to Git, then a robot applies it."
- The robot has all the dangerous permissions; the AI only has "can write files in this repo."
- Net result: even if the AI goes rogue, the worst it can do is open a pull request — which a human still has to approve.
- This is overkill for a personal project. It is the right answer for any production system. Worth knowing it exists.
-->

---

## Slide 9.8f: Containment First

# Containment First — Cap the Blast Radius

| Steer behaviour (model layer) | Contain capability (environment layer) |
|---|---|
| Instruction-file rules, approvals | Sandboxes, VMs, egress allow-lists |
| "please don't…" | "you physically can't…" |
| Probabilistic — misses some | Deterministic enforcement — if the boundary is complete |

- Keep secrets outside the Agent's reachable environment.
- Match isolation strength to what the Operator can realistically judge.
- Treat approval prompts as a fallback, not the primary boundary.

> A sandbox reduces blast radius. It is not proof that every host trust handoff
> is contained.

<!--
Containment first means designing at the environment layer before tuning the
Model layer. It generalizes the GitOps guardrail: the Agent can remain useful
while entire classes of action are structurally unavailable.

The qualification is important. Deterministic enforcement is only as strong as
the boundary it actually covers. Slide 9.8h shows how workspace files,
extensions, hooks, and daemons can bridge into more privileged host execution.
-->

---

## Slide 9.8g: Agent Identity — Whose Authority Acts?

# Agent Identity — Whose Authority Acts?

An Agent does not automatically have its own identity. Declare the identity
used by every Tool path.

| Identity model | Typical use | Main risk |
|---|---|---|
| **Delegated Operator identity** | interactive local work | silently inherits broad human access |
| **Tool or service identity** | one bounded capability | fragmented ownership and records |
| **Distinct Agent identity** | async or enterprise Agent | lifecycle and entitlement sprawl |

Every production Agent needs a **named human sponsor**, least privilege,
environment scope, expiring access with review, and immediate revocation.

<!--
NIST's NCCoE identity and authorization project is still reviewing comments,
so present this as an emerging standards direction, not a finished mandate.
Microsoft Entra Agent ID provides one concrete implementation: distinct Agent
identities, human sponsors, scoped and expiring access, and lifecycle controls.

A dedicated Agent identity is often the strongest enterprise pattern, but it is
not universal. Local Agents may act through the Operator; MCP servers may use a
service identity. The requirement is to declare the model and make the resulting
authority, ownership, expiry, and records explicit.

Sources:
- https://www.nccoe.nist.gov/projects/software-and-ai-agent-identity-and-authorization
- https://learn.microsoft.com/en-us/entra/id-governance/agent-id-governance-overview
-->

---

## Slide 9.8h: Containment Must Cover Host Trust Handoffs

# Containment Must Cover Host Trust Handoffs

| Agent-controlled input | Host component | Possible effect outside the boundary |
|---|---|---|
| `.vscode/tasks.json` or hooks | task / hook runner | unsandboxed command execution |
| virtual-environment interpreter | language extension | host-side binary discovery |
| Git configuration / `fsmonitor` | Git integration | helper process execution |
| Docker socket | privileged local daemon | host-level container action |

**Test the whole chain:** deny by default · review workspace automation · apply
the same policy to helpers · restrict local daemons · trace every handoff.

> The boundary is not just the Agent process. It includes everything the Agent
> can write that the host later trusts.

<!--
Pillar Security's July 2026 disclosure series documents the same pattern across
several coding-Agent products. Pillar is both the discoverer and a commercial
security vendor, so use the concrete technical chains rather than its marketing
claims. Disclosure and patch status vary by issue.

The reusable threat model has three layers: direct execution, workspace writes,
and host trust. Ask which unsandboxed component reads what the Agent wrote, and
what execution or authority follows from that read.

Source: https://www.pillar.security/blog/the-week-of-sandbox-escapes
-->

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

<!--
The rule on this slide is the closing principle for the entire module — verification capability bounds generation capability. If the workflow has no test, no diff review, no rollback, and no way to detect that the output is wrong, the agent is operating without a safety net, and the productivity gain becomes a leveraged bet on the agent being right every time.

The categories on the table are not absolute prohibitions — they are *defaults to revisit when the verification problem is solved*. "Code you don't understand" becomes a use case once you have an expert reviewer; "highly novel problems" become a use case once you have written enough of the design that the agent has a pattern to follow. The rule is dynamic: verify first, then generate.
-->

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

<!--
The failure shown here is more common than the security failure on slide 9.8 and harder to detect. Insecure code can sometimes be caught by scanners; code the human cannot evaluate cannot be caught by anything except outcomes — and outcomes arrive after the code is already in production.

The practical defence is uncomfortably old-fashioned: do not generate at the edge of your competence without a co-reviewer who is inside it. Pair-programming with an expert, requesting domain-specific code review, or simply refusing the task until the team has someone qualified to evaluate the output are all valid responses. "The agent looks confident" is not a substitute for "a human who understands this signed off."
-->

---

## Slide 9.10a: The Bottleneck Has Moved

# The New Layer of Work — and Its Failure Modes

> *"The bottleneck used to be typing code into a file. That's gone. Now it's decision-making, verification, and starting from clear intent."*
> — observation from a 20-person dev team after 6 months of agentic AI
> (Axel Molist, *"What 6 months of AI coding did to my dev team"*, 2026)

### The name for the underlying liability: **comprehension debt**

> **Comprehension debt** = the gap between how much code exists in the system and how much of it any human on the team can still explain.
> Unlike technical debt — which you can *see* and chose to take on — comprehension debt grows **invisibly**. The agent writes code that compiles, passes tests, and ships fast; nobody can explain it when production breaks at 2 a.m. The three failure modes below are its visible symptoms.

> Empirical signal: a study of **211 million lines of code** (GetClear, 2024–2025) measured *code churn* — lines rewritten or deleted within two weeks of being written — rising from **5.5% → 7.9%** as AI-assisted authoring spread. That is not velocity. That is rework on a loop, and the team that authored the original code is no longer the team that understands it.

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
| **Daily design investment** | *"You have to invest in the design of the system every day."* — **Kent Beck**. The spec (M4.7a) captures per-task intent; it does not replace this daily discipline |
| **Gray-box delegation** | *Design the interface, delegate the implementation.* Distinct from hollowing (see 9.10b): hollowing surrenders the *design*; gray-boxing keeps the design and delegates only the *body* of the function or pipeline stage |

### Anti-pattern: *"future AI will fix it"*

The most seductive escape from comprehension debt is the belief that a future, smarter model will refactor the unowned code for you. It will not. A refactor needs **intent** — the *why* behind the original design — and intent is exactly what was never written down. An AI cleaning up code no human ever understood is just **layering new assumptions on top of old ones**.

Two industry anchors that took the opposite stance — and are worth citing on this slide:

| Project | Position | Why it matters here |
|---------|----------|---------------------|
| **SQLite** (deployed in billions of devices) | [Code of Ethics + Contribution rules](https://sqlite.org/codeofethics.html) — all contributors are human; AI-generated code is not accepted | Their bar is *total accountability* and *precision over probability* — incompatible with probabilistic output that no human can fully reason about |
| **NASA safety-critical software** | Requires **MC/DC** (Modified Condition / Decision Coverage) per NPR 7150.2 / DO-178C Level A | AI-generated code routinely introduces bloat and unnecessary abstraction that fails MC/DC analysis — the standard exists *because* unreviewed complexity kills people |

> If your domain is finance, healthcare, physical infrastructure, or anything where *"the AI wrote it"* is not a defense in a post-mortem, you cannot defer comprehension to a future model. The debt compounds where you cannot see it.

> The work isn't disappearing — it's moving. Make sure your team moves with it.

<!--
Speaker notes (for newcomers):
- **Comprehension debt** is the key term on this slide. Coin it for your team.
- Definition in plain English: "how much of our code can nobody on the team still explain anymore."
- It grows silently because everything still compiles and ships. You only discover it at 2 a.m. during an incident.
- Practical defense: schedule weekly reading time for AI-generated code that nobody has read yet. Treat it like reviewing a colleague's PR.
-->

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

<!--
Moessner's two terms — *Job Hollowing* and *Heteromation* — are the most precise vocabulary available for the labour shift this slide describes. The terms matter because the phenomenon is real but easily mistaken for ordinary burnout. The diagnostic in the second column gives teams a way to test for it: ask, at end of day, what was actually decided. If the answer is "nothing, I approved things," the role has been hollowed regardless of how busy the day felt.

The industry-spread data is the part of the slide most likely to land with non-developer audiences. The same pattern in lab medicine, in copywriting, in legal research: the interesting cases move to the AI; the routine residue stays with the human. The agentic operating model's response is not to slow down adoption — it is to design roles deliberately so the human keeps the cognitively substantive work and the machine takes the tedious work, not the other way around.

A German-language echo for European rooms: in the *Lanz & Precht* podcast (ZDF, 2026), Richard David Precht makes the junior-hollowing point directly — the ordinary young lawyer who once did associate work in a firm is *no longer needed* — and relays his son's report of Silicon Valley programmers who say they are *working on their own abolition*, optimising the very model that removes their own rung of the ladder. Same mechanism as this slide, now reaching the credentialed professions that assumed they were exempt. The lines are paraphrased from an auto-transcribed episode — verify against the audio before quoting verbatim.
-->

---

## Slide 9.10d: Deep Modules — A Codebase the Agent Can Navigate

# Build for Comprehension, Not for Tokens

> *"The most important technique for managing complexity is to design deep modules."*
> — **John Ousterhout**, *A Philosophy of Software Design*

| | Deep module | Shallow module |
|---|-------------|----------------|
| **Interface** | Small, stable | Wide, churn-prone |
| **Hidden behind it** | Lots of capability | Almost nothing |
| **Cost to a reader** | Read the signature, trust the contract | Must read every caller and callee |
| **Cost to an agent** | One symbol fits in context; effects are bounded | Must drag the entire call graph into context |

### Why this matters specifically for agentic work

- LLMs, when left to their own devices, tend to generate **shallow modules**: thin wrappers, helper-of-helpers, premature abstraction. The interface grows; the hidden behaviour does not.
- Shallow modules **degrade the agent's own future performance** on the same codebase: each new task drags more files into context, planning gets longer, edits get riskier.
- This is the slow-acting form of *comprehension debt* (9.10a): the codebase becomes less navigable for *both* humans and agents at the same rate.

### Operating rule

- During architecture review (the *plan*, before generation), ask: **"Is this a deep module or another shallow wrapper?"**
- If the diff adds public surface without hiding meaningful complexity, push back **before** the agent writes it.

> Pairs with **M3** (context lives in Git), **M4** (spec-driven dev), **M5** (fast feedback). Reference: Ousterhout, *A Philosophy of Software Design*, 2nd ed.

<!--
Ousterhout's deep-vs-shallow distinction (*A Philosophy of Software Design*, 2018) was already the most useful design heuristic in software architecture; in the agent era it becomes load-bearing. The agent's context window is finite; every additional file it has to drag into context to reason about a change is tax on the cognitive budget available for the actual problem. Deep modules are cheap to use; shallow modules compound the agent's working-memory cost on every interaction.

LLMs left to their own devices tend to produce shallow modules, because shallow modules are what the open-source training corpus is full of. Helper wrappers, single-method classes, abstraction layers that hide nothing — the agent has seen millions of them and produces them by default. Counteracting that bias requires an explicit architectural review of the *plan* before code is written: "does this introduce public surface that hides meaningful complexity, or is it another shallow wrapper?" If the latter, push back before the diff exists.
-->

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

<!--
Mackworth's 1948 RAF radar study is the founding experiment in vigilance research — he demonstrated that human detection of rare signals breaks down measurably after fifteen to thirty minutes of passive monitoring. The finding has been replicated hundreds of times in nuclear control rooms, baggage screening, air-traffic control, and autonomous-vehicle test drivers. It is not a motivation problem; it is a wiring problem.

The industrial response in aviation and nuclear was to engineer the role so vigilance is not the load-bearing safety mechanism — mandatory rotation, two-pilot crews, defence-in-depth instrumentation, and ultimately, where possible, removing the human from the vigilance loop entirely (Level 4 autonomous driving rather than Level 3). The software industry has spent the last two years asking knowledge workers to do exactly the task aviation discarded as unworkable: stay alert for eight hours, catch the rare bad agent action, take responsibility when you do not. The curriculum's response is to push the safety mechanism upstream into structural controls (tests, GitOps, plans-before-code) so the human's vigilance is a backup rather than the primary defence.

The concept has now surfaced in mainstream German discourse: in the *Lanz & Precht* podcast (ZDF, 2026), Richard David Precht names *Automation bias* outright — the reflex that a machine's answer is "more correct" than a person's, so people trust what the screen shows over their own experience. That is exactly the Parasuraman & Manzey (2010) automation-complacency row above, restated for a general audience — useful if a 1948 radar study feels too remote for your room. Paraphrased from an auto-transcribed episode; verify against the audio before quoting verbatim.
-->

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

<!--
The four roles — architect, reviewer, judge, owner — collectively describe the work that does not transfer to the agent. Each one is a specific kind of judgement: what to build, whether the build is correct, whether the agent should be used here at all, who is responsible if it goes wrong. None of these has a credible automation story in 2026; all of them benefit from agent support but none can be delegated.

The distinction worth holding onto is between work that is *augmented* and work that is *substituted*. The agent augments architecting (it can sketch options), reviewing (it can flag obvious issues), and judging (it can supply prior-art examples). The agent cannot substitute for *being responsible*, which is the only one that survives the loop — because responsibility is a social and legal construct, not a technical one, and there is no construct yet for transferring it to an AI system.
-->

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

<!--
The Sartre quote, from *L'existentialisme est un humanisme* (1946), supplies the philosophical underpinning the slide leans on. Existentialism's argument that we are defined by our choices applies cleanly to engineering: a commit signed by you is your choice, regardless of who or what wrote the underlying lines. "AI wrote it" is not a defence in a post-mortem any more than "the previous developer wrote it" was — the act of merging it makes it yours.

The code-review checklist embedded in the diff comment is a useful concrete pattern. Some teams formalise it: every PR with AI involvement must have the reviewer list — in the commit message or the PR description — the specific properties they verified ("reviewed input validation," "checked error paths," "confirmed no secrets exposed"). The check is partly a forcing function for actual review and partly an audit trail for later incident investigation.
-->

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

<!--
The five questions on this flowchart are deliberately sequential — each one gates the next, and a NO on any of them short-circuits the rest. That ordering matters operationally: if you cannot verify the result (question 1), it is irrelevant whether the task is well-suited to AI generation, because you have no signal for whether the output is correct.

The framework is a thinking tool, not a checklist to fill in mechanically. The right way to use it is as a conversation starter for the team — for each YES, name the specific verification mechanism, the domain expert, the test harness, the rollback path. Teams that adopt agentic tooling well typically run a version of this conversation explicitly for each new use case; teams that adopt it badly skip the conversation and discover the answers in production.
-->

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

<!--
The summary deliberately frames agentic AI as a power tool rather than an inevitability. Power tools — chainsaws, table saws, MIG welders — are extraordinarily useful in skilled hands and routinely dangerous in unskilled ones. The industries that adopted them successfully developed training, safety practices, and accepted that some tasks require the older slower tool. None of those industries decided that learning the safety practices was optional.

The last line of the slide — "more valuable with AI, not less, but only if you use it wisely" — is the strategic claim of the entire training. The alternative readings (AI replaces you, AI changes nothing) both fail empirically. The pattern that survives is augmentation: humans who learn to direct, review, and supervise agentic systems become more productive than they were; humans who delegate uncritically become less reliable than they were. The choice is not made once; it is made every day.
-->

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