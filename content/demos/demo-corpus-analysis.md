# Demo: Agentic Knowledge Work — Email Corpus Analysis

## Overview

This demo shows **agentic coding applied to pure knowledge work**: no features, no bugs, no pipelines. The agent:

1. Ingests a folder of synthetic emails (anonymised format).
2. Builds a structured CSV index with PowerShell.
3. Reconstructs a timeline across multiple threads.
4. Detects a factual contradiction between two dates.
5. Drafts a response letter citing the evidence.
6. Commits both analysis and draft to git.

Use this demo for:
- **M11** (Agentic Work Beyond Code) in the **2-hour standard** or **4-hour workshop**.
- Optional closing demo when the audience is legal, HR, consulting, research, or analyst-heavy.

> **Pedagogical payload**: the same tools that build software — git, Markdown, PowerShell, an agent loop — are a superior medium for auditable reasoning over unstructured text.

---

## Audience

| Profile | Fit |
|---|---|
| Research / knowledge workers | **Primary** |
| Consultants / analysts | **Primary** |
| Legal operations | Strong |
| HR / people ops | Strong |
| System engineers looking for new applications | Useful contrast |
| Pure developers | Useful to see "the other half of the training" |

---

## Prerequisites

### Sample corpus

Ship with the training repo: `content/demos/corpus-analysis-sample/`.

Structure (created ahead of time — **do not** use real customer/personal data):

```
corpus-analysis-sample/
├── emails/
│   ├── 2026-01-15-alice-to-bob-project-kickoff.md
│   ├── 2026-02-03-bob-to-alice-budget-approved.md
│   ├── 2026-02-14-alice-to-bob-scope-change.md
│   ├── 2026-03-02-bob-to-alice-budget-concern.md    # ← contradiction lives here
│   ├── 2026-03-15-alice-to-bob-status-update.md
│   ├── 2026-04-01-bob-to-alice-escalation.md
│   └── ... (12 emails total)
├── README.md                    # describes the fictional scenario
└── .gitignore
```

Each email file follows this shape:

```markdown
# Re: Project Phoenix — Budget Approved

| Field | Value |
|---|---|
| **From** | bob@example.org |
| **To** | alice@example.org |
| **Date** | 2026-02-03 09:14 |
| **Thread** | Project Phoenix |

Dear Alice,

The 180 k EUR budget for Project Phoenix is approved...
```

### Workspace

- VS Code with Copilot Agent Mode.
- Terminal available.
- Clean git working tree.
- `.github/copilot-instructions.md` containing:
  - "All analysis output must be Markdown."
  - "Cite every factual claim with a link to the source email file."
  - "Never invent content that is not in the corpus."
- `memory-bank/projectbrief.md` with a one-paragraph scenario description.

---

## The Fictional Scenario

> Alice manages a vendor (Bob) on *Project Phoenix*. In early February, Bob approves a budget of 180 k EUR in writing. In early March, Bob asserts in a new thread that he only approved 120 k EUR. Alice needs to draft a factual, non-confrontational response that cites the contradiction.

Use this synthetic scenario in the training — never real data.

---

## Talking Points Before Starting

> "This demo has no compiler, no test runner, no deployment target. The deliverable is a decision letter. And yet you will see the same loop, the same tools, and the same rigour we applied to code."

Show on-screen:
- The `emails/` folder with 12 files.
- The memory bank projectbrief.
- An empty `analysis/` folder waiting for the agent's output.

---

## The Demo Flow

### Part 1 — Ingest & Index (4 min)

**Prompt to agent:**
> Read every email in `corpus-analysis-sample/emails/`. Write a PowerShell script `scripts/Build-EmailIndex.ps1` that parses each file's header table and produces `analysis/email-index.csv` with columns: Date, From, To, Thread, Subject, File. Run the script and confirm the CSV.

**What to show the audience:**
- Agent writes a short PowerShell parser (~30 lines).
- Runs it; CSV appears with 12 rows.
- Agent reports summary: "12 emails, 3 threads, date range 2026-01-15 to 2026-04-01."

> **Teaching point**: the agent built its own index. This is the exact pattern used against real 600-email corpora — the script scales without changes.

---

### Part 2 — Reconstruct the Timeline (3 min)

**Prompt to agent:**
> Using `analysis/email-index.csv` and the email bodies, reconstruct the *Project Phoenix* thread as `analysis/timeline.md`. Each entry must include date, sender, one-sentence summary, and a Markdown link back to the source file. Sort chronologically.

**What to show the audience:**
- Agent produces a clean Markdown timeline.
- Every claim is a link: `[2026-02-03 Bob → Alice: Budget 180 k EUR approved](../emails/2026-02-03-bob-to-alice-budget-approved.md)`.

