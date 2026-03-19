# Versions Overview

## Three Session Formats

This training is available in three formats. All versions share the **same content modules** from the [content/](../content/) folder — only the agenda, timing, and module selection differ per version.

| Version | Duration | Target Use Case | Modules Included |
|---------|----------|-----------------|------------------|
| [**1-Hour**](1h/) | 60 min | Conference talk, lightning overview, executive briefing | Core concepts only (Modules 1-5, 10) |
| [**2-Hour**](2h/) | 120 min | Half-day session, meetup talk, team introduction | Core concepts + synthesis demo |
| [**4-Hour**](4h/) | 240 min | Full workshop, deep dive with extended demos | All modules including advanced topics |

## Shared Content Architecture

`
versions/                    ← You are here (version-specific agendas)
├── 1h/agenda.md
├── 2h/agenda.md
└── 4h/agenda.md

content/                     ← Shared content (single source of truth)
├── slides/                  ← Detailed presenter notes (all modules)
├── demos/                   ← Demo scripts
├── materials/               ← Cheat sheet, sample files
└── pptx/                    ← MARP slides
`

### Why This Structure?

- **Single source of truth**: All slide content, demos, and materials live in `content/`. When you update a module, all three versions get the update automatically.
- **Version-specific agendas**: Each version folder contains only the agenda and presenter guide — which modules to include, timing per section, and what to skip or condense.
- **No duplication**: Content is never copied between versions. The agenda files reference shared content via relative links.

## Module Map

| Module | 1h | 2h | 4h | Content File |
|--------|:--:|:--:|:--:|-------------|
| 1. AI Coding Revolution | ✅ 5 min | ✅ 10 min | ✅ 10 min | [01-ai-coding-revolution.md](../content/slides/01-ai-coding-revolution.md) |
| 2. What Makes Coding Agentic | ✅ 15 min | ✅ 25 min | ✅ 30 min | [02-what-is-agentic.md](../content/slides/02-what-is-agentic.md) |
| 3. Power of Context | ✅ 10 min | ✅ 20 min | ✅ 25 min | [03-power-of-context.md](../content/slides/03-power-of-context.md) |
| 4. Controlling AI Behavior | ✅ 10 min | ✅ 20 min | ✅ 25 min | [04-controlling-ai-behavior.md](../content/slides/04-controlling-ai-behavior.md) |
| 5. Self-Verification | ✅ 10 min | ✅ 20 min | ✅ 20 min | [05-self-verification.md](../content/slides/05-self-verification.md) |
| 6. Copilot Agent Mode | — | — | ✅ 15 min | (in agenda — no separate slide file) |
| 7. Live Demo (extended) | — | — | ✅ 35 min | [demo-script-main.md](../content/demos/demo-script-main.md) |
| 8. Advanced Capabilities | — | — | ✅ 25 min | [08-advanced-capabilities.md](../content/slides/08-advanced-capabilities.md) |
| 9. When to Use | — | ✅ (in wrap-up) | ✅ 20 min | [09-when-to-use.md](../content/slides/09-when-to-use.md) |
| 10. Your Agentic Future | ✅ 5 min | ✅ 15 min | ✅ 15 min | [10-your-agentic-future.md](../content/slides/10-your-agentic-future.md) |
| Synthesis Demo | ✅ 5 min | ✅ 15 min | — | [demo-script-main.md](../content/demos/demo-script-main.md) |

### Legend
- ✅ = Included with indicated duration
- — = Not included in this version (skip entirely)

## Choosing a Version

### 1-Hour: "The Paradigm Shift"
Best for audiences who need to **understand what agentic coding is** and why it matters. No live coding demo beyond a brief 5-minute showcase. Suitable for conferences, meetups, and executive briefings.

### 2-Hour: "Core Concepts + Demo"
Best for audiences who want to **see it in action**. Covers all core concepts with a 15-minute synthesis demo that shows the full agentic loop. Suitable for team introductions and half-day sessions.

### 4-Hour: "Full Workshop"
Best for audiences who want to **deeply understand and practice**. Includes advanced topics (MCP, agent types, checkpoints), an extended 35-minute live build, and detailed when-to-use guidance. Suitable for dedicated training days and workshops.
