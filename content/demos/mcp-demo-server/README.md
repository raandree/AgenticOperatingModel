# Agentic Demo MCP Server

A minimal **Model Context Protocol** server built for *The Agentic Operating Model*
workshop. It exists to make two abstract ideas concrete in front of a live audience:

1. **MCP gives an LLM persistence it does not have** — the `notes_*` tools write
   to a JSON file on disk you can `cat` on stage between calls.
2. **MCP gives an LLM reach into the host it does not have** — the `system_*`
   tools shell out to PowerShell and return real machine state.

It is intentionally small (~150 lines), has no auth, no network, no secrets,
and no business value. It is a teaching prop.

## Tools

| Tool | What it does | Why it is in the demo |
|---|---|---|
| `notes_add { text }` | Append a note to the JSON store | Side effect the audience can see |
| `notes_list` | Return all notes | Proves persistence across turns |
| `notes_search { query }` | Substring search | Shows typed input + non-trivial logic |
| `notes_delete { id }` | Remove a note by id | Destructive action — discuss confirmation |
| `system_os_info` | OS caption, build, uptime, host, user | Real-time host state the model cannot know |
| `system_disk_free` | Fixed-disk free space | Same point, numeric |
| `system_top_processes { count }` | Top-N processes by working set | Same point, list |

Store location (override with `AGENTIC_DEMO_DIR`):
- Windows: `%LOCALAPPDATA%\AgenticDemoMcp\notes.json`
- Linux / macOS: `~/.local/share/AgenticDemoMcp/notes.json`

## Prerequisites

- Node.js >= 20
- PowerShell (`powershell.exe` on Windows, `pwsh` elsewhere) — the three
  `system_*` tools call it; the four `notes_*` tools work without it.

## Install

```powershell
cd content/demos/mcp-demo-server
npm install
```

## Smoke test (no MCP client needed)

```powershell
node probe.cjs
```

Expected: a list of seven tool names, then one line per tool call.

## Wire it into VS Code

Copy `mcp.example.json` into `.vscode/mcp.json` (or merge with what is there).
VS Code will start the server on demand, the agent will see all seven tools
under the `agentic-demo` prefix in its tool picker.

## Pedagogical uses

- **Show the JSON.** Open the MCP output panel in VS Code and let the audience
  see `tools/list` → `tools/call` → response. The protocol stops being magic.
- **Break it on purpose.** Comment out `notes_search` and re-ask the agent to
  find a note. Watch it either fall back to `notes_list` + filter, or
  hallucinate. Reinforces *context is everything* (Module 3) and
  *self-verification* (Module 5).
- **Identity discussion.** Run the server normally, then re-launch with
  `runas` / elevated PowerShell. Same code, different effective privilege —
  the privilege-decoupling point from Module 9 made tangible.
- **Destructive-ops confirmation.** `notes_delete` is the smallest possible
  destructive tool. Use it to discuss the Layer 4 (human-in-the-loop) guardrail
  from `content/materials/destructive-operations-guardrails.md`.

## Limits / honesty

- Single user, single process, no concurrency control on the JSON file.
- No auth: anything the agent (and therefore any prompt-injection payload in
  tool output) can ask for, the server will do — within the user's own
  privileges.
- Windows-first. The `system_*` tools assume PowerShell + CIM; on Linux they
  will work only where `pwsh` is installed.
- Not a template for production MCP servers. It optimises for *legibility on a
  projector*, not for robustness.