> **Teaching point**: **citation-backed reasoning**. The output is auditable line-by-line. This is the non-coding analogue of "tests prove the claim."

---

### Part 3 — Detect the Contradiction (3 min)

**Prompt to agent:**
> Are there any factual contradictions in this timeline regarding budget amounts? If yes, produce `analysis/contradictions.md` listing each contradiction with direct quotes from both sides and links to the source files. Do not speculate about intent.

**What to show the audience:**
- Agent finds the 180 k vs 120 k discrepancy.
- Produces a short Markdown table with exact quotes and file links.
- Notes explicitly: "Analysis does not address intent."

> **Teaching point**: **the agent's discipline is set by the instruction file**, not by hope. "Never speculate about intent" becomes a hard rule.

---

### Part 4 — Draft the Response (4 min)

**Prompt to agent:**
> Draft `analysis/response-draft.md`: a polite, factual email from Alice to Bob. Ask Bob to reconcile the two budget figures. Quote each figure with date and source. Offer a short call next week. Keep it under 180 words. No accusations.

**What to show the audience:**
- Agent writes a concise, professional draft.
- Each number is tied to a specific date.
- Tone is calibrated per instruction file.

> **Teaching point**: this is the step that would typically happen in Word or Outlook, disconnected from the evidence. Here it happens in the same workspace, with live links back to proof.

---

### Part 5 — Review, Revise, Commit (3 min)

**Prompt to presenter (live edit):**
> Manually tweak two sentences in `response-draft.md` to make the tone slightly warmer.

**Prompt to agent:**
> Update `memory-bank/activeContext.md` to reflect: index built, timeline produced, contradiction found, draft written and revised. Stage and commit everything with a message summarising the analysis in one line.

**What to show the audience:**
- `git diff` on the memory bank — clean, meaningful.
- `git log --oneline` — the whole analysis is one commit.
- Suggest branching for an alternative tone: `git checkout -b alternative-tone-formal`.

> **Teaching point**: **branches for alternative arguments**. Try a firm tone on one branch, a conciliatory tone on another, diff them side-by-side, decide.

---

## Timing Summary

| Part | Duration |
|---|---|
| 1. Ingest & Index | 4 min |
| 2. Reconstruct Timeline | 3 min |
| 3. Detect Contradiction | 3 min |
| 4. Draft Response | 4 min |
| 5. Review & Commit | 3 min |
| **Total** | **≈ 17 min** |

Add 3 minutes for setup + Q&A → ~20-minute demo.

---

## Reset Between Runs

```powershell
git -C $RepoPath restore .
git -C $RepoPath clean -fd analysis/ scripts/
```

---

## Data Governance Sidebar (call out explicitly)

Before ending the demo, spend 60 seconds on the governance point:

> "This was synthetic data. If you do this with real HR correspondence, legal disputes, or regulated records, **you must** verify:
>
> - Your Copilot plan's data handling (Enterprise / Business / Individual)
> - Content exclusion settings
> - Which model actually received the prompt
> - That the repository is private and `.gitignore`s raw evidence if needed.
>
> See M11 slide 11.9 (Data Governance & Confidentiality)."

---

## Common Pitfalls

| Pitfall | Mitigation |
|---|---|
| Agent hallucinates content not in corpus | Pin the instruction *"Never invent content that is not in the corpus"* in `copilot-instructions.md` and demonstrate enforcement. |
| PowerShell parser chokes on irregular headers | Use a consistent header table in every sample email. |
| Demo seems "too simple" | Emphasise: the *shape* of the workflow is what transfers — real corpora have 600 emails, not 12. |
| Audience compares unfavourably to ChatGPT web UI | Show `git diff`. The web UI cannot do that. |

---

## What the Audience Should Leave With

- **Knowledge work benefits from the same rigour as code.** Diffs, branches, commits, citations, tests.
- **An agent in VS Code is a superior workbench** to a chat window for anything you need to defend later.
- **The instruction file is the policy.** "Cite everything", "never speculate", "under 180 words" — these hold.
- **Memory bank + git = institutional memory.** No more "what did we send them in February?"

---

## See Also

- `demo-tax-case-study.md` — same operating model applied at full scale to a real, anonymised, multi-year German income-tax case (six Veranlagungszeiträume, ~80 PDFs/year, ~200 emails). Use as the **closing showcase** in the 4-hour workshop or as a hand-out for non-technical audiences.
- `../materials/agentic-knowledge-work-patterns.md` — ten reusable patterns extracted from that case, applicable to any multi-year knowledge-work matter.
