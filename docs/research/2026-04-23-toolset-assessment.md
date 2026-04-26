# Toolset Assessment: VS Code + Git + GHCP + PowerShell for Non-Coding Knowledge Work

> **Research date:** 2026-04-23
> **Context:** Extending [The Agentic Operating Model](../../README.md) training for a system-engineer and knowledge-worker audience.
> **Reference projects analysed** (anonymised — domains retained, organisation details removed):
> - **Project A** — Active Directory / Kerberos hardening (systems engineering + AutomatedLab)
> - **Project B** — Multi-year legal correspondence analysis (knowledge work)
> - **Project C** — German tenancy law research (legal research)

---

## 1. Project Analysis — What the Stack Is Actually Doing

All three reference projects converge on the **same operating model**, regardless of domain.

### 1.1 Project A — Pure Systems Engineering

- **Domain**: Active Directory security hardening (Kerberos protocol modernisation), rolled out across a Windows estate.
- **Artifacts**: A series of numbered PowerShell scripts in `Lab/` (`10 Deploy…`, `20 Configure…`, `30 Test…`) — an operational runbook as code.
- **GHCP role**: Drove script authoring, documented behaviour discovered in the lab, maintained `.memory-bank/`, tracked open questions against upstream vendor engineering.
- **Test environment**: 5-VM domain on Hyper-V via AutomatedLab, deliberately using older OS to stress-test compatibility.
- **Non-coding output**: Runbook Markdown, step-by-step guide, open-questions log — authored and maintained collaboratively with the agent.

### 1.2 Project B — Legal Correspondence Analysis

- **Domain**: Multi-year legal dispute, formal correspondence, structured argumentation.
- **Scale**: 600+ documents indexed, 19-column CSV corpus, multiple PDF exhibits converted to Markdown.
- **Artifacts**: 15+ drafted letters, argumentation structures, timeline reconstructions across 22+ sessions.
- **GHCP role**: Timeline reconstruction from unstructured email threads, contradiction detection, drafting legally sound German correspondence.
- **Scripts**: 15+ Outlook COM exporters, email indexer, PDF→MD converters — infrastructure for the corpus itself.

### 1.3 Project C — German Tenancy Law Research

- **Domain**: Operating-cost dispute, landlord–tenant correspondence, BGB/BetrKV research.
- **Artifacts**: Case file with parties, contract extracts, deadlines, documents produced.
- **GHCP role**: Legal citation (BGB, BetrKV, Mietrecht), deadline tracking, multi-round drafting of German Schriftsätze.

### 1.4 The Shared Pattern

| Element | Purpose | Universal? |
|---|---|---|
| VS Code + Git + GHCP | Editor, versioned state, agent | Yes |
| Memory Bank (`memory-bank/` or `.memory-bank/`) | Durable project context across sessions | Yes |
| Markdown as first-class content | Drafts, analyses, case files, runbooks | Yes |
| PowerShell as the "fingers" | Ingest, parse, transform, export | Yes |
| Structured input corpus | Emails, PDFs, scans, event logs, configs | Yes |
| Test environment (lab) | Validate before acting on prod / submitting | Project A only |
| Deterministic file outputs | Reviewable, diffable, citable | Yes |

The pattern is **not coding**. It is *agent-assisted, version-controlled knowledge work with a reproducible evidence trail*. Code is an ingredient, not the goal.

---

## 2. Current AI Landscape (April 2026)

### 2.1 Agent-in-Editor Tooling Has Converged

| Tool | Strength | Non-coding fit |
|---|---|---|
| **GitHub Copilot (VS Code Agent Mode)** | Tight editor integration, MCP, custom agents, instructions, skills, checkpoints, multi-model | **Excellent** — file-centric, terminal-capable, runs PowerShell natively |
| **Claude Code (CLI)** | Best autonomous long-horizon agent, strong reasoning | Very good for pure text; weaker for Windows/PowerShell/Hyper-V |
| **Cursor / Windsurf** | Fast edit loops, composer | Coding-biased UX |
| **Cline / Roo Code (VS Code ext)** | Open-source agent, step control | Good alternative, same file-centric model |
| **Aider** | Git-native CLI agent | Terminal-only |
| **ChatGPT / Claude.ai web UIs** | Easy access | **Bad fit** — no filesystem, no versioning, no reproducibility |

MCP (Model Context Protocol) is the universal integration layer. Agent mode + MCP turns a chat assistant into a general-purpose *operational* agent — exactly what sysadmins need.

### 2.2 The "Knowledge Work in VS Code" Movement

