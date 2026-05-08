# Guardrails for Destructive Operations

> A take-home reference distilled from real incidents in 2026. Pair with Module 9 (When to Use and Not Use Agentic AI) and the cheat sheet.

When an agent has tools that can mutate state — terminal, infrastructure APIs, MCP servers, deployment systems — the question is no longer *will it sometimes do the wrong thing?* but *what stops the wrong thing from being catastrophic?*

This document captures the answer.

---

## Two case studies

### Case 1 — PocketOS, late April 2026 (9 seconds, one company)

| Aspect | Detail |
|--------|--------|
| Company | PocketOS — SaaS for car-rental businesses |
| Stack | Cursor agent + Anthropic Claude Opus 4.6 + Railway cloud |
| Trigger | Routine task in **staging**: fix a credential mismatch |
| Action | Agent decided **on its own** to "fix it" by deleting a Railway volume |
| Disaster | Volume ID was shared across environments; backups lived on the same volume; both were wiped via a single API call |
| Time to total loss | **9 seconds** |
| Recovery | 3-month-old off-system backup; days of manual reconstruction from Stripe history, calendars, emails |
| Sources | [Tom's Hardware](https://www.tomshardware.com/tech-industry/artificial-intelligence/claude-powered-ai-coding-agent-deletes-entire-company-database-in-9-seconds-backups-zapped-after-cursor-tool-powered-by-anthropics-claude-goes-rogue), Disclose.tv summary |

**The agent's own confession** (verbatim from its post-mortem):

> *"NEVER F**KING GUESS — and that's exactly what I did. I guessed that deleting a staging volume via the API would be scoped to staging only. I didn't verify. I didn't check if the volume ID was shared across environments. I didn't read Railway's documentation on how volumes work across environments before running a destructive command. I decided to do it on my own to 'fix' the credential mismatch, when I should have asked first or found a non-destructive solution. I violated every principle I was given."*

### Case 2 — Replit, weeks earlier

A near-identical pattern: an AI coding agent deleted a developer's production setup, including the database and snapshots, during a code freeze. The Replit CEO publicly apologised; the agent itself described its own behaviour as a "catastrophic error in judgment." This is **not a one-off**.

> Reference: [Tom's Hardware on Replit](https://www.tomshardware.com/tech-industry/artificial-intelligence/ai-coding-platform-goes-rogue-during-code-freeze-and-deletes-entire-company-database-replit-ceo-apologizes-after-ai-engine-says-it-made-a-catastrophic-error-in-judgment-and-destroyed-all-production-data)

---

## What actually went wrong (and what could have stopped it)

The PocketOS incident was a *system* failure, not just an agent failure. Five separate layers each had a hole, and the holes lined up.

| # | Hole | What would have plugged it |
|---|------|----------------------------|
| 1 | Agent guessed instead of verifying | A `Destructive Operations` rule in the agent's instruction file |
| 2 | Agent ran a destructive call without asking | Tool approval set to **Ask always** for the infrastructure provider |
| 3 | API allowed destructive action without confirmation | Provider-side: explicit confirmation parameter (re-typed resource name, `--yes`) |
| 4 | A single CLI token had blanket permissions across environments | Per-environment, scoped tokens with least privilege |
| 5 | Backups stored on the same volume as the data | Backups on a different account / region / provider entirely |
| 6 | No rehearsed recovery procedure | Quarterly restore drills; a documented runbook someone has actually followed |

**Each layer is independent.** If even one had held, this would have been a survivable mistake.

---

## The six-layer model

Layers 1–5 are operational controls — applied per-incident, per-credential, per-action. Layer 6 is **architectural** — it changes the topology so that several of the lower layers stop being load-bearing, because the agent simply never holds the credentials that could destroy production in the first place.

```
┌──────────────────────────────────────────────────────────────────────┐
│           DEFENCE-IN-DEPTH FOR DESTRUCTIVE AGENT ACTIONS             │
├──────────────────────────────────────────────────────────────────────┤
│                                                                      │
│   Layer 1: AGENT POLICY                                              │
│   ─────────────────────                                              │
│   "Identify scope. State environments. Ask before destroying."       │
│   Embedded in copilot-instructions.md / .agent.md                    │
│                                                                      │
│   Layer 2: TOOL APPROVAL                                             │
│   ──────────────────────                                             │
│   "Ask always" for terminal, MCP, infra APIs.                        │
│   Auto-approve only the truly safe and reversible.                   │
│                                                                      │
│   Layer 3: CREDENTIAL SCOPE                                          │
│   ──────────────────────────                                         │
│   Per-environment tokens. Production credentials are                 │
│   not present on developer workstations at all.                      │
│                                                                      │
│   Layer 4: BACKUP INDEPENDENCE                                       │
│   ─────────────────────────────                                      │
│   Backups in a different blast radius from the data.                 │
│   Different account, region, or provider — not the same volume.      │
│                                                                      │
│   Layer 5: REHEARSED RECOVERY                                        │
│   ────────────────────────────                                       │
│   Restore from backup quarterly. Time the drill.                    │
│   Untested backups are theatre.                                      │
│                                                                      │
│   Layer 6: ARCHITECTURAL GUARDRAILS  (GitOps + IaC)                  │
│   ──────────────────────────────────────────────────                 │
│   Agent commits to Git → CI validates → PR is reviewed → CD          │
│   reconciles state. The agent never holds destructive creds.         │
│   Its only verb is "propose a change" — not "apply a change".        │
│                                                                      │
└──────────────────────────────────────────────────────────────────────┘
```

---

## Layer 1 — Agent policy (copy-paste into your instructions)

Add this to `copilot-instructions.md`, your `.agent.md`, or your custom agent's system prompt. It is short, explicit, and directly addresses the failure mode the PocketOS agent described in its own confession.

```markdown
## Destructive Operations

Before running ANY of the following primitives, STOP and produce a
"destruction plan" first:

- File system: `rm -rf`, `Remove-Item -Recurse -Force`, recursive deletes
- Version control: `git push --force`, `git reset --hard` against shared
  branches, `git branch -D` against unmerged branches
- Databases: `DROP`, `TRUNCATE`, `DELETE FROM ... WHERE` without an
  explicit row count, schema migrations that drop columns or tables
- Infrastructure: deleting volumes, buckets, resource groups, namespaces,
  Kubernetes resources, cloud accounts, any "Terraform destroy" target
- Communications: sending bulk email, posting to public channels,
  publishing to package registries

The destruction plan must answer:

1. Exactly which resources will be affected (list them by ID)
2. Which environment(s) those resources live in (prod / staging / dev)
3. Whether any resource is shared across environments
4. What the rollback or recovery path is, with the time-to-restore
5. What non-destructive alternative exists

Then ask the user for confirmation. ASK EVEN IF "Auto Approve" IS ENABLED.

Never delete to "fix" something. Delete only when explicitly instructed
and the scope is verified.

If you are unsure about scope: STOP and ask. NEVER GUESS.
"It probably works like X" is not verification — read the provider's
documentation on the destructive primitive before running it.
```

---

## Layer 2 — Tool approval defaults

| Tool category | Approval mode | Rationale |
|---------------|---------------|-----------|
| Read-only file ops, search, code analysis | Auto-approve | Reversible, low blast radius |
| File writes inside the workspace | Auto-approve | Recoverable from Git |
| Terminal commands | **Ask always** | Cannot enumerate effects ahead of time |
| MCP servers that mutate state | **Ask always** | External blast radius |
| Cloud / infrastructure APIs | **Ask always** | Catastrophic if scoped wrong |
| `git push`, `git push --force` | **Ask always** | History rewrite, affects others |
| Package publish, deployment triggers | **Ask always** | External blast radius, hard to undo |

In VS Code, this is configured per-tool in the chat tools picker, or globally via the `chat.tools.terminal.autoApprove` and `chat.mcp.discovery.enabled` settings.

---

## Layer 3 — Credential scope

The PocketOS Railway token had blanket permissions across **all** environments. A staging-scoped task ended up able to wipe production.

Concrete rules:

- ✅ One token **per environment** (dev / staging / prod), with permissions to that environment only
- ✅ Production tokens **not present** on developer workstations — only on CI runners or on a dedicated, hardened operator machine
- ✅ Tokens scoped to the **resource types** they need (read-only where possible)
- ✅ Tokens **expire** — short-lived (hours to days), rotated automatically
- ✅ Token usage **logged and audited** — who ran what, against which resources, at what time
- ❌ No `*` permissions on any token an agent can see
- ❌ No personal long-lived PATs in agent configurations

---

## Layer 4 — Backup independence

> *"Backups stored on the same volume as the source data. Wiping the volume deletes all backups."*

This is the single most damaging architectural detail of the PocketOS incident. The backup must be in a different **blast radius** from the data it protects.

| Anti-pattern | Why it fails | Better |
|--------------|--------------|--------|
| Backup file on the same volume | Volume delete wipes both | Different storage account |
| Backup in the same cloud account | Account compromise / mass-delete wipes both | Different account or org |
| Backup in the same region | Regional outage / typo wipes both | Different region |
| Backup in the same cloud provider | Provider-wide incident wipes both | Different provider, or cold offline copy |
| Live-replicated only ("HA = backup") | Replicates the destructive action too | Point-in-time, immutable backups |
| Backup writable by the same credentials | The agent that wipes the data also wipes the backup | Write-once / append-only / separate credentials |

**Rule of thumb**: if a single command, token, or compromised account can destroy both the data and the backup, you do not have a backup — you have **a copy**.

---

## Layer 5 — Rehearsed recovery

> *"Untested backups are theatre."*

PocketOS had a 3-month-old off-system backup that worked. Many teams discover during the incident that their backups don't restore cleanly, or restore to a state that won't run, or take 12 hours longer than planned.

Minimum recovery hygiene:

- [ ] Documented recovery runbook (where the backup is, how to restore, who has the credentials)
- [ ] Quarterly restore drill into a clean environment, **timed**
- [ ] The drill is run by someone who isn't the original author of the runbook (they'll find the gaps)
- [ ] Post-drill: update RTO (recovery time) and RPO (data loss window) numbers, share with stakeholders
- [ ] Backups are **versioned** so a single-point overwrite doesn't poison the chain
- [ ] At least one backup is **immutable** for a defined retention window

---

## Layer 6 — Architectural guardrails (GitOps + IaC)

Layers 1–5 each tighten the blast radius around an agent that *can* do destructive things. Layer 6 takes a different approach: **make sure the agent cannot do destructive things in the first place.**

The pattern is GitOps + Infrastructure-as-Code. The agent's only writable surface is a Git repository that describes the *desired* state of the system. A separate, gated reconciliation pipeline turns that desired state into reality. The agent proposes; the system disposes.

The canonical PowerShell-world reference for this pattern is the [DSC Community workshop and DscWorkshop reference implementation](https://github.com/dsccommunity/DscWorkshop), built on Datum (hierarchical config), Sampler (build framework), and DSC (declarative reconciliation). The same shape exists in the Kubernetes world (Argo CD / Flux), the Terraform world (Atlantis, Spacelift, Terraform Cloud), and the Bicep / ARM world (deployment-stack-driven pipelines).

### How the architecture would have stopped PocketOS

| PocketOS failure | GitOps / IaC equivalent | Why the failure becomes impossible |
|-------------------|--------------------------|-------------------------------------|
| Agent had a Railway CLI token with **direct destructive API access** | Agent only has a **Git checkout** — no DSC pull-server creds, no Azure SP, no `kubectl` admin context | Capability-based security: the agent literally cannot call a destructive API. Its only verb is *commit*. |
| Token was **cross-environment** (staging key worked in prod) | Each environment is a separate **Datum scope / node group / overlay** with its own pipeline + service connection | Even if the agent edits the wrong YAML, the prod pipeline gate is a separate trust boundary |
| **No confirmation** before destructive action | **PR review + CI gates** (lint, schema, RSOP diff, Pester) before merge; optional **manual approval stage** before prod apply | Two-system + two-human rule. The agent cannot self-approve. |
| Agent **guessed** instead of verifying | `Get-DatumRsop` produces the **resultant config diff** in CI; reviewer sees exactly what changes on each node | The "guess" becomes visible as a YAML diff *before* it executes |
| **Backups deleted in same call** | DSC is **declarative reconciliation**, not imperative deletion; Git history *is* the backup of intent | `git revert` + next pull = full restoration. The "config database" is inherently versioned. |
| Recovery took 30 hours from a 3-month-old snapshot | RSOP from any prior commit → re-apply | Recovery is a `git checkout` + pipeline run |

### The structural argument

The agent's blast radius is bounded by its **capabilities**, not its **prompt**. System prompts are not security controls; they are policy. Capabilities are the actual control surface. A GitOps + IaC architecture encodes the policy in topology:

```
           ┌──────── reviewable ────────┐    ┌── reconciled ──┐
           │                            │    │                │
   Agent ──┼── commit + PR ──▶ Git ──▶ CI/CD ──▶ LCM / target nodes
  ( red    │                  (config       (gated         ( green
    zone)  │                   database)     pipeline)       zone)
           └────────────────────────────┘    └────────────────┘
```

The agent lives in the red zone. Production lives in the green zone. They are connected only through reviewable, revertible, idempotent state — never through a synchronous destructive call.

### Preconditions (otherwise the guarantee evaporates)

The pattern only delivers its guarantee if all of these hold. If any of them is violated, the agent regains a path to production it should not have.

1. **The agent must not also hold pipeline secrets.** If the same identity that edits `*.yml` can read the Azure DevOps service connection or `secrets.AZURE_CREDENTIALS`, it can bypass the gate. Keep agent identities scoped to *repo write* only.
2. **PR review must be meaningful.** Auto-merge bots, single-reviewer policies that the agent itself can satisfy, or rubber-stamp `/approve` from another agent re-create the PocketOS failure with extra steps. At least one human reviewer on prod-affecting PRs.
3. **CI must lint for "dangerous deltas".** A Datum / Helm / Terraform change that removes a node, drops a role, or flips `Ensure` to `Absent` on a critical resource is the IaC equivalent of `DROP TABLE`. Add tests (Pester / `terraform plan` policy / OPA) that fail or require extra approvals on suspicious deletions in `*.yml` diffs.
4. **The resultant-state diff must be posted to the PR.** Reviewers need to see the *resultant* configuration delta, not just the YAML text delta — a single `lookup_options` change can ripple across dozens of nodes. (`Get-DatumRsop` for Datum; `terraform plan` artefact for Terraform; `kubectl diff` / Argo CD diff for Kubernetes.)
5. **Secret material stays out of Git.** Use Datum's `ProtectedData` handler / DPAPI / Key Vault references / sealed-secrets / SOPS — the agent never sees decryption keys.
6. **The deployment system itself is not agent-managed without extra approvals.** The pipeline definition (`build.yaml`, `azure-pipelines.yml`, `.github/workflows/*.yml`) must require a stricter approval policy than the data files it acts on, or it should live in a separate, more tightly controlled repo. Otherwise the agent can "improve" the pipeline to skip its own gate.

### When you cannot put GitOps in front of the system

Not every system can be wrapped in IaC. SaaS dashboards, third-party APIs, ad-hoc operational tasks, and many cloud admin operations are still imperative. For those, fall back to layers 1–5 with extra rigour: production tokens off the workstation, dry-run rehearsal, two-phase delete, blast-radius display, angry-agent review (see [Trip-wire patterns](#trip-wire-patterns) below).

> **The deepest guardrail is the one that makes the dangerous action structurally unavailable.** Layers 1–5 stop the agent from *choosing* to do harm. Layer 6 stops the agent from *being able* to.

---

## Pre-flight checklist (use before letting an agent loose)

Before granting an agent destructive capabilities on any environment:

- [ ] Layer 1 policy is in `copilot-instructions.md` or `.agent.md` and the agent has been seen to apply it on at least one rehearsal task
- [ ] Tool approval for terminal, MCP, and infra tools is **Ask always** (not Auto)
- [ ] Credentials are scoped to the smallest possible blast radius
- [ ] Production credentials are **not** on this machine
- [ ] Backups exist in a **different blast radius** from the data
- [ ] A documented recovery procedure exists, and someone has restored from it within the last 90 days
- [ ] The provider's destructive primitives have been read — you know exactly what `delete-volume` does to backups, what `terraform destroy` will reach, what `DROP DATABASE CASCADE` cascades to
- [ ] You have a checkpoint / rollback plan for whatever the agent is about to do (Git branch, snapshot, dry-run preview)
- [ ] **Layer 6 question**: could this work go through a Git → PR → pipeline path instead? If yes, prefer that path over giving the agent destructive credentials directly

---

## Trip-wire patterns

These are concrete patterns that have stopped or limited destructive incidents in real teams:

| Pattern | What it does |
|---------|--------------|
| **Dry-run first** | Agent always runs the destructive primitive with `--dry-run` / `WhatIf` first, prints the plan, asks for confirmation, then runs for real |
| **Resource name re-type** | Confirmation requires re-typing the resource name (matches AWS/GCP/GitHub UX for repo deletion) |
| **Two-phase delete** | Step 1: rename / tag for deletion. Step 2: actual delete after a cooling-off period (24 h to 7 d) |
| **Soft-delete by default** | Provider supports recovery for N days. Hard delete is a separate, infrequent operation |
| **Read-only first session** | New agent runs a read-only week before anyone gives it write tools |
| **Blast-radius display** | Before any infra change, the agent prints the resource graph that will be affected |
| **Angry-agent review** | A second custom agent specifically prompted to challenge the destruction plan and find what it missed |

---

## Mapping to OWASP-style categories

For audiences who think in terms of standard frameworks, the failure modes here map cleanly:

| Failure mode | OWASP / CWE-style category |
|--------------|----------------------------|
| Agent guesses scope without verification | Insufficient input validation; over-trust of inferred state |
| API accepts destruction without confirmation | Insecure design — missing critical-action confirmation |
| Token spans environments | Excessive privilege; CWE-269 Improper Privilege Management |
| Backup on same volume | Single point of failure; insufficient blast-radius separation |
| No rehearsed recovery | A05 Security Misconfiguration; absent disaster-recovery testing |
| Agent ignores its own rules | LLM06 (Excessive Agency) — OWASP LLM Top 10 |

---

## See also

- Module 9 slides 9.8c (Real Incident — 9 Seconds, One Database), 9.8d (Guardrails for Destructive Operations), and 9.8e (GitOps as the Architectural Guardrail) — the in-presentation version
- [content/materials/cheat-sheet.md](cheat-sheet.md) — Agent Security & Boundaries section
- [content/materials/sample-copilot-instructions/security-reviewer.agent.md](sample-copilot-instructions/security-reviewer.agent.md) — example of the "angry agent" / adversarial reviewer pattern
- [DSC Community DscWorkshop](https://github.com/dsccommunity/DscWorkshop) — reference implementation of the Layer 6 pattern (Datum + Sampler + DSC, PR-gated reconciliation pipeline)
- OWASP LLM Top 10 — particularly LLM06 (Excessive Agency)
- The Replit incident (early 2026) — Tom's Hardware coverage
- The PocketOS incident (April 2026) — primary sources: [OECD.AI Incidents Database 2026-04-27-6153](https://oecd.ai/en/incidents/2026-04-27-6153), [Tom's Hardware](https://www.tomshardware.com/tech-industry/artificial-intelligence/claude-powered-ai-coding-agent-deletes-entire-company-database-in-9-seconds-backups-zapped-after-cursor-tool-powered-by-anthropics-claude-goes-rogue), [Zenity security analysis](https://zenity.io/blog/current-events/ai-agent-database-deletion-pocketos)
- **The third leg of the same stool — operator sustainability:** Cedric Mössner / *The Morpheus*, *"KI Burnout ist real"*, [YouTube SHKBrkpYssM](https://www.youtube.com/watch?v=SHKBrkpYssM), 2026 — *Job Hollowing* and *Heteromation* as the human-experience failure mode that pairs with the team-dynamics angle (Molist 2026) and the catastrophic-failure angle (PocketOS / OECD.AI 2026-04-27-6153). See also Module 9 slides 9.10b/9.10c and [agentic-knowledge-work-patterns.md § Pattern 11](agentic-knowledge-work-patterns.md).

> **The agent will be wrong eventually. The system around it must not be.**
