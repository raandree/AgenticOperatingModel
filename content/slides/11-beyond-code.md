# Module 11: Agentic Work Beyond Code

## Version Guide

| Slide | Title | 1h | 2h | 4h |
|-------|-------|:---:|:---:|:---:|
| 11.1 | Same Loop, Different Deliverable | — | ✅ | ✅ |
| 11.2 | Three Real Projects, One Pattern | — | ✅ | ✅ |
| 11.3 | The Universal Operating Model | — | ✅ | ✅ |
| 11.4 | What Counts as "Non-Coding"? | — | — | ✅ |
| 11.5 | Markdown as the Reasoning Substrate | — | — | ✅ |
| 11.6 | Git Is Not Just for Code | — | ✅ | ✅ |
| 11.7 | The Memory Bank Pattern | — | ✅ | ✅ |
| 11.8 | PowerShell as the "Fingers" | — | — | ✅ |
| 11.9 | Data Governance & Confidentiality | — | ✅ | ✅ |
| 11.10 | Audience Extensions | — | — | ✅ |
| 11.11 | Key Takeaway | — | ✅ | ✅ |

> **This module extends the training to system engineers, researchers, and knowledge workers.**
> It is designed to slot into the 2h and 4h versions as an opt-in track for non-developer audiences.

> *"The computer is incredibly fast, accurate, and stupid. Man is unbelievably slow, inaccurate, and brilliant. The marriage of the two is a force beyond calculation."*
> — attributed to **Leo Cherne**

---

## Slide 11.1: Same Loop, Different Deliverable

# This Pattern Is Not About Code

Everything you have learned so far applies **unchanged** to:

| Domain | "Code" is replaced by… |
|---|---|
| Systems engineering | Runbooks, registry changes, event-log verification |
| Incident response | Timelines, root-cause reports, remediation plans |
| Legal & compliance | Case files, Schriftsätze, citation-backed arguments |
| Research & analysis | Literature reviews, corpus indices, synthesis documents |
| Business ops | Status reports, stakeholder communications, decisions with evidence |

> **The loop is identical. Only the artefact changes.**

---

## Slide 11.2: Three Real Projects, One Pattern

# Evidence from the Field

| Project | Domain | Primary artefact | Uses GHCP for |
|---|---|---|---|
| **Project A** | AD Kerberos RC4 rollout | Numbered PowerShell runbook | Script authoring, lab validation, open-question tracking |
| **Project B** | Multi-year legal dispute | 15+ formal emails, argumentation structures | 600+ document corpus indexing, contradiction detection, German drafting |
| **Project C** | Tenancy law (German) | Case file, legal Schriftsätze | BGB/BetrKV citation, deadline tracking, multi-round drafting |

All three use the **same six building blocks**:

1. VS Code + Git + GHCP
2. Markdown as the working medium
3. PowerShell as the bridge to the real world
4. A `memory-bank/` folder for durable context
5. A structured input corpus (emails, PDFs, logs, configs)
6. Deterministic, reviewable, diffable output

---

## Slide 11.3: The Universal Operating Model

# One Model, Three Projects

```
┌──────────────────────────────────────────────────────────────────┐
│                    VERSION-CONTROLLED WORKSPACE                   │
├──────────────────────────────────────────────────────────────────┤
│                                                                  │
│   ┌──────────────┐     ┌───────────────┐     ┌───────────────┐  │
│   │   INPUT/     │     │  memory-bank/ │     │   OUTPUT/     │  │
│   │              │     │               │     │               │  │
│   │  emails      │     │ projectbrief  │     │ runbooks      │  │
│   │  PDFs        │     │ activeContext │     │ case files    │  │
│   │  event logs  │     │ progress      │     │ letters       │  │
│   │  configs     │     │ systemPattern │     │ scripts       │  │
│   │  transcripts │     │ promptHistory │     │ reports       │  │
│   └──────┬───────┘     └───────┬───────┘     └───────▲───────┘  │
│          │                     │                     │          │
│          └─────────┬───────────┴─────────────────────┘          │
│                    │                                            │
│          ┌─────────▼──────────┐                                 │
│          │    GHCP + tools    │   ← PowerShell, terminal,      │
│          │  (reads, writes,   │     Outlook COM, AutomatedLab, │
│          │   runs, verifies)  │     MCP servers                │
│          └────────────────────┘                                 │
│                                                                  │
└──────────────────────────────────────────────────────────────────┘
          │                                           │
          └─────────────► git commit ◄────────────────┘
                    (diff, revert, blame, branch)
```

> **Every decision is reviewable. Every draft is versioned. Nothing is lost.**

---

## Slide 11.4: What Counts as "Non-Coding"?

# Concrete Examples

| Task | The agent does… |
|---|---|
| Reconstruct a timeline | Reads 600 emails, extracts dates, detects contradictions |
| Draft a complaint letter | Cites prior correspondence, uses consistent terminology, follows legal structure |
| Analyse an incident | Reads logs, correlates events, produces a post-mortem with evidence links |
| Track open questions | Maintains a living document keyed to Microsoft/vendor engagements |
| Produce a runbook | Turns 12 PowerShell scripts into an ordered, annotated operational guide |
| Research a regulation | Reads the statute, cross-references secondary sources, drafts an opinion |
| Monitor deadlines | Computes dates from contract clauses, flags approaching thresholds |

> These are not coding tasks. They are **verifiable, auditable reasoning tasks** — which is exactly what git + Markdown + an agent loop are good at.

---

## Slide 11.5: Markdown as the Reasoning Substrate

# Why Markdown Wins for Non-Code Work

