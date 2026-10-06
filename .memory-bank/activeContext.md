---
status: current
last-verified: 2026-10-06
owner: active-agent
source: current task evidence
---

# Active context

## Current focus

Part 2 session *Agents That Reach Out, Ask First, Remember, and Hand Off*,
presented on 2026-10-07 and prepared on branch `ai/aom-part2-deck` (local, not
pushed). Everything lives in `content/part2/`:

- `aom-part2.md` — Marp source, 33 slides, a speaker note on every slide
  (CONTEXT, PRESENT, TRANSITION, TIME; demo slides use DO and IF IT FAILS)
- `aom-part2-60min.pptx` (29 slides) and `aom-part2-90min.pptx` (33 slides);
  version tag `1h` means the 60-minute deck, `2h` the 90-minute deck
- `Build-Part2Deck.ps1` — generates both variants, gates on overflow and
  notes, exports PPTX and PNG
- `demo-runbook.md` and `New-Part2DemoRepo.ps1` — demo setup and the demo
  repository (default `C:\Git\aom-part2-demo`, not yet created)
- `README.md` — agenda, slide map (15 slides from the main deck, 18 new), and
  the submitted session description

The MCP block covers local versus remote servers (slide 8). MCP revision
2026-07-28 removed the `initialize` handshake; the demo server still speaks
2025-06-18, and slide 6 says so.

## Evidence

- Last build: 0 overflowing slides, 0 slides without notes, PPTX notes pages
  equal the slide count (29 and 33); PNG review of every slide done.
- `New-Part2DemoRepo.ps1` tested in a temporary folder: Memory Bank health
  passes; the Pester baseline passes 3 of 3.
- `probe.ps1` now deletes the note it created instead of note #1.
- `.memory-bank/index.md` created 2026-10-06; the health check still fails on
  metadata in untouched files and line budgets in `techContext.md` and
  `systemPatterns.md` (the deck uses that failure as an honest example).

## Next step

Presenter: run `content/part2/New-Part2DemoRepo.ps1`, rehearse the development
cycle once with a branch per stage (see `demo-runbook.md`), then review and
merge `ai/aom-part2-deck`.

## Prior focus

The July and August 2026 deck work (Hooks and Memory Bank routing slides,
presenter-voice fix) is recorded in `progress.md` and in git history up to
`b6452bb`.