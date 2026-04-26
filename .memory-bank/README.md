# Memory Bank

**Location**: `.memory-bank/` (relative to workspace root `c:\Git\AgenticOperatingModel\`)

> This is a hidden directory (dot prefix) matching the technical-writer agent mode convention.

This folder contains project context files that persist between AI sessions.

## Purpose

The Memory Bank is the **shared, version-controlled** project knowledge base. It provides AI agents with:
- Project scope and objectives
- Current work status
- Technical context
- Architectural decisions

It complements VS Code's built-in memory (`/memories/`, `/memories/session/`, `/memories/repo/`), which stores personal learnings and session-specific notes. The Memory Bank is for team-shared project context that persists in Git.

## Files

| File | Purpose |
|------|---------|
| **projectbrief.md** | Core project scope, requirements, and goals |
| **productContext.md** | Business context, audience, and user needs |
| **techContext.md** | Technology stack, instruction files, agent modes, and key concepts |
| **systemPatterns.md** | System architecture, demo patterns, and workflow patterns |
| **activeContext.md** | Current work focus, recent changes, and agent configuration |
| **progress.md** | Status tracking, completed work, and content inventory |

## Usage

### For AI Agents
Read all Memory Bank files at the start of each session to understand context. The **technical-writer** agent mode enforces this as mandatory.

### For Humans
- Update **progress.md** when completing tasks
- Update **activeContext.md** when changing focus
- Keep **projectbrief.md** as the source of truth

## Agent Modes

| Mode | When to Use |
|------|-------------|
| **technical-writer** | Creating articles, documentation, or presentation content. Follows 7-phase workflow with citation requirements. |
| *(default)* | General development, code edits, and project maintenance. |

## Maintenance

- Keep files concise and current
- Remove outdated information
- Update after significant changes