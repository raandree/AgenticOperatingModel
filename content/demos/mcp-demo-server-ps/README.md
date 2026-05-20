# Agentic Demo MCP Server — PowerShell edition

The same teaching prop as [`../mcp-demo-server`](../mcp-demo-server), rewritten
as a **single PowerShell script** with no SDK dependency. Built for a
PowerShell-conference demo: the entire MCP protocol — JSON-RPC over stdio,
`tools/list`, `tools/call`, `notifications/progress` — fits in one `.ps1` you
can read on a projector.

Same seven tools, same persistent notes store, same instrumentation pattern as
the Node version (timestamped colored stderr logging, per-call duration,
progress notifications when the host passes a `progressToken`).

## Tools

| Tool | Category | Demo point |
|---|---|---|
| `notes_add { text }`    | persistence | side effect the audience can see |
| `notes_list`            | persistence | proves persistence across turns |
| `notes_search { query }`| persistence | typed input + non-trivial logic |
| `notes_delete { id }`   | persistence | destructive op → confirmation discussion |
| `system_os_info`        | reach       | OS / build / uptime via CIM |
| `system_disk_free`      | reach       | numeric host state via CIM |
| `system_top_processes { count }` | reach | list host state via `Get-Process` |

## Prerequisites

- **PowerShell 7+** (`pwsh`). Windows PowerShell 5.1 is not supported (no
  `[Console]::OutputEncoding` UTF-8 default, no `\e` escapes).
- Windows for the `system_*` tools (they use CIM / `Win32_*`); the `notes_*`
  tools work cross-platform.

## Quick smoke test

```powershell
cd content/demos/mcp-demo-server-ps
.\probe.ps1
```

You'll see the server's stderr instrumentation interleaved with the probe's
`INIT / TOOLS / ADD / LIST / ...` lines. No MCP client required.

## Wire into VS Code

Copy `mcp.example.json` into `.vscode/mcp.json` (or merge with what's there).
VS Code will start `pwsh -File Start-AgenticDemoMcp.ps1` on demand and surface
the seven tools under the `agentic-demo-ps` prefix.

## Toggles

| Switch / env var | Effect |
|---|---|
| `-Quiet` / `AGENTIC_DEMO_VERBOSE=0` | Hide per-call STEP/DEBUG lines |
| `-NoColor` / `AGENTIC_DEMO_NO_COLOR=1` | Disable ANSI color |
| `-StorePath <path>` / `AGENTIC_DEMO_DIR=<dir>` | Override notes store location |

## What's worth showing on stage

1. **The whole protocol in one file.** Scroll through `Start-AgenticDemoMcp.ps1`
   and point at `Send-McpResponse`, `Send-McpNotification`, the `tools/list` /
   `tools/call` cases. MCP stops being magic.
2. **Stdout is sacred.** All human output goes to stderr; stdout is reserved
   for JSON-RPC frames. Show what happens if you accidentally `Write-Host`
   without redirection.
3. **Tool registry as data.** `Register-McpTool` is just an entry in a list.
   Adding a new capability is one `Register-McpTool` call — no codegen, no
   manifest, no rebuild.
4. **Progress notifications.** Set `_meta.progressToken` in a `tools/call`
   from the probe and watch `notifications/progress` frames appear on stdout
   in real time.
5. **Pair with the Node version.** Same tools, same protocol — switch the
   `.vscode/mcp.json` entry and the agent doesn't notice. Reinforces that MCP
   really is a contract, not a framework.

## Limits / honesty

- Single user, single process, no concurrency control on the JSON store.
- No auth: the server does whatever the agent asks, within the user's own
  privileges.
- Windows-first for the `system_*` tools; `notes_*` are portable.
- Optimised for *legibility on a projector*, not for production.