- **Memory Bank / AGENTS.md / Repo memory**: Shared vocabulary across tools (Cline's memory-bank, Claude Code's `CLAUDE.md`, Copilot's `.github/copilot-instructions.md`, `/memories/repo/`). All three reference projects already implement this.
- **Skills and specialised agents**: Claude Skills, Copilot custom agents, prompt files — all point at the same idea: *package domain expertise as reusable instruction bundles*.
- **Non-coding use cases**: Contract review, incident response, research synthesis, customer-support triage are now widely published.
- **Agentic ops**: SREs and platform engineers run agents against live telemetry via MCP servers (Prometheus, Azure, Kubernetes, Graph).

### 2.3 What's Unique About This Stack

Most published non-coding agent examples run in web UIs or niche RAG apps. Running the same pattern inside a full engineering-grade workbench gives:

- **Git** → every analysis has a diff, a revert, a blame, a branch.
- **PowerShell + .NET** → real file, COM, WMI, AD, Exchange, Hyper-V access.
- **AutomatedLab** → a reproducible *environment*, not just a reproducible document.
- **The same agent** for writing scripts, running them, and narrating results in Markdown.

This combination is uncommon in the broader market and is genuinely differentiating.

---

## 3. Assessment: Is the Toolset the Right Way to Go?

### Verdict: **Yes — strongly validated, with two caveats.**

### 3.1 Why It Works

| Claim | Evidence |
|---|---|
| Git-as-memory scales to legal/ops work | 22+ sessions , 600+ documents, fully reconstructible |
| Markdown is a superior substrate for reasoning | Every deliverable (complaints, runbooks, case files) lives as MD, then exports |
| PowerShell bridges "agent ↔ real world" | Outlook COM, PDF parsing, AD queries, Hyper-V — all driven by GHCP |
| A local lab makes the agent *safe* for ops | Project A validates every registry change on 5 VMs before prod |
| Memory Bank beats context-window amnesia | All three projects use the same 6–7-file convention |

### 3.2 Caveats

1. **Confidentiality & data governance.** Project B and Project C contain confidential and personal data. GHCP's data handling (enterprise vs. individual, model routing, training opt-out) must be explicit in training material.
2. **Audience skill gap.** The model assumes git literacy, Markdown fluency, and terminal comfort. Many sysadmins have the latter two but treat git as "that thing devs use." Training must explicitly onboard git-for-prose and memory-bank discipline.

### 3.3 Where AutomatedLab Is the Decisive Ingredient

For a sysadmin audience, AutomatedLab upgrades the stack from "smart notepad" to *trustworthy operational copilot*:

- **Reversibility** — every destructive action happens against snapshots, not prod.
- **Reproducibility** — the same `New-LabDefinition` yields the same environment for every learner.
- **Observability** — `Invoke-LabCommand` lets the agent *see* the result of its actions (event logs, registry, AD state).
- **Isolation** — the agent can have broad admin rights inside the lab that no one would ever grant on prod.

Project A is the proof-of-concept. It is the archetype for system-engineer training modules.

---

## 4. Recommendations for Extending the Training

### 4.1 Reframe the Core Message

Current framing:

> *"This is NOT a PowerShell training. … PowerShell is simply the language we use for demos."*

Proposed extension:

> *"This is not a coding training either. It is a training about a new working model — versioned, agent-assisted knowledge work — that applies to code, infrastructure, research, legal drafting, and operations alike. Coding is one instance of the pattern, not the pattern itself."*

### 4.2 Add Two New Modules

| Module | Topic | Core idea |
|---|---|---|
| **M11** | Agentic Work Beyond Code | Same loop, different deliverables: runbooks, case files, incident timelines, correspondence |
| **M12** | The Lab as the Agent's Sandbox | AutomatedLab, Hyper-V, snapshots, `Invoke-LabCommand`, `Get-LabVMStatus` as the agent's feedback loop |

### 4.3 Add Two New Demos

1. **`demo-ops-kerberos-lab.md`** — derived from Project A. Agent authors a remediation script, runs it via `Invoke-LabCommand`, reads the resulting event back, updates the runbook, commits.
2. **`demo-corpus-analysis.md`** — an anonymised corpus. Agent ingests emails, builds a CSV index, reconstructs a timeline, detects a contradiction, drafts a response letter.

### 4.4 Add New Audience Profiles

| Profile | Primary output | Hook |
|---|---|---|
| Developer | Code | "AI that codes" |
| DevOps / SRE | Pipelines, IaC, runbooks | "AI that operates" |
| **System engineer** (new) | Configuration, validation, evidence | "AI that tests on real OS — in a lab" |
| **Research/knowledge worker** (new) | Documents, analyses, correspondence | "AI that reasons over your corpus — with a diff" |

### 4.5 Promote the Memory Bank Pattern Explicitly

All three reference projects use the same 6–7 core files. Package them as a reusable handout: `content/materials/memory-bank-template/`.

### 4.6 Add a Data-Governance Slide

For non-coding audiences handling PII/HR/legal data:

- Copilot Business vs. Individual data handling
- Content exclusions, model routing
- On-prem / air-gapped alternatives (Claude Code, Ollama + Cline, Azure OpenAI private endpoints)
- What *never* belongs in a public-model prompt

### 4.7 Pair the AD Troubleshooting Lab with a Second Lab

`ad-troubleshooting-lab` already exists. Pair it with a stripped-down Kerberos/AD-hardening lab so the 4h workshop can offer two contrasting ops scenarios.

---

## 5. Summary

- The stack (VS Code + Git + GHCP + PowerShell + AutomatedLab + Memory Bank) is the right architecture and is more complete than most published non-coding agent workflows.
- The pattern generalises cleanly from code to ops to legal/research work; the three projects are three instances of the same operating model.
- The training content already has the scaffolding to absorb a system-engineer / knowledge-worker track without disrupting the programmer track.
- Highest-leverage additions: reframe the core message, two new modules (M11 + M12), two new demos, memory-bank template as a handout, data-governance slide.
