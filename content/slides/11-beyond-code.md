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
| 11.7a | Memory Bank Integrity — Trusted State Needs a Boundary | — | — | ✅ |
| 11.8 | PowerShell as the "Fingers" | — | — | ✅ |
| 11.9 | Data Governance & Confidentiality | — | ✅ | ✅ |
| 11.10 | Audience Extensions | — | — | ✅ |
| 11.10a | Tools Built on This Model — ShellPilot & DeskPilot | — | — | ✅ |
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

<!--
The table on this slide is one of the strongest claims in the curriculum. Up to this point the audience has been encouraged to picture agents working on source code; this slide widens the frame to claim the same operating model applies to runbooks, legal arguments, research synthesis, and operational reports. The claim is empirical — the next slide names three projects where it has held — not aspirational.

The structural property that makes the loop transfer is verifiability. Code can be compiled and tested; a runbook can be executed in a lab; a legal argument can be cross-checked against a corpus; a research synthesis can be audited against its sources. The agentic loop closes wherever there is a way to check the work. The artefact looks different in each domain, but the supervision pattern — Observe, Plan, Act, Verify, Iterate — is identical.
-->

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

<!--
The three projects on this slide are deliberately drawn from non-software domains — systems engineering, multi-year legal dispute, German tenancy law — to defuse the assumption that the operating model is a software-only practice. The Kerberos RC4 rollout (Project A) produced numbered PowerShell runbooks; the legal dispute (Project B) produced argumentation structures and formal correspondence; the tenancy case (Project C) produced Schriftsatz drafts citing the BGB and BetrKV.

The six building blocks listed at the bottom are the load-bearing finding. None of the three projects could have proceeded with a chat interface alone; each one needed a Git repository, Markdown as the working medium, PowerShell as the bridge to local systems, and a Memory Bank for context that survives across sessions. The operating model is what made the work *durable* — weeks of analysis that could be paused, resumed, audited, and reverted, rather than evaporating between chat sessions.
-->

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

<!--
The input / Memory Bank / output / agent / Git diagram is the architectural summary of every project that uses this operating model. The shape is consistent across domains: a structured input corpus (emails, PDFs, logs, evidence), a stable context store (the Memory Bank), an output folder for the deliverables (runbooks, letters, reports), an agent with tools that connects them, and Git underneath everything as the audit and rollback layer.

The diagram's most underappreciated feature is the Memory Bank in the middle. Without it, every chat session begins with the user re-briefing the agent on the project's state; with it, the briefing is the file the agent reads first. The asymmetry compounds quickly — a long-running project (weeks or months) accumulates context that a short chat history cannot reproduce. The Memory Bank is the part of the operating model that turns "the agent helped me with one task" into "the agent participates in a multi-month effort."
-->

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

<!--
The examples on this slide were chosen to span very different domains while sharing one structural property — each one involves reading a large corpus, extracting structured information, producing a synthesised artefact, and being able to defend the synthesis with citations back to the source. That structure is precisely where agentic tooling excels, because the agent's strength is mechanical attention to detail across volumes of text that exceed a human's working memory.

The boundary between "coding" and "non-coding" turns out to be soft. A runbook is text but might embed PowerShell; a legal Schriftsatz is prose but cites case files via structured references; an incident analysis is narrative but includes evidence links into logs. The operating model treats all of these the same way — versioned text artefacts with verifiable claims — and the tools (Git, Markdown, an agent with shell access) are equally applicable in each case.
-->

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

<!--
Speaker notes (for newcomers):
- **Markdown** = plain text with a few simple symbols for headings (`#`), lists (`-`), bold (`**`), tables (`|`). That's it.
- Why use it instead of Word? Because plain text shows up perfectly in a `git diff` — you can SEE what changed, line by line. Word's tracked changes can't compete.
- Convert to Word/PDF at the END, only when you have to hand the document to someone outside your workflow. Tools like pandoc do this in one command.
-->

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

<!--
The `git log` example is real, drawn from a multi-month tenancy dispute. Each commit corresponds to a substantive decision — the version of the letter that incorporated review feedback, the version that restructured around the regulatory directive, the version that added the twenty-eight evidence references. Reading the log backwards reconstructs the thinking; reading it forwards explains the result.

The four properties below the log (reversible, blameable, branchable, citable) are the same properties software engineers value in Git for source code, applied to prose artefacts. "Version as of commit d4f8ea1" is a precise identifier for the exact text that left the office on a specific day; the equivalent in a Word-based workflow is "the version we sent on Tuesday, I think," with no way to recover the lost edits since.
-->

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

