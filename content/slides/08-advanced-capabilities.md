# Module 8: Advanced Agent Capabilities

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

---

## Slide 8.13: Key Takeaway

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

---

## Speaker Notes - Module 8

### Timing: 25 minutes (Extended agenda only)

### Slide Timing Breakdown:
- Slides 8.1-8.6: MCP (10 min)
- Slides 8.7-8.8: Checkpoints (5 min)
- Slides 8.9: Multi-file operations (5 min)
- Slides 8.10-8.12: Agent types and future (5 min)

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
