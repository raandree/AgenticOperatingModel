# Active Context — The Agentic Operating Model

## Current Focus

**Task**: Maintain and update The Agentic Operating Model training — three-version architecture (1h · 2h · 4h)
**Target Audience**: PowerShell Developers, DevOps Engineers, System Engineers, Research/Knowledge Workers
**Primary Tool**: GitHub Copilot Agent Mode (VS Code)
**GitHub Repository**: raandree/AgenticOperatingModel
**Last Updated**: 2026-05-06

## Recent Changes

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
- Transcript captured via user paste; cite-anchor map saved at `%LOCALAPPDATA%\CareerAuthBrowser\extracted\youtube-SHKBrkpYssM-transcript.md` (outside repo, not committed). YouTube auto-caption fetch was blocked by PO-token gate — user pasted from the signed-in transcript pane
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

## Recent Changes

### 2026-03-19: Three-Version Architecture (1h · 2h · 4h)
- Restructured `agenda/presentation-agenda.md` with DRY three-version architecture
- Added Version Summary, Module Inclusion Matrix, Slide Inclusion Guide
- Three version-specific agenda sections with timing tables and facilitator notes
- Added Version Guide tables to all 8 slide files (01–05, 08–10)
- Module descriptions updated with per-version duration badges
- Added `<!-- version: -->` tags to all 81 MARP slides in `marp-presentation.md`
- Created `content/pptx/Build-MarpVersions.ps1` generating three output MARP files
- Generated: `marp-1h-keynote.md` (~25 slides), `marp-2h-standard.md` (~45), `marp-4h-workshop.md` (81)
- Updated all README/docs files for build workflow
- Content is maintained once — versions differ only in slide selection and timing

### 2026-03-14: MARP slide deck — Git forensics + commit strategy slides
- Added new slide "AI Does the Git Forensics for You" to Module 2 in `marp-presentation.md`
- Added new slide "Commit Strategies — Explained" to Module 2 in `marp-presentation.md`

### 2026-03-14: Famous quotes added across all MARP modules
- 13 curated quotes from European/German thinkers (Goethe, Popper, Kant, Wittgenstein, Seneca, Planck, Humboldt, Confucius, Sartre, Lao Tzu, Aristotle)
- Bilingual format (German + English) where applicable

### 2026-03-14: AI commit strategy added to sample + personal files
- Added Git & Commit Strategy section to `content/materials/sample-copilot-instructions/copilot-instructions.md`
- Added AI-Assisted Commit Strategy section to CopilotAtelier `git.instructions.md`
- Added AI attribution rules to CopilotAtelier Software Engineer Agent

### 2026-03-14: Prompt Evolution demo + slide + cross-references
- Created `content/demos/demo-prompt-evolution.md` — 6-level prompt progression demo script
- Added Slide 4.19 (Prompt Evolution) to Module 4 with summary table + cross-reference
- Updated main demo script with cross-reference to prompt evolution demo
- Updated content README with demo listing
- Updated cheat sheet with Prompt Evolution Pattern quick-reference table
- Updated agenda with optional Prompt Evolution demo in Module 4 extended version

### 2026-03-09: Module 8 + sample templates + MARP update
- Module 8: Advanced Capabilities slides created (13 slides + speaker notes)
  - MCP architecture and configuration (slides 8.1-8.6)
  - Checkpoints and rollback (slides 8.7-8.8)
  - Multi-file operations (slide 8.9)
  - Agent types: local, background, cloud, third-party (slides 8.10-8.11)
  - Future trajectory (slide 8.12)
- Sample templates added (7 files):
  - 3x .instructions.md (testing, documentation, refactoring)
  - 3x .agent.md (code-reviewer, iac-engineer, security-reviewer)
  - 1x SKILL.md (sampler-build-debug)
- MARP presentation updated with 3 new Module 8 slides (22 → 25 slides)
- Technical-writer mode, CopilotAtelier instruction files, skills ecosystem documented

### 2026-03-07: Brainstorming notes integration
- Foundational vocabulary (Slide 2.0), token usage & cost (Slide 1.4a), agent security (Slide 9.8a), guiding principle (Slide 9.8b) added
- Cheat sheet expanded with Token/Cost, Security, Guiding Principle sections
- Agenda rebalanced for Module 2 and Module 9

### 2026-02-25: CopilotAtelier integration
- Skills, Prompts, Agent Handoffs slides added (4.10-4.12)
- Chat shortcuts, feature flags, OneDrive sync pattern added to cheat sheet and demos
- Richer agent examples with production-grade patterns

### 2026-02-24: Copilot pivot & landscape research
- Refocused from Cline to GitHub Copilot Agent Mode as primary demo tool
- Updated landscape: Cursor v2.5, Windsurf, Claude Code, MCP under Linux Foundation
- All 7 slide modules, demo script, cheat sheet refocused for Copilot

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

## Questions for User

Before finalizing agenda:
1. Confirmed duration (2 hours strict, or flexible to 4)?
2. In-person, virtual, or hybrid format?
3. Attendee hands-on exercises required or optional?
4. Should attendees have GitHub Copilot subscription?
5. Any specific PowerShell modules/scenarios to feature?
6. Recording planned?

## Session Context

### Current Task
Creating the agenda document based on Memory Bank content

### Key Constraints
- Must be practical and demo-heavy
- Must emphasize Git integration
- Must include automated testing
- Must be PowerShell/DevOps relevant
- Duration: 2-4 hours (flexible)

### Outputs Expected
1. Detailed agenda markdown file
2. Timing breakdown for each section
3. Demo descriptions per section
4. Break schedule