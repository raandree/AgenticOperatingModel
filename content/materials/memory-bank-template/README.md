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
