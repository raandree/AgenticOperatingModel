---
schema-version: 1
loading-mode: routed
status: accepted
owner: shared
last-verified: <YYYY-MM-DD>
---

# Memory Bank index

> **What this file is**: The routing map, and the **only file read
> unconditionally**. It is an authority map, not a summary of every topic.
> Set `loading-mode: full` above to disable routing and go back to reading
> everything — that switch is the rollback.

## Full-read fallback

Read the complete set — and **say that you did** — when any of these is true:

- `loading-mode: full`
- this index is missing, unparseable, or its routing table is empty
- the task is ambiguous, or two routes conflict
- a file named by the chosen route is missing
- a fact the task needs cannot be found in the routed files

Full mode reads this index, `projectbrief.md`, `productContext.md`,
`activeContext.md`, `techContext.md`, `progress.md`, `systemPatterns.md`,
every `decisions/*.md`, and `promptHistory.md` and `glossary.md` when present.
Missing optional files are not failures.

> A routing miss must never be indistinguishable from an answer. Slower is
> fine; confidently wrong is not.

## Authority order

1. The current request controls task constraints.
2. Repository source, configuration, tests, and evidence control facts.
3. Accepted decision records control durable choices.
4. Core files control only their routed topic.
5. `progress.md` and `promptHistory.md` are historical evidence, not authority.

On conflict, read the controlling source, say which one won, and fix the stale
file in a separate change.

## Routing table

Combine routes when a task spans topics. Before any durable write to the
repository, also read `activeContext.md`.

| Route | Task signals | Read |
|---|---|---|
| `general` | General Q&A with no project-specific decision | Index only |
| `continuation` | Resume, current focus, next step, handoff | `activeContext.md`, `progress.md` |
| `scope` | Purpose, scope, requirements, acceptance criteria | `projectbrief.md` |
| `product` | Users, problem, workflow, experience goals | `productContext.md` |
| `implementation` | Code, configuration, build, test, dependency, deployment | `techContext.md`, `activeContext.md` |
| `architecture` | Design, pattern, decision, migration, integration | `systemPatterns.md`, relevant `decisions/*.md` |
| `status` | Progress, recent change, open work | `progress.md`, `activeContext.md` |
| `language` | Canonical terms in code, tests, docs, or commits | `glossary.md` |
| `interaction-history` | Session analysis, prompt trends | `promptHistory.md`, `progress.md` |

Topic files under `topics/` are optional and load only through an explicit
route. Never read `promptHistory.md` routinely — it is long, it is history, and
it crowds out the task.

## Proving the routing works

Routing that is never measured is just a smaller prompt with more confidence.
Keep a small set of real tasks with the files each one genuinely needs, and
gate changes to this table on two numbers:

- **zero critical misses** — no task loses a fact it needed
- **a real context reduction** against the full read (aim for ≥ 50 %)
