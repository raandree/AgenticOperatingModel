# Prompt History

> **What this file is**: An append-only log of significant prompts and the decisions they produced. Keep the most recent 90 days. Archive or trim older entries.
>
> **Not** a verbatim chat log — just the moments that matter.

## Format

```
### YYYY-MM-DD HH:mm UTC — <short title>

**Prompt (summary)**: <one or two sentences>

**Outcome**: <what the agent produced or decided>

**Artefacts**: <files created / modified>

---
```

## Entries

### <YYYY-MM-DD HH:mm UTC> — Initial setup

**Prompt (summary)**: Initialised the project, created memory bank, set up repository structure.

**Outcome**: Memory bank populated with brief and context; `.github/copilot-instructions.md` created.

**Artefacts**: `memory-bank/*.md`, `.github/copilot-instructions.md`.

---
