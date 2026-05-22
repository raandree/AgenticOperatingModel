# Module 8: Advanced Agent Capabilities

## Version Guide

| Slide | Title | 1h | 2h | 4h |
|-------|-------|:---:|:---:|:---:|
| 8.1–8.14 | All slides (incl. 8.5a: Beyond Code, 8.5b: Scaling the Backlog — Beads, 8.13: What's New 2026 Q2) | — | — | ✅ |

> **This module is included in the 4-hour workshop only.**

> *"Alles hängt mit allem zusammen."*
> *"Everything is connected to everything else."*
> — **Alexander von Humboldt**

## Slide 8.1: Beyond the Basics

# Extending What Your Agent Can Do

### You've learned the fundamentals:
- Agentic loop (Plan → Act → Verify)
- Context from Git and file structure
- Instruction files for consistency
- Self-verification with tests

### Now let's explore the **frontier**:

| Capability | What It Enables |
|------------|-----------------|
| **MCP** | Connect agents to databases, APIs, the web |
| **Checkpoints** | Undo and rollback when things go wrong |
| **Multi-File Operations** | Coordinated changes across an entire codebase |
| **Agent Types** | Background, cloud, and third-party agents |

> These capabilities turn a smart coding assistant into **a full development workflow engine**.

<!--
Modules 1–5 covered the agentic loop in isolation — one agent, one repository, one task. Module 8 widens that out: the same loop, but with access to external systems (MCP), the ability to recover from missteps (checkpoints), the ability to operate across many files at once, and the ability to run somewhere other than the user's editor (background, cloud, third-party hosts).

The scaling is non-trivial. An agent that can query a database, make API calls, and rewrite forty files in parallel is doing something qualitatively different from an agent that suggests a function. The supervision pattern (review the diff, trust the tests, keep the rollback path open) does not change, but the surface area it has to cover grows substantially.
-->

---

## Slide 8.2: MCP - The Universal Connector

# Model Context Protocol

### The problem:
```
┌─────────────────────────────────────────────────────────────────┐
│                    WITHOUT MCP                                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   Your agent can:                                              │
│   • Read files in workspace      ✅                            │
│   • Run terminal commands        ✅                            │
│   • Search code                  ✅                            │
│                                                                 │
│   Your agent cannot:                                           │
│   • Query a database             ❌                            │
│   • Call a REST API              ❌                            │
│   • Read a Confluence wiki       ❌                            │
│   • Check Azure resource status  ❌                            │
│   • Search GitHub issues         ❌                            │
│                                                                 │
│   The agent is ISOLATED from everything outside VS Code.       │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### The solution:
> **MCP (Model Context Protocol)** gives agents a standardized way
> to connect to external tools, data sources, and services.

<!--
Speaker notes (for newcomers):
- **MCP** = Model Context Protocol. Think of it as "USB for AI tools."
- Before MCP: every AI tool needed a custom integration for every data source. Painful.
- After MCP: one plug fits everything. Write an MCP server once, every AI tool (Copilot, Claude, Cursor…) can use it.
- Standardized by the Linux Foundation — so it's not a Microsoft- or Anthropic-only thing.
- You don't need to build MCP servers to benefit; hundreds already exist for GitHub, Azure, databases, browsers, etc.
-->

---

## Slide 8.3: How MCP Works

# A Universal Protocol for AI Tools

```
┌─────────────────────────────────────────────────────────────────┐
│                      MCP ARCHITECTURE                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   ┌──────────────┐         ┌──────────────────────┐            │
│   │  AI Agent    │         │  MCP Server          │            │
│   │  (Copilot)   │◀──MCP──▶│  (runs locally or    │            │
│   │              │         │   remotely)           │            │
│   └──────────────┘         └──────────┬───────────┘            │
│                                       │                        │
│                                       ▼                        │
│                            ┌──────────────────────┐            │
│                            │  External Service    │            │
│                            │  ─────────────────── │            │
│                            │  • Database          │            │
│                            │  • REST API          │            │
│                            │  • Git platform      │            │
│                            │  • Cloud provider    │            │
│                            │  • File converter    │            │
│                            └──────────────────────┘            │
│                                                                 │
│   MCP = standardized JSON-RPC protocol                         │
│   Think of it as "USB for AI tools"                            │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Key points:
- **Open standard** — now under the Linux Foundation
- **Server/client model** — servers expose tools, agents consume them
- **Works across AI tools** — Copilot, Claude Code, Cursor, Cline all support MCP
- **Growing ecosystem** — hundreds of MCP servers already available

<!--
The protocol Anthropic published in late 2024 caught on faster than anyone expected; by mid-2026 it had been moved to the Linux Foundation and adopted by every major AI coding tool. The reason is structural: before MCP, every AI host had to write its own integration for every tool, and every tool vendor had to maintain N adapters. MCP turned an N×M problem into an N+M problem.

The "USB for AI tools" framing is more than analogy. MCP defines transport (stdio, HTTP), discovery (`list_tools`), invocation (`call_tool`), and a typed schema language. A server exposes capabilities; the agent discovers and uses them without bespoke wiring. The economic effect mirrors what USB did for peripherals: once the protocol stabilises, the ecosystem can scale independently of any single vendor.
-->

---

## Slide 8.4: MCP in VS Code

# Configuring MCP Servers

### In your VS Code settings or `.vscode/mcp.json`:
```json
{
  "servers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "${input:ghToken}"
      }
    },
    "sqlite": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sqlite",
               "--db-path", "./data/inventory.db"]
    },
    "azure": {
      "command": "npx",
      "args": ["-y", "@azure/mcp"],
      "env": {
        "AZURE_SUBSCRIPTION_ID": "${input:azureSub}"
      }
    }
  }
}
```

### What happens when configured:
1. VS Code starts the MCP server process
2. Agent discovers available tools automatically
3. Agent can call those tools during any task
4. Tool calls require user approval (by default)

<!--
The `mcp.json` configuration is the same pattern as `launch.json` or `tasks.json` — a small JSON file that wires the editor to an external process. The `command`/`args` shape means almost any executable can be an MCP server; the only contract is that it speaks the protocol on stdin/stdout.

The `${input:...}` interpolation is the right way to handle secrets — it prompts the user once and stores the value in the OS credential store, not in the JSON file. Hard-coded tokens in `mcp.json` are the single most common security mistake when teams first adopt MCP, because the file is committed to Git by default.
-->

---

## Slide 8.5: MCP Use Cases

# What Can You Connect?

| MCP Server | What It Provides | Example Use |
|------------|-----------------|-------------|
| **GitHub** | Issues, PRs, repos | "Find all open issues labeled bug" |
| **Azure** | Resource management | "Check the status of my App Service" |
| **SQLite / Postgres** | Database queries | "Show me users who signed up today" |
| **Filesystem** | Extended file access | "Read files outside the workspace" |
| **Fetch / Puppeteer** | Web content | "Get the API docs from this URL" |
| **Docker** | Container management | "List running containers" |
| **Playwright** | Browser automation | "Take a screenshot of the test page" |

### PowerShell-relevant examples:

```
You: "Query the CMDB database for all servers in the 
      production environment and generate a DSC config"

Agent (using SQLite MCP):
  1. Queries database: SELECT * FROM Servers WHERE env='prod'
  2. Reads results: 47 servers found
  3. Generates DSC configuration for each server
  4. Creates Pester tests to validate the configs
```

> MCP turns your agent from "code assistant" into **"operations assistant."**

<!--
The CMDB example is the kind of workflow that resists conventional automation: it requires reading a database, applying domain logic, generating configuration, and validating the result. Before MCP, every step would have been a separate script with its own glue. With MCP, the agent treats database query, code generation, and test execution as a single planning surface.

The operational implication is that "AI in operations" stops being a slogan and becomes a concrete capability. A PowerShell-focused team can wire MCP servers to Active Directory, Exchange, SCCM, Azure, and SQL Server, and end up with an agent that can answer questions like "which servers haven't reported a successful backup in 48 hours?" by walking the same systems a human operator would walk — only faster, and with the query inspectable in the diff.
-->

---

## Slide 8.5a: Beyond Code — Anything You Can Script

# AI Agents Are Not Limited to Writing Code

### The key insight:
> GitHub Copilot and similar AI agents can assist with **anything
> you can do from the command line or programmatically.**

| "Code" Tasks | "Beyond Code" Tasks |
|-------------|---------------------|
| Write functions | Parse `repadmin /showrepl` output |
| Generate tests | Diagnose DNS failures via `dcdiag` |
| Refactor modules | Correlate Event Log entries across servers |
| Create pipelines | Interpret `gpresult` XML for GPO issues |
| Write documentation | Decode Kerberos error codes |
|  | Trace account lockout sources across DCs |

### Why this works:
```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│   If you can RUN it in a terminal,                             │
│   an AI agent can HELP you:                                    │
│                                                                 │
│   • Execute the command                                        │
│   • Parse the output                                           │
│   • Correlate with other data                                  │
│   • Explain what it means                                      │
│   • Suggest the fix                                            │
│   • Verify the fix worked                                      │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### The same agentic loop applies:
> **Observe** (run diagnostics) → **Plan** (identify root cause) →
> **Act** (apply fix) → **Verify** (re-run diagnostics) → **Iterate**

See the [AD Troubleshooting Lab](../demos/ad-troubleshooting-lab/) for a
hands-on example of this principle with 5 real Active Directory scenarios.

<!--
The "if you can run it in a terminal" framing is the most important reframing in this module for a DevOps audience. Most discussion of agentic AI focuses on writing application code, which under-sells what the technology actually does. The model does not care whether the tool it invokes returns source code, JSON, RTF, a stack trace, or `repadmin /showrepl` output — it parses text and reasons about it.

The Active Directory troubleshooting example is genuinely representative of operations work: most of the job is reading diagnostic output (event logs, `gpresult`, `nltest`, `dcdiag`), correlating across hosts, and forming hypotheses. An agent with shell access and a domain glossary can carry the same loop, with the human supervising the conclusions rather than transcribing the inputs.
-->

---

## Slide 8.5b: Scaling the Backlog — When to Reach for Beads

# When the Memory Bank Is Not Enough

### The default stack — Memory Bank + GitHub Issues + `ai/<slug>` branches —
is the right level of ceremony for **1–4 person teams, one agent at a time,
backlogs in the tens**.

### Reach for a dedicated agent-native tracker (e.g. **[Beads / `bd`](https://github.com/gastownhall/beads)**) when *all three* hold:

| Signal | Why it matters |
|--------|----------------|
| **Multiple agents writing the same backlog in parallel** | Need atomic claim and cell-level merge, not file locks |
| **Hundreds of issues with real dependency graphs** | `bd ready` becomes a genuine query, not a paragraph |
| **Stateless sessions across many machines / contributors** | `bd prime` re-bootstraps context that a single Memory Bank can't |

### Below that threshold:
> Beads adds a second database (Dolt), a second tracker next to GitHub Issues,
> and a new vocabulary — for problems you don't have yet. **Stay with the
> Memory Bank.**

> **Judgment, not tooling.** The agentic operating model is the discipline.
> The tracker is an implementation detail you upgrade when the seams show.

<!--
Beads (`bd`) is one of several agent-native trackers that appeared in 2025–26 in response to a real problem: GitHub Issues and similar trackers were designed for human teams writing issues one at a time, and they degrade when multiple agents attempt to claim, update, and link issues concurrently. The Dolt backend underneath Beads provides cell-level merge semantics that file-based trackers cannot offer.

The slide's discipline is to resist adopting the tool prematurely. A two-person team with one agent and twenty open issues will not benefit from Beads; they will benefit from the friction-cost of learning it. The threshold for adoption is structural — multiple agents writing in parallel, hundreds of issues with real dependencies, sessions distributed across machines and contributors. Below that threshold, GitHub Issues plus a Memory Bank plus `ai/<slug>` branches is the right answer.
-->

---

## Slide 8.6: MCP Security Considerations

# Trust but Verify (Again)

```
┌─────────────────────────────────────────────────────────────────┐
│                  MCP SECURITY MODEL                            │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   ⚠️ MCP SERVERS CAN:                                          │
│   ────────────────────                                          │
│   • Read and write to databases                                │
│   • Make network requests on your behalf                       │
│   • Access services with your credentials                      │
│   • Modify external resources                                  │
│                                                                 │
│   🔒 SAFEGUARDS:                                                │
│   ──────────────                                                │
│   • Tool approval prompts (you approve each call)              │
│   • Scoped credentials (least privilege tokens)                │
│   • Local execution (most servers run on your machine)         │
│   • Open source (inspect what the server does)                 │
│   • VS Code sandbox restrictions                               │
│                                                                 │
│   ✅ BEST PRACTICES:                                            │
│   ──────────────────                                            │
│   • Use read-only tokens where possible                        │
│   • Review MCP server source before installing                 │
│   • Never use production database credentials in dev           │
│   • Start with "Ask always" tool approval                      │
│   • Document approved MCP servers in copilot-instructions.md   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

> **Golden rule**: Give MCP servers the **minimum permissions** needed.

<!--
The security model deserves the same scrutiny as any other extension mechanism. An MCP server is arbitrary code running in the user's process with whatever credentials the user provides. The "open source" safeguard on this slide is only as good as the actual reading of the server's source — in practice teams pin specific versions and treat MCP-server updates with the same caution as npm-package updates.

The least-privilege principle is more important here than in most software contexts because the agent will *use* whatever capabilities you grant it, and will sometimes use them in combinations the human did not anticipate. A read-only database token plus a public-internet HTTP tool is not the same risk surface as their union — the agent can join the two into queries that exfiltrate data the human would not have asked for. The safe default is the smallest tool set that lets the agent finish the actual task at hand.
-->

---

## Slide 8.7: Checkpoints & Rollback

# Your Safety Net

### The challenge:
> Agents make many changes across many files.
> What if something goes wrong halfway through?

### Copilot Agent Mode creates **checkpoints** automatically:

```
┌─────────────────────────────────────────────────────────────────┐
│                   CHECKPOINT SYSTEM                            │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   Timeline of agent actions:                                   │
│                                                                 │
│   ──●────────●────────●────────●────────●────────●──▶ time     │
│     │        │        │        │        │        │             │
│     ▼        ▼        ▼        ▼        ▼        ▼             │
│   Start   Created  Modified  Added    Deleted  Broke          │
│           file A   file B    tests    old file something      │
│                                                                 │
│   Each ● is a checkpoint you can restore to.                   │
│                                                                 │
│   🔙 "Undo last 3 changes"                                     │
│   ──●────────●────────●────────                                │
│     │        │        │                                        │
│     ▼        ▼        ▼                                        │
│   Start   Created  Modified   ← restored here                 │
│           file A   file B                                      │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

<!--
Checkpoints are the editor's answer to the question "what if the agent's work goes wrong before it reaches Git?" Git commits are durable but coarse; checkpoints are ephemeral but fine-grained. The combination gives the user two undo horizons — minutes (checkpoints) and hours-to-days (commits) — each suited to a different class of mistake.

The psychological effect on the user is often more important than the technical capability. Knowing that any agent action can be undone in two clicks raises the user's tolerance for letting the agent take larger steps. Without that safety net, users tend to micromanage the agent (one tool call at a time, approving each one), which negates most of the productivity benefit of agent mode.
-->

---

## Slide 8.8: Using Checkpoints

# Practical Rollback

### How it works in Copilot Agent Mode:

| Action | How |
|--------|-----|
| **View checkpoints** | Click the checkpoint icon in chat response |
| **Compare changes** | Hover to see diff at that checkpoint |
| **Rollback** | Click "Undo" to restore to any checkpoint |
| **Selective undo** | Undo specific file changes, keep others |

### When to rollback:
- Agent went down a wrong path
- Changes broke something unrelated
- You want to try a different approach
- Tests pass but the approach is wrong

### The workflow:
```
1. Request a complex task
2. Agent works through multiple steps
3. You realize step 4 went wrong
4. Click "Undo" → restored to after step 3
5. Give better direction
6. Agent continues from the good state
```

### Key insight:
> Checkpoints give you the confidence to let agents take **bigger steps**.
> You can always go back.

<!--
Speaker notes (for newcomers):
- VS Code now ships with built-in checkpoints — you didn't have to enable anything. They appear next to each agent reply in chat.
- Distinct from Git commits: checkpoints are short-term, undo-friendly, free. Git commits are permanent and shareable.
- Recommended habit: let the agent do 5–10 steps freely, eyeball the result, click "Undo" if needed. No drama.
-->

---

## Slide 8.9: Multi-File Operations

# Coordinated Changes Across Your Codebase

### The power of agentic coding:
> Agents don't just edit one file — they understand **relationships**
> between files and make coordinated changes.

### Example: Renaming a function across a module

```
┌─────────────────────────────────────────────────────────────────┐
│              MULTI-FILE RENAME OPERATION                       │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   Request: "Rename Get-ServerInfo to Get-ServerHealth"         │
│                                                                 │
│   Agent changes:                                               │
│   ──────────────                                                │
│   📄 Public/Get-ServerInfo.ps1                                 │
│      → Renamed file to Get-ServerHealth.ps1                    │
│      → Updated function name inside                            │
│                                                                 │
│   📄 DemoModule.psd1                                           │
│      → Updated FunctionsToExport list                          │
│                                                                 │
│   📄 Tests/Get-ServerInfo.Tests.ps1                            │
│      → Renamed file to Get-ServerHealth.Tests.ps1              │
│      → Updated all Describe/It blocks                          │
│      → Updated function calls in tests                         │
│                                                                 │
│   📄 README.md                                                 │
│      → Updated usage examples                                  │
│                                                                 │
│   📄 docs/Get-ServerInfo.md                                    │
│      → Renamed and updated documentation                       │
│                                                                 │
│   Total: 5 files changed, 0 missed references ✅              │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Why this matters:
- Manual rename across 5+ files is error-prone
- Agent uses **search** to find all references
- Agent runs **tests** to verify nothing is broken
- You review **one diff** instead of hunting for references

<!--
Multi-file refactoring is one of the operations where the agent's behaviour most clearly exceeds what autocomplete or chat could do. Modern IDEs already had "rename symbol" features, but those break down once the rename has to cross file types (source, tests, documentation, manifest files) or follow a less mechanical pattern (rename a concept, not a token).

The agent's advantage here is that it uses the same tools a human would use — grep, semantic search, the test runner — in sequence, with the test suite as the convergence check. The trade-off is that the operation is opaque while in progress: the agent might touch fifty files before showing the result. This is the canonical case for letting the agent run, then reviewing the consolidated diff rather than each step.
-->

---

## Slide 8.10: Agent Types

# Beyond the Chat Window

Copilot supports multiple agent types for different workflows:

```
┌─────────────────────────────────────────────────────────────────┐
│                    COPILOT AGENT TYPES                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   ┌──────────────────────────────────────────────────────┐     │
│   │  LOCAL AGENTS (in VS Code)                           │     │
│   ├──────────────────────────────────────────────────────┤     │
│   │  • Agent Mode — autonomous, full tool access         │     │
│   │  • Plan Mode — creates plan, asks before acting      │     │
│   │  • Ask Mode — read-only, analysis and questions      │     │
│   └──────────────────────────────────────────────────────┘     │
│                                                                 │
│   ┌──────────────────────────────────────────────────────┐     │
│   │  BACKGROUND AGENTS (Copilot CLI)                     │     │
│   ├──────────────────────────────────────────────────────┤     │
│   │  • Run in a separate worktree                        │     │
│   │  • Don't block your editor                           │     │
│   │  • Good for long-running tasks                       │     │
│   │  • Review results when done                          │     │
│   └──────────────────────────────────────────────────────┘     │
│                                                                 │
│   ┌──────────────────────────────────────────────────────┐     │
│   │  CLOUD AGENTS (Copilot Coding Agent)                 │     │
│   ├──────────────────────────────────────────────────────┤     │
│   │  • Run on GitHub infrastructure                      │     │
│   │  • Create PRs autonomously                           │     │
│   │  • Triggered from GitHub Issues or CLI               │     │
│   │  • Review via normal PR workflow                     │     │
│   └──────────────────────────────────────────────────────┘     │
│                                                                 │
│   ┌──────────────────────────────────────────────────────┐     │
│   │  THIRD-PARTY AGENTS (VS Code Extensions)             │     │
│   ├──────────────────────────────────────────────────────┤     │
│   │  • Extensions provide custom agentic capabilities    │     │
│   │  • Specialized tools for specific workflows          │     │
│   │  • Examples: Docker agent, Azure agent               │     │
│   └──────────────────────────────────────────────────────┘     │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

<!--
Speaker notes (for newcomers):
- Four ways to run an agent, from "watching every keystroke" to "fire and forget on GitHub."
- Start with **Agent Mode** in VS Code — you see everything. Comfortable, low risk.
- Promote tasks to **Cloud Agent** only after you trust your instructions — there's no human in the loop while it runs.
- **Background agent** = like Agent Mode but in a separate copy of the repo so it doesn't block your editor. Good for long refactors.
-->

---

## Slide 8.11: Cloud Agent Workflow

# Copilot Coding Agent — PRs from Issues

### The workflow:

```
┌─────────────────────────────────────────────────────────────────┐
│               CLOUD AGENT WORKFLOW                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   1. You create a GitHub Issue:                                │
│      "Add retry logic to the Get-ApiData function"             │
│                          │                                      │
│                          ▼                                      │
│   2. Assign to Copilot (or use CLI):                           │
│      gh copilot agent --issue 42                               │
│                          │                                      │
│                          ▼                                      │
│   3. Cloud agent works autonomously:                           │
│      • Reads your repo and instructions                        │
│      • Plans the implementation                                │
│      • Writes code and tests                                   │
│      • Runs CI pipeline                                        │
│      • Creates a Pull Request                                  │
│                          │                                      │
│                          ▼                                      │
│   4. You review the PR normally:                               │
│      • Read the diff                                           │
│      • Check test results                                      │
│      • Request changes or approve                              │
│      • Merge when satisfied                                    │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Why this matters for teams:
- Well-defined tasks can be delegated fully
- Agent respects your `copilot-instructions.md`
- Results go through normal PR review
- Works while you focus on architecture and design

<!--
The cloud-agent pattern compresses a workflow that previously required a junior developer, a senior reviewer, and a CI pipeline into something resembling a delegation primitive. The interesting design choice is that the output is a Pull Request, not a merged change — the existing review machinery (code owners, required reviewers, branch protection rules) all still apply, unchanged.

Where this pattern works well: well-scoped, low-ambiguity changes against codebases with strong tests and clear conventions — dependency bumps, lint fixes, documented bug reports with reproduction steps. Where it works poorly: anything ambiguous, anything cross-cutting, anything that requires reading a human's intent rather than a written specification. Teams that adopt cloud agents successfully spend most of the work writing better issues, not configuring the agent.
-->

---

## Slide 8.12: The Horizon

# What's Coming Next

### Near-term evolution:

| Capability | Status | Impact |
|------------|--------|--------|
| **Longer autonomous sessions** | Emerging | Agents tackle bigger tasks without check-ins |
| **Multi-agent collaboration** | Available | Agents hand off to each other (Dev → QA → Docs) |
| **CI/CD integration** | Technical preview | Agents triggered by pipeline events |
| **Domain-specific agents** | Growing | Specialized agents for IaC, security, testing |
| **Agentic workflows** | Technical preview | Markdown-defined CI/CD with AI decision-making |

### The trajectory:
```
2024            2025               2026               Future
─────           ─────              ─────              ──────
Autocomplete    Agent Mode         Cloud Agents       Autonomous
+ Chat          + Instructions     + MCP ecosystem    development
                + Custom agents    + Multi-agent       workflows
                + Checkpoints      + Background agents
```

### What stays the same:
> - **You** define what to build
> - **You** review what was built
> - **You** are responsible for the outcome
> - **Git** provides traceability
> - **Tests** provide verification

<!--
Forecasting in this space ages fast — the slide deliberately separates capabilities that are *available now*, *in technical preview*, and *emerging*. The trajectory worth holding onto is that the unit of delegation keeps growing: from a line to a function to a file to a feature to a task to a sprint. Each step expands the agent's autonomy and correspondingly raises the cost of weak supervision.

The "what stays the same" list is the more important half of the slide. Every capability listed above amplifies whatever discipline the team already has — strong tests, clean Git history, good instructions — and amplifies the absence of that discipline just as effectively. The operating model the curriculum teaches is the thing that holds value across each generation of capability; the specific features will be obsolete within eighteen months.
-->

---

## Slide 8.13: What's New in 2026 Q2

# The Landscape Keeps Moving — Fast

```
┌─────────────────────────────────────────────────────────────────┐
│             KEY 2026 Q2 CAPABILITIES                           │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  🧠 MODELS                                                     │
│  ────────                                                       │
│  • Claude Opus 4.7 GA (premium reasoning default)              │
│  • GPT-5.4 / 5.4-mini current; GPT-5.1 series retired          │
│  • Auto model selection in Copilot CLI & Chat                  │
│                                                                 │
│  🔑 BYOK (Business/Enterprise)                                 │
│  ──────────────────────────                                    │
│  • Bring your own API keys in VS Code 1.117+                   │
│  • OpenAI, OpenRouter, Ollama, Google — and local models       │
│  • Also available in Copilot CLI                               │
│                                                                 │
│  🛠️ COPILOT SDK (public preview)                              │
│  ───────────────────────                                        │
│  • Build your own agents on the Copilot platform               │
│  • Programmatic access to models, tools, and sessions          │
│                                                                 │
│  ☁️ CLOUD AGENT IMPROVEMENTS                                   │
│  ────────────────────────                                      │
│  • Signed commits — verified provenance                        │
│  • Research → Plan → Code multi-phase mode                     │
│  • 3-click merge-conflict resolution                           │
│  • Org firewall, runner controls, custom properties            │
│  • Remote control of CLI sessions on web + mobile              │
│                                                                 │
│  🏢 ENTERPRISE                                                 │
│  ──────────                                                    │
│  • Org custom instructions GA                                  │
│  • Data residency (US / EU) + FedRAMP compliance               │
│                                                                 │
│  💻 VS CODE                                                    │
│  ─────────                                                      │
│  • VS Code Agents app (Insiders) — parallel cross-repo sessions │
│  • Incremental chat rendering (streamed, block-by-block)       │
│  • Agent CLI identified in terminal titles                     │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

> **So what?** Every feature here reinforces the same loop:
> **Observe → Plan → Act → Verify → Iterate** — but at more scale,
> across more systems, with more enterprise guardrails.

<!--
This slide is a snapshot — by the time the deck is delivered some of these will be GA, others superseded, others quietly retired. The point is not the specific features but the pattern of what is shipping: better models, broader provider choice (BYOK), programmable extension surfaces (SDK), more autonomous cloud execution, and enterprise controls (signed commits, data residency, custom properties).

The enterprise-control thread is the most underappreciated one. Signed commits, org-level instructions, data residency, and FedRAMP compliance are what move agentic tooling from "available" to "deployable in regulated environments." Teams in finance, healthcare, defence, and public sector have been waiting for these controls; their adoption curve is now beginning, several quarters behind the consumer / startup curve.
-->

---

## Slide 8.14: Key Takeaway

# Advanced Capabilities Expand Your Reach

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│   MCP                                                          │
│   ───                                                          │
│   Connect your agent to databases, APIs, and services.         │
│   It's no longer limited to files in your workspace.           │
│                                                                 │
│   CHECKPOINTS                                                  │
│   ───────────                                                  │
│   Every change is reversible. Let agents take bigger steps     │
│   because you can always go back.                              │
│                                                                 │
│   MULTI-FILE OPERATIONS                                        │
│   ────────────────────                                         │
│   Agents understand relationships across files.                │
│   Coordinated changes, verified by tests.                      │
│                                                                 │
│   AGENT TYPES                                                  │
│   ───────────                                                  │
│   Local, background, or cloud — pick the right mode            │
│   for the task. From interactive to fully autonomous.          │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

> These capabilities move agentic coding from
> **"smart assistant"** to **"development workflow engine."**

<!--
The summary collapses Module 8 into four capabilities that change the shape of what an agent can do: external reach (MCP), reversibility (checkpoints), coordinated change (multi-file ops), and deployment flexibility (local / background / cloud). Each one expands a different dimension of the basic agentic loop; together they constitute the difference between an editor feature and an operations platform.

The progression to Module 9 is deliberate. Module 8 shows what agents *can* do; Module 9 turns to what they *should* do. The expanded capability surface makes the discrimination harder — a task that was obviously out of scope for autocomplete is no longer obviously out of scope for a cloud agent with database access and rollback. The decision framework moves from technical (can the tool handle this?) to organisational (do we want the tool handling this?).
-->

---

## Speaker Notes - Module 8

### Timing: 25 minutes (Extended agenda only)

### Slide Timing Breakdown:
- Slides 8.1-8.6: MCP (10 min)
- Slides 8.7-8.8: Checkpoints (5 min)
- Slides 8.9: Multi-file operations (5 min)
- Slides 8.10-8.12: Agent types and future (5 min)
- Slides 8.13-8.14: 2026 Q2 capabilities + takeaway (5 min)

### Key Points to Emphasize:
1. MCP is the "USB for AI tools" — one standard that works everywhere
2. Checkpoints remove fear — let agents take bigger steps
3. Multi-file operations are where agentic coding truly shines
4. Cloud agents represent the next phase — Issues become PRs automatically
5. Despite all the power, human review remains the constant

### Demo Suggestions:
- **MCP demo**: Show configuring a GitHub MCP server, then ask the
  agent to "list my open issues" — demonstrates tool discovery
- **Checkpoint demo**: Have the agent make several changes, then
  click "Undo" to roll back to an earlier state
- **Multi-file demo**: Ask the agent to rename a function and watch
  it update all references across files, then run tests

### Common Questions:
- "Is MCP safe?" → Tool approval prompts, scoped credentials,
  open source servers. Start with read-only access.
- "Can the cloud agent access private repos?" → Yes, with proper
  GitHub App permissions configured.
- "How long can a cloud agent run?" → Several minutes per task;
  it creates a PR when done.
- "What happens if the agent breaks something?" → Checkpoints
  let you roll back. Tests catch regressions.
- "Can I build my own MCP server?" → Yes, MCP has SDKs for
  TypeScript, Python, and other languages.

### Tone:
- Exciting but grounded
- Show the possibilities, but remind that fundamentals
  (instructions, tests, review) still apply
- These are power tools for people who already understand the basics

### Transition to Module 9:
"Now that you've seen what agentic coding can do at its most
advanced, let's talk about an equally important topic: knowing
when to use these capabilities and when to exercise caution..."