<!--
Speaker notes (for newcomers):
- **Memory Bank** = a small set of Markdown files that act as the project's long-term memory between AI chat sessions.
- Why needed? Because each new chat starts fresh — the AI doesn't remember yesterday. The Memory Bank is the briefing you hand it on day 1.
- Don't overthink it: start with `projectbrief.md` ("what is this project") and `activeContext.md` ("what are we working on right now"). Add the rest only when you feel the pain.
- The template in `content/materials/` is ready to copy into any new project.
-->

---

## Slide 11.7a: Memory Bank Integrity — Trusted State Needs a Boundary

# Memory Bank Integrity — Trusted State Needs a Boundary

A Memory Bank is durable context the Agent rereads. A bad write can persist
across every future session.

| State | Default write authority | Required control |
|---|---|---|
| Instructions, glossary, project brief | Operator / reviewer | Agent proposes a diff; human approves |
| Active context and progress | shared | narrow path access + review each change |
| External factual claims | Agent may draft | claim provenance + unverified-notes area |
| Prompt history | append-only | no silent rewrite or deletion |
| Recovery copy | outside Agent reach | protected remote / snapshot + restore drill |

> Versioning detects and reverses corruption only if the Agent cannot erase the
> history and someone reviews the diff.

<!--
A July 2026 arXiv preprint formalizes "self-state attacks" against writable
Agent memory and configuration. It provides useful evidence for a threat model,
not a universal incident claim: the paper is unreviewed and evaluates one
representative self-hosted harness.

The paper supports access control for instructions and configuration,
workload-conditioned detection for memory, and periodic backup. The AOM adds
its existing Human oversight and claim-provenance practices: make write authority
explicit, require review on trusted state, label sourced and unsourced claims,
and keep recovery outside the Agent's authority.

Source: https://arxiv.org/abs/2607.17986
-->

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

<!--
The "fingers" metaphor is the right framing for what PowerShell does in this operating model. The chat interface gives the agent a mouth and a brain; the shell gives it hands. Without the hands, the agent can recommend that the user run `Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4625}` and the user has to copy and paste; with the hands, the agent runs the command, reads the output, and decides what to do next.

Windows knowledge workers have a particular advantage in this regard because of how much of the operating system is already scriptable — Outlook COM, Word COM, Excel COM, Active Directory cmdlets, Hyper-V, Exchange management. The agent's ability to integrate these without bespoke wiring turns workflows that were previously "manual operational work" into structured pipelines that can be audited and reused. The economic effect on system-administration teams is significant; the practical effect on individual researchers and analysts is that they suddenly have an automation layer over their own filing system.
-->

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

<!--
The data-governance slide is the gatekeeper for any non-software audience and increasingly for software audiences too. The matrix is intentionally aimed at the practical questions a compliance officer or legal team will ask: where does the prompt go, who trains on it, what stays out of context, which model handles the request, what is the local-only fallback.

The distinction between Copilot Individual, Business, and Enterprise tiers is the one most teams get wrong. Individual plans default to using prompts for training unless the user opts out; Business and Enterprise plans do not train on customer prompts at all and offer data-residency controls. For HR, legal, healthcare, and any regulated context, the tier choice is the difference between a defensible deployment and a compliance incident waiting to surface. The rule of thumb at the bottom is unsubtle on purpose — it gives non-technical reviewers a clear test they can apply without understanding the underlying details.
-->

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

<!--
The four-profile matrix is what allows this training to address mixed audiences. The slides do not change between profiles — the principles, the operating model, the tools, the governance considerations are identical. What changes is the demonstration: a code-focused demo for developers, a runbook-focused demo for system engineers, a case-file demo for analysts and lawyers. The substrate underneath each demo is the same.

The "special case" framing in the closing line is the inversion of how the field usually presents itself. Agentic AI is typically marketed to developers first and extended outward; the training argues the reverse direction is more accurate — reasoning over structured corpora is the general capability, and writing code is one instance of it. That reframing matters because it changes who the audience can include: a sysadmin running PowerShell against Active Directory and a lawyer drafting Schriftsatz against the BGB are doing structurally identical work, even though the field rarely says so out loud.
-->

---

## Slide 11.10a: Tools Built on This Model — ShellPilot & DeskPilot

# Tools Built on This Model — ShellPilot & DeskPilot

The operating model is deliberately tool-agnostic. But you do not have to assemble it by hand: two companion projects run it on the **exact primitives** taught in this training — instruction files, Agent Skills, a memory bank, and Git underneath.

