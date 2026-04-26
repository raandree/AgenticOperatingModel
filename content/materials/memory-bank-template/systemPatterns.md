# System Patterns

> **What this file is**: Conventions, folder structure, recurring patterns. How this project is organised and how things are done here. On-demand read.

## Folder structure

```
<root>/
├── <folder>/              # <purpose>
├── <folder>/              # <purpose>
├── memory-bank/           # This folder — durable project context
└── README.md
```

## Naming conventions

- <Files: e.g., `YYMMDD-topic.md` for correspondence>
- <Scripts: e.g., `NN Verb-Noun.ps1` with numeric prefix for runbook order>
- <Branches: e.g., `feature/<slug>`, `analysis/<topic>`>

## Commit conventions

- <Format, e.g., conventional commits, or "imperative subject under 72 chars">
- <When to split commits>
- <What never goes into a commit>

## Document patterns

- <Every analysis document cites sources via Markdown links>
- <Every script has comment-based help>
- <Every decision is recorded in `activeContext.md` with date and rationale>

## Recurring workflows

| Workflow | Steps | Trigger |
|---|---|---|
| <Name> | <Short step list> | <When this runs> |

## Cross-references

- Conventions that come from external standards (PEP 8, PSScriptAnalyzer, organisational style guides): <link>
