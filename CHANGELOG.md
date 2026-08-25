# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- **New material: AI customization template repository blueprint (2026-08-25).**
  The curriculum taught the *personal* customization layer well (the Atelier,
  cross-machine sync, a sample instruction library) and the *project* layer
  briefly (`commit .github/copilot-instructions.md`), but had nothing on the
  **team** layer — how one shared rule set reaches many repositories, how a
  consuming repository picks up a newer version, and who is allowed to change a
  rule at all. Added
  [content/materials/instructions-template-repo/](content/materials/instructions-template-repo/)
  with three files. `README.md` gives the three-layer model (personal / team /
  project), the repository layout for the five customization surfaces, and a
  distribution table that states the trade-off honestly: a GitHub template
  repository carries everything but has **no** update path, while a
  `plugin.json` is updatable but carries **Agents and Skills only** — it will
  never ship Instructions or Hooks, so a second path is mandatory. The update
  procedure is SemVer tags plus a `.github/ai-template-version` marker, with a
  `git diff v1.3.0..v1.4.0` between tags as the review artifact. `GOVERNANCE.md`
  answers "who may change the rules?" in five rules — named owner per file via
  `CODEOWNERS`, pull request required, specific-layer-wins **except** that
  security rules may only be tightened, no rule without a case it fixes
  (including a trigger test for skills), and deprecate-version-announce — plus a
  role matrix and the hook exception. It also states the limitation the tooling
  imposes: precedence between layers is **not** enforced, all matching
  instruction files reach the model, so a rule that must hold belongs in a hook
  rather than in prose. `plugin.json` is a worked example manifest.
  A sixth rule closes the gap that prose governance cannot: the update path runs
  as a **CI drift check** in every consuming repository, marked as a *required*
  status check so that deleting the job leaves pull requests blocked instead of
  silently passing them, with the workflow file under `CODEOWNERS`. The same
  section names the cost of the pattern — pulling agent resources on a schedule
  is a supply-chain path, because hooks are executed by the host, so the
  template is pinned to a tag rather than a branch, the bump job opens a pull
  request instead of pushing to `main`, and the scheduled job is treated as
  unreliable because GitHub disables schedules on quiet repositories.

- **Hooks taught as the fifth Customization type (2026-07-29).** Every
  customization the curriculum taught so far — `copilot-instructions.md`,
  `.instructions.md`, `.agent.md`, `SKILL.md`, `.prompt.md` — is text the model
  reads and then *chooses* whether to obey. A hook is a command the host
  executes at a fixed lifecycle event, and it honours the exit code, so it is
  the only customization type that enforces rather than requests. Added a new
  2h/4h M3 slide *Hooks — Enforcement That Doesn't Depend on Compliance* to the
  Marp build source
  [content/slides/marp-presentation.md](content/slides/marp-presentation.md)
  covering the `SessionStart` / `PreToolUse` / `PostToolUse` events and the
  `0` allow / `2` block / other warn exit-code contract. Added a Hooks row to
  the *Complete Customization Ecosystem* table (now seven types) in both the
  build source and the split twin
  [content/slides/04-controlling-ai-behavior.md](content/slides/04-controlling-ai-behavior.md),
  with the matching `notes-title-map.psd1` alias updated so the split notes
  still merge. Added `chat.hookFilesLocations` to every cross-machine sync
  snippet, a `Hooks/` entry to the atelier folder tree, and a Hooks section to
  [content/materials/cheat-sheet.md](content/materials/cheat-sheet.md) and the
  sample
  [copilot-authoring.instructions.md](content/materials/sample-copilot-instructions/copilot-authoring.instructions.md).
  The containment slide *Containment Must Cover Host Trust Handoffs* now states
  the dual-use tension explicitly: the `PreToolUse` hook that blocks your pushes
  is a script the Agent can edit, so it belongs outside auto-approved edit scope.

- **New M11 slide "Routing the Memory Bank — Select, With a Number Attached" (2026-07-29).**
  Added one 4h-only slide after *The Memory Bank Pattern*. The curriculum taught
  the Memory Bank as a set of files read every session, which is the Write move
  from M2 done well and the Select move not done at all — and on a long project
  it manufactures the very *distraction* failure M2 names. The slide teaches an
  `index.md` routing table as the single unconditional read, the fail-open rule
  (index missing, routes conflict, or a fact not found → read everything and say
  so), the authority order, and the fact that routing is testable: CopilotAtelier
  gates its own routing on 25 audited cases requiring zero critical misses and
  ≥ 50 % context reduction.

- **Memory Bank template gains `index.md` and `decisions/` (2026-07-29).**
  [content/materials/memory-bank-template/index.md](content/materials/memory-bank-template/index.md)
  ships the routing map, full-read fallback, authority order, and routing table;
  [content/materials/memory-bank-template/decisions/0001-example-decision.md](content/materials/memory-bank-template/decisions/0001-example-decision.md)
  ships an immutable decision-record template with context, decision,
  consequences (including what it cost), alternatives, and evidence. The
  template README and `activeContext.md` were corrected accordingly —
  `activeContext.md` is a status page, not "the index".

- **Worked incident added to the destructive-operations handout (2026-07-29).**
  [content/materials/destructive-operations-guardrails.md](content/materials/destructive-operations-guardrails.md)
  gains *The guardrail that ate the guardrails*: a real July 2026 CopilotAtelier
  defect where a setup script's `Remove-Item -Recurse` fallback followed a
  junction's reparse point under Windows PowerShell 5.1 and would have deleted
  the OneDrive folder holding every agent, instruction, skill, prompt, and hook.
  Rare, silent, irreversible, and self-targeting — and caught not by a test but
  by an independent security review of an unrelated change. Also added a
  `PreToolUse` hook row to the trip-wire pattern table.

### Changed

- **Model currency and a resilient `model` declaration (2026-07-29).** Claude
  Opus 5 replaces Opus 4.8 as the current flagship across the deck, the
  cheat-sheet model table, and the split files. More importantly, the custom
  agent examples now declare `model` as a **priority array**
  (`['Claude Opus 5 (copilot)', 'Claude Opus 4.8 (copilot)']`) rather than a
  hard-pinned string, with the rule stated on-slide: first available wins, last
  entry must be GA, because hosted models retire on a roughly six-week cadence
  and a pin breaks every agent at once.

- **Subagent eligibility taught explicitly (2026-07-29).** The security-reviewer
  agent example now declares `agents: []` and `disable-model-invocation: true`,
  with the footgun named: an unset `agents` key means "any agent may call me as
  a subagent", which is how a domain specialist ends up invoked on an unrelated
  task.

- **Skill description cap corrected from ~500 to 1024 characters (2026-07-29).**
  The sample
  [copilot-authoring.instructions.md](content/materials/sample-copilot-instructions/copilot-authoring.instructions.md)
  stated a soft ~500-character guideline. The real limit is a hard 1024
  characters enforced by both VS Code and the agentskills.io specification, and
  a description over it can fail to load silently. The M4 *Skill-Authoring
  Discipline* failure-mode table and speaker notes were corrected to match, and
  the optional `compatibility`, `context: fork`, `license`, `metadata`, and
  `allowed-tools` Skill fields are now documented.

- **`agent-evals` reference updated to native tooling (2026-07-29).** The M4
  *Evals Are Not Unit Tests* slide described the CopilotAtelier skill as
  shipping a `run-evals.ps1` harness. That harness is now the documented
  *fallback*; the slide leads with the Chat Customizations Evaluations extension
  for static analysis and Microsoft's Waza runner for non-interactive execution.

- **CopilotAtelier inventory refreshed to ~40 skills and five surfaces
  (2026-07-29)**, and the `plugin.json` distribution path (installable Agents +
  Skills from a Git URL, complementary to the setup script, which still owns
  Instructions and hooks) is now mentioned on the atelier slide and in the
  cheat sheet.

- **Deck build (2026-07-29).** 1h / 2h / 4h source slides now **30 / 75 / 149**
  (from 30 / 74 / 147). Seven slides that gained content dropped one density
  tier to stay inside the frame; the already-compact *Skill-Authoring
  Discipline* slide was trimmed instead. Rendered overflow **0 / 0 / 0**,
  speaker-note injection **115**, build Pester **11/11**.

