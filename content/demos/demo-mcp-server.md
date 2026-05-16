# Demo: Live MCP Server — Notes & System Tools

## Audience and slot

- **Versions**: 4h workshop (primary, 12–15 min, Module 4 *Controlling AI Behavior* or as a sidecar to Module 7 build)
- **Optional**: 2h standard as a 5-min sidebar after Module 4
- **Skip in 1h keynote** — too much setup payload

## What this demo proves

| Point | How the demo proves it |
|---|---|
| MCP is just *typed tools the LLM can pick* | Show `tools/list` JSON in the MCP panel |
| The LLM has no persistence by default | Add a note, start a new chat, ask the agent to find it |
| The LLM has no reach into the host by default | Ask for "top 3 processes by memory on this laptop" — without the server the agent cannot answer; with it, it can |
| Identity decoupling (privilege ≠ user) | Same code, run normally then under `runas` — same agent, different blast radius |
| Destructive tools deserve a confirmation gate | `notes_delete` as the smallest possible destructive tool |

## Setup (do once, before the room sits down)

```powershell
cd content/demos/mcp-demo-server
npm install
node probe.cjs   # must print INIT / TOOLS / ADD / LIST / SEARCH / OS / TOP / DISK / DEL
```

Then add to `.vscode/mcp.json` (or merge):

```json
{
  "servers": {
    "agentic-demo": {
      "type": "stdio",
      "command": "node",
      "args": ["${workspaceFolder}/content/demos/mcp-demo-server/server.js"]
    }
  }
}
```

Restart VS Code. In the Copilot chat tool picker you should now see seven new
tools prefixed `agentic-demo_`.

## Live script (12 min)

### Beat 1 — the protocol is not magic (2 min)

1. Open the **MCP** panel in VS Code → `agentic-demo` → *Show tools*.
2. Walk the audience through one tool's JSON schema. Say out loud:
   *"This is the entire interface. Name, description, JSON schema for the
   input. The model picks the tool by reading the description."*

### Beat 2 — persistence the model does not have (3 min)

Prompt the agent (turn 1):

> Add a note saying "buy milk", then list all my notes.

Open `%LOCALAPPDATA%\AgenticDemoMcp\notes.json` in the editor — the row is
really there. Close that chat. Start a **new** chat. Ask:

> What was on my notes list?

The agent calls `notes_list`. Punchline: *the model forgot, the file did not.
That is what MCP gives you — state outside the conversation.*

### Beat 3 — reach into the host (3 min)

Prompt:

> What OS am I on, and what are the top 3 processes by memory right now?

The agent calls `system_os_info` and `system_top_processes`. Point out: *no
training-data answer can include "right now". That is the second job MCP
does — get the model out of its head and into the world.*

### Beat 4 — identity is not the user (2 min)

Stop the server. Re-launch VS Code from an elevated PowerShell. Re-run the
same prompts. Identical UX, but the server now runs as Administrator.

> The agent did not change. The model did not change. The prompt did not
> change. What changed is *what this server is allowed to do on this box*.
> An MCP server is not a Windows service — but it has the same
> identity-and-privilege question, and most demos pretend it does not.

(Back-reference Module 9.8 / destructive-ops guardrails.)

### Beat 5 — the destructive-tool guardrail (2 min)

Prompt:

> Delete note number 1.

Discuss: VS Code prompts for tool confirmation. *This is Layer 4 from the
guardrails handout, made literal.* What would happen if confirmation were
off and `notes_delete` were `database_drop_table`?

## Common failures and recovery

| Symptom | Cause | Fix |
|---|---|---|
| Tools do not appear in VS Code | `mcp.json` typo or extension not reloaded | Open the MCP panel, click "Reload servers" |
| `system_*` tools time out | Network drive enumeration / no PowerShell | Confirm `powershell.exe` on PATH; the server uses CIM not `Get-PSDrive` |
| `notes_*` returns empty after restart | `AGENTIC_DEMO_DIR` differs between runs | Pin the path in `mcp.json` env |
| Probe hangs after first call | Old `server.js`, missing `process.exit` in probe | Pull latest from this folder |

## Where this lands in the slides

- Module 3 *The Power of Context* — MCP is a *context provider*, not a UI.
- Module 4 *Controlling AI Behavior* — schemas are the smallest possible control surface.
- Module 5 *Self-Verification* — `notes_list` after `notes_add` is verify-by-artefact in miniature.
- Module 9.8 *When to Use / Destructive Ops* — identity and confirmation gates.