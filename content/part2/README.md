# The Agentic Operating Model, Part 2

Materials for the follow-up session *Agents That Reach Out, Ask First,
Remember, and Hand Off*: one Marp source with full speaker notes, a 60-minute
and a 90-minute deck, a demo runbook, and a script that creates the demo
repository.

## Files

| File | Purpose |
| --- | --- |
| [aom-part2.md](aom-part2.md) | Marp source: 33 slides, every slide with speaker notes |
| `aom-part2-60min.pptx`, `aom-part2-90min.pptx` | Exported decks (built by the script below) |
| [Build-Part2Deck.ps1](Build-Part2Deck.ps1) | Builds both variants, gates on overflow and notes, exports |
| [demo-runbook.md](demo-runbook.md) | Setup, prompts, expected results, and fallbacks for every demo |
| [New-Part2DemoRepo.ps1](New-Part2DemoRepo.ps1) | Creates the demo repository the live demos run in |

## Agenda

One running example connects the four blocks: a new Tool for the PowerShell
MCP server, taken from a vague idea to a reviewed commit.

| Block | 90 minutes | 60 minutes | Slides (90-minute numbering) |
| --- | --- | --- | --- |
| Opening: four questions, Part 1 recap | 0:00–0:05 | 0:00–0:04 | 1–3 |
| 1 · Reach out: MCP servers, local and remote | 0:05–0:24 | 0:04–0:18 | 4–10 |
| 2 · Ask first: questionnaires and Grill-Me | 0:24–0:42 | 0:18–0:30 | 11–15 |
| 3 · Remember: the Memory Bank in 2026 | 0:42–0:57 | 0:30–0:38 | 16–22 |
| 4 · Hand off: engineer and security reviewer | 0:57–1:17 | 0:38–0:53 | 23–28 |
| Close: use the new Tool, choose the surface | 1:17–1:24 | 0:53–0:57 | 29–32 |
| Q&A | 1:24–1:30 | 0:57–1:00 | 33 |

The engineer's implementation runs during block 3, so block 4 starts with a
finished change to review. Every demo has a rehearsal branch as a fallback; see
the [demo runbook](demo-runbook.md).

## Slide map

Fifteen of the 33 slides come from the main deck in
[marp-presentation.md](../slides/marp-presentation.md); eighteen are new, five
of them short live-demo cue slides. The 60-minute deck drops the four slides
marked *90 only*.

| # | Title | Variant | Origin |
| --- | --- | --- | --- |
| 1 | The Agentic Operating Model — Part 2 | both | Edited: *The Agentic Operating Model* |
| 2 | Four Questions Once the Agent Works in One Repository | both | New |
| 3 | The Agentic Loop | both | Reused as is |
| 4 | Why MCP When the Agent Already Has a Terminal? | both | Edited: *MCP — The Universal Connector* |
| 5 | MCP Sits On Top of Your APIs | 90 only | Reused as is |
| 6 | The Whole Protocol in One PowerShell File | both | New |
| 7 | Wiring the PowerShell Server Into VS Code | both | Edited: *MCP in VS Code* |
| 8 | Local or Remote — Where Does the MCP Server Run? | both | New |
| 9 | Three Questions Before You Connect Any MCP Server | both | New, built from *MCP Security Considerations*, *Agent Identity*, *The Lethal Trifecta* |
| 10 | Live: Seven Tools, One PowerShell Script | both | New demo cue |
| 11 | Agents Act Eagerly — and Agree With You | 90 only | New |
| 12 | Questionnaires — Structured Questions, Recommended Answers | both | New |
| 13 | Grill-Me — Twelve Categories, Depth by Blast Radius | both | Edited: *Two Patterns for Context* |
| 14 | A Skill Is Advice — a Custom Agent Is a Mode | both | New |
| 15 | Live: From a Vague Idea to a Design Concept | both | New demo cue |
| 16 | The Memory Bank Pattern | both | Edited |
| 17 | What Changed in Nine Months | both | New |
| 18 | Routing the Memory Bank — "Select", With a Number Attached | both | Edited: current numbers |
| 19 | Compaction — the Memory Bank Needs an Exit Gate | both | New |
| 20 | Three Memories, Three Owners | both | New |
| 21 | Memory Bank Integrity — Trusted State Needs a Boundary | 90 only | Reused as is |
| 22 | Live: Measure a Memory Bank | both | New demo cue |
| 23 | Agent Handoffs Are Declared in Frontmatter | both | Edited: *Custom Agents* and *Agent Handoff Chains* |
| 24 | One Request, Four Custom Agents — the Development Cycle | both | New |
| 25 | Fifteen Round Trips | both | New |
| 26 | Bound the Loop in Structure — Then Test the Graph | both | New |
| 27 | Beyond Agent Handoffs — Orchestration Patterns | 90 only | Edited title |
| 28 | Live: Engineer → Security Reviewer → Engineer | both | New demo cue |
| 29 | Close the Loop — Use the Tool That Did Not Exist an Hour Ago | both | New demo cue |
| 30 | Which Surface for Which Need? | both | Edited: *The Complete Customization Ecosystem* |
| 31 | Sergeant and Commander | both | Edited |
| 32 | Resources | both | Edited |
| 33 | Questions? | both | Edited |

