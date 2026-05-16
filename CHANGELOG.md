# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Added

- **Demo MCP server (`content/demos/mcp-demo-server/`) + demo script** (2026-05-16)
  - Minimal Node.js / ESM MCP server (`server.js`, ~150 LOC) built on `@modelcontextprotocol/sdk` over stdio. Two intentionally distinct tool families: **`notes_*`** (`add`, `list`, `search`, `delete`) backed by a JSON file under `%LOCALAPPDATA%\AgenticDemoMcp\notes.json` to demonstrate *persistence the LLM does not have*; **`system_*`** (`os_info`, `disk_free`, `top_processes`) that shell out to PowerShell (Win32_OperatingSystem / Win32_LogicalDisk / Get-Process) to demonstrate *reach into the host the LLM does not have*
  - `probe.cjs` — standalone JSON-RPC smoke test (no MCP client required); exercises `initialize` → `tools/list` → all seven `tools/call`. Verified end-to-end on Windows 11 Pro for Workstations, Node 24.11.1
  - `mcp.example.json` — drop-in VS Code `mcp.json` snippet using `${workspaceFolder}` so it works without per-machine paths
  - `README.md` covers tools, prerequisites, install, smoke test, VS Code wiring, pedagogical uses (show-the-JSON / break-it-on-purpose / identity-discussion / destructive-ops-confirmation), and honest limits (single-user, no auth, Windows-first)
  - `content/demos/demo-mcp-server.md` — 12-min live script with five beats (protocol-is-not-magic / persistence / reach / identity decoupling under `runas` / destructive-tool guardrail), audience/slot guidance (primary: 4h workshop M4; optional: 2h sidebar; skip in 1h), common-failure table, and back-references to M3, M4, M5, M9.8
  - Closes the conceptual gap exposed by the May 16 thread on MCP servers — server identity vs. user identity, MCP vs. raw Graph API, what makes a *teachable* MCP demo for a mixed audience

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

[1.0.0]: https://github.com/raandree/AgenticOperatingModel/releases/tag/v1.0.0
[0.1.0]: https://github.com/raandree/AgenticOperatingModel/releases/tag/v0.1.0