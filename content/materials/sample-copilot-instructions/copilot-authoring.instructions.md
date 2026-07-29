---
applyTo: "**/*.instructions.md,**/*.prompt.md,**/*.agent.md,**/SKILL.md"
---

# Authoring Copilot Customization Files

> **Sample `.instructions.md`** that governs how Copilot customization
> files themselves are authored. Inspired by the
> [CopilotAtelier](https://github.com/raandree/CopilotAtelier) pattern
> of treating agents, instructions, skills, and prompts as a versioned
> artifact set.
>
> Drop this into `.github/instructions/` (or your synced
> `Instructions/` folder) so that Copilot applies it whenever you
> create or edit any customization file.

## Scope

These rules apply to:

| Pattern | Purpose |
|---------|---------|
| `*.instructions.md` | Coding standards / rules (auto-applied via `applyTo`) |
| `*.prompt.md` | Reusable slash commands (one-shot templates) |
| `*.agent.md` | Custom AI personas with tools, models, handoffs |
| `SKILL.md` | On-demand domain knowledge loaded by description match |
| `*.hooks.json` | Deterministic guardrails run by the host at lifecycle events |

## YAML Frontmatter Rules

All four file types require valid YAML frontmatter at the top of the file.

- Delimit frontmatter with `---` on its own line, top and bottom.
- Leave **one blank line** between the closing `---` and the first line
  of content. Some parsers fail without it.
- Every `SKILL.md` MUST define both `name` and `description`.
- Every `.agent.md` SHOULD define `description`, `tools`, `model`.
- Use block scalars (`>-` or `|`) for multi-line descriptions.

**Correct `SKILL.md` frontmatter:**

```markdown
---
name: my-skill-name
description: >-
  Short, keyword-dense summary. Include "USE FOR" and
  "DO NOT USE FOR" phrases so Copilot can match the skill
  to user intent.
---

# My Skill

Content starts here...
```

## Description Field Guidelines

Descriptions drive retrieval. They MUST be written for a search engine,
not for a human reader.

- Start with an imperative verb phrase ("Debug and troubleshoot ...",
  "Convert PDF to Markdown ...", "Deploy Hyper-V labs ...").
- Include the canonical names of the tools, cmdlets, and concepts the
  file covers — Copilot matches on these tokens.
- Include both **USE FOR** and **DO NOT USE FOR** lines to prevent
  over-triggering on adjacent topics.
- **Hard cap: 1024 characters.** Both VS Code and the agentskills.io
  specification enforce it, and a description over the cap can fail to
  load *silently*. Test for it rather than eyeballing it.

## Optional Skill Frontmatter

| Field | Use it when |
|-------|-------------|
| `compatibility` | The skill needs a specific OS or toolchain (max 500 chars). Without it, a Linux user loads a Windows-COM skill with no warning. |
| `context: fork` | The skill ingests untrusted external content. It then runs in its own subagent and returns only its final report, keeping fetched pages out of the parent context. |
| `license`, `metadata` | Publishing the skill outside your own machine. |
| `allowed-tools` | The skill should narrow the tool surface while it is active. |

## `applyTo` Glob Patterns

For `.instructions.md` files, use precise `applyTo` globs so they load
only where relevant.

- Combine multiple patterns with commas: `"**/*.ps1,**/*.psm1,**/*.psd1"`.
- Prefer `**/` prefixes so files match at any depth.
- Avoid overly broad patterns like `**/*` — they inflate the context
  window on every request.

## Agent Files (`.agent.md`)

- Declare `tools` explicitly; never leave the list empty.
- Prefer inheritance: "You inherit all rules from the
  `base-agent` agent" instead of copy-pasting shared rules.
- Include a **Handoff** section if the agent is part of a pipeline
  (e.g., `code-reviewer` → `security-reviewer`).
- Declare `model` as a **priority array**, not a single string — the
  first available model wins and the last entry must be generally
  available. Hosted models are retired on a regular cadence, and a
  hard-pinned model breaks every agent at once.
- **Always declare `agents`**, even as `agents: []`. An unset key means
  "any agent may call me as a subagent", which is how a domain
  specialist ends up invoked on an unrelated task.
- Set `disable-model-invocation: true` on heavyweight or narrow roles so
  only a human, or an agent that names them explicitly, can start them.

## Hook Files (`*.hooks.json`)

Instructions, agents, and skills are advice the model may ignore. A hook
is a command the host executes, so it is the only customization type
that enforces rather than requests.

- Honour the exit-code contract: `0` allows, `2` blocks and returns the
  reason on stderr, and anything else is a non-blocking warning.
- **Fail open.** An unreadable payload or an internal error must exit
  non-blocking; a hook that throws must not brick every tool call.
- Match on the command text at any nesting depth rather than on the tool
  name, and exit `0` immediately for a tool that carries no command —
  otherwise editing a document that merely mentions `git push` is
  blocked.
- Provide a documented, per-command override for the case the rule is
  meant to catch, and log every use of it.
- Keep hook scripts out of the agent's auto-approved edit scope. An
  agent that can rewrite its own guardrails has none.

## Prompt Files (`.prompt.md`)

- Use `.prompt.md` for single, repeatable tasks with a clear output
  (scaffolding, review, refactor). If the task is open-ended, write an
  agent or a skill instead.
- Parameterize with `${input:variableName}` — never hardcode paths or
  values that change between invocations.

## Discovery & Verification

After adding or editing any customization file:

1. Reload VS Code (or start a new chat session).
2. Open the Chat view gear icon → **Chat: Open Chat Customizations**
   to confirm the file is registered.
3. If it is missing, open the Chat view `…` menu →
   **Show Agent Debug Logs** to see the parse or registration error
   (usually a frontmatter or `name`/directory mismatch).

## Anti-Patterns

- ❌ Copy-pasting rules across many files instead of referencing a
  shared instruction file or base agent.
- ❌ Descriptions written as prose paragraphs with no keywords.
- ❌ Skills with broad names like `helpers` or `utils` — they compete
  with every other skill during matching.
- ❌ Agents that declare every tool "just in case". Fewer, targeted
  tools produce better behaviour.
