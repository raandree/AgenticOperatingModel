# Agentic Knowledge-Work Patterns

> **Audience**: anyone applying the agentic operating model to work that
> is not application code — legal cases, tax matters, consulting
> engagements, research projects, regulatory correspondence, multi-year
> incident files, ops runbooks.
>
> **Source**: extracted from a real, multi-year German income-tax case
> (six Veranlagungszeiträume [tax assessment years], ~80 PDFs/year, ~200
> emails, three legal phases). Anonymised companion:
> `content/demos/demo-tax-case-study.md` — which carries the full German
> terminology glossary.
>
> **Status**: each pattern below has been used in production against
> legally binding output. None of them is theoretical.

---

## Pattern 1 — The Two-Axis Filesystem

**Problem.** Long-running matters mix two orthogonal concerns:
*time-scoped* evidence (this year's rent receipts) and *time-independent*
master data (the underlying contract, the property cost basis, the
party's tax ID). Mixing them causes duplication and quiet divergence —
the same source document edited differently in two folders.

**Pattern.** Separate the two axes at the top level:

```text
input/
├── _stammdaten/           # year-INDEPENDENT (contracts, IDs, AfA bases)
│   ├── <subject>/         # one folder per long-lived entity
│   ├── ...
├── 2021/                  # year-SPECIFIC evidence
│   ├── <category>/
├── 2022/
├── ...
└── _verfahren/            # cross-year procedural correspondence
```

Year folders **link into** `_stammdaten/`; they never duplicate it. The
underscore prefix sorts the cross-cutting folders to the top alphabetically
and signals "not a year."

**Failure mode without it.** In the source case, the same Kaufvertrag
[purchase contract] existed in `input/2021/`, `input/2022/`, and
`input/2024/` with three slightly different filenames. Reorganising into
the two-axis layout took three commits and a written
`restructuring-plan.md` (see Pattern 7).

---

## Pattern 2 — Memory Bank as Case File

**Problem.** Project state in chat history is unsearchable, unversioned,
and tied to one vendor. After three months, no one can find what was
decided.

**Pattern.** A `.memory-bank/` folder, git-tracked, structured by purpose:

| File | Purpose | Update cadence |
|---|---|---|
| `case-overview.md` | parties, IDs, jurisdictions, cross-refs | rare |
| `case-<scope>.md` | one per scope (year, matter, sub-case) | per session |
| `stammdaten-<subject>.md` | distilled hard facts (numbers, addresses) | when source changes |
| `deadlines.md` | every live deadline, sortable, with status | per session |
| `documents-produced.md` | register of every artefact in `output/` | per artefact |
| `session-log.md` | chronological work log, newest at bottom | per session |
| `restructuring-plan.md` | binding blueprints for major reorgs | when needed |

**Test of a good memory bank**: hand the repository to a colleague.
Without speaking to you, they can answer (a) what is the current
deadline, (b) what was the last action, (c) what is the case strategy,
(d) where is document X.

---

## Pattern 3 — Multi-Modal Ingestion Pipeline

**Problem.** Real evidence arrives as scanned PDFs, Excel sheets,
Outlook MSG files, photographs, web printouts. The agent cannot reason
over binary blobs.

**Pattern.** Agent-authored scripts normalise every input to plain text
or Markdown alongside the original:

```text
input/<scope>/
├── 240131 Schreiben FA.pdf          # original (binary)
├── 240131 Schreiben FA.txt          # pymupdf plain extract
├── 240131 Schreiben FA.layout.txt   # pymupdf layout-sorted (tables)
├── 240131 Schreiben FA.md           # human/agent reviewed Markdown
└── ...
```

Recommended toolchain (let the agent write all of it):

| Source format | Tool | Output |
|---|---|---|
| PDF (text-layer) | `pymupdf` (Python) | `.txt` + `.layout.txt` |
| PDF (image-only) | `pytesseract` + `pdf2image` | `.txt` |
| XLSX | `openpyxl` (Python) or PowerShell `ImportExcel` | `.md` table |
| MSG / Outlook | PowerShell + Outlook COM | `.md` per message + attachments |
| Photographs | Azure Document Intelligence or Tesseract | `.txt` |

**Rule.** Keep originals next to derivatives. Never mutate the original.

---

## Pattern 4 — Citation-Backed Reasoning

**Problem.** Output that asserts a number ("rental income 4 500 EUR") is
indefensible without a source. In legal and financial contexts, an
unsourced claim is a defect.

**Pattern.** A pinned instruction-file rule:

```markdown
## Output Discipline
- Every factual claim cites a source via a Markdown link.
- Source links point to a file inside `input/` (the original or a
  derivative) and, where possible, a line range.
- Never invent content not present in the corpus.
- For statutory claims, cite the section (e.g. § 122 Abs. 2 Nr. 1 AO)
  and recompute the consequence (e.g. the deadline) from the statute.
```

**Verification.** Every Markdown artefact in `output/` is reviewable by
clicking through the citations. A reviewer can answer "is that number
real?" in one click.

---

## Pattern 5 — Branches as Strategy Alternatives

**Problem.** A non-trivial decision has multiple defensible options. In
chat-based AI, exploring three options means three throwaway
conversations, none of them comparable.

**Pattern.** Treat each option as a feature branch:

```text
main
├── strategy-a-extension-only
├── strategy-b-full-substantive
└── strategy-c-staggered
```

The agent drafts each strategy on its own branch. The human reviews via
`git diff strategy-a..strategy-c -- output/`. Decision is recorded in
`session-log.md` with the chosen branch merged to `main`.

**Bonus.** Rejected branches stay as references. Six months later when
the strategy needs to change, the alternative drafts already exist.

---

## Pattern 6 — Computed Deadlines

**Problem.** Deadlines stored as static dates ("filing due 30.04.2026")
go stale silently when the underlying rule changes (e.g. Germany's
4-Tage-Fiktion in § 122 Abs. 2 Nr. 1 AO since 01.01.2025) or when a
weekend rule applies (§ 108 Abs. 3 AO).

**Pattern.** Every deadline in `deadlines.md` carries:

- the **source event** (date of service, date of postmark),
- the **statutory rule** that governs the deadline,
- the **computed deadline date**,
- the **next weekday adjustment** if the result falls on a Sat/Sun/holiday.

**Instruction-file rule.** "When the source event date is added or
changed, recompute the deadline from the statute. Cite the section."
The agent then re-derives the deadline rather than copying a previously
computed value.

**The lesson that paid for this pattern.** In the source case, the
human-computed Bekanntgabedatum [legally deemed date of service of the
assessment] was **two days too early**. The agent caught it during
memory-bank initialisation. Two days was the difference between a timely
Einspruch [administrative appeal] and a permanently lost case.

---

## Pattern 7 — The Restructuring Plan as a Document

**Problem.** Large refactors of the filesystem (or the memory bank) are
risky, irreversible-looking, and easy to abandon mid-way.

**Pattern.** Write the reorganisation as a binding document in the
memory bank **before executing it**:

```text
.memory-bank/restructuring-plan.md
├── 1. Ausgangslage und Motivation
├── 2. Zielstruktur (Filesystem)
├── 3. Drei-Schritte-Ausführung (jeweils ein Commit, reversibel)
│   ├── Schritt 1 — ...
│   ├── Schritt 2 — ...
│   └── Schritt 3 — ...
├── 4. Offene Entscheidungspunkte (mit Defaults)
├── 5. Risiken
├── 6. Validierungs-Checkliste
└── 7. Stammdaten zur Bewahrung (wörtlich, mit Quelle)
```

A second document, `restructure-prompt.md`, instructs the agent to
execute the plan strictly:

- a separate **feature branch** (`restruct-2026-MM`),
- one commit per step with prescribed message,
- after each commit: validation checklist (`git status`, grep for dead
  paths, manual link review),
- **push only after human confirmation**,
- `git mv` (not delete + add) to preserve history.

**Why it matters.** A reorg done this way is reversible (every step is
a commit), reviewable (the plan is on disk), and resumable (if the
session ends, the plan is still there).

---

## Pattern 8 — The Reconciliation Document

**Problem.** Two sources purport to describe the same reality and
disagree (internal Excel vs. SmartSteuer; vendor invoice vs. internal
ledger; client narrative vs. email evidence).

**Pattern.** A dedicated reconciliation Markdown (column captions in
the original German, translated below the example):

```markdown
| # | Position | Quelle A | Quelle B | Δ | Beleg | Aktion |
|---|----------|---------:|---------:|---:|-------|--------|
| 1 | Mieteinnahmen Objekt 1 | 5.400 | 4.800 | +600 | [Beleg](...) | korrigieren in B |
| 2 | Schuldzinsen MüncherHyp | 3.215 | 3.215 |   0 | [Beleg](...) | OK |
| ... |
```

In English: *Position* = line item · *Quelle A/B* = source A/B · *Δ* =
delta · *Beleg* = receipt / supporting document · *Aktion* = action.
*Mieteinnahmen* = rental income; *Schuldzinsen* = mortgage interest;
*korrigieren in B* = correct in source B.

Every row links to the source document. Every action is one of:
`korrigieren in <Quelle>` [correct in source X] / `Beleg fehlt` [receipt
missing] / `OK`. The artefact is the worklist.

---

## Pattern 9 — The Three-Phase Status Marker

**Problem.** Multi-year matters have entries in different lifecycle
phases simultaneously. Without a visible status, the human re-derives
"what is open" each session.

**Pattern.** A small, fixed vocabulary in every memory-bank header:

| Marker | Meaning |
|---|---|
| 🟢 ABGESCHLOSSEN [closed] | Closed, retained as reference / anchor only |
| 🟡 LAUFEND [running / active] | Active, has live deadlines |
| ⚪ KOMMEND [upcoming] | Future scope, no live deadlines yet |
| 🔴 KRITISCH [critical] | Active and at risk (deadline near, anomaly found) |

The marker appears at the top of every `case-*.md` file. The
`deadlines.md` table sorts by marker, then by date.

---

## Pattern 10 — Privacy by Repository

**Problem.** Real evidence contains personally identifiable, regulated,
or privileged information. Content exclusion settings alone are
insufficient.

**Pattern.** A defensible setup:

| Layer | Decision |
|---|---|
| Repo visibility | Private. Always. |
| Copilot tier | Enterprise or Business — never Individual for real client data |
| Content exclusion | Configured to exclude the repo from training |
| `.gitignore` | Raw evidence kept locally **but committed** in this case (small project; the choice depends on the matter) |
| Anonymisation | Required for any version shared in training, demo, or public materials |
| Statutory check | § 203 StGB (DE professional secrecy), Art. 5/6/9 DSGVO, attorney work product, applicable industry rules |

For training audiences: never demonstrate against real client data.
Demonstrate against an anonymised clone or a synthetic corpus
(`demo-corpus-analysis.md`) and **describe** the real case via the case
study (`demo-tax-case-study.md`).

---

## Pattern 11 — Operator Dignity ("with AI, not from AI")

**Problem.** The default workflow with agentic tools is *job hollowing*
(Mössner 2026): the agent absorbs the part of the work that *built* the
operator's expertise — reading, reasoning, designing — and leaves only
the mechanical residue (accept / reject / commit / next). Productivity
looks fine on paper; the operator is increasingly *quality control for
a machine they don't trust*. The same mechanism is documented in
software (Mössner @0:00), lab medicine (@18:39) and creative writing
(@19:38) — it is not a developer-specific failure mode.

The vigilance literature (Mackworth 1948; Parasuraman & Manzey 2010)
is blunt about why this breaks humans: passive monitoring fails after
15–30 minutes, automation complacency cannot be trained away, and the
automotive industry's response (Waymo 2017) was to *remove the
steering wheel* rather than ask drivers to stay vigilant.

**Pattern.** Three operating rules that move the operator from *prompter*
to *author of intent*, without giving up the speed of agentic tools:

| Rule | Concrete control | Curriculum surface |
|------|------------------|--------------------|
| **Author intent in version control, not in prompts** | The operator owns `copilot-instructions.md`, `.agent.md`, skills, memory bank — *the standing intent lives in Git, not in chat history* | Module 3 (instruction files), Module 4 (custom agents), Module 8 (memory bank) |
| **Verify by artefact, not by line-reading** | Reviewer inspects test runs, RSOPs, `terraform plan` diffs, schema migrations — *consequences*, not tokens | Module 5 (self-verification), Slide 9.8e (GitOps Layer 6) |
| **Budget for review, not for typing** | If the team's per-ticket budget assumes AI speedup, *redistribute the saved time into verification*. Otherwise the team has built the burnout factory the talk describes (Mössner @0:13) | Slide 9.10b (Job Hollowing) |

**Diagnostic.** Ask the operator at end of day: *"What did you actually
decide today?"* If the answer is "nothing, I just approved" — the
role has been hollowed and the pattern needs to be re-applied.

**Counter-evidence the pattern relies on.** Two domains where the
machine surpassed humans without hollowing the operator: **chess**
(Stockfish ≫ any human; chess exploded in popularity) and
**aviation** (autopilot ≫ manual; FAA mandates regular hand-flying
practice to prevent skill atrophy). In both, the human kept the
*intent and the craft*; the machine did the execution. Same pattern
the operating model encodes.

> Source: Cedric Mössner, *"KI Burnout ist real"*, 2026,
> [YouTube SHKBrkpYssM](https://www.youtube.com/watch?v=SHKBrkpYssM)
> — synthesising Mackworth (1948), Parasuraman & Manzey (2010),
> KOF/ETH Zürich diff-in-diff labour-market study (2025), BCG/HBR
> *AI Brainfry* survey (March 2026), Brynjolfsson et al. (Stanford,
> 2026), and Waymo's removal of the steering wheel (2017).

---

## Pattern Combinations

The patterns compose. The source tax case uses **all ten** simultaneously:

- Pattern 1 (two-axis) gives the filesystem.
- Pattern 2 (memory bank) gives durable context.
- Pattern 3 (ingestion) feeds the agent.
- Pattern 4 (citations) makes output defensible.
- Pattern 5 (branches) explores strategy.
- Pattern 6 (computed deadlines) prevents catastrophe.
- Pattern 7 (restructuring plan) handles reorgs safely.
- Pattern 8 (reconciliation) drives correction worklists.
- Pattern 9 (status markers) keeps multi-year scope navigable.
- Pattern 10 (privacy) keeps the practice defensible.

A new matter typically starts with Patterns 1, 2, 9, 10 on day one and
adds the others as the work demands them.

---

## Cross-References

- `content/demos/demo-tax-case-study.md` — anonymised real-world
  application of all ten patterns.
- `content/demos/demo-corpus-analysis.md` — short synthetic demo using
  Patterns 2, 3, 4 in ~17 minutes.
- `content/materials/memory-bank-template/` — starter memory-bank files.
- `content/materials/sample-copilot-instructions/` — instruction-file
  templates that encode Patterns 4, 6, 10.
- `content/slides/11-beyond-code.md` — M11 slides where these patterns
  are introduced in the workshop.