- **New M2 slide "Four Ways Context Goes Bad — Name It to Fix It" (2026-07-29).**
  Added one 4h-only slide to the Marp build source
  [content/slides/marp-presentation.md](content/slides/marp-presentation.md),
  inserted directly after *Context Engineering — Context Is a Finite Resource*.
  The existing slide states that context is finite and that a bigger window is not
  better, but gives no vocabulary for *how* a long session actually degrades. The
  new slide supplies the four named failure modes — **poisoning**, **distraction**,
  **confusion**, **clash** — each with its observable symptom and a measured effect
  from a primary source: the Gemini 2.5 technical report (poisoned goals; recall
  degrading past ~100k tokens), a Databricks study (Llama 3.1 405b declining near
  32k), the GeoEngine result (46 tools fail / 19 tools pass inside the same 16k
  window), and a Microsoft/Salesforce sharded-prompt study (**−39 %** average;
  o3 **98.1 → 64.1**). Two consequences are stated on-slide: **every MCP server is
  a permanent context tax** because tool descriptions occupy the window on every
  call whether used or not — the evidence-backed counterweight to the "connect
  everything" framing in the MCP module — and the **Write / Select / Compress /
  Isolate** verbs, which unify four practices the curriculum already teaches in
  separate places (Memory Bank, just-in-time retrieval, compaction, sub-agent
  context isolation). Also added a *Four context failures* row to the *What's New
  to Teach* table in
  [content/materials/cheat-sheet.md](content/materials/cheat-sheet.md). Framings
  adapted from a context-engineering explainer transcript and verified against the
  two primary sources it derives from (Drew Breunig, *How Long Contexts Fail*,
  2025-06-22; LangChain, *Context Engineering*, 2025-07-02); the transcript's
  unsupported claims were not imported.

- **New M5 slide "MCP Sits On Top of Your APIs" + MCP security rationale (2026-07-29).**
  Added one 4h-only slide to the Advanced Capabilities module in the Marp build
  source [content/slides/marp-presentation.md](content/slides/marp-presentation.md)
  (and as slide 8.3a in the split
  [content/slides/08-advanced-capabilities.md](content/slides/08-advanced-capabilities.md)),
  inserted after *How MCP Works*. It corrects the misreading the existing capability
  slide invites — that MCP is an *alternative* to an existing API estate — with the
  accurate framing: MCP replaces the **middleware between the model and the API you
  already own**, not the backend. A four-row comparison makes the decisive
  substitution explicit: the **client is now the model**, so the caller is
  **probabilistic** rather than deterministic, the contract is a tool description
  rather than an endpoint, and **routing logic moves out of application code into
  the model's reasoning**. Two consequences are stated on-slide: the auth / paging /
  rate-limit / error-handling work **moved into the MCP server rather than
  vanishing** (a common overclaim an operations audience will reject), and
  integration behaviour left unit-test coverage — which is what **evals** and
  **containment** exist for. Also appended a rationale paragraph to the *MCP
  Security Considerations* speaker notes, recasting the safeguards list as
  consequences of the model-as-client substitution (the tool description becomes
  part of the attack surface; the call sequence is not something you specified)
  rather than as a checklist. Source framings adapted from a Model Context Protocol
  explainer transcript; its factual errors were deliberately **not** imported
  (WebSocket is not an MCP transport, and MCP does not remove pagination / token /
  rate-limit work). 4h deck grows 145 → 146 source slides; overflow gate **0 across
  1h/2h/4h**; build Pester **11/11**.

- **Agent observability, Memory Bank integrity, Agent identity, and host trust handoffs (2026-07-22).**
  Added *Three Evidence Planes — Git Is Necessary, Not Sufficient* to M3 (2h/4h),
  distinguishing Git Traceability, Agent observability, and claim provenance.
  Added three 4h controls: *Agent Identity — Whose Authority Acts?*, *Containment
  Must Cover Host Trust Handoffs*, and *Memory Bank Integrity — Trusted State
  Needs a Boundary*. Expanded the reusable Memory Bank template with write
  ownership, source labeling, protected recovery, and restore guidance; expanded
  the destructive-operations handout with host trust handoff and Agent identity
  checklists. Added the MCP/A2A protocol distinction to the standards slide and
  cheat sheet. Rebuilt all decks (30 / 74 / 145 source slides), detected 0
  overflow, visually verified the affected PNGs, passed 11/11 Pester tests, and
  re-exported native PPTX with notes on every rendered slide (31 / 75 / 146).

- **New M4 slide "You Can Verify the Output, Not the Reasoning" + German *Lanz & Precht* pull-quotes (2026-07-13).**
  Added one 4h-only slide to the Trust-but-Verify module in the Marp build source
  [content/slides/marp-presentation.md](content/slides/marp-presentation.md),
  inserted after *Can You Trust AI-Generated Code?* as the epistemic *why* before
  *The Self-Verification Loop*: a model's answer comes from statistical correlation,
  not an auditable causal chain of reasons, so the operating model verifies the
  deterministic **artefact** (tests, `git diff`, RSOP / `terraform plan`), the
  **behaviour** (evals), and leans on Git **traceability** — never the reasoning.
  Grounded in Richard David Precht's causality/automation-bias argument from the
  *Lanz & Precht* podcast (ZDF, 2026). Also appended German Precht paraphrases to the
  existing **Job Hollowing** (junior-hollowing / "working on our own abolition") and
  **Vigilance Trap** (Precht naming *Automation bias* outright) speaker notes in the
  split [content/slides/09-when-to-use.md](content/slides/09-when-to-use.md). All
  German lines are marked *paraphrased from an auto-transcribed episode — verify
  against the audio before quoting verbatim*.

- **CopilotAtelier skills wired into the slides as concrete worked examples (2026-07-12).**
  Following the skill-inventory sync, four CopilotAtelier skills are now referenced
  on their natural-home slides in the Marp build source
  [content/slides/marp-presentation.md](content/slides/marp-presentation.md):
  `agent-evals` on *Evals Are Not Unit Tests* (M4), `test-driven-development` on
  *Test-First with AI* (M5), `agent-security-review` on *Containment First* (M6,
  covering the Lethal Trifecta pair), and `skill-creator` on *Skill-Authoring
  Discipline* (M4 — delivered in the speaker notes, since that slide is already
  full). All three decks rebuilt: overflow gate **0 across 1h/2h/4h** and the build
  Pester suite **11/11**. Two pre-existing issues surfaced by the faithful rebuild
  were fixed in passing (both independent of the skill edits — the note-merge
  matches by title, and no titles changed): *The Consistency Problem* (M3) switched
  `dense → compact` (a marginal slide the newer bundled Chromium tipped to fill
  1.064; no content removed), and the 2026-07-01 split slides *The Bottleneck Has
  Moved — Counter-Patterns* and *Job Hollowing & Heteromation — The Numbers* gained
  deterministic inline speaker notes (their titles are unmatchable by the title-map
  note-merge, so a clean rebuild drops their merged notes). Regenerated
  `marp-{1h,2h,4h}-*.md` reflect all of the above; the three tracked PPTX decks
  (`agentic-operating-model-{1h,2h,4h}.pptx`) were re-exported to match.

- **Editable PPTX export via Pandoc (2026-07-02).** Added
  [content/pptx/Export-PandocToPptx.ps1](content/pptx/Export-PandocToPptx.ps1),
  which converts the version-specific Marp decks
  ([marp-1h-keynote.md](content/pptx/marp-1h-keynote.md),
  [marp-2h-standard.md](content/pptx/marp-2h-standard.md),
  [marp-4h-workshop.md](content/pptx/marp-4h-workshop.md)) to *native, editable*
  PowerPoint files with selectable text, bullet lists, tables, and code blocks —
  unlike [Export-MarpToPptx.ps1](content/pptx/Export-MarpToPptx.ps1), which embeds
  each slide as a single image and produces an uneditable deck. Strips Marp YAML
  frontmatter and directive comments (`<!-- _class: ... -->`, `<!-- version: ... -->`)
  before invoking Pandoc 3.x; writes `agentic-operating-model-{1h|2h|4h}-editable.pptx`.
  An optional `-ReferenceDoc <template.pptx>` applies a corporate template (fonts,
  colors, master layout). Trade-off: lower visual fidelity (no per-slide CSS or
  `dense`/`compact` density classes) in exchange for full editability — keep Marp
  for PDF/PNG distribution where layout matters, use Pandoc for an editable PPTX
  hand-off.
- **Root-level `build.ps1` slide-build entry point (2026-07-01).** Added
  [build.ps1](build.ps1), a thin wrapper around
  [content/pptx/Build-MarpVersions.ps1](content/pptx/Build-MarpVersions.ps1)
  so the Marp deck build can be triggered from the repository root without
  changing into `content/pptx/`. Forwards the delivery-workflow parameters
  (`-Version`, `-ExportPptx`, `-ExportPng`, `-CheckOverflow`, `-Report`,
  `-AddMissingTags`, `-AssembleFromSplits`, `-MergeNotesFromSplits`) via
  `@PSBoundParameters`; advanced overrides (custom `SourcePath` /
  `OutputDir`) still route through the deep script. Also updated the
  [README](README.md) *Rebuilding the Decks* snippet to lead with
  `.\build.ps1 -Version all -ExportPptx` and added `build.ps1` to the
  project-structure listing.