| Property | Why it matters |
|---|---|
| **Plain text** | Diffable, greppable, portable, future-proof |
| **Structure without ceremony** | Headings, tables, lists — enough for 95% of documents |
| **Tables render everywhere** | Parties, deadlines, evidence, decisions |
| **Block quotes for citations** | Preserve exact source text alongside analysis |
| **Fenced code for commands** | Even a legal document may embed an OCR command or SQL query |
| **Linkable** | Cross-reference between case files, memory bank, and source corpus |
| **Exports cleanly** | DOCX via pandoc, PDF via LaTeX, HTML via Marp |

> **A Word document is a destination. Markdown is a working medium.**

---

## Slide 11.6: Git Is Not Just for Code

# Git for Prose, Decisions, and Evidence

```
$ git log --oneline Results/Formal-Letter.md
d4f8ea1  v2: add 28 evidence references, timeline history
7c21b9e  v1: initial formal letter to counterparty
b210c3e  Incorporate review feedback from session 9
a0fe73c  Correct timeline for approval workflow
91bc4d1  Restructure argumentation around policy directive
2d3a1f8  Initial outline
```

### Each commit is:

- A **reversible** step.
- **Blameable** — who decided what, when.
- **Branchable** — try an alternative argument without losing the main line.
- **Citable** — "version as of commit `d4f8ea1`" is exact.

> **Your complaint letter, your runbook, and your case file deserve the same rigour as production code.**

---

## Slide 11.7: The Memory Bank Pattern

# Durable Context Across Sessions

The same six or seven files appear in every serious GHCP project:

| File | Purpose |
|---|---|
| `projectbrief.md` | What this project is and why it exists |
| `productContext.md` | Stakeholders, background, scope |
| `activeContext.md` | Current focus, recent changes, next steps (the **index**) |
| `progress.md` | What's done, what's pending, known issues |
| `systemPatterns.md` | Conventions, folder structure, recurring patterns |
| `techContext.md` | Tools, versions, environment |
| `promptHistory.md` | Append-only record of prompts and decisions |

### The pattern is tool-neutral:
- Copilot: `.github/copilot-instructions.md` + memory bank
- Claude Code: `CLAUDE.md` + memory bank
- Cline: `memory-bank/` natively

> **A reusable template ships with this training.** See `content/materials/memory-bank-template/`.

---

## Slide 11.8: PowerShell as the "Fingers"

# The Agent Needs Hands in Your World

GHCP's chat is powerful. Its **tools** are what make it *operational*.

### Windows knowledge workers get, out of the box:

| Capability | PowerShell surface |
|---|---|
| **Email corpus** | Outlook COM (`$outlook = New-Object -ComObject Outlook.Application`) |
| **Office documents** | Word/Excel COM, or better: ZIP/XML parsing for DOCX/XLSX |
| **PDFs** | .NET zlib/deflate streams, pandoc, or targeted OCR |
| **Active Directory** | `ActiveDirectory`, ADSI, Get-ADUser |
| **Event logs** | `Get-WinEvent`, XML filters |
| **Exchange / M365** | Graph PowerShell SDK, EWS (legacy) |
| **Hyper-V** | Native module + AutomatedLab |
| **Web data** | `Invoke-WebRequest`, `Invoke-RestMethod`, MCP servers |

> **The agent proposes, PowerShell executes, git records.**

---

## Slide 11.9: Data Governance & Confidentiality

# Not Everything Belongs in Every Model

> **This slide is mandatory for HR, legal, and regulated-industry audiences.**

| Concern | What to check before you start |
|---|---|
| **Data residency** | Copilot Enterprise vs. Business vs. Individual — where does the prompt go? |
| **Training opt-out** | Confirm your plan does not train on your prompts (Business/Enterprise: no; Individual: opt-out setting) |
| **Content exclusions** | `.copilotignore` / repo settings to keep sensitive paths out of context |
| **Model routing** | Know which model your prompt hits (Claude / GPT / Gemini) and its vendor's policy |
| **Local alternatives** | Ollama + Cline, LM Studio, Azure OpenAI private endpoint for PII / HR / legal |
| **Repository hygiene** | Private repos, no public forks, `.gitignore` for `input/` raw evidence |
| **Prompt hygiene** | Pseudonymise names, redact account numbers, keep salary data out of shared contexts |

### Rule of thumb:

> **If you would not paste it into a public forum, configure your stack before you paste it into a prompt.**

---

## Slide 11.10: Audience Extensions

# Four Profiles, One Training

| Profile | Primary deliverable | Hook |
|---|---|---|
| **Developer** | Code | "AI that codes" |
| **DevOps / SRE** | Pipelines, IaC, runbooks | "AI that operates" |
| **System engineer** | Configuration, validation, evidence | "AI that tests on real OS — in a lab" |
| **Research / knowledge worker** | Documents, analyses, correspondence | "AI that reasons over your corpus — with a diff" |

### The slides you've seen don't change. What changes is:
- The **demo** (code vs. runbook vs. case file)
- The **tools** (Pester vs. `Invoke-LabCommand` vs. Outlook COM)
- The **success criterion** (tests pass vs. lab event 205 appears vs. letter cites all referenced emails)

> **Agentic coding is a special case of agentic knowledge work.**

---

## Slide 11.11: Key Takeaway

# What to Remember

1. **The agentic loop is domain-independent.** Observe → Plan → Act → Verify → Iterate applies to code, infrastructure, and prose alike.
2. **Git + Markdown + a memory bank** is a better working medium than any document editor for anything you need to reason about carefully.
3. **PowerShell gives the agent hands** in your Windows world — for email, PDFs, AD, Exchange, and Hyper-V.
4. **Data governance is not optional** the moment your corpus contains real people's real lives.
5. **If you're a sysadmin or an analyst, you are the audience for agentic coding — just with a different deliverable.**

> **Next up (M12): how a lab makes the agent safe to let loose on real infrastructure.**
