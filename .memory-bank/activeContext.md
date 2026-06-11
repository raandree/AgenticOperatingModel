# Active Context — The Agentic Operating Model

## Current Focus

**Task**: Placed references to the two companion tools that support the AOM — **[ShellPilot](https://github.com/raandree/ShellPilot)** (public; GitHub Copilot in the PowerShell terminal) and **[DeskPilot](https://github.com/raandree/DeskPilot)** (private preview; a desktop chat front door for non-technical users) — across the docs and slides where they fit, on branch `ai/companion-tools-references` (not pushed). Both tools already link back to AOM; this reciprocates. Repo milestone: **v1.1.0 released** (2026-06-07).
**Target Audience**: PowerShell Developers, DevOps Engineers, System Engineers, Research/Knowledge Workers
**Primary Tool**: GitHub Copilot Agent Mode (VS Code)
**GitHub Repository**: raandree/AgenticOperatingModel
**Last Updated**: 2026-06-11

> **Release status (2026-06-07):** **`v1.1.0` is published** — PR #13 squash-merged to `main` (`f1f7daf`), tag `v1.1.0` pushed, and the GitHub Release created and marked Latest. The working tree is clean and `CHANGELOG.md` `[Unreleased]` is empty. Older entries that read "not yet committed", "local only", or name a feature branch are retained for provenance but are **superseded by this line**. Open follow-up: `v1.0.0` has a tag but **no GitHub Release** — backfill it if the announcement needs a complete releases page.

## Recent Changes

### 2026-06-11: Companion-tool references — ShellPilot & DeskPilot
- User shipped two tools supporting the AOM and asked to reference them where it makes sense: **ShellPilot** (public — GitHub Copilot in the PowerShell terminal; the `Invoke-Shp` engine reusing the same instruction files + Agent Skills, returning usage/cost objects) and **DeskPilot** (private preview — a calm desktop chat UI on the ShellPilot engine for non-technical knowledge workers). User chose *“everywhere it fits + rebuild”* and *“link as-is, no private-preview note.”* Both repos already link back to AOM, so this reciprocates.
- Docs: root `README.md` gains a **Related projects** section; `docs/for-decision-makers.md` gains a *Putting It in Non-Technical Hands* subsection + two See-Also links; `cheat-sheet.md` **Resources** gains two entries (after CopilotAtelier).
- Slides (Marp master is the build source; splits donate notes): new 4h slide **11.10a “Tools Built on This Model — ShellPilot & DeskPilot”** inserted after *A Mature Personal Atelier* and before *M8 Key Takeaway*, with an inline `Speaker notes —` block so the note-merge **skip-guard** protects it from duplicate injection. Detailed twin + Version Guide row added to `11-beyond-code.md` (H1 aligned to the master to stay off the title-drift list). M4 4.13a *Your Atelier* closing line now cites ShellPilot/DeskPilot as literal proof of “use it everywhere” (2h + 4h); its split note (`04-controlling-ai-behavior.md`) and the M8 *Mature Atelier* note gained pointers.
- Build/verify: `Build-MarpVersions.ps1 -Version all -ExportPptx` rebuilt all three decks + PPTX (4h 130 → 131; 1h 29, 2h 68). Overflow check (`Test-SlideOverflow.ps1 -Version 4h`): my slides fit; the 4 reported overflows (Bottleneck / Deep Modules / Vigilance Trap / Stockfish) are pre-existing and unrelated. 11/11 build Pester tests green.
- Deliberately skipped: `content/README.md` and `agenda/README.md` (folder indexes) and the demo scripts (out of scope for a light reference pass).
- Branch: **`ai/companion-tools-references`** — local only, not pushed.

### 2026-06-11: Light mode fix — dark-card hero → theme-aware transparent lockup
- User: the dark-card hero banner "does not look good" in light mode (a heavy dark box on the white README page). Fix: drop the card and ship the **same rich lockup** (glyph + wordmark + *Orchestrate. Align. Scale.* tagline + compass) as a transparent, theme-aware pair so it sits directly on the page in both themes.
- Process gotcha: the splash (`AOM #8`) is a rounded dark-navy card on an **off-white flatten margin**, so a plain luma key kept the off-white border and left white triangles in the rounded-corner gaps (cornerA 255). Fixed by flood-filling the off-white from the image border (kills margin + corner gaps; the enclosed ink is never reached), then luma-keying the navy card interior to transparent. Corner alpha 0 confirmed.
- Two variants from the one splash: light = recolour near-white ink → brand navy `#101638`, keep teal; dark = keep white + teal. Verified on `#ffffff` + `#0d1117`: light reads cleanly on white (navy/teal, no box), dark crisp on dark.
- README: replaced the `AOM-hero.png` `<img>` with a centered `<picture>` switching `AOM-lockup-on-{light,dark}.png` (width 380); removed `assets/AOM-hero.png`. New filenames keep GitHub's Camo cache fresh. Glyph assets + sub-READMEs unchanged. Note: `bc781bc` (the hero) was already pushed, so github.com showed the dark card correctly — it was a design issue, not a cache issue.
- **Frame-ring fix (folded into the same commit by amend, unpushed):** first cut showed a faint grey rectangle around the lockup. Cause: the flood-fill stopped at a high brightness threshold, leaving the card's anti-aliased outer edge as a ring of opaque mid-grey pixels, which the content-crop then traced. Fix: after flooding the off-white, take the survivor bbox and **inset it ~10px** so the card-edge ring is dropped before the luma-key + content-crop. Result is frame-free on both themes (verified on white + `#0d1117`); corner alpha 0; tighter crop (1031×780).

### 2026-06-11: Root logo → colour hero banner; GitHub cache fix
- User reported github.com still showed the old logo and asked for the new logo in the original (colour) scheme. Root cause of the stale image: the branch is pushed and the new logo was committed (`c3221e2`), so it was **GitHub's Camo image cache** serving the old PNG at the unchanged path. Fix: ship under a **new filename** so the raw URL (and thus the camo key) changes — `AOM-hero.png`.
- Source taxonomy lesson: the design-board **tile numbers do not match the export filename numbers** (export regrouped by type). Verified content by eye. The full colour lockup (glyph + wordmark + *Orchestrate. Align. Scale.* tagline + compass divider) lives in the file named `AOM #8 - Splash ... light mode.png` — actually a **dark-navy card** (`#0E1B1F`); its sibling `#7` is an app-icon tile, not a splash. Labels are unreliable; trust pixels.
- Cropped the splash to its dark card (dropped the off-white flatten margin via a max-channel<160 bbox), saved opaque `assets/AOM-hero.png` (1347×905, ~1.5:1). Previewed centered on `#ffffff` + `#0d1117`: handsome banner on light; on dark the card sits just above page colour with a faint hairline edge (reads as an intentional border) and all content stays crisp — one image serves both themes, no `<picture>` switch needed.
- README: replaced the floated `<picture>` logo with a centered `<p align="center"><img src="assets/AOM-hero.png" width="520">`; removed the now-pointless `<br clear="left">` and restored the blank line before the `[!IMPORTANT]` callout. Removed the orphaned `assets/AOM-logo-on-{light,dark}.png` (mono lockup) — the glyph assets stay for the sub-READMEs (left unchanged per user).
- Repo hygiene: `c3221e2` had accidentally committed the throwaway `.work/mono.ps1`; removed it and added `.work/` to `.gitignore`. CHANGELOG `[Unreleased]` rewritten to the final hero-banner state.

### 2026-06-11: Mono-lockup logo swap (EVALUATING, uncommitted)
- Tried sources `AOM #9` (mono teal-on-white) and `#10` (mono white-on-teal) per user request. Pixel inspection: #9 = teal ink `#107070` on off-white; #10 = white ink on dark-teal `#105050`. Both are the **full lockup** (document frame + wave + wordmark + tagline "Orchestrate. Align. Scale." + compass divider) — richer than the prior simple glyph+wordmark.
- Keyed each background out (color-to-alpha vs white for #9 → teal transparent; a min-channel white-ink key for #10 → pure-white transparent). Composited on `#0d1117` + `#ffffff`: teal reads on light but is muddy on dark; white reads on dark but is invisible on light → they form a clean theme pair. Corner alpha 0, auto-cropped, `Format32bppArgb`.
- Promoted into the logo slot (overwrote `assets/AOM-logo-on-{light,dark}.png`; README filenames unchanged). Also fixed a stray `"` in the README `<img>` tag (`align="left" "`). Glyph assets left as-is. Layout still floated-left `width=300`; the lockup is a **tall stacked hero** (~1.33:1) so a centered hero is the likely better fit — offered as an option.
- **Uncommitted**, pending user keep / revert / re-layout decision. `.work/` throwaway deleted.

### 2026-06-11: Brand icons in README + sub-READMEs
- Added the AOM brand glyph/logo to the docs on branch `ai/brand-icons` (**not pushed**). New `assets/` folder with four transparent, auto-cropped `Format32bppArgb` PNGs generated from the off-white-flattened design-board exports (`AOM #N` taxonomy): `AOM-logo-on-{light,dark}.png` (navy wordmark `#101030` + teal accent `#10B0B0`; the dark variant recolours navy→near-white `#EAF1F8` via the `darkInk` predicate while preserving the teal) and `AOM-glyph-on-{light,dark}.png` (teal corner glyph — darker shade for light bg, brighter for dark).
- Root `README.md`: floated, theme-aware `<picture>` logo header (`align="left" width="300"`, `prefers-color-scheme` switch, `<br clear="left">` after the intro). `agenda/README.md` + `content/README.md`: compact theme-aware corner glyph (`align="right" width="96"`, no `<br clear>`). All HTML wrapped in `markdownlint-disable MD033 MD041`.
- Verified: corner alpha = 0 programmatically on all four variants; composited each on `#0d1117` and `#ffffff` and inspected visually — wordmark opaque, off-white veil gone, and the theme switch confirmed necessary (navy nearly vanishes on dark, near-white nearly vanishes on light). Throwaway `.work/` (scripts, sources, composites) deleted; `git status` shows only the three READMEs + `assets/`. `.gitattributes` already marks `*.png binary`. Not a PowerShell module → no Gallery `IconUri` step.
- CHANGELOG `[Unreleased]` entry added. Docs/asset-only; no slide content or deck build output changed.

### 2026-06-07: v1.1.0 released
- Squash-merged PR #13 (`ai/release-prep-1-1-0` → `main`, now `f1f7daf`); local + remote branch deleted.
- Tagged `v1.1.0` on the merged commit and pushed the tag; created the GitHub Release ([releases/tag/v1.1.0](https://github.com/raandree/AgenticOperatingModel/releases/tag/v1.1.0)) from the `CHANGELOG` `[1.1.0]` section, marked Latest.
- Preceding release-prep (same day): curated this Memory Bank (removed a personal-path reference, corrected stale "not committed" notes, trimmed `activeContext.md` ~100 lines); refreshed `content/README.md` (M06/M07 reserved, M11/M12 tracks added, newer demos + memory-bank template); relabeled closing-slide contact placeholders as presenter fields; cut `CHANGELOG.md` `[Unreleased]` → `[1.1.0] - 2026-06-07` (SemVer + compare links); rebuilt the three Marp decks and re-exported the tracked PPTX (11/11 build Pester tests green).
- Open follow-up: `v1.0.0` tag exists but has **no GitHub Release**.

### 2026-06-07: Repo promotion — decision-maker value doc + README callout
- User-reported gap: people looking at the repo did not grasp what it is, who the target audience is, or why investing time is worth it.
- Added `docs/for-decision-makers.md` — a jargon-free value summary for engineering leaders, IT/platform directors, and research/legal/business managers. Sections: one-sentence definition; the under-using vs. over-trusting problem; what makes it an *operating model* (not a tool); where the value compounds across departments (four-profile table reframed as "where this pays off"); the business case (speed *with* traceability, self-verification, durable Memory Bank, bounded risk); risk-and-governance as the de-risking signal (six-layer guardrails, comprehension debt, operator sustainability, team dynamics); why it is worth the time; what you get; a 30-minute evaluation path. Links only to in-repo artefacts so claims are verifiable.
- Added an emphasized `> [!IMPORTANT]` callout near the top of `README.md` (between the intro lines and `## Overview`) leading with **"New here? Start with *Why this is worth your time*"** and linking to the new doc; surfaced the `docs/` folder (with the new file) in the project-structure listing.
- Docs-only change: no slide content, MARP master, or build-output (`marp-*.md` / PPTX) edits. No deck rebuild required.
- Merged to `main` via PR #12; recorded under CHANGELOG `[1.1.0]`.

### 2026-05-22: Speaker-note coverage — inline gap-fill + Pester guard
- User-reported gap: 12 slides in the built 4h deck still had no speaker notes despite the earlier split-file note pass. Root cause split three ways: (a) monolith-only slides with no split-file equivalent (8 of 12), (b) title drift between split H1 and monolith H1 not yet captured in `notes-title-map.psd1` (3 of 12), (c) one orphan from earlier oversight (4.7b).
- Fix: injected 12 inline `<!-- ... -->` newbie notes directly into `marp-presentation.md` (cleanest fix — guaranteed regardless of merge logic). Slides covered: Spec "Not a Substitute", Skill-Authoring Discipline, The Self-Verification Loop, Enabling Self-Verification, Agent Types, Your First copilot-instructions.md, Resources, You Are the Conductor, A Mature Personal Atelier, Demo Reference, M9 Key Takeaway, Sergeant and Commander.
- Guard: 6 new Pester tests in `content/pptx/Build-MarpVersions.Tests.ps1` (3 versions × 2 invariants). Code-fence-aware separator counter mirrors `Split-MarpSlides` so `---` inside ```​```markdown``` example fences is not mis-counted. Skips gracefully (`Set-ItResult -Skipped`) if the built file is missing. All 11 tests green.
- `<!-- _split_ -->` (line 2184 of monolith) clarified: it's an editorial marker for human readers, ignored by Marp and by the build script. Harmless; the new test explicitly excludes it from the directive blocklist.
- Still not committed per user instruction.

### 2026-05-22: Newbie-friendly speaker notes across all slide modules
- Added concise Marp speaker notes (`<!-- ... -->` HTML comments — render in presenter mode, export as PPTX notes) to ~30 jargon-heavy / concept-introducing slides spanning M1, M2, M3, M4, M5, M8, M9, M10, M11, M12.
- Each note is 3–5 short bullets in plain English: defines jargon (LLM, context window, MCP, GitOps, Memory Bank, Pester, checkpoint, diff, comprehension debt…), gives an everyday analogy, and cross-references where the concept is revisited.
- No structural / layout / build-output changes. Notes are HTML comments; rendered slides are byte-identical visually.
- **Not yet committed** per explicit user instruction ("please don't commit yet").
- Next step: user reviews notes in presenter mode (or PPTX export) and signals whether to commit / adjust tone / add more.

### 2026-05-20: Spec-Driven slide split (M4 4.7a → 4.7a + 4.7b)
- Original `dense` slide overflowed 4h render by ~240 px (contentHeight ~960 / 720). Split at the natural seam between *"Why it beats prompt engineering"* and the Pitfall block.
- 4.7a now carries intro + code-first/spec-first table + project-constitution pattern + why-it-beats-prompt-engineering bullets + "continued →" pointer.
- 4.7b carries the Pitfall framing, per-cycle entropy bullets, two-daily-investments rule (read the diff / refactor the design), Kent Beck + Pocock quotes, pair-cross-refs, Spec Kit link.
- Both switched `dense` → `compact`. Verified via `Test-SlideOverflow.ps1`: both contentHeight=720, overflowY=0, fillRatio=1.0. 4h overflow count 9 → 7. `Build-MarpVersions.ps1` re-run; 4h: 130 slides; 1h/2h unchanged.

### 2026-05-20: PowerShell edition of the demo MCP server
- New folder `content/demos/mcp-demo-server-ps/` — single-file `Start-AgenticDemoMcp.ps1` (PowerShell 7+) speaks MCP as raw JSON-RPC over stdio, no SDK dependency. Built for a PowerShell-conference demo: the entire protocol fits in one readable `.ps1`.
- Protocol-identical to the Node version. Same seven tools, same JSON store (`%LOCALAPPDATA%\AgenticDemoMcp\notes.json`), same instrumentation (timestamped colored stderr, per-call duration, `notifications/progress` when host passes a `progressToken`). Toggles: `-Quiet` / `AGENTIC_DEMO_VERBOSE=0`, `-NoColor` / `AGENTIC_DEMO_NO_COLOR=1`, `-StorePath` / `AGENTIC_DEMO_DIR`.
- Follows PowerShell best practices: approved verbs, `[CmdletBinding()]`, comment-based help, validation attributes, `Set-StrictMode 3.0`, UTF-8 stdio (stdout reserved for JSON-RPC frames, all human output to stderr). Tool registry via `Register-McpTool` — one call adds a capability.
- `probe.ps1` mirrors `probe.cjs` end-to-end. Verified on pwsh 7.5.5 / Win11.
- Two small polish fixes during verification: trim leading blank line from `Out-String` formatting; pass `-DateKind String` to `ConvertFrom-Json` (PS 7.5+) so ISO timestamps survive round-trip instead of being coerced to local-culture `[datetime]`.
- `content/demos/demo-mcp-server.md` gains a *PowerShell variant* callout; the agent cannot tell the two implementations apart → reinforces "MCP is a contract, not a framework".
- Branch: **`feature/mcp-demo-server`** — local only, not pushed.

### 2026-05-16: Demo MCP server + workshop script
- New folder `content/demos/mcp-demo-server/` — Node ESM MCP server on `@modelcontextprotocol/sdk` over stdio. Seven tools split into two families that demonstrate the two distinct things MCP gives an LLM: **persistence** (`notes_add/list/search/delete` → JSON file under `%LOCALAPPDATA%\AgenticDemoMcp\`) and **reach** (`system_os_info/disk_free/top_processes` → PowerShell shell-out via CIM and `Get-Process`).
- `probe.cjs` smoke test exercises all seven tools via raw JSON-RPC; verified on Win11 + Node 24.11.1. First attempt used `Get-PSDrive` for disk free → hung on network-drive enumeration; switched to `Win32_LogicalDisk DriveType=3`.
- `README.md`, `mcp.example.json` (uses `${workspaceFolder}` for portability), and `content/demos/demo-mcp-server.md` (12-min live script for 4h workshop M4; optional 2h sidebar; skip in 1h). Five-beat structure: protocol-is-not-magic / persistence / reach / identity-decoupling under `runas` / destructive-ops gate.
- Closes the conceptual gap raised in the May-16 Q&A on MCP server identity, MCP vs. raw Graph API, and what makes a *teachable* MCP demo for a mixed audience (PowerShell devs + sysadmins + knowledge workers).
- Branch: **`feature/mcp-demo-server`** — local only, not pushed.
### 2026-05-19: Obsidian + MCP server cheat-sheet reference
- Added one line under cheat-sheet **Resources** (immediately after the Beads link) pointing to Obsidian + the `mcp-obsidian` MCP server, framed as a *complement* to the per-repo Memory Bank for personal cross-project knowledge — explicitly **not** a replacement.
- Deliberately scoped to the cheat-sheet only. Considered and rejected adding Obsidian to slides 8.5a (Beyond Code) or 8.5b (Scaling the Backlog): wrong axis (personal knowledge vs. shared backlog), not agent-native by default, no sharp "you've outgrown X" threshold for the 1–4-person dsccommunity audience. Would dilute the Beads slide's "stay with the Memory Bank" message.
- No slide build re-run needed; cheat-sheet only.

### 2026-05-16: Beads / `bd` brief signpost in M8
- Added new slide **8.5b "Scaling the Backlog — When to Reach for Beads"** (4h only) after 8.5a. Frames Beads as an *upgrade path*, not a default. Three-signal threshold (parallel agents on shared backlog / hundreds of dependency-tangled issues / stateless multi-machine sessions); explicit "stay with the Memory Bank" guidance below that.
- Decision driven by assessment of dsccommunity org (representative audience): 1–4 person teams, one agent at a time, issue counts in single/low-double digits. Beads' sweet spot (multi-writer cell-merge, atomic claim, dependency graph queries) doesn't materialize at that scale; cost of a second tracker next to GitHub Issues + Dolt runtime + new vocabulary is not justified.
- MARP master updated with condensed version tagged `<!-- version: 4h -->`; `Build-MarpVersions.ps1` re-run — 4h: 124→125 slides; 1h/2h unchanged.
- Cheat-sheet Resources: one-line link to Beads repo with "only when you outgrow Memory Bank + Issues" qualifier.

### 2026-05-06: Operator-Sustainability Integration — Mössner / *KI Burnout ist real*
- Integrated Cedric Mössner / *The Morpheus*, *"KI Burnout ist real"*, [YouTube SHKBrkpYssM](https://www.youtube.com/watch?v=SHKBrkpYssM), 2026 (35:31). Closes the third leg of the failure-mode stool: alongside team-dynamics (Molist 2026, M9.10a) and catastrophic blast radius (PocketOS / OECD.AI 2026-04-27-6153, M9.8c–e), this is the **operator-sustainability / human-experience** angle the curriculum was missing
- Transcript captured via user paste and kept **outside the repository** (not committed). The YouTube auto-caption fetch was blocked by a PO-token gate, so the user pasted from the signed-in transcript pane
- Three new slides added (all 4h-only):
  - **M9.10b "Job Hollowing & Heteromation"** — defines both terms with M-quotes (*"quality control for a machine I don't trust"*, @0:32; Heteromation @21:50). BCG/HBR *AI Brainfry* survey numbers (14% report it; +33% decision fatigue; +39% serious errors; +39% want to quit, March 2026, @13:22). Brynjolfsson / Stanford (@11:20): hiring of 22–25 yr-olds in AI-exposed jobs −20% from peak; bigtech new-grad share 15%→7%. Same-mechanism-three-industries table (software @0:00, lab medicine @18:39, creative writing @19:38) prevents framing as developer-only
  - **M9.10c "The Vigilance Trap"** — frames the problem as 78 years old, not novel. Mackworth (1948) RAF radar — vigilance breaks after 15–30 min, untrainable. Parasuraman & Manzey (2010) Automation Complacency — equally bad in novices and experts. Google self-driving 2015–17 — drivers fell asleep, did makeup; Krafcik *"hard to take over because they have lost contextual awareness"*; Waymo's response was Level 4 not Level 3 (remove the steering wheel). Cognitive-load mismatch table: ATC 2h max + 30-min break / FAA pilot autopilot-off practice / knowledge worker 8h with no break. Closes by mapping each trap to existing curriculum surfaces (M5, S9.8e, S9.10a)
  - **M10.7a "With AI, Not From AI — The Stockfish Pattern"** — positive counter-pattern that closes the operator-sustainability arc. Stockfish/chess explosion + FAA hand-flying as proof that *machine-surpasses-human ≠ human-role-hollows*. *From* vs *with* operator-experience table. Explicit mapping of every curriculum surface (`copilot-instructions.md`, `.agent.md`, skills, memory bank, self-verification, GitOps Layer 6) to "moves operator upstream from prompter to author of intent"
- MARP master `content/slides/marp-presentation.md` updated with condensed versions of all three slides at the correct anchors (after 9.10a, before *You Are the Conductor*), each tagged `<!-- version: 4h -->`
- `Build-MarpVersions.ps1` re-run: 121 → 124 slides; 1h: 28 unchanged, 2h: 65 unchanged, 4h: 124
- `content/materials/agentic-knowledge-work-patterns.md`: new **Pattern 11 — Operator Dignity ("with AI, not from AI")** with three operating rules (author intent in version control / verify by artefact / budget for review), end-of-day diagnostic question, source-list footnote citing Mackworth 1948 + Parasuraman & Manzey 2010 + KOF/ETH 2025 + BCG/HBR 2026 + Brynjolfsson 2026 + Waymo 2017
- `content/materials/cheat-sheet.md`: new **"Job Hollowing & Heteromation — The Vocabulary"** section with four-row vocabulary table (Job Hollowing, Heteromation, AI Brainfry, Vigilance Trap), one-line definitions and diagnostics, plus operator-dignity rules
- `content/materials/destructive-operations-guardrails.md`: See-also section gains Mössner 2026 citation as the operator-sustainability companion to existing Molist (team) and PocketOS (catastrophic) citations
- CHANGELOG.md `[Unreleased]` entry added
- Branch: **`ai/job-hollowing`** — local only, not pushed; user requested branch for diff review against `main`

### 2026-04-29: Layer 6 — GitOps / IaC as the architectural antidote (DscWorkshop)
- Promoted the destructive-operations defence-in-depth model from **five layers** to **six**, adding **Layer 6: Architectural guardrails (GitOps + IaC)** — the *capability-based* answer to the PocketOS class of incident
- Core argument: layers 1–5 stop the agent from *choosing* to do harm; Layer 6 stops it from *being able* to. The agent's only verb is *propose a change* (commit + PR), never *apply a change* — a gated CI/CD pipeline (with PR review + RSOP/`terraform plan` diff + manual approval) is the only path from "agent's desired state" to "production state"
- Canonical reference: the [DSC Community DscWorkshop](https://github.com/dsccommunity/DscWorkshop) (Datum + Sampler + DSC). Same-shape patterns called out: Argo CD / Flux (Kubernetes), Atlantis / Spacelift / Terraform Cloud, Bicep deployment stacks
- New slide **M9.8e "GitOps as the Architectural Guardrail"** added to `content/slides/09-when-to-use.md` (4h only); slide is positioned directly after 9.8d, version-guide table extended; covers the per-failure mapping table (how each PocketOS failure mode becomes impossible under GitOps), red-zone / green-zone topology diagram, and the five preconditions (repo-write-only agent identity, meaningful human PR review, dangerous-delta CI linting, stricter pipeline-definition approval, secrets out of Git)
- MARP master `marp-presentation.md`: condensed version inserted directly after the existing 9.8d block, tagged `<!-- version: 4h -->`
- `content/materials/destructive-operations-guardrails.md`: "five-layer model" diagram redrawn as six-layer; new section "Layer 6 — Architectural guardrails (GitOps + IaC)" with failure-mode mapping, structural argument, six preconditions (slightly expanded vs the slide), "when you cannot put GitOps in front of the system" fallback. Pre-flight checklist gains a Layer 6 question. See-also list upgraded — OECD.AI Incidents entry **2026-04-27-6153** and the **Zenity** security analysis cited as primary sources, replacing the lower-credibility Disclose.tv summary
- `content/materials/cheat-sheet.md`: Guardrails table extended from five to six layers
- `Build-MarpVersions.ps1` re-run after the edits to keep the 1h/2h/4h derived MARP files consistent (1h and 2h decks unchanged — the new content is 4h-only)

### 2026-04-29: Failure-Mode Integration — PocketOS incident + supervisory-work theme
- Integrated two external sources into the curriculum:
  - **Disclose.tv / Tom's Hardware (2026-04-27)** — PocketOS / Cursor + Claude Opus 4.6 / Railway incident: production database + every backup wiped in 9 seconds via a single API call after the agent guessed the scope of a destructive Railway primitive
  - **Axel Molist video transcript (2026-04-18)** — *"What 6 months of AI coding did to my dev team"*: the bottleneck has moved from typing code to specifications + supervision; the cheating-agent problem (broken code + broken tests); senior/junior/mid-level dynamics; "strangers in your own codebase"; angry agents as a counter-pattern; the 2 a.m. "restart the server" tribal-knowledge anecdote
- Four new slides added (all 4h-only):
  - M5.11a "The Cheating-Agent Trap" — mitigations: tests-as-specs first, "tests must fail first" rule, independent reviewer agent, mutation testing, hold-out acceptance criteria
  - M9.8c "Real Incident — 9 Seconds, One Database" — chain-reaction breakdown + the agent's own verbatim confession
  - M9.8d "Guardrails for Destructive Operations" — five-layer defence-in-depth: agent policy, tool approval (Ask always), credential scope (per-environment, not blanket), backup independence (different blast radius), rehearsed recovery (quarterly drills)
  - M9.10a "The Bottleneck Has Moved" — three role shifts (specification / supervisory / institutional memory), three failure modes (strangers in own codebase / yes-man agents / mid-level squeeze), four counter-patterns (architecture review before generation, angry agents, agent subconscious, scheduled reading time)
- MARP master `marp-presentation.md` updated with condensed versions of all four slides, tagged `<!-- version: 4h -->`
- New take-home material `content/materials/destructive-operations-guardrails.md` — case studies (PocketOS + Replit), six failure layers, copy-paste agent-policy snippet, tool-approval defaults, credential-scope rules, backup-independence anti-patterns, recovery hygiene, pre-flight checklist, trip-wire patterns, OWASP/CWE mapping including LLM06 Excessive Agency
- Cheat sheet expanded with three new sections (Destructive Operations, Cheating-Agent Trap, Bottleneck Has Moved)
- `content/README.md` updated with the new material file; CHANGELOG.md gets a new `[Unreleased]` entry

### 2026-04-25: Real Multi-Year Tax Case Added as Sample (M11)
- Analysed a real multi-year German income-tax case repo — multi-year German income-tax case (six VZ 2021–2026, ~80 PDFs/year, ~200 emails, three legal phases) — confirmed exceptional fit for M11 (Beyond Code) and the broader operating-model thesis
- Original repo contains real PII and is left untouched; integration done via two anonymised artefacts in this repo
- New: `content/demos/demo-tax-case-study.md` — anonymised companion to `demo-corpus-analysis.md`; full-scale walk-through covering memory bank as case file, multi-modal ingestion (pymupdf + Tesseract + Outlook COM), citation discipline, three-branch strategy alternatives, computed deadlines (§ 122 Abs. 2 Nr. 1 AO 4-Tage-Fiktion lesson), restructuring plan as document, data governance; includes hand-out variant for non-technical audiences
- New: `content/materials/agentic-knowledge-work-patterns.md` — ten reusable patterns (two-axis filesystem, memory bank as case file, multi-modal ingestion, citation-backed reasoning, strategy branches, computed deadlines, restructuring plan, reconciliation document, status markers, privacy by repository)
- Wired into `content/README.md` (demos and materials sections); cross-linked from `demo-corpus-analysis.md`

### 2026-04-24: CopilotAtelier Deep Integration
- Promoted CopilotAtelier from cheat-sheet footnote to first-class slide content
- Added M3 slide "Your Atelier — Customization as Code" (four surfaces + environment + keybindings; `~/OneDrive/CopilotAtelier/` layout; `chat.*FilesLocations` settings) — 2h, 4h
- Added M3 slide "Skill-Authoring Discipline" (YAML frontmatter, USE FOR / DO NOT USE FOR trigger phrases, failure modes, Chat Customizations editor + Show Agent Debug Logs diagnostics) — 4h only
- Added M8 slide "A Mature Personal Atelier" using CopilotAtelier's ~20-skill portfolio (infra, DSC, testing, documents, communications, knowledge work) as proof of the operating-model thesis — 4h only
- Cheat sheet: new "Authoring Your Own Skills" section (frontmatter template, 7-item checklist, feature-flag table including `chat.includeReferencedInstructions`)
- Rebuilt pptx trio as `agentic-operating-model-{1h,2h,4h}.pptx`; old `agentic-coding-*.pptx` and legacy single-file `agentic-coding-presentation.md` removed (2026-04-26)

### 2026-04-23: 2026 Q2 Landscape Refresh + CopilotAtelier Integration
- Researched VS Code 1.117 (released 2026-04-22) and GitHub Copilot changelog for April 2026
- Reviewed the [CopilotAtelier](https://github.com/raandree/CopilotAtelier) reference repo (the public OneDrive-based cross-machine Copilot sync setup, formerly named MyCopilot)
- Added Module 8 Slide 8.13 "What's New in 2026 Q2" (renamed prior 8.13 Key Takeaway → 8.14)
- Rewrote Module 10 Slide 10.8 "The Future" Already-Here list for April 2026
- Updated cheat sheet: model table (Opus 4.7 GA, GPT-5.4/5.4-mini, 5.1 retired), new settings (incremental rendering, agent CLI terminal title), new Useful Keybindings table, extended Troubleshooting (skills, debug logs, Chat Customizations editor), Resources + Cross-Machine Sync rewritten around CopilotAtelier
- New sample `copilot-authoring.instructions.md` — meta-instructions for authoring `.instructions.md` / `.prompt.md` / `.agent.md` / `SKILL.md` files
- CHANGELOG updated with a single cohesive 2026-04-23 entry

## Agent & Instruction Configuration

### Active Agent Modes

| Mode | Purpose | Key Features |
|------|---------|-------------|
| **technical-writer** | Documentation & article creation | 7-phase workflow (Scope → Research → External Research → Outline → Content → Editing → Publication), citation requirements, quality gates, Memory Bank integration, subagent delegation, CRAAP source evaluation |
| *(default)* | General development | Standard Copilot Agent Mode |

### Instruction Files (12 total)

**CopilotAtelier** (OneDrive cross-machine sync, 12 files):
`powershell` · `pester` · `yaml` · `json` · `markdown` · `changelog` · `git` · `versioning` · `sampler` · `azurepipelines` · `csharp` · `copilot-authoring`

**VS Code Extension** (1 file, conditionally loaded):
- `azure.instructions.md` — loaded only for Azure-related requests (from `ms-azuretools.vscode-azure-github-copilot` extension)

### Available Skills (~26 total)

**CopilotAtelier Skills** (~22): `automatedlab-deployment` · `datum-configuration` · `dsc-troubleshooting` · `mecm-dsc-deployment` · `winrm-troubleshooting` · `sampler-framework` · `sampler-migration` · `sampler-build-debug` · `pester-patterns` · `grammar-check` · `agent-customization` · `pdf-to-markdown` · `docx-to-markdown` · `xlsx-to-markdown` · `pandoc-docx-export` · `outlook-email-export` · `outlook-calendar-export` · `send-outlook-email` · `create-outlook-draft` · `microsoft-todo-tasks` · `german-legal-research` · `german-employment-law`

**VS Code Extension Skills** (4): `summarize-github-issue-pr-notification` · `suggest-fix-issue` · `form-github-search-query` · `show-github-search-result`

### Memory Architecture

| Scope | Location | Purpose | Persistence |
|-------|----------|---------|-------------|
| **Memory Bank** | `.memory-bank/` (git-tracked) | Shared project context, teaching artifact | Across sessions, machines, and collaborators |
| **User memory** | `/memories/` | Personal learnings, terminal patterns | Across all workspaces (first 200 lines auto-loaded) |
| **Session memory** | `/memories/session/` | Task-specific notes | Current conversation only |
| **Repository memory** | `/memories/repo/` | Workspace-scoped facts | Local to workspace |

### Key Deferred Tools

`fetch_webpage` (web research for technical-writer mode) · `github_repo` · `get_changed_files` · `mcp_azure_mcp_search`

### Project Instruction Files

Previously in `.github/` (removed). Now loaded via CopilotAtelier OneDrive sync and VS Code `chat.*FilesLocations` settings. Project-specific samples remain in `content/materials/sample-copilot-instructions/`.

> Older completed work (three-version architecture, quotes, Module 8, prompt-evolution demo, CopilotAtelier integration, the Copilot pivot, etc.) lives in [progress.md](progress.md). This file keeps only the current focus and the most recent changes.

## Presenter Preparation (Next Steps)

- [ ] Customize speaker notes and contact info
- [ ] Prepare demo environment per demo script
- [ ] Practice timing with actual Copilot Agent Mode usage
- [ ] Test Copilot connectivity before session

## Working Assumptions

- Audience: Strong PowerShell, Git basics, some VS Code, likely used Copilot autocomplete
- Platform: Windows 11, PowerShell 7.x, Pester 5.x, stable internet
- Format: Live demo primary, slides for concepts, Q&A throughout
- Attendees may ask about Cursor/Windsurf/Claude Code — be prepared to compare

### Attendee Environment Variance
- Provide pre-session setup guide
- Have troubleshooting FAQ ready
- Consider DevContainer option
- Demo-first, follow-along optional

## Open Decisions

- **Contact details** on the closing slides are kept as labelled presenter placeholders so the deck stays reusable by anyone who forks it. A presenter fills these in before delivery.
- **`v1.0.0` GitHub Release** is not published (the tag exists from 2026-04-26 but has no Release page). Backfill it from the `CHANGELOG.md` `[1.0.0]` section if the announcement needs a complete releases history; otherwise the existing `v1.1.0` Latest release is sufficient.