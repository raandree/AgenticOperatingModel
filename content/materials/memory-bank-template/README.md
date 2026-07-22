# Memory Bank Template

A reusable, tool-neutral template for a project "memory bank" — a small set of Markdown files that give an AI agent durable context across sessions.

> **Why this exists**: Three real projects (systems engineering, legal research, legal corpus analysis) all converged on the same 6–7 files. This template packages the pattern so you can drop it into any new GHCP / Claude Code / Cline workspace.

---

## How to Use

1. Copy the entire `memory-bank-template/` folder into your project.
2. Rename it to `memory-bank/` (or `.memory-bank/` if you prefer it hidden).
3. Open each file and replace the `<placeholder>` text. Start with `projectbrief.md` and `activeContext.md` — the rest will follow naturally.
4. Reference the folder from `.github/copilot-instructions.md`:

   ```markdown
   ## Context
   
   Always read `memory-bank/activeContext.md` first. That file is the current-state index.
   Consult other memory-bank files on demand.
   ```

5. Commit early. The memory bank is meant to be versioned prose.

---

## The Files

| File | Purpose | Loaded | Typical size |
|---|---|---|---|
| `projectbrief.md` | What this project is, why it exists, who it's for | Once, rarely changes | 20–60 lines |
| `productContext.md` | Background, stakeholders, scope, history | Occasionally | 30–100 lines |
| `activeContext.md` | **The index.** Current focus, recent changes, next steps | Every session | < 200 lines |
| `progress.md` | What's done, what's pending, known issues | Every session | < 200 lines |
| `systemPatterns.md` | Conventions, folder structure, recurring patterns | On-demand | 40–200 lines |
| `techContext.md` | Tools, versions, platforms, environment | On-demand | 20–100 lines |
| `promptHistory.md` | Append-only record of prompts and key decisions | On-demand, trimmed ≥ 90 days | varies |

---

## Principles

- **`activeContext.md` is an index, not a journal.** Summarise; link to detail files.
- **Overwrite, don't append.** When status changes, replace the old status, don't pile on.
- **Topic files are on-demand.** If a section in a core file exceeds ~50 lines, extract it into its own file (`deadlines.md`, `tool-version-matrix.md`, `case-<id>.md`, etc.).
- **Trim `promptHistory.md` regularly.** Keep 90 days of entries; archive the rest.

---

## Integrity and write ownership

A Memory Bank is trusted project state, not an unrestricted scratchpad. Define
who may write each class of file before giving an Agent write access.

| State | Suggested write authority | Required control |
|---|---|---|
| `projectbrief.md`, glossary, Instruction files | Operator / reviewer | Agent proposes a diff; a human approves |
| `activeContext.md`, `progress.md` | Agent and Operator | Restrict writes to named paths; review every change |
| Research findings and external claims | Agent may draft | Record source passage + stable identifier; keep unverified leads separate |
| `promptHistory.md` | Append-only process | Never silently rewrite or delete prior entries |
| Recovery copy | Outside Agent authority | Protected Git remote or snapshot; test restoration |

Adapt the matrix to the project. The important property is that write authority
is explicit and narrower than read authority.

Add a rule like this to the governing Instruction file:

```markdown
## Memory Bank integrity

- Treat the Memory Bank as trusted project state.
- Propose changes to operator-owned files as a diff; do not apply them without
  explicit approval.
- Label externally sourced claims with the exact source passage and stable
  identifier. Keep unverified leads in a separate working-notes file.
- Never rewrite append-only history or delete the recovery copy.
- After changing shared state, show the diff and state how to restore it.
```

At least one history or backup must be outside the Agent's reachable
credentials. Periodically restore it into a clean directory; an untested backup
is only a hope.

This threat model is supported by the July 2026 preprint
[*Self-State Attacks on Self-Hosted AI Agents*](https://arxiv.org/abs/2607.17986).
It studies one representative self-hosted harness and is not peer-reviewed, so
use it as a design warning rather than proof that every Memory Bank is
compromised.

---

## Tool Compatibility

| Tool | How the memory bank plugs in |
|---|---|
| GitHub Copilot (VS Code) | Referenced from `.github/copilot-instructions.md` |
| Claude Code | Referenced from `CLAUDE.md` |
| Cline | Native `memory-bank/` detection |
| Roo Code | Native memory-bank support |
| Cursor | Referenced from `.cursorrules` |

The same files work across all of them.

---

## Where This Pattern Comes From

- **[Cline memory-bank docs](https://docs.cline.bot/prompting/cline-memory-bank)** — the earliest articulated version.
- Three production projects in different domains that converged independently on the same pattern:
  - `Project A` — systems-engineering operational-readiness project (AD/Kerberos hardening).
  - `Project B` — multi-year legal correspondence analysis.
  - `Project C` — German tenancy law research.

See also `docs/research/2026-04-23-toolset-assessment.md` in this repo.
