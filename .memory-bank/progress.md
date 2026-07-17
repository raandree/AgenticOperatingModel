# Progress — The Agentic Operating Model

## Recent

- 2026-07-17: **Branch-disposition confirmation (read-only) — verdict: merge none of the five.** Performed the content-diff the 2026-07-08 audit deferred, comparing each branch against **current `main`**. `ai/memory-bank-glossary` is 0 ahead (already merged, `1864a4e`). `feature/mcp-demo-server` has an **empty** `content/demos` diff vs `main` (squash-merged 2026-05-20; its 4 "ahead" commits are pre-squash history). `ai/mcp-server-powershell-port` + `ai/refurbish-ps-mcp-server` are a superseded `server.ps1` lineage — merging would delete `main`'s current `Start-AgenticDemoMcp.ps1` and shrink `server.js` (regression). `feature/contentUpdate` (27 behind / 4 ahead) has a **+68 / −1513** net content delta — all its concepts (comprehension debt, spec-driven, operator-sustainability, gray-box delegation) already on `main` in evolved form; its 68 unique lines are older (Opus 4.7 vs 4.8, ~20 vs ~37 skills, unrelabeled `[Your URL]` placeholders). The user then deleted all five local branches; this record branch `ai/branch-disposition-audit` was fast-forward-merged into `main` and deleted, leaving `main` the only local branch (1 ahead of `origin/main`, not pushed). Memory-bank-only update; no curriculum or build change.
- 2026-07-13: **New M4 slide *You Can Verify the Output, Not the Reasoning* + German *Lanz & Precht* pull-quotes.** From a user-supplied Lanz & Precht (ZDF, 2026) podcast transcript, identified the one genuine curriculum gap — LLM answers come from statistical correlation, not an auditable causal chain of reasons — and turned it into a **4h-only** slide in the Trust-but-Verify module (`content/slides/marp-presentation.md`), inserted after *Can You Trust AI-Generated Code?* as the epistemic *why* before *The Self-Verification Loop*: you verify the deterministic **artefact** (tests, `git diff`, RSOP/`terraform plan`), **behaviour** (evals), and **traceability** (Git) — never the reasoning. Also appended German Precht paraphrases to the existing **Job Hollowing** (junior-hollowing / "working on our own abolition") and **Vigilance Trap** (Precht naming *Automation bias* outright) speaker notes in the split `content/slides/09-when-to-use.md`; all German lines marked *paraphrased from an auto-transcribed episode — verify against the audio before quoting verbatim*. Rebuilt all three decks: 4h **140 → 141** slides, 1h/2h unchanged, overflow **0/0/0**, build Pester **11/11**; verified the new slide + both merged notes appear only in `marp-4h-workshop.md`. CHANGELOG `[Unreleased] › Added` entry added. **Not committed** (user: "do it but don't commit"); tracked PPTX now stale (new slide absent) — re-export offered, not done.
- 2026-07-12: **Wired four CopilotAtelier skills into the slides as concrete examples.** In the Marp build source, referenced `agent-evals` (M4 *Evals Are Not Unit Tests*), `test-driven-development` (M5 *Test-First with AI*), `agent-security-review` (M6 *Containment First*, covering the Lethal Trifecta pair), and `skill-creator` (M4 *Skill-Authoring Discipline* — in speaker notes, the slide was full). Rebuilt all three decks: overflow **0 across 1h/2h/4h**, build Pester **11/11**. Fixed two pre-existing issues surfaced by the rebuild (both independent of the skill edits — the title-based note-merge was unchanged): *The Consistency Problem* (M3) `dense → compact` (a marginal slide tipped by the newer bundled Chromium), and inline notes for the 2026-07-01 split slides *— Counter-Patterns* / *— The Numbers* (title-unmatchable by the note-merge). Not committed per user; work sits uncommitted on `ai/sync-copilotatelier-skills`. PPTX re-exported (all three tracked decks refreshed via `-ExportPptx`; 4.6 / 12.8 / 25.7 MB).
- 2026-07-11: **Synced CopilotAtelier skill-inventory references (34 → 37 skills).** Upstream CopilotAtelier added three engineering-discipline skills (`test-driven-development`, `debugging-and-error-recovery`, `code-review-and-quality`) plus earlier-but-newer additions (`agent-evals`, `agent-security-review`, `long-running-job-monitor`, `pswritehtml-reporting`, `social-signal-sweep`, `citation-integrity`, `devils-advocate-review`, `grill-me`). Fixed two stale counts in AOM: `content/materials/cheat-sheet.md` ("~20 skills … lab automation, DSC, documents, email, knowledge work" → "~37 skills" + research/verification, agent-building, engineering-discipline categories) and `.memory-bank/techContext.md` ("~22 skills" → "~37 skills"). Other named skill references (`german-legal-research`, `marp-slide-overflow`, `sampler-build-debug`, grill-me + Ubiquitous Language slide 3.11a) verified still-valid — in sync. Markdown-only; no new lint issues (the 230 cheat-sheet warnings are pre-existing house-style). CHANGELOG `[Unreleased] › Changed` entry added. Branch `ai/sync-copilotatelier-skills`.
- 2026-07-08: **Created the missing Ubiquitous Language glossary** (`.memory-bank/glossary.md`) — the canonical location the pre-flight hook and `ubiquitous-language.instructions.md` expect, previously absent. Harvested the already-settled project vocabulary (cheat-sheet "Key Concepts" + Slide 2.0 "Foundational Vocabulary") into 8 themed tables (~30 terms) in the mandated `Term | Means | Don't say` format; a harvest of settled language, not an invention (project is mature at v1.1.0). Detected and flagged one drift: loop phase 3 is **ACT** in the cheat-sheet + Module 2 slides but **EXECUTE** in `techContext.md` — glossary declares ACT canonical (no rewrite of `techContext.md` this turn). Markdown clean (0 MD060 after spacing the table delimiters). Memory-bank-only change; no curriculum content or build output touched. Branch `ai/memory-bank-glossary` **fast-forward merged to `main`** (`1864a4e`); `main` now 1 commit ahead of `origin/main`, not pushed.
- 2026-07-08: **Branch-hygiene audit (read-only).** `main` checked out, clean, in sync with `origin/main`. Confirmed the 2026-07-01/02 work (gaps slides, root `build.ps1`, CHROME_PATH fix, 4h overflow fixes, Pandoc PPTX export) is all on `main` (`a6f4ea7` … `e7b2204`); `ai/agentic-gaps-research` + `ai/pandoc-editable-pptx-rebased` were merged and deleted (no loss). Four branches remain unmerged by SHA but 23–25 commits behind and likely already squash-merged: `feature/contentUpdate`, `feature/mcp-demo-server`, `ai/refurbish-ps-mcp-server`, `ai/mcp-server-powershell-port`. No files changed (memory-bank refresh only).
- 2026-07-02: **Integrated the Pandoc editable-PPTX export; retired the stale feature branch.** Cherry-picked the sole unique commit (`bbf5170`, adding `content/pptx/Export-PandocToPptx.ps1`) from `ai/pandoc-editable-pptx` (20 commits behind `main`, forked pre-v1.1.0) onto a fresh `ai/pandoc-editable-pptx-rebased` off current `main`. The script applied clean; resolved the expected `CHANGELOG.md` conflict by placing the entry under the current `[Unreleased] › Added`. Verified: 0 AST parse errors, script byte-identical to the original commit, 0 conflict markers; result commit `944f7b0` on `1242d92`. Deleted the old branch local (`git branch -D`) + remote (`git push origin --delete`). New branch local-only, not pushed.
- 2026-07-01: **Overflow fixes + slide-interleaving bug (4h).** The overflow gate flagged 4 clipped 4h slides (Bottleneck 1.61, Deep Modules 1.65, Vigilance 1.38, Stockfish 1.44). Found a content bug: *Deep Modules* had been inserted into the middle of *Job Hollowing & Heteromation*, stranding that slide's second half (Heteromation row + BCG/HBR numbers + three-industries table) on *Deep Modules* (Marp ignores `<!-- _split_ -->`). Per user choice (preserve content, split the biggest): reunited Job Hollowing, split its evidence to a new *— The Numbers* slide, gave *Deep Modules* its own clean slide; split *The Bottleneck Has Moved* into two (+ new *— Counter-Patterns*); *Vigilance* + *Stockfish* → compact + light trims (moved framing/citation + German quote to the merged split-file notes, not inline comments — those trip the note-merge skip-guard). Verify loop caught and fixed a duplicate empty Vigilance slide. Final: 4h 138 → 140 slides, **0 overflow** across all versions, note injection restored to 109, 7 changed slides PNG-verified. 1h/2h unchanged. PPTX not re-exported (still stale from Jun 11; now unblocked). Branch `ai/agentic-gaps-research`, not pushed.
- 2026-07-01: **Fixed Marp PPTX/PNG export browser launch (`CHROME_PATH`).** Verifying a user-reported `.\build.ps1 -ExportPptx -Version all -CheckOverflow` run: the build was healthy but every PPTX export aborted with *"Failed to launch the browser process"* because Marp CLI bundles no browser and `CHROME_PATH` was unset (Chrome absent, only Edge x86 present). Added `Resolve-MarpBrowserPath` to `content/pptx/Build-MarpVersions.ps1` (prefer explicit `CHROME_PATH` → the local `puppeteer` package's downloaded Chromium via `executablePath()` — the same one the overflow check uses → installed Edge/Chrome) and wired it into the export block (set for the export, restored after). Verified end-to-end: all three PPTX now export (4.7 / 12.9 / 25.5 MB) and the overflow check completes for every version. The overall exit 1 the user saw is the overflow **gate** over the 4 pre-existing 4h overflows (Bottleneck / Deep Modules / Vigilance Trap / Stockfish), not a failure. Findings noted: committed PPTX are stale (Jun 11) — deferred re-export now unblocked; and the split-note merge is non-deterministic (a Module 9 appendix note block repositions between rebuilds — cosmetic). Regenerated artifacts reverted; commit is the fix alone. Branch `ai/agentic-gaps-research`, not pushed.
- 2026-07-01: **Root-level `build.ps1` slide-build entry point.** Added a thin `[CmdletBinding()]` wrapper at the repo root that forwards to `content/pptx/Build-MarpVersions.ps1` via `@PSBoundParameters` so the Marp deck build can be triggered without `cd content/pptx`. Mirrors the inner script's delivery-workflow parameter surface (`-Version`, `-ExportPptx`, `-ExportPng`, `-CheckOverflow`, `-Report`, `-AddMissingTags`, `-AssembleFromSplits`, `-MergeNotesFromSplits`); advanced overrides (`-SourcePath` / `-OutputDir`) still route through the deep script. README *Rebuilding the Decks* snippet updated to lead with `.\build.ps1 -Version all -ExportPptx` and `build.ps1` added to the project-structure listing. AST parse clean; `pwsh -File .\build.ps1 -Version 1h` exits 0 and regenerates `marp-1h-keynote.md` (30 slides). Branch `ai/agentic-gaps-research`, not pushed.
- 2026-07-01: **Executed the gaps & trends plan — 7 new slides + currency refresh.** Added 7 compact slides to the Marp build source (`content/slides/marp-presentation.md`): *The Lethal Trifecta* + *Containment First* (M6 security), *Context Engineering* (M2), *Evals Are Not Unit Tests* (M4), *Beyond Handoffs — Orchestration Patterns* + *The Standardization Wave* (M3), *The Autonomy Horizon* (intro). Refreshed model currency (Opus 4.7 → 4.8) in the deck + cheat-sheet; added a cheat-sheet "What's New to Teach (2026 H2)" block. Rebuilt all three decks (1h 30 / 2h 73 / 4h 138); overflow clean (4 pre-existing overflows only); 11/11 build Pester tests green. PPTX re-export deferred. Branch `ai/agentic-gaps-research`, not pushed.
- 2026-06-30: **Agentic gaps & trends research.** Ran a five-phase web-research pass (12 primary sources: Anthropic, OWASP GenAI, GitHub/VS Code changelogs, METR, AAIF, agentskills.io, MCP, Willison) and persisted `docs/research/2026-06-30-agentic-gaps-and-trends.md` — 7 primary gaps (prompt injection/lethal trifecta, containment-first sandboxing, context engineering, evals≠tests, sub-agent orchestration, AAIF standardization, METR autonomy horizon), 9 secondary, a currency refresh, an evidence table with confidence grades, and a full gap-by-gap curriculum integration plan. No deck edits yet (research + plan only, per user). Branch `ai/agentic-gaps-research`, not pushed.
- 2026-06-11: **Brand logos placed in the presentation decks.** Used the four design-board brand sets (AOM / ShellPilot / DeskPilot / CopilotAtelier) on the slides where they add identity: AOM glyph on the **title** + closing **Questions?** slides (1h/2h/4h), the **ShellPilot+DeskPilot** pair on the 4h **M11 Tools Built on This Model**, and the **CopilotAtelier** logo on the 4h **M8 Mature Personal Atelier**. The new design-board `#2` primary logos are opaque 24-bit with noisy near-white backgrounds → processed to transparent, content-cropped PNGs via luma keying + despeckle + strong-ink bbox (min-channel keying failed on DeskPilot's faint colored noise). New `assets/{ShellPilot,DeskPilot,CopilotAtelier}-logo-on-light.png` + composed `ShellPilot-DeskPilot-on-light.png`; reused the existing transparent `AOM-glyph-on-light.png`. Marp `![center w:NNN](../../assets/…)` (no body HTML; `../../assets/` works from both `content/slides/` and `content/pptx/`). Rebuilt all three decks + PPTX; no new overflow; 11/11 build tests green; visually verified the four slides from exported 4h PNGs. Branch `ai/companion-tools-references` (continued), not pushed.
- 2026-06-11: **Companion-tool references — ShellPilot & DeskPilot.** Referenced the two AOM-supporting tools where they fit: a *Related projects* section in `README.md`, a *Putting It in Non-Technical Hands* subsection + See-Also links in `docs/for-decision-makers.md`, two cheat-sheet **Resources** entries, a new 4h slide **11.10a “Tools Built on This Model”** in the Marp master + `11-beyond-code.md`, and a ShellPilot/DeskPilot proof line on the M4 *Your Atelier* slide (2h + 4h) + the M8 *Mature Atelier* note. ShellPilot is public (Copilot in the PowerShell terminal); DeskPilot is a private-preview desktop front door. Rebuilt all three decks + PPTX (4h 130 → 131); 11/11 build Pester tests green; overflow check shows no new overflow. Branch `ai/companion-tools-references`, not pushed. Docs + slide change.
- 2026-06-11: **README logo → centered theme-aware transparent lockup** (`assets/AOM-lockup-on-{light,dark}.png`), replacing the dark-card hero that looked heavy on the white README page in light mode. Same rich lockup (glyph + wordmark + tagline + compass) with the card keyed out (flood-fill the off-white margin + rounded-corner gaps from the border, **inset ~10px to drop the card-edge frame ring**, then luma-key the navy interior); light variant recolours the wordmark to brand navy, dark keeps it white, teal preserved in both. Switches via `<picture>`. New filenames keep GitHub's Camo cache fresh; removed `AOM-hero.png`. Docs/asset-only.
- 2026-06-11: **Root README logo finalised as a colour hero banner** (`assets/AOM-hero.png`). Cropped from the design-board splash (full lockup + *Orchestrate. Align. Scale.* tagline + compass on a dark navy card); centered at `width=520`; one self-contained image works on both GitHub themes. Shipped under a new filename to bust GitHub's Camo image cache (the cause of the "old logo still shows" report). Removed the orphaned mono `AOM-logo-on-{light,dark}.png`; kept the glyph assets for the sub-READMEs. Also removed an accidentally-committed throwaway `.work/mono.ps1` and added `.work/` to `.gitignore`. Docs/asset-only.
- 2026-06-11: **Brand icons added to the docs** (branch `ai/brand-icons`, not pushed). New `assets/` with four transparent `Format32bppArgb` PNGs derived from the off-white-flattened design-board exports: `AOM-logo-on-{light,dark}.png` (navy wordmark + teal accent; dark variant recolours navy→near-white, keeps teal) and `AOM-glyph-on-{light,dark}.png` (teal corner glyph). Root `README.md` gets a floated theme-aware `<picture>` logo header; `agenda/README.md` + `content/README.md` get a compact theme-aware corner glyph. Verified corner alpha 0 + dark/light composites; deleted throwaway `.work/`; CHANGELOG `[Unreleased]` updated. Docs/asset-only.
- 2026-06-07: **Released v1.1.0.** Squash-merged PR #13 (`ai/release-prep-1-1-0` → `main`, `f1f7daf`), pushed the `v1.1.0` tag, and published the GitHub Release (Latest) from the `CHANGELOG` `[1.1.0]` section. Branch deleted (local + remote). Preceding release-prep the same day: curated the Memory Bank, refreshed `content/README.md` (M11/M12 + newer demos), relabeled closing-slide presenter placeholders, cut `CHANGELOG` `[Unreleased]` → `[1.1.0]` (SemVer + compare links), rebuilt the three Marp decks + PPTX (11/11 build tests green). Open follow-up: `v1.0.0` has a tag but no GitHub Release.
- 2026-06-07: Added `docs/for-decision-makers.md` — a jargon-free value summary for engineering leaders, IT/platform directors, and research/legal/business managers (what the model is, under-using vs. over-trusting, cross-department value, business case, risk-and-governance, 30-minute evaluation path). Added an emphasized `> [!IMPORTANT]` "why this is worth your time" callout near the top of `README.md` linking to it and surfaced the `docs/` folder in the project-structure listing. Motivated by feedback that repo visitors did not grasp what it is, who it is for, or why it is worth the time. Docs-only; no slide or build-output changes.
- 2026-05-22: Added inline speaker notes in `marp-presentation.md` for the 12 slides that the split-file merge couldn't reach (orphaned monolith-only slides + title drift). Added 6 new Pester tests (in `content/pptx/Build-MarpVersions.Tests.ps1`) that enforce "every built slide has a speaker-note HTML comment" and "every section-divider carries its module appendix" across all three versions (1h/2h/4h). Code-fence-aware parser — won't be fooled by `---` inside ```\`\`\`markdown``` fences. All 11 tests green.
- 2026-05-22: Added Marp speaker notes (HTML comments) to ~30 concept-introducing slides across all 10 module files for newcomer accessibility. Merged to `main` via PR #11.

## Current Status

**Phase**: **v1.1.0 released** (2026-06-07) — repo ready to announce
**Started**: 2026-02-02
**Last Updated**: 2026-06-11
**GitHub Repository**: raandree/AgenticOperatingModel

> **Release status (2026-06-07):** **`v1.1.0` is published** — PR #13 squash-merged to `main` (`f1f7daf`), tag pushed, GitHub Release created and marked Latest; `CHANGELOG` `[Unreleased]` is empty. Entries below that read "not committed", "local only", or name a feature branch are historical provenance, **superseded by this line**. Open follow-up: `v1.0.0` has a tag but no GitHub Release.

**Status**: Three-version architecture (1h · 2h · 4h) maintained; content refreshed with the April 2026 Copilot landscape, CopilotAtelier integration, destructive-ops guardrails / cheating-agent / bottleneck-has-moved / GitOps-Layer-6, Mössner *KI Burnout ist real* operator-sustainability, the Node + PowerShell demo MCP servers, the M11 Beyond-Code and M12 Lab-as-Sandbox tracks, and the decision-maker value document

## Completed

### Spec-Driven Slide Split ✅ (2026-05-20)
- [x] M4 Slide 4.7a *"Spec-Driven Development — Make the Spec the Primary Artefact"* overflowed at 4h. Measured via `Test-SlideOverflow.ps1`: contentHeight ~960 px in `dense` (target 720)
- [x] Split into 4.7a (intro + table + project constitution + why-it-beats-prompt-engineering) and 4.7b (Pitfall + per-cycle entropy + two daily investments + Beck/Pocock quotes + pair-refs); both switched `dense` → `compact`
- [x] Re-verified: both slides now contentHeight=720, overflowY=0, fillRatio=1.0. Total 4h overflow count 9 → 7
- [x] CHANGELOG.md `[Unreleased]` updated; promptHistory.md entry appended

### PowerShell Edition of Demo MCP Server ✅ (2026-05-20)
- [x] New folder `content/demos/mcp-demo-server-ps/` — single-file `Start-AgenticDemoMcp.ps1` (PowerShell 7+); speaks MCP as raw JSON-RPC over stdio, no SDK dependency
- [x] Protocol-identical to the Node version: same seven tools (`notes_*` persistence + `system_*` reach), same JSON store, same instrumentation (timestamped colored stderr, per-call duration, `notifications/progress`)
- [x] PowerShell best practices applied: approved verbs, `[CmdletBinding()]`, comment-based help, validation, `Set-StrictMode 3.0`, UTF-8 stdio with stdout reserved for JSON-RPC frames
- [x] `probe.ps1` mirrors `probe.cjs`; verified end-to-end on pwsh 7.5.5 / Win11
- [x] `mcp.example.json` (VS Code wiring via `pwsh -NoProfile -NonInteractive -File`), `README.md` (what to show on stage), demo-script callout in `demo-mcp-server.md`
- [x] CHANGELOG.md `[Unreleased]` entry added
- [x] Branch: `feature/mcp-demo-server` → merged to `main`

### Operator-Sustainability Integration ✅ (2026-05-06)
- [x] Source: Cedric Mössner / *The Morpheus*, *"KI Burnout ist real"*, [YouTube SHKBrkpYssM](https://www.youtube.com/watch?v=SHKBrkpYssM), 2026 (35:31). Transcript captured via user paste and kept **outside the repository** (not committed)
- [x] Identified the curriculum gap: existing failure-mode coverage had team-dynamics (Molist 2026, M9.10a) and catastrophic blast radius (PocketOS / OECD.AI 2026-04-27-6153, M9.8c–e) but was missing the human-experience / operator-sustainability angle
- [x] Module 9: new slide **9.10b "Job Hollowing & Heteromation"** — defines both terms with M-quotes, BCG/HBR *AI Brainfry* numbers (14% / +33% / +39% / +39%), Brynjolfsson/Stanford new-grad data (−20% peak hiring, bigtech 15%→7%), three-industries table (software / lab medicine / creative writing). Anchored to transcript timestamps
- [x] Module 9: new slide **9.10c "The Vigilance Trap"** — Mackworth 1948 + Parasuraman & Manzey 2010 + Waymo 2015–17 with Krafcik quote; cognitive-load mismatch table (ATC 2h / pilot autopilot-off practice / knowledge worker 8h); maps each trap to existing curriculum surfaces (M5, S9.8e, S9.10a)
- [x] Module 10: new slide **10.7a "With AI, Not From AI — The Stockfish Pattern"** — positive counter-pattern. Chess explosion + FAA hand-flying as proof. *From* vs *with* table; explicit mapping of each curriculum surface (`copilot-instructions.md`, `.agent.md`, skills, memory bank, self-verification, GitOps Layer 6) to "moves operator upstream"
- [x] MARP master `content/slides/marp-presentation.md`: condensed versions of all three slides inserted at correct anchors, tagged `<!-- version: 4h -->`
- [x] `Build-MarpVersions.ps1` re-run cleanly: 121 → 124 slides; 1h: 28 unchanged, 2h: 65 unchanged, 4h: 124
- [x] `content/materials/agentic-knowledge-work-patterns.md`: new **Pattern 11 — Operator Dignity ("with AI, not from AI")** — three operating rules mapped to modules; end-of-day diagnostic question; explicit source-list footnote
- [x] `content/materials/cheat-sheet.md`: new **"Job Hollowing & Heteromation — The Vocabulary"** section with four-row table (Job Hollowing / Heteromation / AI Brainfry / Vigilance Trap)
- [x] `content/materials/destructive-operations-guardrails.md`: See-also gains the Mössner 2026 citation as the third leg of the failure-mode stool
- [x] CHANGELOG.md `[Unreleased]` entry added
- [x] Branch: `ai/job-hollowing` → merged to `main`

### Failure-Mode Integration ✅ (2026-04-29)
- [x] Researched PocketOS / Cursor + Claude Opus 4.6 / Railway incident via Disclose.tv and Tom's Hardware (incident date late April 2026; published 2026-04-27)
- [x] Cross-source verification: confirmed by **OECD.AI Incidents Database 2026-04-27-6153**, Tom's Hardware (originating outlet), The Register, TechSpot, Business Standard, ExtremeTech, Mashable, India Today, Financial Express, Indian Express, Analytics Insight, MSN, plus a dedicated **Zenity** security analysis. Disclose.tv downgraded from primary to secondary source
- [x] Read full transcript of Axel Molist *"What 6 months of AI coding did to my dev team"* (2026-04-18); cross-referenced with project memory bank
- [x] Module 5: new slide 5.11a "The Cheating-Agent Trap" with five mitigations + test-discipline `copilot-instructions.md` snippet
- [x] Module 9: new slides 9.8c (Real Incident), 9.8d (Guardrails for Destructive Operations), **9.8e (GitOps as the Architectural Guardrail)**, 9.10a (The Bottleneck Has Moved); Version Guide table updated
- [x] **Layer 6 — GitOps / IaC architectural guardrail**: promoted defence-in-depth model from five layers to six. Layer 6 = capability-based answer to PocketOS class of incident (agent's only verb is *propose a change* via commit + PR; gated CI/CD reconciles). Canonical reference: [`dsccommunity/DscWorkshop`](https://github.com/dsccommunity/DscWorkshop) (Datum + Sampler + DSC). Same-shape patterns: Argo CD / Flux, Atlantis / Terraform Cloud, Bicep deployment stacks
- [x] MARP master `content/slides/marp-presentation.md`: condensed versions of all five new slides inserted with `<!-- version: 4h -->` tags
- [x] New material `content/materials/destructive-operations-guardrails.md` — case studies, **six-layer** defence-in-depth model with failure-mode mapping table for Layer 6, copy-paste snippets, pre-flight checklist (incl. Layer 6 question), trip-wire patterns, OWASP/CWE mapping (incl. LLM06 Excessive Agency)
- [x] Cheat sheet expanded with three sections: Guardrails for Destructive Operations (six-layer table), Cheating-Agent Trap, Bottleneck Has Moved
- [x] `content/README.md` materials section updated with six-layer + DscWorkshop reference
- [x] CHANGELOG.md `[Unreleased]` entry added (two bullets: PocketOS integration + Layer 6 architectural guardrail)
- [x] Memory bank updated (activeContext.md, progress.md)
- [x] Build-MarpVersions.ps1 re-run; 4h deck = 121 slides (1h/2h unchanged — new content is 4h-only)
- [x] Committed to `update` branch as 441a33b (11 files, +998/-6)

### 2026 Q2 Landscape Refresh ✅ (2026-04-23)
- [x] Researched VS Code 1.117 (2026-04-22) + GitHub Copilot changelog (April 2026)
- [x] Reviewed `raandree/CopilotAtelier` reference repo and integrated its patterns (keybindings, debug-logs troubleshooting, agent-authoring meta-instructions)
- [x] Module 8: Slide 8.13 "What's New in 2026 Q2" added; prior 8.13 Key Takeaway renumbered to 8.14; Version Guide updated
- [x] Module 10: Slide 10.8 "The Future" Already-Here list rewritten for April 2026
- [x] Cheat sheet: model table refreshed (Opus 4.7 GA, GPT-5.4/5.4-mini, 5.1 retired); new settings and Useful Keybindings table; extended Troubleshooting (skills + debug logs); Resources + Cross-Machine Sync updated with CopilotAtelier
- [x] New sample `content/materials/sample-copilot-instructions/copilot-authoring.instructions.md`
- [x] CHANGELOG + memory bank updated

### Three-Version Architecture ✅ (2026-03-19)
- [x] Restructured `agenda/presentation-agenda.md` — Version Summary, Module Inclusion Matrix, Slide Inclusion Guide
- [x] Three version-specific timing tables with facilitator notes and learning outcomes
- [x] Module descriptions updated with per-version duration badges
- [x] Version Guide tables added to all 8 slide files (01–05, 08–10)
- [x] Added `<!-- version: -->` tags to all 81 MARP slides in source
- [x] Created `Build-MarpVersions.ps1` generating three output MARP decks
- [x] Generated `marp-1h-keynote.md`, `marp-2h-standard.md`, `marp-4h-workshop.md`
- [x] Updated README files: `agenda/README.md`, root `README.md`, `content/README.md`, `pptx/README-how-to-create-pptx.md`
- [x] Demo script updated with three-version timing references
- [x] Memory bank updated

### MARP Slide Deck Updates ✅ (2026-03-14)
- [x] New slide: "AI Does the Git Forensics for You" — contributor frequency analysis via `git log`
- [x] New slide: "Commit Strategies — Explained" — Conventional Commits, Branch Strategy, Co-authored Commits
- [x] 13 famous quotes added across all module dividers and key slides (Goethe, Popper, Kant, Wittgenstein, Seneca, Planck, Humboldt, Confucius, Sartre, Lao Tzu, Aristotle)
- [x] AI commit strategy added to sample `copilot-instructions.md` (Git & Commit Strategy section)
- [x] AI commit strategy added to CopilotAtelier `git.instructions.md` + Software Engineer Agent
- [x] Memory bank + CHANGELOG updated

### Prompt Evolution Demo ✅ (2026-03-14)
- [x] `content/demos/demo-prompt-evolution.md` — Six-level prompt quality progression demo
- [x] Slide 4.19 added to Module 4 (Prompt Evolution summary table)
- [x] Cross-references from main demo script, content README, cheat sheet, agenda
- [x] Memory bank updated (activeContext.md, progress.md, promptHistory.md)

### Agent Infrastructure ✅ (2026-03-09)
- [x] Technical-writer agent mode configured (7-phase documentation workflow)
- [x] CopilotAtelier instruction files (12 pattern-matched .instructions.md files on OneDrive, incl. `copilot-authoring`)
- [x] Skills ecosystem configured (sampler-framework, pester-patterns, grammar-check, agent-customization, etc.)
- [x] Cross-machine sync via VS Code `chat.*FilesLocations` settings
- [x] Project .github/ instruction files migrated to personal CopilotAtelier sync
- [x] Memory bank updated with agent mode and instruction documentation

### Brainstorming Notes Integration ✅ (2026-03-07)
- [x] Foundational vocabulary slide (Slide 2.0) added to Module 2
- [x] Token usage & cost slide (Slide 1.4a) added to Module 1
- [x] Agent security & boundaries slide (Slide 9.8a) added to Module 9
- [x] Guiding principle "Know what you are doing" slide (Slide 9.8b) added to Module 9
- [x] Complementary tools (Warp, GitHub Copilot CLI, Zed) added to Module 10 and cheat sheet
- [x] Cheat sheet expanded with Token/Cost, Security, Guiding Principle sections and 6 new glossary terms
- [x] Agenda updated with vocabulary, security, and guiding principle sections
- [x] Speaker notes enriched for Modules 1 and 9
- [x] Memory bank updated (activeContext.md, progress.md)

### Memory Bank ✅ (Updated 2026-03-09)
- [x] `projectbrief.md` - Core focus on agentic coding paradigm
- [x] `productContext.md` - Audience analysis and learning journey
- [x] `techContext.md` - Technology stack, instruction files, agent modes, memory architecture
- [x] `systemPatterns.md` - Presentation, demo, and workflow patterns (8 + 9 patterns)
- [x] `progress.md` - Status tracking (this file)
- [x] `activeContext.md` - Working context, agent configuration, condensed to < 200 lines
- [x] `README.md` - Memory Bank documentation with VS Code memory relationship

### Agenda ✅
- [x] `agenda/presentation-agenda.md` - Comprehensive 2-4 hour agenda

### Slide Content ✅ (Updated 2026-02-25)
- [x] Module 1: The AI Coding Revolution (10 min) - **Updated with current landscape**
- [x] Module 2: What Makes Coding Agentic (25-30 min) - **Refocused to Copilot**
- [x] Module 3: The Power of Context (20-25 min) - **Refocused to Copilot**
- [x] Module 4: Controlling AI Behavior (30-35 min) - **Expanded: Skills, Prompts, Handoffs, richer agents**
- [x] Module 5: Self-Verification (20-25 min) - **Refocused to Copilot**
- [x] Module 8: Advanced Capabilities (25 min) - **NEW: MCP, checkpoints, agent types**
- [x] Module 9: When to Use (15-20 min) - **Refocused to Copilot**
- [x] Module 10: Your Agentic Future (10-15 min) - **Added OneDrive sync, feature flags, updated takeaways**

### Demo Materials ✅ (Updated 2026-02-25)
- [x] Main demo script with talking points - **Added bonus Skills/Prompts/Sync demo section**
- [x] Sample copilot-instructions.md file
- [x] Sample .instructions.md file (pattern-matched)
- [x] Sample .agent.md file (custom agent)
- [x] Troubleshooting guide

### Supporting Materials ✅ (Updated 2026-03-09)
- [x] Sample copilot-instructions.md for PowerShell module development
- [x] Sample .instructions.md for PowerShell files
- [x] Sample .instructions.md for testing (Pester test files)
- [x] Sample .instructions.md for documentation (Markdown files)
- [x] Sample .instructions.md for refactoring
- [x] Sample .agent.md for Pester test writer
- [x] Sample .agent.md for code reviewer (with handoff)
- [x] Sample .agent.md for IaC engineer (DSC, Bicep, Terraform)
- [x] Sample .agent.md for security reviewer (OWASP, CWE references)
- [x] Sample SKILL.md for build debugging
- [x] Quick reference cheat sheet - **Added chat shortcuts, feature flags, expanded ecosystem**
- [x] MARP slide deck updated with Module 8 (MCP, checkpoints, agent types)

### Research ✅ (Completed 2026-02-24)
- [x] GitHub Copilot Agent Mode (Local/Background/Cloud/Third-party)
- [x] GitHub Copilot Coding Agent (autonomous PR creation, Windows support)
- [x] Copilot instruction file ecosystem (5 file types)
- [x] Custom agents (.agent.md) with tools and handoffs
- [x] Cursor v2.5 (alternative tool reference)
- [x] Windsurf/Cascade (alternative tool reference)
- [x] Claude Code (alternative tool reference)
- [x] GitHub Agentic Workflows (Markdown-based CI/CD, technical preview)
- [x] MCP under Linux Foundation, universal standard
- [x] Current AI models (April 2026): Claude Opus 4.7 GA, GPT-5.4 / GPT-5.4-mini, Gemini 3.1 Pro (Feb 2026 baseline was Opus 4.6 / GPT-5.3-Codex / Gemini 3.1 Pro)

## Content Structure

```
c:\Git\AgenticOperatingModel\
├── .memory-bank/
│   ├── projectbrief.md
│   ├── productContext.md
│   ├── techContext.md
│   ├── systemPatterns.md
│   ├── progress.md
│   └── activeContext.md
├── agenda/
│   └── presentation-agenda.md
└── content/
    ├── slides/
    │   ├── 01-ai-coding-revolution.md
    │   ├── 02-what-is-agentic.md
    │   ├── 03-power-of-context.md
    │   ├── 04-controlling-ai-behavior.md
    │   ├── 05-self-verification.md
    │   ├── 08-advanced-capabilities.md
    │   ├── 09-when-to-use.md
    │   └── 10-your-agentic-future.md
    ├── demos/
    │   └── demo-script-main.md
    ├── pptx/
    │   ├── Build-MarpVersions.ps1
    │   ├── marp-1h-keynote.md
    │   ├── marp-2h-standard.md
    │   ├── marp-4h-workshop.md
    │   └── README-how-to-create-pptx.md
    └── materials/
        ├── cheat-sheet.md
        └── sample-copilot-instructions/
            ├── copilot-instructions.md
            ├── powershell.instructions.md
            ├── testing.instructions.md
            ├── documentation.instructions.md
            ├── refactoring.instructions.md
            ├── pester-test-writer.agent.md
            ├── code-reviewer.agent.md
            ├── iac-engineer.agent.md
            ├── security-reviewer.agent.md
            └── sample-skill/
                └── SKILL.md
```

## What's Ready

| Item | Status | Notes |
|------|--------|-------|
| 2-Hour Agenda | ✅ Ready | Core concepts covered |
| 4-Hour Agenda | ✅ Ready | Extended with demos |
| All Core Slides | ✅ Updated | Modules 1-5, 8-10 (Copilot-focused) |
| Main Demo Script | ✅ Updated | Copilot Agent Mode workflow |
| Sample Copilot Instructions | ✅ Ready | 10 sample files (instructions, agents, skill) |

| Cheat Sheet | ✅ Updated | Refocused on Copilot |
| Landscape Research | ✅ Complete | Copilot primary, alternatives referenced |
| Agent Infrastructure | ✅ Configured | Technical-writer mode, CopilotAtelier instructions, skills |

## Optional: Still Could Create

These are optional additions if time permits:

- [x] Module 8 slides: Advanced Capabilities (MCP, checkpoints)
- [x] Sample `SKILL.md` file for presentation materials
- [x] Additional .instructions.md templates (testing, documentation, refactoring)
- [x] Additional .agent.md templates (code review, IaC, security)
- [x] Slide deck conversion to PowerPoint/Google Slides (MARP updated with Module 8)
- [ ] Pre-recorded backup demo video
- [ ] Setup checklist for attendees

## Key Decisions Made

1. **Focus**: Agentic coding paradigm, NOT PowerShell training
2. **Structure**: Concept → Demo → Practice pattern
3. **Core Message**: "AI that acts, not just suggests"
4. **Primary Tool**: GitHub Copilot Agent Mode (built into VS Code)
5. **Emphasis Areas**:
   - Git for context and traceability
   - Instruction files for consistency
   - Automated testing for self-verification
   - Human judgment remains essential

## Next Steps for Presenter

1. **Review all content** for accuracy and tone
2. **Customize** speaker notes and contact info
3. **Prepare demo environment** per demo script
4. **Practice** timing with actual Copilot Agent Mode usage
5. **Test** Copilot connectivity before session
6. **Create** backup recordings if desired

## File Summary

The curriculum has grown well beyond the original estimate, so the precise
file/word counts that used to live here were removed to avoid drift. For the
current, authoritative inventory see [README.md](../README.md) and
[content/README.md](../content/README.md). At a glance: 10 core modules
(M01–M05, M08–M10) plus two optional tracks (M11 Beyond Code, M12 Lab as
Sandbox); the three generated Marp decks + exported PPTX; several demo scripts
(main, prompt-evolution, corpus-analysis, tax-case-study, MCP server in Node and
PowerShell, Kerberos lab); and the take-home materials (cheat sheet,
destructive-operations guardrails, knowledge-work patterns, memory-bank
template, sample instruction files).
