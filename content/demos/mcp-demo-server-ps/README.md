# Agentic Demo MCP Server (PowerShell)

A pure-PowerShell port of the sibling Node.js [`mcp-demo-server`](../mcp-demo-server/README.md).
Same seven tools, same teaching points, no Node.js dependency — written for a
PowerShell-conference audience.

It exists to make two abstract ideas concrete on stage:

1. **MCP gives an LLM persistence it does not have** — the `notes_*` tools
   write to a JSON file you can `Get-Content` between calls.
2. **MCP gives an LLM reach into the host it does not have** — the `system_*`
   tools call native cmdlets (`Get-CimInstance`, `Get-Process`).

It is intentionally small (~300 lines), single file, stdio transport, no auth,
no network. It is a teaching prop, not a production template.

## Tools

| Tool | What it does |
|---|---|
| `notes_add { text }` | Append a note to the JSON store |
| `notes_list` | Return all notes |
| `notes_search { query }` | Case-insensitive substring search |
| `notes_delete { id }` | Remove a note by id (destructive — discuss confirmation) |
| `system_os_info` | OS caption, build, uptime, host, user |
| `system_disk_free` | Fixed-disk free space |
| `system_top_processes { count }` | Top-N processes by working set |

Store location (override with `AGENTIC_DEMO_DIR`):

- Windows: `%LOCALAPPDATA%\AgenticDemoMcp\notes.json`
- Linux / macOS: `~/.local/share/AgenticDemoMcp/notes.json`

## Prerequisites

- PowerShell 7.0 or later (`pwsh`). Windows PowerShell 5.1 is not supported
  because the script uses `[ordered]` JSON round-tripping and cross-platform
  `$IsWindows`.

No modules to install. No `npm install`. That is the point.

## Smoke test (no MCP client needed)

```powershell
pwsh -NoProfile -File .\probe.ps1
```

Expected: server info, a list of seven tool names, then one line per tool call.

## Wire it into VS Code

Copy [`mcp.example.json`](./mcp.example.json) into `.vscode/mcp.json` (or merge
with what is there). VS Code will start the server on demand and the agent will
see all seven tools under the `agentic-demo-ps` prefix.

## Why a PowerShell port?

The Node.js server already proves the protocol. This port proves something
else: an MCP server is just **JSON-RPC over stdio**. There is no SDK lock-in.
Any language that can read a line from stdin, parse JSON, and write a line to
stdout can be an MCP server — including, very comfortably, PowerShell.

Use this on stage to:

- Open `server.ps1` next to `..\mcp-demo-server\server.js` and show the same
  protocol implemented in two languages.
- Demonstrate that the `system_*` tools are even shorter in PowerShell because
  there is no `spawn('pwsh', ...)` bridge — the cmdlets run in-process.
- Discuss the identity/privilege point from Module 9: launch `pwsh` elevated
  and re-run the same server; the agent inherits whatever the shell can do.

## Limits / honesty

- Single user, single process, no concurrency control on the JSON file.
- No auth: anything the agent (and therefore any prompt-injection payload in
  tool output) can ask for, the server will do — within the user's privileges.
- Synchronous request loop: one in-flight call at a time. Fine for a demo,
  not for production.
- Not a template for production MCP servers. Optimised for *legibility on a
  projector*.