| Tool | Surface | For whom | What it is |
|---|---|---|---|
| **[ShellPilot](https://github.com/raandree/ShellPilot)** | PowerShell terminal / scriptable | Engineers, ops, automation | `Invoke-Shp` drives a Copilot agent from the shell — reuses your `-InstructionRoot` and `-SkillPath`, calls tools, reads/writes files, runs commands, and returns structured objects with token **usage** and estimated **cost** |
| **[DeskPilot](https://github.com/raandree/DeskPilot)** | Local desktop chat (no terminal, no IDE) | Analysts, operators, lawyers, researchers | A calm web UI on the ShellPilot engine — five permission switches you control (Terminal off by default), an activity panel of what it read / wrote / ran, and honest per-turn cost |

### Why they belong in this module:
- **ShellPilot is "PowerShell as the fingers" (11.8) made literal** — the agent lives in the shell where your automation already runs.
- **DeskPilot is the front door for the non-coding profiles (11.10)** — it hands the same agent to people who will never open a terminal.
- **Same Atelier, new surfaces** — both discover the same Skills / Instructions folders VS Code Copilot uses, so customization-as-code travels across the editor, the terminal, and a desktop app.

> **Status check:** both are experimental pre-releases that ride internal Copilot endpoints intended for first-party editors — preview tooling, not supported products. Run them on a single-user machine and point the workspace at a version-controlled folder.

<!--
This slide answers the question the previous slides provoke: "the demos are in VS Code — how does a non-developer actually do this?" The training is intentionally tool-agnostic, so the answer is not "buy this product" but "here are two reference implementations built on the same primitives you have just learned."

ShellPilot is the engine. It is a Sampler-built PowerShell module whose entry point, Invoke-Shp, drives a Copilot agent from the terminal and from scripts; crucially it reuses the very same instruction files and Agent Skills as VS Code (via -InstructionRoot and -SkillPath), and every call returns a rich object with token usage and an estimated cost, which makes the governance and cost-awareness themes of this module concrete. DeskPilot sits on top of that engine and is aimed squarely at the non-coding profiles from slide 11.10: a local single-page chat app with permission toggles, an activity log, and per-turn cost, so an analyst or lawyer gets the agent without the tool stack.

Be honest on stage about maturity: both are experimental and use internal Copilot endpoints meant for first-party editors, so they can change without notice. Present them as proof that the operating model is buildable and portable, not as turnkey production software.
-->

---

## Slide 11.11: Key Takeaway

# What to Remember

1. **The agentic loop is domain-independent.** Observe → Plan → Act → Verify → Iterate applies to code, infrastructure, and prose alike.
2. **Git + Markdown + a memory bank** is a better working medium than any document editor for anything you need to reason about carefully.
3. **PowerShell gives the agent hands** in your Windows world — for email, PDFs, AD, Exchange, and Hyper-V.
4. **Data governance is not optional** the moment your corpus contains real people's real lives.
5. **If you're a sysadmin or an analyst, you are the audience for agentic coding — just with a different deliverable.**

> **Next up (M12): how a lab makes the agent safe to let loose on real infrastructure.**

<!--
The takeaways collapse Module 11 to five sentences that travel back to non-developer teams. The first three are about applicability (the loop transfers, the medium scales, PowerShell supplies the hands); the fourth and fifth are about responsibility (governance is not optional, sysadmins and analysts are first-class users of agentic tooling).

The transition to Module 12 is deliberate. Module 11 widens the operating model to non-code domains; Module 12 narrows back to one specific extension — using a lab as the safe sandbox for agentic work on real infrastructure. That sequence puts the broadest claim first and the most concrete application of it second, so that the lab patterns in M12 land as a worked example of the universal model from M11 rather than as a separate topic.
-->


## Speaker Notes - Module 11

### Timing: 15-20 minutes (2h cut) / 25 minutes (4h cut)

Module 11 widens the agentic operating model beyond code. The pedagogical move is to defuse the assumption that this curriculum is a developers-only practice; the structural claim is that runbooks, legal correspondence, research synthesis, and operational reports all submit to the same loop when the verification step can be made concrete.

When presenting to a mixed audience, this is the module that earns the non-developer attendees' attention. The three-project table (Kerberos rollout, multi-year legal dispute, German tenancy case) is the empirical anchor; the data-governance slide is the gatekeeper that keeps the talk credible in regulated contexts. The transition to Module 12 narrows back to one concrete extension — the lab as the agent's sandbox for infrastructure work.