Every speaker note follows the same shape: **CONTEXT** (why the slide exists
and its sources), **PRESENT** (how to deliver each bullet or row),
**TRANSITION** (the line into the next slide), and **TIME**. Demo cue slides
use **DO** and **IF IT FAILS** instead of PRESENT.

## Build

Prerequisites: PowerShell 7, Node.js 20 or later, and the slide tooling
dependencies installed once with `npm install` in
[content/pptx](../pptx/).

```powershell
# Gate both variants (overflow and speaker notes) without exporting
.\Build-Part2Deck.ps1

# Gate, then export both PPTX files and review PNGs
.\Build-Part2Deck.ps1 -ExportPptx -ExportPng
```

- Version tags select the variant: `1h` slides form the 60-minute deck, `2h`
  slides the 90-minute deck.
- Nothing is exported unless every slide fits the 1280 × 720 frame and carries
  a speaker note.
- Close the decks in PowerPoint before exporting. An open deck makes the export
  fail, and the script reports it instead of leaving a stale file.
- The wrapper does not use `Build-MarpVersions.ps1 -CheckOverflow`, because
  that checker always measures the main deck's generated files.

## Session description

The text submitted to Sessionize, kept here so the slides and the promise stay
in sync.

**Title:** The Agentic Operating Model, Part 2: Agents That Reach Out, Ask
First, Remember, and Hand Off

**Learning outcomes.** After the session, participants will be able to:

- Explain how an MCP server works at the protocol level and assess the
  identity, privilege, and untrusted-input risks it introduces.
- Use questionnaires and the Grill-Me pattern to turn a vague idea into a
  Design Concept before any work starts.
- Describe how Memory Bank practice has changed and decide what belongs in a
  versioned Memory Bank and what in an Agent host's built-in memory.
- Design Agent handoff chains with explicit gates: what to automate, where a
  human decides, and how to keep a review loop bounded.
- Choose between an Instruction file, a Skill, a Custom agent, and an MCP
  server for a recurring need.

**Small print:** a talk with live demos in VS Code and GitHub Copilot, aimed at
PowerShell practitioners and DevOps and platform engineers who already use an
Agent. Preferred length 90 minutes; a 60-minute version is available. Part 2
of the series; it stands on its own.

## See also

- [Demo runbook](demo-runbook.md)
- [PowerShell MCP demo server](../demos/mcp-demo-server-ps/README.md)
- [Main deck source](../slides/marp-presentation.md)
- [Memory Bank template](../materials/memory-bank-template/README.md)