- **New landscape slides and currency refresh in the presentation (2026-07-01).**
  Executed the [gaps & trends dossier](docs/research/2026-06-30-agentic-gaps-and-trends.md):
  added seven slides to the Marp build source
  [content/slides/marp-presentation.md](content/slides/marp-presentation.md) —
  *The Lethal Trifecta* and *Containment First* (Module 6 security),
  *Context Engineering* (Module 2), *Evals Are Not Unit Tests* (Module 4),
  *Beyond Handoffs — Orchestration Patterns* and *The Standardization Wave*
  (Module 3), and *The Autonomy Horizon* (intro). Refreshed the model currency
  (Claude Opus 4.7 → 4.8) in the deck and the
  [cheat sheet](content/materials/cheat-sheet.md), and added a *What's New to
  Teach (2026 H2)* quick-reference block. Rebuilt all three decks (1h 30, 2h 73,
  4h 138 slides); the overflow check shows no new overflow (the four pre-existing
  dense-slide overflows are unrelated) and 11/11 build Pester tests pass. PPTX
  re-export deferred.
- **Research dossier — agentic gaps and trends, mid-2026 (2026-06-30).** Added
  [docs/research/2026-06-30-agentic-gaps-and-trends.md](docs/research/2026-06-30-agentic-gaps-and-trends.md),
  a companion to the April toolset assessment. A five-phase web-research pass
  over 12 primary sources (Anthropic, OWASP GenAI, the GitHub and VS Code
  changelogs, METR, the Agentic AI Foundation, agentskills.io, MCP, and Simon
  Willison's agents index) identifying the principles and trends the curriculum
  does not yet cover: seven primary gaps (prompt injection / the lethal trifecta;
  containment-first sandboxing; context engineering; evals as distinct from unit
  tests; sub-agent orchestration; the AAIF standardization wave; the METR
  autonomy horizon), nine secondary gaps, a model and tooling currency refresh
  (Opus 4.8 / VS Code 1.126), an evidence table with confidence grades, and a
  gap-by-gap curriculum integration plan. Research only — no slide or material
  edits in this change.
- **Brand logos in the presentation decks (2026-06-11).** Placed the project
  and companion-tool brand marks on the slides where they add identity, sourced
  from the four design-board sets (AOM / ShellPilot / DeskPilot / CopilotAtelier).
  The new design-board exports are opaque 24-bit (noisy near-white background),
  so each product logo was processed into a transparent, content-cropped PNG by
  luma-keying the background, despeckling, and cropping on strong ink only
  (`.work/make-logos.ps1`, throwaway). New assets:
  `assets/ShellPilot-logo-on-light.png`, `assets/DeskPilot-logo-on-light.png`,
  `assets/CopilotAtelier-logo-on-light.png`, and a composed side-by-side
  `assets/ShellPilot-DeskPilot-on-light.png`. Placements in the Marp source
  ([content/slides/marp-presentation.md](content/slides/marp-presentation.md)),
  using Marp's `![center w:NNN](../../assets/…)` syntax (paths resolve from both
  `content/slides/` and the generated `content/pptx/`): the existing
  transparent `AOM-glyph-on-light.png` on the **title** and closing **Questions?**
  slides (1h/2h/4h); the **ShellPilot + DeskPilot** pair on the 4h M11 *Tools
  Built on This Model* slide; the **CopilotAtelier** logo on the 4h M8 *A Mature
  Personal Atelier* slide. The deck is light-themed (white background even on
  dividers), so only dark-ink (light-mode) logos are needed. All three decks
  regenerated and PPTX re-exported; the overflow check shows **no new overflow**
  (the four pre-existing dense-slide overflows are unrelated); 11/11 build Pester
  tests pass; each placement was visually verified from the exported 4h PNGs.
- **Companion-tool references — ShellPilot & DeskPilot (2026-06-11).** Referenced
  the two companion projects that operationalize this operating model wherever
  they fit (both already link back here, so this reciprocates).
  [ShellPilot](https://github.com/raandree/ShellPilot) is GitHub Copilot in the
  PowerShell terminal — the `Invoke-Shp` engine that reuses the same instruction
  files and Agent Skills as VS Code and returns structured token-usage/cost
  objects; [DeskPilot](https://github.com/raandree/DeskPilot) is a calm desktop
  chat front door on the ShellPilot engine for the non-technical knowledge
  workers in the Module 11 audience. Placements: a **Related projects** section
  in [README.md](README.md); a *Putting It in Non-Technical Hands* subsection +
  two See-Also links in
  [docs/for-decision-makers.md](docs/for-decision-makers.md); two **Resources**
  entries in [content/materials/cheat-sheet.md](content/materials/cheat-sheet.md);
  a new 4h slide **11.10a “Tools Built on This Model — ShellPilot & DeskPilot”**
  in the Marp master + [content/slides/11-beyond-code.md](content/slides/11-beyond-code.md)
  (with Version Guide row); a ShellPilot/DeskPilot proof line on the M4 *Your
  Atelier — Customization as Code* slide (2h + 4h) and its speaker note; and a
  pointer in the M8 *A Mature Personal Atelier* speaker note. All three Marp
  decks were regenerated and the PPTX re-exported (4h 130 → 131 slides; 1h 29 /
  2h 68 unchanged in count); 11/11 build Pester tests pass; the overflow check
  shows no new overflow (the four pre-existing dense-slide overflows are
  unrelated). `content/README.md`, `agenda/README.md`, and the demo scripts were
  deliberately left untouched — external tool links do not belong in folder
  indexes, and the demos were out of scope for a light reference pass.
- **Brand identity in the documentation (2026-06-11).** Added an `assets/`
  folder with the project's AOM brand artwork. The root [README.md](README.md)
  header is a centered, theme-aware logo **lockup** — the full mark
  (network-and-helm glyph, `AgenticOperatingModel` wordmark, the
  *Orchestrate. Align. Scale.* tagline, and a compass divider) with the dark
  card keyed out so it sits transparently on the page. Two variants switch by
  theme via `<picture>`: navy ink on light themes
  (`AOM-lockup-on-light.png`), white ink on dark (`AOM-lockup-on-dark.png`).
  [agenda/README.md](agenda/README.md) and [content/README.md](content/README.md)
  carry a compact, theme-aware corner glyph (`AOM-glyph-on-light.png` /
  `AOM-glyph-on-dark.png`). All artwork was derived from off-white-flattened
  design-board exports by flood-keying the background to transparency,
  recolouring the wordmark per theme, and cropping to content. Docs/asset-only
  change; no slide content or deck build output affected.

### Changed

- **Clarify this repository's AOM scope and refresh July 2026 product currency (2026-07-22).**
  Distinguished this repository's repository/workbench-level operating model
  from LangChain's production-lifecycle guide and California Management Review's
  enterprise-governance AOM. Qualified containment as deterministic enforcement
  only when the boundary is complete. Updated VS Code to the 1.128 baseline and
  refreshed Copilot examples to Claude Opus 4.8, GPT-5.6 Sol/Terra/Luna, Gemini
  3.6 Flash, and Kimi K2.7 Code with dated rollout status and model-dependent
  usage-based billing caveats.

- **Synced the CopilotAtelier skill-inventory reference to 37 skills (2026-07-11).**
  [content/materials/cheat-sheet.md](content/materials/cheat-sheet.md) previously
  described [CopilotAtelier](https://github.com/raandree/CopilotAtelier) as shipping
  "~20 skills across lab automation, DSC, documents, email, and knowledge work."
  Refreshed to ~37 skills and broadened the category list to match the current
  inventory — research and verification (`citation-integrity`,
  `devils-advocate-review`, `social-signal-sweep`), agent-building
  (`skill-creator`, `mcp-builder`, `agent-evals`, `agent-security-review`), and
  core engineering discipline (`test-driven-development`,
  `debugging-and-error-recovery`, `code-review-and-quality`). Cheat-sheet content
  only; no slide or deck build output changed.

### Fixed

- **Presenter instruction removed from an audience-facing bullet on *The
  Autonomy Horizon* (2026-08-13).** The slide's third bullet opened with
  "Teach it with its caveat — …", which addressed the presenter rather than the
  room while carrying the same list marker, weight, and indentation as the two
  audience-facing bullets above it. Rendered, it read as a demoted side note in
  a position the layout reserves for a peer takeaway. Reworded to "**The
  caveat:** the self-reported *size* of the gain is debated; the *direction* is
  robust." in the build source
  [content/slides/marp-presentation.md](content/slides/marp-presentation.md),
  keeping the claim intact and moving the instruction to the presenter into the
  slide's speaker notes, where it now also names the "this is just AI hype"
  objection it defuses. The slide appears in all three versions, so 1h, 2h, and
  4h are all corrected. Rebuilt at 30 / 75 / 149 source slides with overflow
  0 / 0 / 0 and speaker-note injection unchanged at 115.

- **Marp PPTX/PNG export no longer fails with "Failed to launch the browser
  process" (2026-07-01).** [content/pptx/Build-MarpVersions.ps1](content/pptx/Build-MarpVersions.ps1)
  now resolves a Chromium-family browser for the Marp CLI before exporting.
  Marp bundles no browser and reads the `CHROME_PATH` environment variable;
  when it was unset (and no Chrome/Edge was on the default search path) the
  `-ExportPptx` / `-ExportPng` step aborted for every version. The new
  `Resolve-MarpBrowserPath` helper prefers an explicit `CHROME_PATH`, then the
  Chromium the local `puppeteer` package already downloaded for the overflow
  check (via `puppeteer.executablePath()`), then an installed Edge or Chrome;
  the resolved path is exported as `CHROME_PATH` for the duration of the
  export and restored afterwards. Verified end-to-end: all three decks now
  export to PPTX (1h 4.7 MB / 2h 12.9 MB / 4h 25.5 MB) and the overflow check
  completes for all versions (the four pre-existing 4h dense-slide overflows
  are unchanged and unrelated).
- **Four overflowing 4h slides now fit, and a slide-interleaving bug is fixed
  (2026-07-01).** The overflow gate flagged four clipped 4h-only slides in
  [content/slides/marp-presentation.md](content/slides/marp-presentation.md).
  Root causes and fixes: (1) *Deep Modules* overflowed because the second half
  of the **Job Hollowing & Heteromation** slide (the Heteromation definition
  row, the BCG/HBR numbers, and the three-industries table) was stranded on it
  — the *Deep Modules* slide had been inserted into the middle of that slide
  and Marp ignores the `<!-- _split_ -->` marker. Reunited the two Job
  Hollowing rows, split the evidence onto a new *Job Hollowing & Heteromation
  — The Numbers* slide, and gave *Deep Modules* its own clean slide.
  (2) *The Bottleneck Has Moved* (already `compact`, fill 1.61) was split at
  its natural seam into the original slide plus a new *The Bottleneck Has Moved
  — Counter-Patterns* slide. (3) *The Vigilance Trap* and (4) *The Stockfish
  Pattern* were dropped to `compact` and lightly trimmed (framing/citation and
  the German closing quote moved to the slides' merged speaker notes; Google's
  "remove the wheel" folded into the studies table). No content was lost. The
  4h deck grows 138 → 140 slides; the overflow check now reports **0 overflow**
  across all three versions and each changed slide was visually verified from
  its exported PNG. 1h and 2h decks are unchanged (all edits are 4h-only).

## [1.1.0] - 2026-06-07

Second feature release. Broadens the curriculum beyond code with two optional
tracks — **M11 Beyond Code** and **M12 The Lab as the Agent's Sandbox** — adds two
protocol-identical demo MCP servers (Node and PowerShell), a six-layer
destructive-operations guardrail model, operator-sustainability material (job
hollowing, the vigilance trap, "with AI, not from AI"), comprehension-debt and
spec-driven-development slides, newcomer speaker notes across every module, and a
decision-maker value document. All three deck versions (1h / 2h / 4h) regenerate
from the single Marp source.

### Added

- **Decision-maker value document + README promotion (2026-06-07).** Added
  [docs/for-decision-makers.md](docs/for-decision-makers.md) — a jargon-free
  value summary aimed at engineering leaders, IT/platform directors, and
  research/legal/business managers. It covers what the operating model is, the
  under-using vs. over-trusting problem it solves, where the value compounds
  across departments (one model, learned once, amortised many times), the
  business case (speed *with* traceability, self-verification, durable memory),
  the risk-and-governance story (six-layer destructive-ops guardrails,
  comprehension debt, operator sustainability, team dynamics), and a 30-minute
  evaluation path. Added an emphasized `> [!IMPORTANT]` "why this is worth your
  time" callout near the top of [README.md](README.md) linking to it, and
  surfaced the `docs/` folder in the project-structure listing. No slide or
  build-output changes.
- **Skill updates extracted from this branch (2026-05-22, personal skills, outside repo).** Folded the lessons from the speaker-note work into two existing skills under `~/.copilot/skills/`:
  - `marp-slide-overflow` — new *Recipe 5: Speaker-Note Coverage — Gotchas and a Pester Guard*. Covers the `---`-inside-a-` ```markdown ` fence trap (code-fence-aware separator counting), the Marp-directive-vs-real-note distinction (blocklist + >40-char threshold), section-divider slides as a separate category, a drop-in Pester guard (`Get-MarpSlide` + `Test-SlideHasNote` in `BeforeAll`), the title-drift / `notes-title-map.psd1` alias pattern for multi-file decks, and an explainer for the editorial `<!-- _split_ -->` marker.
  - `pester-patterns` — new *Pattern 14: Helpers Used Inside `It` Must Live in `BeforeAll`*. Documents the Pester 5 runspace-isolation symptom (`CommandNotFoundException` on a helper plainly defined right above the failing `It`), the broken pattern, the fix, and related gotchas (`$script:` scope for variables, `BeforeDiscovery` for `-ForEach` data).
- **Speaker-note coverage test in `Build-MarpVersions.Tests.ps1` (2026-05-22).** Six new Pester cases (3 versions × 2 invariants):
  - *every slide in `marp-{1h,2h,4h}-*.md` has a speaker-note HTML comment block* (>40 chars, not a Marp directive like `_class:` / `_paginate:` / `_split_` / `version:`).
  - *every section-divider slide carries its `Speaker notes — Module N appendix` block.*
  Uses a code-fence-aware separator counter that mirrors `Split-MarpSlides` in `Build-MarpVersions.ps1` — `---` inside ```​```markdown``` example fences is no longer mis-counted as a slide break. Helpers (`Get-MarpSlide`, `Test-SlideHasNote`) live in `BeforeAll` so Pester 5 isolates them per test. Test skips gracefully if the built file is missing (`Set-ItResult -Skipped`). All 11 tests green.
- **Inline speaker notes for 12 orphan slides in `marp-presentation.md` (2026-05-22).** Targeted the slides the split-file merge couldn't reach — either *monolith-only* (no split-file equivalent: `Skill-Authoring Discipline`, `A Mature Personal Atelier`, `Sergeant and Commander`, `Your First copilot-instructions.md`, `Resources`, `You Are the Conductor — AI Is Your Orchestra`, `Demo Reference`, `M9 Key Takeaway`) or *title-drifted* against the split-file H1 (`Spec-Driven Development — The Spec Is Not a Substitute for Code Review`, `The Self-Verification Loop`, `Enabling Self-Verification`, `Agent Types`). Each note is a 3–5-bullet `<!-- ... -->` block written for newcomers in the same style as the per-split-file notes from earlier this turn. Verified by the new coverage test; 4h build now reports 0 slides without notes (was 12).
- **Per-slide newbie speaker notes across all 10 module files (2026-05-22).** Added concise Marp speaker notes (HTML comments — render in presenter mode, export as PPTX slide notes) targeting ~30 jargon-heavy / concept-introducing slides for newcomers. Each note is 3–5 short bullets: defines the jargon in plain English, gives an everyday analogy where helpful, and points to where the concept is revisited later. Covered slides include M1 (1.4 tech advances, 1.4a tokens), M2 (2.0 vocabulary, 2.4a conductor analogy, 2.5 agentic loop), M3 (3.2 Git, 3.7 diff/traceability, 3.9 checkpoints), M4 (4.3 instruction file types, 4.7a spec, 4.10 skills, 4.11 prompts, 4.12 handoffs), M5 (5.1 tests, 5.6 instructions snippet, 5.11a cheating-agent trap), M8 (8.2 MCP, 8.7 checkpoints, 8.10 agent types), M9 (9.8c PocketOS incident, 9.8e GitOps, 9.10a comprehension debt), M10 (10.5a cross-machine sync), M11 (11.5 Markdown, 11.7 Memory Bank), M12 (12.3 AutomatedLab, 12.8 Invoke-LabCommand). No slide layout, content, or build output changes — notes are HTML comments and are invisible in rendered slides. Not yet committed (per user request).

### Changed

- **M4 Slide 4.7a — Spec-Driven Development split into two slides (2026-05-20).** Original `dense` slide overflowed the 720 px frame (contentHeight ~960 px, ~9 distinct content blocks). Split at the natural seam between *"Why it beats prompt engineering"* and the *"Pitfall — not a substitute for code review"* block:
  - **4.7a "Make the Spec the Primary Artefact"** — intro, code-first/spec-first table, project-constitution pattern, why-it-beats-prompt-engineering bullets, continuation pointer.
  - **4.7b "The Spec Is Not a Substitute for Code Review"** — Pitfall framing, per-cycle entropy bullets, two-daily-investments rule (read the diff / refactor the design), Kent Beck + Pocock quotes, pair-cross-references, Spec Kit link.
  - Both slides switched from `dense` → `compact` to leave headroom. Verified via `Test-SlideOverflow.ps1`: contentHeight = 720 / overflowY = 0 / fillRatio = 1.0 on both. 4h slide count 130 → 130 (one merged, two created).

### Added

- **M3 / M4 / M5 / M9 / M10 — Matt Pocock, *"Claude Code for real engineers"* integration (2026-05-20).**
  - **M3 Slide 3.11a (new, 4h)** — *Two Patterns for Context: Grill-Me + Ubiquitous Language*. Named patterns for adversarial requirements interview (Brooks, *Design of Design*) and DDD glossary-in-Git. References `github.com/mattpocockuk/skills`.
  - **M4 Slide 4.7a (Spec-Driven Development) — Pitfall block added.** *"Compile from spec without reading the code = software entropy."* Pairs Pocock with Kent Beck: *"invest in the design every day."*
  - **M5 Slide 5.5 (Iteration Power) — Rate-of-feedback callout.** *"Don't outrun your headlights"* (Hunt & Thomas, *Pragmatic Programmer*) reframed as the agent's speed governor; explains why fast TDD pairs with — not against — LLM agents.
  - **M9 Slide 9.10a — Counter-patterns expanded** with Kent Beck daily-design-investment bullet and **gray-box delegation rule** (interface kept, implementation delegated) explicitly distinguished from hollowing (9.10b).
  - **M9 Slide 9.10d (new, 4h)** — *Deep Modules: A Codebase the Agent Can Navigate*. Ousterhout *Philosophy of Software Design* deep-vs-shallow contrast, with the observation that LLMs default to shallow modules which then degrade the agent's own future performance on the same repo.
  - **M10 Slide 10.10 (Final Thought) — Sergeant / Commander metaphor** added as closing operating image (AI = tactical sergeant, you = strategic commander). Mirrored as standalone closing slide in MARP master before *Thank You!*.
  - **cheat-sheet.md Resources** — `github.com/mattpocockuk/skills` added.
  - All MARP-master twins updated. Source citation: Matt Pocock, *"Claude Code for real engineers"*, 2026 (`aihero.dev`).


- **Comprehension debt, spec-driven development, and the "future AI will fix it" anti-pattern** (2026-05-20)
  - Module 9 slide **9.10a "The Bottleneck Has Moved"** gains an explicit named-concept block introducing **comprehension debt** (the gap between code that exists and code any human can still explain) as the umbrella diagnosis for the three existing failure modes (Strangers / Yes-man / Mid-level squeeze). Empirical hook: the GetClear 211 M-LOC analysis showing code churn rising from **5.5% → 7.9%** within 2 weeks of authoring as AI assistance spread
  - Same slide gains an **"Anti-pattern: future AI will fix it"** subsection refuting the belief that a smarter future model will retroactively clean up unowned code (a refactor needs *intent*, and intent is exactly what was never written down). Two industry anchors next to the existing PocketOS/Replit case studies: **SQLite's** code-of-ethics rejection of AI-generated contributions (total-accountability standard), and **NASA / DO-178C Level A** MC/DC coverage requirements that AI-generated bloat routinely fails. Framed as a hard guardrail for finance, healthcare, and physical-infrastructure domains where *"the AI wrote it"* is not a post-mortem defense
  - Module 4 gets a new slide **4.7a "Spec-Driven Development"** positioned between *Hierarchy of Instructions* (4.7) and *Custom Agents* (4.8) — included in 2h and 4h. Establishes the **spec as primary artefact, code as implementation detail** flip; introduces the **project constitution** pattern (`spec/constitution.md` for non-negotiable, repo-wide rules the agent must honour on every task) with a copy-paste example; cites the TypeScript benchmark (**~94% of LLM errors caught at type-check**) to make the strong-typing-as-guardrail argument; cross-links to M3 (spec lives in Git), M5 (verify against spec), and M9.10a counter-pattern *"Architecture review BEFORE generation"*. References the [GitHub Spec Kit](https://github.com/github/spec-kit) as the canonical implementation
  - MARP master `content/slides/marp-presentation.md`: condensed mirrors of the comprehension-debt lead-in and "future AI will fix it" anti-pattern inserted into the 9.10a slide; new Spec-Driven Development slide inserted after Priority Order and before Custom Agents, tagged `<!-- version: 2h 4h -->` so the next `Build-MarpVersions.ps1` run regenerates both 2h and 4h decks cleanly
  - Cheat sheet (`content/materials/cheat-sheet.md`): "Bottleneck Has Moved" section gains the comprehension-debt definition + GetClear data point as a lead-in; counter-patterns list gains the "reject future AI will fix it" bullet with the SQLite/NASA anchors
  - Source: Engineered Mind, *"You're Shipping Code You Don't Own"* (May 2026) — transcript landed cleanly on the existing destructive-ops / hollowing / vigilance scaffold; this change imports the three genuinely net-new ideas while keeping the deck's existing citation discipline (specific anchor projects rather than uncited percentages)

- **PowerShell edition of the demo MCP server (`content/demos/mcp-demo-server-ps/`)** (2026-05-20)
  - Single-file `Start-AgenticDemoMcp.ps1` (PowerShell 7+) speaks Model Context Protocol over stdio as raw JSON-RPC — no SDK dependency, no `npm install`, the whole protocol fits in one `.ps1` readable on a projector. Built for PowerShell-conference demos where the Node.js implementation would distract from the protocol itself
  - Protocol-identical to the Node version: same seven tools (`notes_add/list/search/delete` for persistence, `system_os_info/disk_free/top_processes` for host reach), same JSON store under `%LOCALAPPDATA%\AgenticDemoMcp\`, same instrumentation pattern (timestamped colored stderr logging, per-call duration, `notifications/progress` frames when the host passes a `progressToken`)
  - Follows PowerShell best practices: approved verbs, `[CmdletBinding()]`, comment-based help, parameter validation, `$ErrorActionPreference = 'Stop'`, `Set-StrictMode -Version 3.0`, UTF-8 console encoding (stdout reserved for JSON-RPC, all human output to stderr). Tool registry via `Register-McpTool` — adding a capability is one call, no manifest
  - Toggles: `-Quiet` / `AGENTIC_DEMO_VERBOSE=0`, `-NoColor` / `AGENTIC_DEMO_NO_COLOR=1`, `-StorePath` / `AGENTIC_DEMO_DIR`
  - `probe.ps1` mirrors `probe.cjs` — spawns the server as a child process, exercises `initialize` → `tools/list` → all seven `tools/call` over stdio, prints `INIT / TOOLS / ADD / LIST / SEARCH / OS / TOP / DISK / DEL`. Verified end-to-end on Windows 11 Pro for Workstations, pwsh 7.5.5
  - `mcp.example.json` (drop-in VS Code wiring using `pwsh -NoProfile -NonInteractive -File`), `README.md` (tools / prerequisites / smoke test / VS Code wiring / what to show on stage — *the whole protocol in one file* / *stdout is sacred* / *tool registry as data* / *progress notifications* / *pair with the Node version*)
  - `content/demos/demo-mcp-server.md` gains a *PowerShell variant* callout pointing at the new folder. Reinforces the talking point that MCP is a contract, not a framework — the agent cannot tell the two implementations apart

- **Demo MCP server (`content/demos/mcp-demo-server/`) + demo script** (2026-05-16)
  - Minimal Node.js / ESM MCP server (`server.js`, ~150 LOC) built on `@modelcontextprotocol/sdk` over stdio. Two intentionally distinct tool families: **`notes_*`** (`add`, `list`, `search`, `delete`) backed by a JSON file under `%LOCALAPPDATA%\AgenticDemoMcp\notes.json` to demonstrate *persistence the LLM does not have*; **`system_*`** (`os_info`, `disk_free`, `top_processes`) that shell out to PowerShell (Win32_OperatingSystem / Win32_LogicalDisk / Get-Process) to demonstrate *reach into the host the LLM does not have*
  - `probe.cjs` — standalone JSON-RPC smoke test (no MCP client required); exercises `initialize` → `tools/list` → all seven `tools/call`. Verified end-to-end on Windows 11 Pro for Workstations, Node 24.11.1
  - `mcp.example.json` — drop-in VS Code `mcp.json` snippet using `${workspaceFolder}` so it works without per-machine paths
  - `README.md` covers tools, prerequisites, install, smoke test, VS Code wiring, pedagogical uses (show-the-JSON / break-it-on-purpose / identity-discussion / destructive-ops-confirmation), and honest limits (single-user, no auth, Windows-first)
  - `content/demos/demo-mcp-server.md` — 12-min live script with five beats (protocol-is-not-magic / persistence / reach / identity decoupling under `runas` / destructive-tool guardrail), audience/slot guidance (primary: 4h workshop M4; optional: 2h sidebar; skip in 1h), common-failure table, and back-references to M3, M4, M5, M9.8
  - Closes the conceptual gap exposed by the May 16 thread on MCP servers — server identity vs. user identity, MCP vs. raw Graph API, what makes a *teachable* MCP demo for a mixed audience
- **Obsidian + MCP server cheat-sheet reference** (2026-05-19)
  - One-line entry under cheat-sheet **Resources**, immediately after the Beads line, framing Obsidian as a *complement* to the per-repo Memory Bank for personal cross-project knowledge — explicitly **not** a replacement. Same rhetorical guardrail as the Beads signpost: reach for it only when the problem appears, do not displace the default stack. No slide changes; the Memory Bank vs. Obsidian distinction (project state vs. personal corpus, deterministic full-file load vs. embedding RAG) is intentionally kept off the deck to preserve the sharp 8.5b *stay with the Memory Bank* message.

- **Beads / `bd` brief signpost in M8** (2026-05-16)
  - New slide **8.5b "Scaling the Backlog — When to Reach for Beads"** (4h only) — frames Beads as an *upgrade path* for when the default Memory Bank + GitHub Issues stack stops scaling: multiple agents writing the same backlog in parallel, hundreds of issues with real dependency graphs, stateless sessions across many machines/contributors. Explicitly tells the audience to **stay with the Memory Bank** below that threshold (matches the 1–4 person team profile of dsccommunity-style projects). Reinforces the operating-model thesis: judgment, not tooling.
  - MARP master `marp-presentation.md` gets the condensed version, tagged `<!-- version: 4h -->`. `Build-MarpVersions.ps1` re-run: 4h 124 → 125 slides; 1h (28) and 2h (65) unchanged.
  - Cheat-sheet Resources gains one line linking to the Beads repo with the same "only when you outgrow Memory Bank + Issues" qualifier.

### Added

- **Job Hollowing, Heteromation, and the Vigilance Trap — operator-sustainability angle** (2026-05-06)
  - Integrated Cedric Mössner / *The Morpheus*, *"KI Burnout ist real"*, [YouTube SHKBrkpYssM](https://www.youtube.com/watch?v=SHKBrkpYssM), 2026 — the third leg of the failure-mode stool that already covers team dynamics (Molist 2026, M9.10a) and catastrophic blast radius (PocketOS / OECD.AI 2026-04-27-6153, M9.8c–e). Adds the *human-experience* failure mode the curriculum was missing.
  - Module 9: new slide **9.10b "Job Hollowing & Heteromation"** — defines both terms with the speaker's own framing (*"I feel like quality control for a machine I don't trust"*, @0:32), the BCG/HBR *AI Brainfry* numbers (14% report it; +33% decision fatigue; +39% serious errors; +39% want to quit; March 2026), the Brynjolfsson/Stanford new-grad data (−20% peak hiring in AI-exposed jobs, bigtech new-grad share 15%→7%), and the *same-mechanism-three-industries* table (software / lab medicine / creative writing) that prevents the audience from filing this as a developer-only problem (4h)
  - Module 9: new slide **9.10c "The Vigilance Trap"** — frames the problem as 78 years old, not novel: Mackworth (1948) RAF radar; Parasuraman & Manzey (2010) Automation Complacency, untrainable; Google self-driving 2015–17 with the John Krafcik *"hard to take over because they have lost contextual awareness"* quote and Waymo's response (remove the steering wheel = Level 4, not Level 3). Cognitive-load mismatch table contrasts air-traffic controllers (2h max, 30-min mandatory break) and FAA pilots (regular hand-flying practice) against knowledge workers reviewing AI output (8h, no break). Closes by mapping each trap to an existing curriculum surface (M5 self-verification, S9.8e GitOps Layer 6, S9.10a specification + supervisory chunking) (4h)
  - Module 10: new slide **10.7a "With AI, Not From AI — The Stockfish Pattern"** — positive counter-pattern that closes the operator-sustainability arc. Stockfish/chess and FAA hand-flying as proof that *machine surpasses human ≠ human role hollows*. *From* vs *with* operator-experience comparison table; explicit mapping of how each curriculum surface (`copilot-instructions.md`, `.agent.md`, skills, memory bank, self-verification, GitOps Layer 6) moves the operator *upstream* from prompter to author of intent (4h)
  - MARP master `content/slides/marp-presentation.md`: condensed versions of all three new slides inserted at the correct anchors (after the existing 9.10a *Bottleneck Has Moved*, and before the *You Are the Conductor* close), each tagged `<!-- version: 4h -->`. `Build-MarpVersions.ps1` re-run; output went from 121 → 124 slides (1h: 28 unchanged, 2h: 65 unchanged, 4h: 124)
  - `content/materials/agentic-knowledge-work-patterns.md`: new **Pattern 11 — Operator Dignity ("with AI, not from AI")** — three operating rules (author intent in version control, verify by artefact, budget for review) mapped to existing curriculum modules; end-of-day diagnostic question; explicit list of the synthesised sources (Mackworth 1948, Parasuraman & Manzey 2010, KOF/ETH 2025, BCG/HBR 2026, Brynjolfsson 2026, Waymo 2017)
  - `content/materials/cheat-sheet.md`: new **"Job Hollowing & Heteromation — The Vocabulary"** section between *Bottleneck Has Moved* and *Decision Framework*; four-row vocabulary table (Job Hollowing, Heteromation, AI Brainfry, Vigilance Trap) with one-line definitions and diagnostics, plus the three operator-dignity rules
  - `content/materials/destructive-operations-guardrails.md`: See-also section gains the Mössner 2026 citation, framed as the operator-sustainability companion to the existing Molist (team) and PocketOS (catastrophic) citations

  - Module 9: new slide **9.8e "GitOps as the Architectural Guardrail"** — introduces the *capability-based* answer to the PocketOS-class incident: the agent's only verb is *propose a change* (commit + PR), never *apply a change*; reconciliation runs through a gated CI/CD pipeline. Includes a per-failure mapping table showing how each PocketOS failure mode is structurally precluded by the GitOps + IaC topology, plus five preconditions (repo-write-only agent identity, meaningful PR review, dangerous-delta CI linting, stricter pipeline-definition approval, secret material out of Git). References the [DSC Community DscWorkshop](https://github.com/dsccommunity/DscWorkshop) (Datum + Sampler + DSC) as the canonical PowerShell-world implementation, and Argo CD / Flux / Atlantis / Terraform Cloud as same-shape patterns in other ecosystems (4h)
  - MARP master `marp-presentation.md`: condensed version inserted directly after the existing 9.8d Guardrails slide, tagged `<!-- version: 4h -->` so the next `Build-MarpVersions.ps1` run regenerates the 4-hour deck cleanly
  - `content/materials/destructive-operations-guardrails.md`: upgraded the five-layer defence-in-depth model to a **six-layer** model; new section **"Layer 6 — Architectural guardrails (GitOps + IaC)"** with the failure-mode mapping table, the structural argument with red-zone / green-zone diagram, six preconditions, and a "when you cannot put GitOps in front of the system" fallback note; pre-flight checklist gains a Layer 6 question; see-also links updated with DscWorkshop, OECD.AI Incidents Database entry 2026-04-27-6153, and the Zenity security analysis (replacing the lower-credibility disclose.tv summary as primary source)
  - Cheat sheet (`content/materials/cheat-sheet.md`): "Guardrails for Destructive Operations" table extended from five to **six** layers with the new Architectural-guardrails row, including the DscWorkshop reference

- **Failure-mode integration: PocketOS incident + supervisory work theme** (2026-04-29)
  - Module 5: new slide **5.11a "The Cheating-Agent Trap"** — covers the failure mode where an agent writes broken code and broken tests that pass against the broken code; lists five mitigations (tests-as-specs, "tests must fail first" rule, independent reviewer agent, mutation testing, hold-out acceptance criteria) plus a `copilot-instructions.md` test-discipline snippet (4h)
  - Module 9: new slide **9.8c "Real Incident — 9 Seconds, One Database"** — chain-reaction breakdown of the late-April 2026 PocketOS / Cursor + Claude Opus 4.6 / Railway incident (production database + every backup wiped via a single API call), including the agent's own verbatim post-mortem (4h)
  - Module 9: new slide **9.8d "Guardrails for Destructive Operations"** — five-layer defence-in-depth model (agent policy, tool approval, credential scope, backup independence, rehearsed recovery) plus a copy-paste `## Destructive Operations` snippet for `copilot-instructions.md` (4h)
  - Module 9: new slide **9.10a "The Bottleneck Has Moved"** — synthesises the Axel Molist transcript: three role shifts (specification work, supervisory work, institutional memory), three failure modes (strangers in your own codebase, yes-man agents, mid-level squeeze), and four counter-patterns (architecture review before generation, angry agents, agent subconscious, scheduled reading time); includes the 2 a.m. "restart the server" tribal-knowledge anecdote (4h)
  - MARP master `marp-presentation.md`: condensed versions of all four new slides inserted at correct module positions with `<!-- version: 4h -->` tags so the next `Build-MarpVersions.ps1 -ExportPptx` run regenerates the 4-hour deck cleanly
  - New material **`content/materials/destructive-operations-guardrails.md`** — take-home reference: two case studies (PocketOS, Replit), six independent failure layers, full five-layer defence-in-depth model, copy-paste agent policy, tool-approval defaults table, credential-scope rules, backup-independence anti-patterns, recovery hygiene checklist, pre-flight checklist for granting destructive capabilities, trip-wire patterns (dry-run first, resource name re-type, two-phase delete, soft-delete by default, blast-radius display, angry-agent review), and OWASP/CWE mapping (incl. LLM06 Excessive Agency)
  - Cheat sheet (`content/materials/cheat-sheet.md`): three new sections — "Guardrails for Destructive Operations" (five-layer table + agent-policy snippet), "The Cheating-Agent Trap (and How to Avoid It)" (mitigations table + test-discipline snippet), "The Bottleneck Has Moved" (role-shift table + failure modes + counter-patterns); cross-link from cheat sheet to the new material file
  - `content/README.md`: materials section lists the new `destructive-operations-guardrails.md` handout
  - References: Tom's Hardware coverage of the PocketOS incident (2026-04-27); Disclose.tv summary; Tom's Hardware Replit incident coverage; Axel Molist video transcript *"What 6 months of AI coding did to my dev team"* (2026-04-18)

## [1.0.0] - 2026-04-26

Initial public release of **The Agentic Operating Model** — a presentation/workshop on versioned, AI-agent-assisted knowledge work for developers, DevOps engineers, system engineers, and research/analyst-style knowledge workers. Available in three versions (1-hour keynote, 2-hour standard, 4-hour workshop) sharing a single source of module content.

### Added

- **Early broadening for system engineers and knowledge workers** (2026-04-24)
  - Opening poll slide reworded from "How Do YOU Use AI for Coding Today?" to "How Do YOU Use AI in Your Work Today?" with explicit "whatever you build" coda (all versions)
  - "Three Waves" table gains a "Deliverable" row naming code, runbooks, documents, and decisions as Wave-3 outputs
  - New **"Why This Matters to You — Whatever Your Role"** slide (all versions): four-audience table (Developer / DevOps / System engineer / Knowledge worker) mapped to their primary deliverable and their verification signals (Pester, `dcdiag`, citations)
  - New **"Why Dev & DevOps Practices Are the Foundation"** slide (all versions): explicit bridge — Git, plain text / Markdown, small commits, automated checks, review mindset, reproducible environments are the engineering discipline that makes agentic AI trustworthy in *any* domain
  - Existing "Why This Matters to You" (developers-only framing) kept and re-scoped to "If You Already Write Code" (2h, 4h) — positions developers as the blueprint non-dev colleagues adopt
  - Module 1 retitled **"What Makes Work 'Agentic'?"** (from "What Makes Coding 'Agentic'?")
  - "What IS an Agent?" closing line expanded to mention code, servers, email corpora, and legal case files
  - "Traditional AI vs Agentic AI" diagram caption clarified: *verification* means Pester for code, `dcdiag` for a DC, "every citation resolves" for a legal draft
  - "Your Role Changes" table generalised (you type code / commands / prose) with closing line naming code, configuration, and 40-page case file as equivalent deliverables
  - "You Are the Conductor" analogy reworded from "Developer with AI Agents" to "You — with AI agents"; closing note covers code, data center, legal brief
  - "Today's Journey" TOC adds "Beyond Code — Same loop, different artefact" as an explicit milestone

- **CopilotAtelier deep integration — atelier pattern, skill authoring, skill portfolio** (2026-04-24)
  - New Module 3 slide "Your Atelier — Customization as Code" introducing the four-surfaces (Agents · Instructions · Skills · Prompts) + environment + keybindings pattern, with the `~/OneDrive/CopilotAtelier/` layout and VS Code `chat.*FilesLocations` settings (2h, 4h)
  - New Module 3 slide "Skill-Authoring Discipline" covering required YAML frontmatter, `USE FOR` / `DO NOT USE FOR` trigger phrases, common failure modes, and diagnostic tools (Chat Customizations editor, Show Agent Debug Logs) (4h only)
  - New Module 8 slide "A Mature Personal Atelier" using CopilotAtelier's ~20-skill portfolio (infrastructure, DSC, testing, documents, communications, knowledge work) as concrete evidence that one agent shape serves many domains (4h only)
  - Cheat sheet: New "Authoring Your Own Skills" section with required frontmatter template, 7-item checklist, and related feature-flag table (`chat.includeReferencedInstructions` for instruction composition, `thinkingTool`, semantic search)
  - PPTX files regenerated as `agentic-operating-model-{1h,2h,4h}.pptx`

- **2026 Q2 landscape refresh — new features, models, CopilotAtelier integration** (2026-04-23)
  - New Module 8 slide 8.13 "What's New in 2026 Q2" covering Claude Opus 4.7 GA, GPT-5.4/5.4-mini (5.1 retired), Copilot SDK public preview, BYOK in VS Code 1.117+ and Copilot CLI, signed cloud-agent commits, Research/Plan/Code mode, 3-click merge-conflict resolution, org firewall/runner controls, remote control CLI sessions on web/mobile, org custom instructions GA, data residency (US/EU) + FedRAMP, VS Code Agents app (Insiders), incremental chat rendering, agent CLI terminal titles
  - Existing Slide 8.13 "Key Takeaway" renumbered to 8.14; Version Guide updated to 8.1–8.14
  - Module 10 "The Future" slide (10.8) rewritten with April 2026 "Already Here" items replacing Feb 2026 list
  - Cheat sheet: model table updated (Claude Opus 4.7 GA, GPT-5.4/5.4-mini, note on GPT-5.1 retirement); added BYOK and Auto model selection notes
  - Cheat sheet: Recommended VS Code Settings expanded with `chat.experimental.incrementalRendering.enabled` and `terminal.integrated.tabs.allowAgentCliTitle`
  - Cheat sheet: New "Useful Keybindings" table (Ctrl+K X / N / K, Ctrl+Enter submit) from CopilotAtelier pattern
  - Cheat sheet: Troubleshooting table extended with skill-loading, instructions-ignored, agent-not-listed, and Agent Debug Logs entries
  - Cheat sheet: Resources list adds Copilot SDK and the [CopilotAtelier](https://github.com/raandree/CopilotAtelier) reference repository
  - Cheat sheet: Cross-Machine Sync example rewritten to point at `~/OneDrive/CopilotAtelier/` with a reference to the public setup script
  - New sample `content/materials/sample-copilot-instructions/copilot-authoring.instructions.md` — meta-instructions for authoring `.instructions.md`, `.prompt.md`, `.agent.md`, and `SKILL.md` files (YAML frontmatter rules, description guidelines, `applyTo` globs, discovery/verification, anti-patterns)
  - References: VS Code 1.117 release notes (2026-04-22), GitHub Copilot changelog (Apr 2026), CopilotAtelier repository

- **Conductor/Orchestra metaphor integrated across presentation** (2026-03-26)
  - New Slide 2.4a "The Conductor and the Orchestra" in Module 2 — maps conductor = developer, musicians = AI agents; includes German/English framing and parallel table
  - Added to all three versions (1h, 2h, 4h) via Version Guide and MARP source
  - Module 10 "Final Thought" slide updated: "YOUR EXPERTISE (The Conductor)" / "AI CAPABILITIES (The Musicians)" / "A SYMPHONY (The Result)"
  - MARP slide updated from "You + AI > You Alone" to "You Are the Conductor — AI Is Your Orchestra"
  - Cheat sheet: Updated Guiding Principle section with conductor/orchestra analogy
  - README.md: Cleaned up raw brainstorming notes (now properly integrated into slides)
  - References: Anthropic Auto Mode blog post, WELT article "Im Auto Mode wird die KI zur digitalen Arbeitskraft" (Benedikt Fuest, 2026-03-26)

- **Three-version architecture (1h · 2h · 4h)** (2026-03-19)
  - Restructured `agenda/presentation-agenda.md` with DRY single-source architecture
  - Version Summary table, Module Inclusion Matrix, Slide Inclusion Guide
  - Three version-specific agenda sections: 1-Hour Keynote, 2-Hour Standard, 4-Hour Workshop
  - Each version has timing table, facilitator notes, and learning outcomes
  - Version Guide tables added to all 8 slide files (01–05, 08–10)
  - Module descriptions updated with per-version duration badges
  - Updated all README files and demo script with three-version references
  - Added `<!-- version: 1h 2h 4h -->` tags to all 81 MARP slides in source
  - Created `Build-MarpVersions.ps1` to generate version-specific MARP decks
  - Generated `marp-1h-keynote.md` (~25 slides), `marp-2h-standard.md` (~45 slides), `marp-4h-workshop.md` (all 81 slides)
  - Updated `README-how-to-create-pptx.md` with build workflow

- **MARP slide deck: Git forensics and commit strategy slides** (2026-03-14)
  - New slide "AI Does the Git Forensics for You" in Module 2 — demo prompt, `git log` command, contributor frequency output
  - New slide "Commit Strategies — Explained" in Module 2 — detailed breakdown of Conventional Commits, Branch Strategy, and Co-authored Commits

- **MARP slide deck: Famous quotes added across all modules** (2026-03-14)
  - 13 curated quotes from European/German thinkers: Goethe, Popper, Kant, Wittgenstein, Seneca, Planck, Humboldt, Confucius, Sartre, Lao Tzu, Aristotle
  - Bilingual format (German + English translation) where applicable
  - Placed at section dividers and key message slides to reinforce themes

- **AI commit strategy added to sample copilot-instructions.md** (2026-03-14)
  - Git & Commit Strategy section: Conventional Commits with 🤖 tagging, `ai/` branch prefix, `Co-authored-by` attribution

- **Module 8: Advanced Capabilities slides** (2026-03-09)
  - 13 slides + speaker notes covering MCP, checkpoints, multi-file operations, agent types
  - Slide 8.1-8.6: MCP architecture, VS Code configuration, use cases, security model
  - Slide 8.7-8.8: Checkpoint system and practical rollback workflows
  - Slide 8.9: Multi-file coordinated rename operations
  - Slide 8.10-8.11: Agent types (local, background, cloud, third-party) and cloud agent PR workflow
  - Slide 8.12: Future trajectory from 2024 to autonomous workflows

- **Additional sample template files** (2026-03-09)
  - Sample `SKILL.md` for Sampler build debugging (auto-activated skill)
  - `testing.instructions.md` template for Pester test files (`applyTo: **/*.Tests.ps1`)
  - `documentation.instructions.md` template for Markdown files
  - `refactoring.instructions.md` template for PowerShell files
  - `code-reviewer.agent.md` template with multi-phase review and handoff
  - `iac-engineer.agent.md` template for DSC, Bicep, Terraform, Ansible
  - `security-reviewer.agent.md` template with OWASP Top 10 and CWE references

- **MARP slide deck updated with Module 8 content** (2026-03-09)
  - 3 new slides: MCP Universal Connector, Checkpoints & Rollback, Agent Types
  - Slide count increased from 22 to 25

- **Integrated brainstorming notes from PSConfEU 2026 session planning** (2026-03-07)
  - Module 2: Added Slide 2.0 "Foundational Vocabulary" with 10 key terms (Model, Agent, Tools, Skill, Instructions, Prompt, Memory Bank, Token, Context Window, MCP)
  - Module 1: Added Slide 1.4a "Tokens, Context Windows & Cost" covering token economics, context window sizes, and a hands-on lab idea
  - Module 9: Added Slide 9.8a "Agent Security & Boundaries" covering agent capabilities, safeguards, and restriction mechanisms
  - Module 9: Added Slide 9.8b "The Cardinal Rule" with guiding principle "Know what you are doing"
  - Module 10: Added complementary tools (Warp, GitHub Copilot CLI, Zed) to resources slide
  - Cheat sheet: Added Token Usage & Cost section, Agent Security & Boundaries section, Guiding Principle section
  - Cheat sheet: Expanded Key Concepts table with 6 new terms (Model, Agent, Tools, Token, Context Window, Memory Bank, MCP)
  - Cheat sheet: Added complementary tools to Resources section

### Changed

- **Integrated brainstorming notes into agenda and speaker notes** (2026-03-07)
  - Module 2 agenda: Added "Foundational Vocabulary" as first content item
  - Module 9 agenda: Added "Agent Security & Boundaries" section, added guiding principle to Human Role section, rebalanced timing
  - Module 1 speaker notes: Added token/cost emphasis and new Q&A item
  - Module 9 speaker notes: Added security and guiding principle emphasis, two new Q&A items
  - Memory bank: Updated activeContext.md and progress.md with integration record

- **Integrated CopilotAtelier project patterns into presentation content**
  - Module 4: Added 4 new slides (Skills, Prompts, Agent Handoffs, Complete Customization Ecosystem)
  - Module 4: Enhanced custom agent examples with production-grade patterns (model, handoffs, subagents, zero-confirmation)
  - Module 4: Renumbered slides 4.10–4.18 to accommodate new content, updated timing to 30–35 min
  - Module 10: Added cross-machine sync slide with OneDrive pattern and setup script
  - Module 10: Updated getting started checklist with VS Code feature flags
  - Module 10: Updated key takeaways to include skills, prompts, and handoffs
  - Module 10: Updated sample template library with prompt and skill examples
  - Demo script: Added "Demo Part 6 (Bonus)" covering skills, prompts, and cross-machine sync
  - Demo script: Added recommended VS Code settings to setup checklist
  - Demo script: Updated timing table for 4-hour version (35–42 min)
  - Cheat sheet: Added Chat Shortcuts table (`/agents`, `/instructions`, `/skills`, `/prompts`)
  - Cheat sheet: Added Recommended VS Code Settings table (4 feature flags)
  - Cheat sheet: Expanded Key Concepts with Skills, Prompt Files, Agent Handoffs
  - Cheat sheet: Expanded Customization Ecosystem to 6-type table with cross-machine sync example

### Removed

- `.clinerules/` directory (Cline-specific configuration files)
- `.github/chatmodes/` directory (deprecated chatmode format)
- `.github/instructions/` directory (moved to personal CopilotAtelier sync)
- `.github/prompts/` directory (moved to personal CopilotAtelier sync)
- `content/materials/sample-clinerules/` directory
  - `.github/chatmodes/README.md`: Added migration notice and `.agent.md` format guide
- **Pivoted primary demo tool from Cline to GitHub Copilot Agent Mode**
  - All 7 slide modules refocused for Copilot as primary tool
  - Module 4 (Controlling AI Behavior) major refactor: 5 instruction file types, custom agents, org policies
  - Module 10 (Your Agentic Future) major refactor: Copilot resources, getting started guide, agent templates
  - Demo script updated for Copilot Agent Mode workflow (setup, file names, narration, troubleshooting)
  - Cheat sheet refocused: Copilot Agent Mode Quick Reference, instruction file ecosystem, resources
  - All `.clinerules` references updated to `copilot-instructions.md` across all files
  - All "Cline" demo references updated to "Copilot Agent Mode"
- Updated Module 1 slides with current agentic coding landscape (Feb 2026)
  - Added Windsurf, Claude Code to tool mentions
  - Updated timeline to reflect Wave 3 starting 2025
  - Updated technology advances (1M+ token context, MCP as standard, cloud agents)
  - Added enterprise adoption data (NVIDIA, Salesforce, Fortune 500)
- Updated Module 10 slides with current resources and future outlook
  - Added comprehensive resource links for all major agentic tools
  - Updated future outlook to reflect features already shipped (cloud agents, subagents, agentic CI/CD)
- Updated cheat sheet with current tool ecosystem and instruction file comparison
- Updated techContext.md with current AI models, competitor tools, Copilot instruction hierarchy
- Updated all memory bank files to reflect Copilot as primary tool

### Added

- Sample `copilot-instructions.md` file for PowerShell module projects
- Sample `powershell.instructions.md` file with pattern-matched `applyTo` frontmatter
- Sample `pester-test-writer.agent.md` custom agent file with YAML tools configuration
- New `content/materials/sample-copilot-instructions/` directory with 10 sample files
- Copilot instruction file ecosystem table (5 file types: copilot-instructions.md, .instructions.md, .agent.md, AGENTS.md, CLAUDE.md)
- Custom agent examples with YAML frontmatter (name, description, tools, handoffs)
- Organization-level instruction sharing documentation
- `/init` command reference for auto-generating instructions
- Agentic coding landscape research findings (Feb 24, 2026)
- Current AI model reference (Claude Opus 4.6, GPT-5.3-Codex, Gemini 3.1 Pro)
- Initial presentation structure and content
- Module slides 1-5, 9-10 covering core agentic coding concepts
- Main demo script with troubleshooting guide
- MARP slide deck for PowerPoint conversion
- Quick reference cheat sheet for attendees
- Project-specific instruction files
- Comprehensive documentation in .memory-bank/

### Deprecated

- *(No current deprecations)*

### Documentation

- Root README.md with project overview
- Folder README files explaining directory purposes
- Presentation agenda with timing estimates

## [0.1.0] - 2026-02-02

### Added
- Initial project creation
- Memory bank structure
- Basic agenda outline

[Unreleased]: https://github.com/raandree/AgenticOperatingModel/compare/v1.1.0...HEAD
[1.1.0]: https://github.com/raandree/AgenticOperatingModel/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/raandree/AgenticOperatingModel/compare/v0.1.0...v1.0.0
[0.1.0]: https://github.com/raandree/AgenticOperatingModel/releases/tag/v0.1.0