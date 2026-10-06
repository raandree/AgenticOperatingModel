---
marp: true
theme: default
paginate: true
backgroundColor: #ffffff
color: #1e293b
style: |
  /* ---------- Base ---------- */
  section {
    font-family: 'Segoe UI', Arial, sans-serif;
    font-size: 24px;
    background-color: #ffffff;
    color: #1e293b;
  }
  h1 {
    color: #0c4a6e;
    font-size: 1.5em;
    margin-bottom: 0.3em;
    border-bottom: 3px solid #0284c7;
    padding-bottom: 0.15em;
  }
  h2 {
    color: #0369a1;
    font-size: 1.3em;
  }
  h3 {
    color: #0f172a;
    font-size: 1.05em;
    margin-top: 0.3em;
    margin-bottom: 0.2em;
  }
  p, li {
    color: #1e293b;
  }
  strong {
    color: #0c4a6e;
    font-weight: 700;
  }
  em {
    color: #475569;
  }
  a {
    color: #0284c7;
    text-decoration: underline;
  }

  /* ---------- Code ---------- */
  code {
    background-color: #f1f5f9;
    color: #0f172a;
    padding: 0.1em 0.3em;
    border-radius: 4px;
    font-family: 'Cascadia Code', 'Consolas', 'Courier New', monospace;
  }
  pre {
    background-color: #f8fafc;
    color: #0f172a;
    border: 1px solid #cbd5e1;
    border-left: 4px solid #0284c7;
    border-radius: 6px;
    padding: 12px;
    font-size: 0.9em;
  }
  pre code {
    background-color: transparent;
    color: #0f172a;
    padding: 0;
  }

  /* ---------- Tables ---------- */
  table {
    font-size: 0.75em;
    margin: 0 auto;
    border-collapse: collapse;
    border: 1px solid #cbd5e1;
  }
  th {
    background-color: #0c4a6e;
    color: #ffffff;
    padding: 6px 10px;
    border: 1px solid #0c4a6e;
    text-align: left;
  }
  td {
    background-color: #ffffff;
    color: #1e293b;
    padding: 6px 10px;
    border: 1px solid #cbd5e1;
  }
  tr:nth-child(even) td {
    background-color: #f8fafc;
  }

  /* ---------- Blockquotes ---------- */
  blockquote {
    border-left: 4px solid #0284c7;
    background-color: #f0f9ff;
    color: #0c4a6e;
    font-style: italic;
    padding: 0.5em 0.8em;
    margin: 0.5em 0;
    border-radius: 0 4px 4px 0;
  }
  blockquote strong {
    color: #0c4a6e;
  }

  /* ---------- Lead slide ---------- */
  section.lead {
    background: linear-gradient(135deg, #ffffff 0%, #e0f2fe 100%);
  }
  section.lead h1 {
    font-size: 2.2em;
    text-align: center;
    color: #0c4a6e;
    border-bottom: none;
  }
  section.lead h2 {
    text-align: center;
    color: #475569;
  }
  section.lead h3 {
    text-align: center;
    color: #0369a1;
  }
  section.lead p {
    text-align: center;
    color: #334155;
  }

  /* ---------- Section divider ----------
     Note: Marp's frontmatter `backgroundColor: #ffffff` injects an inline
     style on every <section>, which beats class-based background rules
     regardless of specificity. Section-divider slides therefore always
     render on white; text colors below are tuned for that background. */
  section.section-divider {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    color: #1e293b;
  }
  section.section-divider h1 {
    font-size: 2.4em;
    margin-bottom: 0.2em;
    color: #0c4a6e;
    border-bottom: none;
  }
  section.section-divider h2 {
    color: #0369a1;
    font-size: 1.2em;
  }
  section.section-divider blockquote {
    background-color: #f0f9ff;
    border-left: 4px solid #0284c7;
    color: #0c4a6e;
  }

  /* ---------- Layout helpers ---------- */
  img[alt~="center"] {
    display: block;
    margin: 0 auto;
  }
  .columns {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1em;
  }
  footer {
    color: #64748b;
    font-size: 0.6em;
  }
  section::after {
    color: #64748b;
  }

  /* ---------- Dense slide variant ---------- */
  section.dense {
    font-size: 20px;
  }
  section.dense h1 {
    font-size: 1.4em;
    margin-bottom: 0.2em;
  }
  section.dense h3 {
    font-size: 1.0em;
    margin-top: 0.2em;
    margin-bottom: 0.1em;
  }
  section.dense pre {
    padding: 8px;
    font-size: 0.85em;
  }
  section.dense blockquote {
    margin-top: 0.3em;
    margin-bottom: 0.3em;
  }

  /* ---------- Compact slide variant (denser than dense) ---------- */
  section.compact {
    font-size: 18px;
  }
  section.compact h1 {
    font-size: 1.3em;
    margin-bottom: 0.15em;
    padding-bottom: 0.1em;
  }
  section.compact h2 {
    font-size: 1.15em;
  }
  section.compact h3 {
    font-size: 0.95em;
    margin-top: 0.15em;
    margin-bottom: 0.1em;
  }
  section.compact p {
    margin-top: 0.4em;
    margin-bottom: 0.4em;
  }
  section.compact pre {
    padding: 6px;
    font-size: 0.8em;
  }
  section.compact table {
    font-size: 0.65em;
  }
  section.compact th, section.compact td {
    padding: 3px 6px;
  }
  section.compact blockquote {
    margin: 0.25em 0;
    padding: 0.4em 0.6em;
  }
  section.compact ul, section.compact ol {
    margin-top: 0.25em;
    margin-bottom: 0.25em;
  }
  section.compact li {
    margin-top: 0.1em;
  }
---
<!-- version: 1h 2h -->

<!-- _class: lead -->
<!-- _paginate: false -->

![center w:130](../../assets/AOM-glyph-on-light.png)

# The Agentic Operating Model — Part 2

## Agents That Reach Out, Ask First, Remember, and Hand Off

### MCP servers · Questionnaires and Grill-Me · the Memory Bank in 2026 · Agent handoffs

<!--
CONTEXT — Part 2 of the Agentic Operating Model series. Part 1 (13 Aug 2026, 120 minutes)
ran out of time before its last modules. This session picks up the four topics that changed
most since then: MCP servers, interviewing before acting, the Memory Bank, and Agent handoffs.

PRESENT — Keep this under a minute.
- Introduce yourself in one sentence, then ask: "Who was at Part 1?" The show of hands decides
  how long the recap on slide 3 takes: 30 seconds if most were there, 90 seconds if few were.
- Read the four topics on the bottom line once. They are the agenda.
- Say early that every demo has a fallback: "If a live Agent takes too long, I switch to the
  branch I recorded in rehearsal. You see the same artefacts either way."
- Say that PowerShell is the demonstration medium, not the subject.

TRANSITION — "Part 1 ended with an Agent that works well inside one repository. Today starts
with the four questions that come right after that."

TIME — 1 minute.
-->

---
<!-- version: 1h 2h -->

# Four Questions Once the Agent Works in One Repository

| Block | The question | Today's answer |
|---|---|---|
| **1 · Reach out** | How does it reach systems beyond the repository? | MCP servers |
| **2 · Ask first** | Who questions an idea before the Agent acts on it? | Questionnaires and Grill-Me |
| **3 · Remember** | What does it still know after the session ends or is compacted? | The Memory Bank, revisited |
| **4 · Hand off** | Who checks its work? | Agent handoffs with a human gate |

> **One running example connects all four:** a new Tool for a PowerShell MCP server — from a vague idea to a reviewed commit.

> *The idea, as vague as real ideas are:* "Let the Agent see the recent errors on my machine."

<!--
CONTEXT — The agenda and the promise of the talk. The four questions come from the abstract;
each one is a block of 12 to 20 minutes with a live demo.

PRESENT
- Read the four questions, not the answers. Pause after "Who checks its work?" — that is the
  question most people in the room have not solved yet.
- Then point at the right-hand column: one concrete answer per question, each shown live.
- Running example: the four blocks are not four separate demos. One small feature travels
  through all of them — a new Tool for the PowerShell MCP server.
- Read the vague idea slowly. Say: "This sentence hides at least ten decisions. In block 2 the
  Agent finds them, not me."

TRANSITION — "Before we leave the repository, one minute on the loop from Part 1."

TIME — 1.5 minutes.
-->

---
<!-- version: 1h 2h -->

<!-- _class: dense -->

# The Agentic Loop

```
         ┌──────────────────────────────────────┐
         │                                      │
         ▼                                      │
   ┌──────────┐                                 │
   │ OBSERVE  │  Read repo, analyze code        │
   └────┬─────┘                                 │
        ▼                                       │
   ┌──────────┐                                 │
   │   PLAN   │  Decide approach, break steps   │
   └────┬─────┘                                 │
        ▼                                       │
   ┌──────────┐                                 │
   │   ACT    │  Write code, create files       │
   └────┬─────┘                                 │
        ▼                                       │
   ┌──────────┐                                 │
   │  VERIFY  │  Run tests, check errors        │
   └────┬─────┘                                 │
        │                                       │
   Pass ──▶ DONE ✅    Fail ──▶ ITERATE ────────┘
```

<!--
CONTEXT — The core idea of Part 1, as a one-minute recap. Part 2 must also work for people who
did not attend.

PRESENT
- Walk the loop once, top to bottom: OBSERVE reads the repository, PLAN breaks the task down,
  ACT changes files, VERIFY runs tests, and a failure sends the Agent around again.
- Then map today's four blocks onto the loop. This mapping is the one idea to land here:
  - Reach out: MCP extends what OBSERVE and ACT can touch beyond the repository.
  - Ask first: questions sharpen PLAN before the first file changes.
  - Remember: the Memory Bank feeds OBSERVE across sessions and compactions.
  - Hand off: a second Agent adds an independent VERIFY.
- If most people were at Part 1, skip the walk-through and do only the mapping.

TRANSITION — "Let's start with reach. The Agent can already run a terminal — so why would it
need anything else?"

TIME — 1 minute.
-->

---
<!-- version: 1h 2h -->

<!-- footer: '1 · Reach out — MCP servers' -->

# Why MCP When the Agent Already Has a Terminal?

A terminal already reaches almost everything. **MCP makes that reach typed, visible, and governable.**

| Through the terminal | Through an MCP server |
|---|---|
| The Agent composes a command string | The Agent picks a **named Tool with a JSON Schema** |
| One generic question: "run this command?" | **Per-Tool approval**; Tools can be marked read-only or destructive |
| Knowledge of your systems lives in the Prompt | Knowledge lives **in the server**, reused by every chat |
| Works in this one shell | The same server works in VS Code, Copilot CLI, Claude, Cursor |

> **MCP (Model Context Protocol)** — the open standard that connects Agents to Tools and data, now governed under the Linux Foundation.

<!--
CONTEXT — A PowerShell audience asks "why not just Invoke-RestMethod?" within the first minute.
Answer it before they ask. The honest framing: MCP adds no reach the terminal lacks. It adds
structure — names, schemas, approvals, and a place to keep knowledge about your systems.

PRESENT — Read the table row by row, left column first, then the right.
- Row 1: a command string is free text the Model writes; a Tool is a named function with a
  JSON Schema. Typed input is easier to validate and easier for the Model to choose.
- Row 2: in the terminal you approve "run this command?" — the same question for Get-Process
  and for Remove-Item -Recurse. MCP lets the host ask per Tool, and the specification lets a
  server mark a Tool as read-only or destructive. One-sentence caveat: those marks are hints
  from the server, so a client must not trust them blindly.
- Row 3: the knowledge of "how to talk to our CMDB" moves out of every Prompt and into code
  that every chat reuses.
- Row 4: one server works across hosts — VS Code, GitHub Copilot CLI, Claude, Cursor.
- Blockquote: MCP is an open standard. It moved under the Agentic AI Foundation, part of the
  Linux Foundation.

TRANSITION (90 min) — "MCP doesn't replace your APIs either. It sits on top of them."
TRANSITION (60 min) — "So what does that structure look like on the wire? Surprisingly little."

TIME — 2 minutes.
-->

---
<!-- version: 2h -->

<!-- _class: dense -->

# MCP Sits On Top of Your APIs

> MCP does not replace your backend. It replaces the **middleware between
> the model and the API you already own**.

|  | REST API | MCP server |
|---|---|---|
| **Who calls it** | another program | **the model itself** |
| **Caller behaviour** | deterministic | **probabilistic** |
| **The contract** | endpoint + payload | tool name + schema + **description** |
| **Who picks the call** | your app code | **the model's reasoning** |

- **Nothing is thrown away** — auth, paging, rate limits, error handling still live *inside the MCP server*. The work **moved**; it did not vanish.
- **Routing logic left your codebase** — unit tests no longer cover it. That is what **evals** and **containment** are for.

<!--
CONTEXT — 90-minute version only. Reused from the 4h deck: MCP as a layer, not a replacement.
It prepares the security questions on the next slides.

PRESENT
- Quote: MCP replaces the glue between the Model and your API, not the API itself.
- Table: read only the bold right-hand column — the Model calls it, its behaviour is
  probabilistic, the contract includes a description in natural language, and the Model's
  reasoning picks the call.
- Bullet 1: authentication, paging, and rate limits still exist; they now live in the server.
- Bullet 2 is the important one: the decision about which call to make left your codebase.
  Unit tests no longer cover it; evals and containment do.

TRANSITION — "Let me show you how small the protocol itself is."

TIME — 1.5 minutes.
-->

---
<!-- version: 1h 2h -->

<!-- _class: dense -->

# The Whole Protocol in One PowerShell File

`Start-AgenticDemoMcp.ps1` — 611 lines, PowerShell 7, no SDK. One JSON-RPC 2.0 message per line over stdio:

```text
→ {"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18",…}}
← {"jsonrpc":"2.0","id":1,"result":{"protocolVersion":"2025-06-18","serverInfo":{…},…}}
→ {"jsonrpc":"2.0","method":"notifications/initialized"}
→ {"jsonrpc":"2.0","id":2,"method":"tools/list"}
← {"jsonrpc":"2.0","id":2,"result":{"tools":[{"name":"notes_add","inputSchema":{…}},…]}}
→ {"jsonrpc":"2.0","id":3,"method":"tools/call","params":{"name":"notes_add","arguments":{"text":"buy milk"}}}
← {"jsonrpc":"2.0","method":"notifications/progress","params":{"progress":1,"message":"loading store",…}}
← {"jsonrpc":"2.0","id":3,"result":{"content":[{"type":"text","text":"Added note #1. Total notes: 1. …"}]}}
```

- **Handshake, discovery, call** — `initialize`, `tools/list`, `tools/call`. An `id` pairs a request with its response; a notification has none.
- **A Tool is data** — a name, a description the Model reads to choose, a JSON Schema, and a script block: one `Register-McpTool` call.
- **stdout is the protocol, stderr is the log** — one stray `Write-Host` corrupts the stream.

<!--
CONTEXT — Demystification: everything VS Code needs from an MCP server fits in eight lines.
These are the real messages of the demo server, shortened with "…".

PRESENT
- Explain the arrows first: → is VS Code talking to the server, ← is the server answering.
- Lines 1 to 3, the handshake: the client proposes a protocol version, the server confirms it
  and says what it can do, and the client confirms it is ready.
- Lines 4 and 5, discovery: the client asks for the Tool list. Each Tool comes back with a
  name, a description, and an input schema. The description is what the Model reads to decide.
- Lines 6 to 8, the call: the Model chose notes_add with the argument "buy milk". When the
  client passes a progress token, the server streams progress notifications before the result.
- Bullet 1: the id pairs request and response; notifications carry no id and get no answer.
- Bullet 2: in this server a Tool is one Register-McpTool call. No code generation, no manifest.
- Bullet 3: the classic bug. stdout carries the protocol, so any stray output — Write-Host or
  an uncaptured pipeline value — corrupts the stream. Logs go to stderr.

TRANSITION — "Now let's plug it into VS Code."

TIME — 2.5 minutes.
-->

---
<!-- version: 1h 2h -->

<!-- _class: dense -->

# Wiring the PowerShell Server Into VS Code

```jsonc
// .vscode/mcp.json — or your user-level MCP configuration
{
  "servers": {
    "agentic-demo-ps": {
      "type": "stdio",
      "command": "pwsh",
      "args": ["-NoProfile", "-NonInteractive", "-File",
               "${workspaceFolder}/Start-AgenticDemoMcp.ps1"],
      "env": { "AGENTIC_DEMO_DIR": "${workspaceFolder}/.demo-store" }
    }
  }
}
```

- VS Code starts the process on demand and keeps it running — **as you, with your rights**.
- The Agent sees seven Tools; **you approve each call** unless you choose otherwise.
- **Change the server, restart it** — a running process still has the old Tool list.

<!--
CONTEXT — The exact configuration of the demo repository created by
content/part2/New-Part2DemoRepo.ps1. In the AgenticOperatingModel repository the same server is
wired from content/demos/mcp-demo-server-ps/mcp.example.json.

PRESENT
- Point at three keys: type stdio (a local child process talking over stdin and stdout),
  command and args (plain pwsh, nothing special), and env (where the notes store lives — here
  inside the demo folder, so the demo never touches real data).
- Bullet 1 is the identity point: the server runs as you. Start VS Code elevated and the
  server is elevated too — same Agent, same Prompt, different blast radius.
- Bullet 2: the approval prompt appears in the demo. It is the cheapest guardrail you have.
- Bullet 3: a practical gotcha that comes back in the close. After the engineer adds a Tool,
  the running process doesn't know it. Restart the server from the MCP server list.
- One sentence on why CopilotAtelier syncs no mcp.json to its users: this file starts
  processes with your credentials. Treat it like code, not like settings.

TRANSITION — "That leads to three questions you should ask about every MCP server."

TIME — 1.5 minutes.
-->

---
<!-- version: 1h 2h -->

<!-- _class: dense -->

# Three Questions Before You Connect Any MCP Server

| Question | Why it matters | Default answer |
|---|---|---|
| **Whose identity does it run under?** | A local server inherits *your* rights — an elevated editor means an elevated server | Least privilege; never elevate the editor for convenience |
| **Which Tools need a human click?** | To the Model, a destructive Tool looks exactly like a read-only one | Confirm destructive calls; never auto-approve them |
| **Who wrote the text it returns?** | Tool results go straight into the context window: web pages, tickets, event logs | Treat every Tool result as untrusted input |

- **Private data + untrusted content + an outbound channel = the Lethal trifecta.** Never combine all three in one Agent.
- **An `mcp.json` is executable code with your credentials.** CopilotAtelier deliberately ships none.
- **Every connected server costs context on every call** — 46 Tools failed where 19 passed: same Model, same context window.

<!--
CONTEXT — The MCP security block compressed into three questions the room can take home.
Sources: the Lethal trifecta (Simon Willison, June 2025; OWASP LLM01), CopilotAtelier
Decision 17 (no curated mcp.json), and the Berkeley Function-Calling Leaderboard / GeoEngine
result from the 4h deck (a quantized Llama 3.1 8b failed with 46 Tools and passed with 19 in
the same 16k context window).

PRESENT — Ask each question to the room before you read the answer.
- Identity: "Who knows which account your MCP servers run under?" Expect few hands. A local
  stdio server is a child process of your editor.
- Human click: the Model sees names and descriptions only. notes_delete and notes_list look
  alike to it. Confirming destructive Tools is not optional.
- Untrusted text: the one people miss. A Tool that reads a web page, a ticket, or an event log
  returns text someone else wrote, and that text lands in the context window next to your
  instructions. The running example reads the event log, so this question returns in the
  security review.
- Bullet 1: name the Lethal trifecta. The fix is to break one leg, not to filter.
- Bullet 2: CopilotAtelier, which ships Custom agents, Skills, and Hooks to many machines,
  deliberately syncs no MCP configuration: it is code with credentials and network reach.
- Bullet 3: Tool descriptions sit in the context window on every request. More servers can
  make answers worse, not better.
- Optional anecdote: while this talk was prepared, the demo's own smoke test deleted note #1
  instead of the note it had just created — a destructive call aimed at the wrong record. It
  was fixed in the same preparation branch.

TRANSITION — "Enough slides. Let's look at the server."

TIME — 3 minutes.
-->

---
<!-- version: 1h 2h -->

# Live: Seven Tools, One PowerShell Script

1. Read the server — `Register-McpTool` and the `tools/call` branch
2. Run `probe.ps1` — the protocol, with no client involved
3. Ask the Agent: *"What are the top 3 processes by memory right now?"*
4. Ask the Agent: *"Delete note 1."* — and watch the confirmation

> **Watch for:** which Tool the Agent picks — and what it had to read to pick it.

<!--
CONTEXT — First demo: 8 minutes at 90, 5 minutes at 60. Everything runs in the demo repository
created by content/part2/New-Part2DemoRepo.ps1 (default C:\Git\aom-part2-demo). See
content/part2/demo-runbook.md for setup and fallbacks.

DO
1. Open Start-AgenticDemoMcp.ps1. Search for "function Register-McpTool": a Tool is an entry
   in a list. Show one registration (notes_add): name, description, schema, script block.
   Search for "'tools/call'": the dispatcher. Search for "function Send-McpFrame": the only
   place that writes to stdout.
2. Terminal: .\probe.ps1. The INIT, TOOLS, ADD, LIST, SEARCH, OS, TOP, DISK, DEL lines come
   from the probe; the coloured lines in between are the server's stderr log.
3. Command Palette: "MCP: List Servers". Start agentic-demo-ps if it isn't running. Open a new
   chat in Agent mode and ask for the top 3 processes. Approve the system_top_processes call
   and point at the Tool name in the chat.
4. 90 minutes only: ask "Delete note 1." Stop at the confirmation and ask the room: "What if
   this were database_drop_table?" Then approve or cancel.

IF IT FAILS — If the server doesn't start, the probe output from step 2 is the demo: it shows
the same protocol. Say so and move on. Don't debug on stage.

TRANSITION — "The Agent picked the right Tool because the question was precise. Most real
ideas are not. Remember our vague sentence?"

TIME — 8 minutes at 90, 5 minutes at 60 (skip step 4).
-->

---
<!-- version: 2h -->

<!-- footer: '2 · Ask first — Questionnaires and Grill-Me' -->

# Agents Act Eagerly — and Agree With You

- A vague Prompt does not produce a question. It produces **plausible work built on invisible assumptions**.
- Ask *"Is this a good idea?"* and a Model tends to agree — **sycophancy** is a documented failure mode.
- **Defects start in requirements, not in code.** The cheapest fix is a sentence changed before the first file exists.

> Flip the direction: **the Agent interviews you** until the idea survives the questions.

<!--
CONTEXT — 90-minute version only. At 60 minutes, say the blockquote in one sentence on the
next slide. Sources: Sharma et al., "Towards Understanding Sycophancy in Language Models"
(Anthropic, 2023); Fred Brooks, "The Design of Design" (2010).

PRESENT
- Bullet 1: use the running example. "Let the Agent see the recent errors on my machine." A
  capable Agent happily writes a Get-WinEvent call. Which log? How many events? What if the log
  needs admin rights? It decides all of that silently.
- Bullet 2: ask the room: "Who has asked an Agent whether their idea is good — and been told
  no?" Models are trained to be helpful, and agreeing feels helpful.
- Bullet 3: the economics. A requirement fixed as a sentence costs seconds; the same fix after
  implementation, review, and release costs days.
- Blockquote: the move of this block is to reverse the direction of the questions.

TRANSITION — "The simplest way to make an Agent ask well is a questionnaire."

TIME — 1.5 minutes.
-->

---
<!-- version: 1h 2h -->

<!-- footer: '2 · Ask first — Questionnaires and Grill-Me' -->

# Questionnaires — Structured Questions, Recommended Answers

The Agent asks through a question panel instead of a wall of text:

- **One to four questions per round**, each with options — the **recommended answer first**
- **Free text always allowed** — options guide, they never cage
- **`not sure, you pick`** turns the recommendation into an **assumption flagged for review**
- **A strict choice only at the gate** — `SIGNED OFF` or `revise`
- `not sure, you pick` is **never offered** when the answer authorizes a push, a deletion, or a permission change

> Measured in CopilotAtelier: on 17 real chat cases, these question and answer rules raised the pass rate from **52.1 % to 100 %** (51 of 51 samples).

<!--
CONTEXT — The question panel is VS Code's askQuestions Tool. The rules come from
CopilotAtelier's interactive-questions reference and its contributor-calibration Instruction
(Decision 0027, 30 Sep 2026). The measurement is a private behaviour eval: 17 cases taken
from real chats, run with and without the Instruction, three samples each, graded by a pinned
Model judge that agreed with human labels on 38 of 40 replies.

PRESENT
- Bullet 1: small rounds keep the interview adaptive — the next question depends on the last
  answer. With the recommendation first, you can accept with one click.
- Bullet 2: options are suggestions; typing your own answer is always possible.
- Bullet 3: the most useful rule. If you don't know, you are not stuck. The Agent records its
  recommendation as an assumption and flags it for an expert. Nothing is silently guessed.
- Bullet 4: only the final sign-off is a strict choice, so "sure, sounds good" can't slip
  through as approval.
- Bullet 5: delegation has limits — no "you pick" for anything irreversible.
- Blockquote: rules about asking are testable like code: 52 % to 100 % on real cases.
- A real example from preparing this talk: the Agent asked what Sessionize's "small print"
  field should contain — with options — instead of guessing.

TRANSITION — "Questionnaires are the format. Grill-Me is the discipline behind them."

TIME — 2.5 minutes.
-->

---
<!-- version: 1h 2h -->

<!-- _class: dense -->

# Grill-Me — Twelve Categories, Depth by Blast Radius

The Agent interviews **you** and refuses to build until you sign off a **Design Concept**.

**Twelve categories:** purpose and success criteria · users and stakeholders · inputs and outputs · failure modes · edge cases · security and privacy · performance and scale · operational ownership · rollback · observability · non-goals · open questions

| Blast radius | Interview depth |
|---|---|
| New system, new public contract, irreversible data or schema decision | All twelve categories, 40–100 questions |
| Contained change inside an owned module | A named subset: purpose, inputs and outputs, failure modes, edge cases, rollback, non-goals |
| Unambiguous request, one obvious design | No interview — a one-paragraph concept, then hand off |

- **The transcript becomes the spec.** Every unanswered question becomes an explicit `TBD` with an owner.
- **Not only for code:** a migration plan, a budget, a talk abstract — *"grill me on this"* works on any idea.

<!--
CONTEXT — Grill-Me is the adversarial requirements interview from CopilotAtelier's grill-me
Skill (May 2026; prior art: Matt Pocock's skills repository). The depth table is quoted from
the software-architect Custom agent (26 Aug 2026).

PRESENT
- First line: the refusal is the feature. Until sign-off, the only output is the next question.
- Categories: don't read all twelve. Pick three that fit the running example — security and
  privacy (which event logs may it read?), performance (how many events?), rollback (what if
  the Tool misbehaves?).
- Table: read the left column, then quote the agent file: "Ninety questions about a new switch
  parameter teaches the user never to select this agent again." Depth scales with risk.
- Bullet 1: a TBD is not a failure; a hidden assumption is.
- Bullet 2: to reflect on any idea, ask an Agent to grill you instead of praising you. It is
  the antidote to sycophancy.

TRANSITION — "Grill-Me existed as a Skill for months. It still lost. Here is why."

TIME — 2.5 minutes.
-->

---
<!-- version: 1h 2h -->

# A Skill Is Advice — a Custom Agent Is a Mode

**What happened:** Grill-Me shipped as a Skill. Inside the Software Engineer Custom agent, it lost every time.

| | Grill-Me Skill | Software Engineer body |
|---|---|---|
| **Kind** | advisory content, loaded on demand | mode instruction, active all the time |
| **Says** | "interview before any code" | "do not ask for confirmation when the next action is reversible" |
| **Wins** | — | ✔ |

**The fix:** a `software-architect` Custom agent whose only deliverable is a signed-off Design Concept.

- **31 Tools instead of 45** — no test runner, no task runner, no code interpreter
- It can still edit files, but it **cannot close a code change** — the Agent handoff is its only way forward
- **An Agent handoff, not a subagent** — so the interview keeps a direct channel to you

<!--
CONTEXT — CopilotAtelier Decision 0022 (26 Aug 2026). The most transferable lesson of the
block: when two instructions conflict, the mode instruction wins.

PRESENT
- First line: tell it as a story. The Skill was correct, well written, and loaded. It still
  lost.
- Table: a Skill is content the Model may consult. A Custom agent body is the mode the Model is
  in. The engineer's body says "don't ask when the next step is reversible" — and almost every
  step is reversible. Two directives point in opposite directions; only one of them is a mode.
- Fix line: make the interview a role, not a suggestion. The VS Code documentation shows the
  same pattern: a planning agent that hands off to an implementation agent.
- Bullet 1: taking Tools away is a design tool. The architect has no test runner.
- Bullet 2: it is not a sandbox. It can still edit files, because the shared close-out writes
  the Memory Bank. Without tests, though, it can't finish a code change, so the Agent handoff is
  the only productive exit. Say this honestly: it is a bounded guarantee.
- Bullet 3: why not call the architect as a subagent? A subagent runs in its own context
  window and reports back. It can't hold a conversation with you, and an interview needs you.
- Generalize: if a behaviour must win, make it a Custom agent's mode or a Hook, not a Skill.

TRANSITION — "Let's watch it interview me about our vague idea."

TIME — 2.5 minutes.
-->

---
<!-- version: 1h 2h -->

# Live: From a Vague Idea to a Design Concept

Custom agent: **`software-architect`**

```text
cycle: full — add a Tool to the PowerShell MCP server that shows
recent errors from the Windows event log
```

**Watch for:**

- the **interview depth** it announces — and the reason it gives
- options with a **recommended answer** — and one deliberate `not sure, you pick`
- the **sign-off gate**, then the Design Concept written to `.memory-bank/decisions/`

<!--
CONTEXT — Second demo: 8 minutes at 90, 5 minutes at 60. Runs in the demo repository. The
prompt starts the full development cycle (architect, engineer, security reviewer, writer),
which block 4 explains. Keep the rehearsal branch demo/1-concept ready in case the interview
runs long.

DO
1. Select the software-architect Custom agent and paste the prompt from the slide.
2. Read the first reply aloud: the depth it chose (expect the named subset, because this is a
   contained change) and its reason.
3. Answer in the question panel. Answers that keep the demo crisp: System and Application logs
   only; errors and critical events only; the last hour by default; at most 50 events; message
   text truncated; Windows only, with a clear error elsewhere; read-only. Answer one question
   with "not sure, you pick" on purpose and later show where that assumption appears.
4. Expect a security question about log access. The Security log needs elevation. Say: "We will
   not run the server elevated." That decision shapes the Tool.
5. Sign off. Open .memory-bank/decisions/ and show the file the architect wrote.
6. Take the "Implement the Design Concept" handoff. The engineer starts; leave it running and
   go back to the slides.

IF IT FAILS — git switch demo/1-concept, open the Design Concept from rehearsal, and take the
handoff from there.

TRANSITION — "While the engineer works, let's talk about what it knows — and what it forgets."

TIME — 8 minutes at 90 (8 to 10 questions), 5 minutes at 60 (about 5 questions).
-->

---
<!-- version: 1h 2h -->

<!-- footer: '3 · Remember — the Memory Bank in 2026' -->

<!-- _class: dense -->

# The Memory Bank Pattern

Versioned project knowledge under `.memory-bank/`, read at the start of every Agent session:

| File | Purpose |
|---|---|
| `index.md` | **The routing map** — always read; it says what to read next |
| `projectbrief.md` | What this project is and why it exists |
| `productContext.md` | Users, problem, scope |
| `activeContext.md` | Current focus and next step — overwritten, not appended |
| `progress.md` | What is done, what is pending, known issues |
| `systemPatterns.md` | Conventions, architecture, the decision index |
| `techContext.md` | Tools, versions, environment, validation commands |
| `decisions/*.md` | One durable choice per file, with its rationale |
| `promptHistory.md` | Optional local log of intents — never read routinely |

> Same idea elsewhere: Cline's Memory Bank, Claude Code's `CLAUDE.md`, `AGENTS.md`. A template ships in this repository.

<!--
CONTEXT — The pattern in its 2026 shape. In Part 1 this slide sat in Module 8 of the 2h deck,
so many attendees may not have seen it.

PRESENT
- Opening line: the Memory Bank is Markdown in Git — reviewed, diffed, and versioned like code.
- Walk the rows in three groups rather than one by one:
  - Stable: projectbrief, productContext, systemPatterns, techContext change rarely.
  - Moving: activeContext is a status page, overwritten whenever the focus changes; progress
    keeps recent milestones; git keeps the full history.
  - New in 2026: index.md routes the reading; decisions/ holds one durable choice per file;
    promptHistory became an optional local log that is never read routinely.
- Blockquote: the idea is tool-neutral. The template is in
  content/materials/memory-bank-template.

TRANSITION — "Nine months ago this table looked almost the same. What changed is how it is
used."

TIME — 2 minutes.
-->

---
<!-- version: 1h 2h -->

# What Changed in Nine Months

| Then | Now |
|---|---|
| The Memory Bank was the only memory | **Hosts ship their own memory** — VS Code's and Claude's memory Tools. Convenient, never authoritative |
| Long sessions were rare | **Compaction is routine** — vendors now design for interruption |
| Read every file, every session | **Route through `index.md`** — and read everything when in doubt |
| "It seems to work" | **Routing is measured** — audited cases, zero critical misses |
| Trust whatever is written | **Integrity** — a bad write persists into every future session |
| One shared store for everything | **Personal memory leaves the project** — a private profile outside every repository |

<!--
CONTEXT — The answer to "what has changed in this field". Each row is illustrated with a dated
change in CopilotAtelier, which tracked the field closely:
- 07 Jul 2026: promptHistory.md becomes a local, untracked log.
- 24 Jul: routing through index.md; 25 audited routing cases; decision records extracted;
  VS Code's native memory Tool deliberately not granted to every Custom agent.
- 28 Jul: Hooks arrive; a SessionStart Hook makes "a Memory Bank exists here" a fact.
- 01 Aug: line budgets, and a health check that warns before a budget breaks.
- 13 Aug: a second eval — can a fresh Model pick the routes from the task text?
- 25 Aug: a PreCompact Hook writes a recovery file before compaction.
- 30 Sep to 06 Oct: contributor calibration and a private profile outside every repository.

PRESENT — One sentence per row, "then … now …":
- Row 1: host memory is useful for personal preferences. It is not reviewed, not versioned,
  and not shared, so it never outranks the Memory Bank.
- Row 2: vendors assume the context window will be reset. Anthropic's memory Tool tells the
  Model to assume interruption; Claude Code re-reads CLAUDE.md after /compact; Cline asks you to
  update the Memory Bank before the window fills.
- Row 3: reading everything is the "distraction" failure — the history of the project crowds
  out the task at hand.
- Row 4: routing is tested like code. The next slide has the numbers.
- Row 5: whatever an Agent writes into the Memory Bank is read by every future session. A
  wrong fact becomes a durable wrong fact.
- Row 6: some memory is about the person, not the project, and doesn't belong in a shared
  repository.

TRANSITION — "Let's start with routing, because it has a number attached."

TIME — 2.5 minutes.
-->

---
<!-- version: 1h 2h -->

<!-- _class: dense -->

# Routing the Memory Bank — "Select", With a Number Attached

Read `index.md`, then only the files its table names:

| Route | Task signal | Read |
|---|---|---|
| `general` | Q&A with no project decision | index only |
| `continuation` | resume, next step, handoff | `activeContext.md`, `progress.md` |
| `implementation` | code, configuration, build, test | `techContext.md`, `activeContext.md` |
| `architecture` | design, pattern, migration | `systemPatterns.md`, relevant `decisions/*.md` |

- **Fail open, always** — index missing, routes conflict, a fact not found: read everything and *say so*.
- **Measured today in CopilotAtelier:** 25 audited cases, **0 critical misses, 79 % less context** — up from 56 % in August. The gain grows as the Memory Bank grows.
- **A second eval:** can a fresh Model *pick* the routes from the task text? An extra file only costs tokens; a missing file fails.

<!--
CONTEXT — Routing became the default in CopilotAtelier on 24 Jul 2026. The numbers come from
Test-MemoryBankRouting.ps1, run on 6 Oct 2026: 25 cases, 0 coverage misses, 0 fallback
failures, an average of about 11.9k approximate tokens per task instead of the 55.5k-token full
read (78.6 % less). On 12 Aug 2026 the reduction was 56.1 %. The route-selection eval
(13 Aug 2026) reports pass@k and pass^k.

PRESENT
- Table: four of the routes are enough to show the idea. A build failure pulls techContext and
  activeContext; a design question pulls systemPatterns and one decision record; a general
  question pulls nothing further.
- Bullet 1, the safety rule: a routing miss must never look like an answer. Slower is fine;
  confidently wrong is not.
- Bullet 2: say the numbers slowly. Zero critical misses is the gate; 79 % is the benefit. The
  benefit grew because the full read grew — routing matters more as a project ages.
- Bullet 3: the first test checks the routes themselves; the second checks whether a Model
  chooses them well. A superset is graded as a cost, not a failure; only a dropped file fails.

TRANSITION — "Routing decides what to read. Compaction decides what is left."

TIME — 2 minutes.
-->

---
<!-- version: 1h 2h -->

<!-- _class: dense -->

# Compaction — the Memory Bank Needs an Exit Gate

A long session hits the context limit. The host **replaces the conversation with a summary** — mid-task.

- The summary still says *"Pre-flight ran"* — the Agent believes it holds files it no longer has.
- The only durable write point was the end of the turn — **a compacted turn never reaches it.**

| Mechanism | What it guarantees |
|---|---|
| `SessionStart` Hook | Entry gate: "a Memory Bank exists here" is a fact, not a guess |
| `PreCompact` Hook | Writes a recovery file: branch, commit, changed paths, resume steps |
| Re-sent Instruction | *Distrust the summary, read the recovery file, re-read the index from disk* |

> A `PreCompact` Hook can write a file, but it **cannot put anything into the compacted context**. The state survives on disk; recovery still depends on the Model acting on it.

<!--
CONTEXT — CopilotAtelier Decision 0021 (25 Aug 2026). The recovery file is
.memory-bank/session/compaction-<UTC>Z.md. CopilotAtelier calls it a compaction checkpoint; it
is not the VS Code Checkpoint you restore to undo an Agent's edits.

PRESENT
- Opening: compaction is not an error; it is how long sessions survive. The danger is that it
  is silent.
- Bullet 1: the summary is produced by the truncation. It says what happened, not what the
  Agent still holds in its context window.
- Bullet 2: in this setup, Memory Bank updates happen when the turn closes. A turn compacted in
  the middle never closes the way it planned to.
- Table, row by row: the entry gate already existed (Part 1's Hooks slide). The exit gate is
  the new piece. The Instruction is re-sent with every request, so it survives the truncation
  that the conversation does not.
- Blockquote: be honest about the limit. VS Code's PreCompact event supports only the common
  output format, so the Hook writes state to disk but can't inject it. Recovery is "files plus
  a rule", not magic.

TRANSITION — "Not everything an Agent should remember belongs to the project."

TIME — 2 minutes.
-->

---
<!-- version: 1h 2h -->

<!-- _class: dense -->

# Three Memories, Three Owners

| Memory | Lives in | Owner | Authority |
|---|---|---|---|
| **Project** | `.memory-bank/` in Git | the team, through review | the source of truth for the project |
| **Personal** | a private profile outside every repository | you alone | shapes how answers are pitched, never what is checked |
| **Session** | the recovery file, the current chat | nobody — disposable | a resume anchor, then deleted |
| *Host-native* | the Agent host's memory Tool | the vendor's feature | convenience only |

**This week in CopilotAtelier:** familiarity levels per knowledge area moved into a private profile.

- No host reruns `SessionStart` after compaction → a `PostToolUse` Hook re-sends the levels on the first Tool call after it.
- The architect recommended a Skill; **the human chose the Hook** — at roughly half a second to a second per Tool call.
- Independent review of the first design draft: **2 Blockers, 5 Majors** — all fixed or ruled before implementation.

<!--
CONTEXT — CopilotAtelier Decisions 0027 (30 Sep 2026) and 0028 (6 Oct 2026). This design ran
through exactly the workflow of this talk: an architect interview with sign-off, an
independent review, and Hooks that survive compaction.

PRESENT
- Table: read the Owner column — that is the point of the slide. Each memory has one owner and
  one authority. Mixing them is how personal data ends up in a shared repository.
- Personal row: CopilotAtelier keeps a contributor's familiarity (new, familiar, expert) per
  knowledge area. It changes the wording and depth of answers, never warnings, tests, or
  review. It never enters a repository: a self-assessment stays honest only if no colleague can
  read or edit it.
- Bullet 1: a real engineering constraint. After compaction no Copilot host runs SessionStart
  again, so the levels would silently reset. A PostToolUse Hook re-sends them once, on the
  first Tool call after compaction.
- Bullet 2: the human decision. The architect recommended a cheaper Skill; the contributor chose
  determinism and accepted the measured cost (p95 about 0.6 s in VS Code and 0.85 s in the SDK
  host). The Agent recommended; the human decided.
- Bullet 3: the review found real problems before any code existed — the cheapest moment.

TRANSITION (90 min) — "One more property every shared memory needs: integrity."
TRANSITION (60 min) — "Let's measure a real Memory Bank."

TIME — 2.5 minutes.
-->

---
<!-- version: 2h -->

<!-- _class: dense -->

# Memory Bank Integrity — Trusted State Needs a Boundary

A Memory Bank is durable context the Agent rereads. A bad write can persist
across every future session.

| State | Default write authority | Required control |
|---|---|---|
| Instructions, glossary, project brief | Operator / reviewer | Agent proposes a diff; human approves |
| Active context and progress | shared | narrow path access + review each change |
| External factual claims | Agent may draft | claim provenance + unverified-notes area |
| Prompt history | append-only | no silent rewrite or deletion |
| Recovery copy | outside Agent reach | protected remote / snapshot + restore drill |

> Versioning detects and reverses corruption only if the Agent cannot erase the
> history and someone reviews the diff.

<!--
CONTEXT — 90-minute version only. Reused from the 4h deck. A Memory Bank is durable context:
a wrong or malicious write is re-read by every future session.

PRESENT
- Opening sentence: memory poisoning is one mechanism; the property to protect is integrity.
- Table, top to bottom: the more authority a file has, the fewer writers it should have.
  Instruction files and the project brief: the Agent proposes a diff, a human approves.
  External facts: the Agent may draft, with claim provenance. Prompt history: append-only.
  The recovery copy: outside the Agent's reach.
- Blockquote: versioning helps only if the Agent can't rewrite history and someone reads the
  diff.

TRANSITION — "Enough theory. Let's measure."

TIME — 1.5 minutes.
-->

---
<!-- version: 1h 2h -->

<!-- _class: dense -->

# Live: Measure a Memory Bank

```powershell
$mb = "$HOME/.copilot/skills/memory-bank/scripts"

# Routing: does every task still get the files it needs?
& "$mb/Test-MemoryBankRouting.ps1" -Path C:\Git\CopilotAtelier

# Health: index, metadata, line budgets — on this talk's own repository
& "$mb/Test-MemoryBankHealth.ps1" -Path C:\Git\AgenticOperatingModel
```

**Watch for:** 25 cases, 0 misses, 79 % less context — and a health check that **fails on our own repository**.

Then open the Design Concept the architect just wrote: the engineer reads it **from disk, not from the chat**.

<!--
CONTEXT — Third demo: 4 minutes at 90, 2 minutes at 60. Both scripts are read-only. Paths
assume the default checkouts; adjust them if yours differ.

DO
1. Run the routing check. Read three fields aloud: CaseCount 25, CoverageMisses 0, and
   AverageContextReductionPercent (about 79). It takes about a second.
2. 90 minutes, optional honesty moment: run the health check on the AgenticOperatingModel
   repository. It fails: several core files lack the metadata block, and two are far over
   their line budgets (systemPatterns.md has more than 550 lines against a budget of 110).
   Say: "This is the repository of this talk. I added the index while preparing it, and the
   check still fails. Routing doesn't fix bloat; curation does."
3. Switch to the demo repository and open the Design Concept in .memory-bank/decisions/. Make
   the point: the next Agent reads this file. A subagent never sees our chat, and a compaction
   can drop it.
4. Glance at the engineer's progress; don't interrupt it.

IF IT FAILS — The numbers are on the slide. Show them and move on.

TRANSITION — "The engineer should be done by now. Time to check its work."

TIME — 4 minutes at 90, 2 minutes at 60 (skip step 2).
-->

---
<!-- version: 1h 2h -->

<!-- footer: '4 · Hand off — engineer ↔ security reviewer' -->

<!-- _class: dense -->

# Agent Handoffs Are Declared in Frontmatter

```yaml
---
name: security-reviewer
agents: ['research-analyst']        # the Custom agents it may call as subagents
handoffs:
  - label: Fix Issues Found         # fail path: back to the engineer
    agent: software-engineer
    prompt: Fix the security and quality issues identified in the review above.
    send: false                     # pre-fills the Prompt; you read it and send it
  - label: Document the Change      # pass path: on to the writer
    agent: technical-writer
    prompt: The review above passed. Document the user-visible impact …
    send: true                      # submits as soon as you pick the button
---
```

- **`handoffs`** — buttons offered after a reply: the next Custom agent, with a prepared Prompt
- **`agents`** — which Custom agents this one may call as subagents; `[]` means none
- **`disable-model-invocation: true`** — other Agents can't invoke this one as a subagent

<!--
CONTEXT — The security reviewer's real frontmatter from CopilotAtelier (6 Oct 2026), shortened.
The field meanings follow the VS Code custom agents documentation: handoffs are suggested next
steps shown as buttons after a reply, and send: true auto-submits the Prompt.

PRESENT
- Code block, top to bottom: the name; agents lists whom it may call as a subagent; then two
  Agent handoffs, one per verdict.
- The two send values are the heart of block 4. Pass path: send true — pick the button and the
  writer starts. Fail path: send false — the Prompt is prepared, but you read it and decide.
- Bullet 1: an Agent handoff switches the conversation to another Custom agent. You stay in the
  loop and can edit the Prompt.
- Bullet 2: subagents are different. The current Agent calls them, they run in their own
  context window, and they return a summary. Declaring agents is least privilege for delegation.
- Bullet 3: heavyweight or domain-specific Custom agents set this flag, so no other Agent pulls
  them in by accident.
- If someone attended the 4h workshop: its older version of this slide described agents as
  "who may call me". The documentation says it is "whom this agent may call".

TRANSITION — "Chain four of these together and you get a development cycle."

TIME — 2 minutes.
-->

---
<!-- version: 1h 2h -->

<!-- _class: dense -->

# One Request, Four Custom Agents — the Development Cycle

```text
architect ──▶ engineer ──▶ reviewer ──pass──▶ writer
                 ▲            │
                 └─── fail ───┘     send: false — one human click per fix round
```

- **Opt-in:** `cycle: full` or "full development cycle". *"End-to-end"* or *"ship it"* gets a question, not four Agents.
- **Consent once:** the forward Agent handoffs auto-submit — you asked for the whole chain.
- **State on disk:** the Design Concept lands in `.memory-bank/decisions/`; the engineer reads it from there.
- **One closer:** only the last stage writes the changelog and commits.
- **Outside a cycle:** `review: off | on | auto` — the engineer no longer calls the reviewer on its own judgement, because almost every change matched its risk list.

<!--
CONTEXT — CopilotAtelier, 28 Aug 2026: the opt-in development cycle and the independent review
switch. Roles: the architect writes the Design Concept, the engineer implements and validates,
the security reviewer is the gate, and the technical writer documents and closes out.

PRESENT
- Diagram: forward arrows go ahead as soon as you pick the button, because you started the
  cycle. The only way back to the engineer is the fail arrow, and it waits for you.
- Bullet 1: starting four Agents is expensive, so the trigger is explicit. The architect even
  carries a refusal list: "end-to-end" usually means end-to-end tests.
- Bullet 2: consent at the entry point covers the chain; asking again at every stage would be
  ceremony.
- Bullet 3: block 3 again — files survive compaction and reach subagents; the chat doesn't.
- Bullet 4: four stages would otherwise produce four changelog entries and four commits for
  one change.
- Bullet 5: outside a cycle the default is review off. With it off, the engineer still names
  the risk and recommends a review; it just doesn't spend minutes on one unasked. Why? In an
  agent-customization repository nearly every change touched security, a public contract, or
  an Agent, so "review high-risk work" had quietly become "review everything".

TRANSITION — "Why is the way back gated? Because of fifteen round trips."

TIME — 2.5 minutes.
-->

---
<!-- version: 1h 2h -->

# Fifteen Round Trips

**The setup:** both directions auto-submitted, and the Instructions said *"stop after two rounds"*.

**The result:** 15 complete engineer ↔ reviewer round trips — until the session was abandoned.

**Why the rule could never fire:**

- Each Agent handoff starts the receiving Agent with **fresh context**.
- Neither side can see — let alone count — the rounds before it.
- A limit written in prose is **an instruction with no state behind it**.

> If a loop must end, the bound has to live **outside the Model**.

<!--
CONTEXT — A real failure recorded in CopilotAtelier's changelog (release 5.0.0, entry of
28 Aug 2026): a prose cap plus two mutually auto-submitting Agent handoffs produced fifteen
complete round trips.

PRESENT — Tell it as a story. This is the most memorable slide of the block.
- The setup sounds reasonable: a written cap of two rounds. Most of us would write exactly that.
- Pause on the result: fifteen round trips, stopped by a human walking away.
- Then the why, slowly: each Agent starts fresh. The reviewer doesn't know it is in round
  twelve, and neither does the engineer. Counting needs state, and a sentence has none.
- Blockquote: the general rule for every evaluator–optimizer loop — retries, fix rounds, "keep
  going until the tests pass". Put the limit in structure, configuration, or a Hook; never only
  in a sentence.
- Link to Part 1's vigilance trap: the fix is not "watch the loop more closely". The fix is
  one deliberate click per fix round.

TRANSITION — "So where does the bound live now?"

TIME — 2 minutes.
-->

---
<!-- version: 1h 2h -->

<!-- _class: dense -->

# Bound the Loop in Structure — Then Test the Graph

| Agent handoff | `send` | Effect |
|---|---|---|
| architect → engineer | `true` | submits as soon as you pick it |
| engineer → reviewer | `true` | submits as soon as you pick it |
| reviewer → writer (pass) | `true` | submits as soon as you pick it |
| **reviewer → engineer (fail)** | **`false`** | **pre-filled — you read it and decide** |

```powershell
It 'leaves no cycle in the handoff graph that can close unattended' {
    # A detector that never detects would pass this test silently.
    script:Find-HandoffCycle -Node 'a' -Edge @{ a = 'b'; b = 'a' } |
        Should -Not -BeNullOrEmpty
    # ...then every send: true edge of every Custom agent: no ring allowed
}
```

> `DevelopmentCycle.Tests.ps1` — 20 tests in 2.5 s. A ring of auto-submitting Agent handoffs is now a **failing build**, not a judgement call.

<!--
CONTEXT — The fix that shipped in CopilotAtelier: the asymmetry of the send values is the
bound, and a Pester test walks the whole handoff graph so the ring can't come back unnoticed.
Run on 6 Oct 2026: 20 of 20 tests passed.

PRESENT
- Table: three forward edges are true, one return edge is false. Going forward is cheap and
  safe; re-entering implementation is a decision.
- Code: two ideas in a few lines. First, the test checks its own detector on a known ring,
  a → b → a, because a guard that never fires would pass silently. Second, it builds the graph
  of every auto-submitting Agent handoff in every Custom agent and fails on any cycle.
- Blockquote: the whole lesson of block 4 in one line. The bound lives in configuration, and a
  test protects the configuration.
- Optional: the same test file also checks that the cycle is opt-in, that exactly one stage
  closes out, and that ambiguous phrases don't start it.

TRANSITION (90 min) — "Agent handoff chains are one orchestration pattern of several."
TRANSITION (60 min) — "Let's see the gate in action."

TIME — 2.5 minutes.
-->

---
<!-- version: 2h -->

<!-- _class: dense -->

# Beyond Agent Handoffs — Orchestration Patterns

A sequential handoff (Dev → QA) is one shape. Agents compose in more:

| Pattern | Shape | Use when |
|---|---|---|
| **Routing** | classify, then send to the right specialist | inputs fall into distinct kinds |
| **Parallelization** | split into independent sub-tasks, then merge | the work divides cleanly |
| **Orchestrator–workers** | a lead splits work *it decides* at runtime | you can't pre-list the sub-tasks |
| **Evaluator–optimizer** | one drafts, another critiques, loop | clear quality criteria exist |

### Sub-agents for context isolation

A worker explores in **its own clean window** and returns a **short summary** — the lead never sees the noise. (VS Code now runs parallel agent sessions.)

> Rule of thumb: **don't build an agent when a workflow will do.** Start simple; add structure only when it earns its keep.

<!--
CONTEXT — 90-minute version only. Reused from the 4h deck; the patterns come from Anthropic's
"Building effective agents" (December 2024).

PRESENT
- First line: what we just saw is one shape, a sequential chain.
- Table: the engineer and reviewer pair is the fourth row, evaluator–optimizer. Every loop in
  that row needs a bound outside the Model — the link to the previous slide.
- Sub-agents: they isolate context and return a summary, but they can't interview you. That is
  why the architect is reached through an Agent handoff, not as a subagent.
- Blockquote: start with the simplest structure that works.

TRANSITION — "Now the live run."

TIME — 1.5 minutes.
-->

---
<!-- version: 1h 2h -->

# Live: Engineer → Security Reviewer → Engineer

1. Back to the engineer: the diff, and a probe run that includes the new Tool
2. **Run Security Review** — read the findings
3. **Fix Issues Found** arrives pre-filled and **not sent** — the human click
4. The second review passes → the writer documents and commits
5. `Invoke-Pester DevelopmentCycle.Tests.ps1` — the graph guard, 20 green

> If the first review passes, the interview did its job. The rehearsal branch shows the failed round.

<!--
CONTEXT — Fourth demo: 10 minutes at 90, 6 minutes at 60. Rehearsal branches in the demo
repository: demo/2-implemented, demo/3-review, demo/4-done. At 60 minutes, switch to the
branches from step 2 on.

DO
1. Switch to the engineer's chat. Show the diff in the Source Control view and the probe or
   test run it used to verify the new Tool. Ask the room: "What would you check first?"
2. Take "Run Security Review". Likely findings for an event-log Tool: a free-text log name
   lets the Agent read any log the server's identity can read — including
   PowerShell/Operational, where script-block logging can capture secrets (fix: an
   allow-list); the event message text is untrusted input (fix: truncate it and mark it as
   data); no cap on the number of events (fix: a cap).
3. Take "Fix Issues Found". The Prompt appears in the input box but is not sent. Pause: "This is
   the one place in the cycle where a human decides — not on every Tool call, once per fix
   round." Then send it.
4. After the fix, the engineer hands back for review. On pass, take "Document the Change" and
   let the writer produce the changelog entry and the commit. Show the commit in the git log.
5. In a terminal: Invoke-Pester C:\Git\CopilotAtelier\tests\DevelopmentCycle.Tests.ps1
   -Output Detailed. Show the ring test passing.

IF IT FAILS OR RUNS LONG — Switch to the next rehearsal branch and narrate what the stage
produced. Never wait silently for more than a minute.

TRANSITION — "One thing left: use the Tool."

TIME — 10 minutes at 90, 6 minutes at 60.
-->

---
<!-- version: 1h 2h -->

<!-- footer: 'Close' -->

# Close the Loop — Use the Tool That Did Not Exist an Hour Ago

1. **Restart the MCP server** — the running process still has the old Tool list
2. New chat: *"Which errors did the System log record in the last hour?"*

> A vague idea → a Design Concept → code → review → a commit → **in use**.
> Every step left a file you can read.

<!--
CONTEXT — The payoff of the running example: 2 minutes.

DO
1. MCP server list → agentic-demo-ps → Restart. Show the new Tool in the Tool list.
2. Open a new chat — fresh context, so nothing from the session helps the Agent — and ask the
   question. Approve the call. Read one or two events aloud.

SAY — Walk the trail backwards: the commit, the review findings, the Design Concept in
decisions/, the interview. "Nothing important lived only in the chat."

IF IT FAILS — If the System log has no errors in the last hour, ask for the last 24 hours.

TRANSITION — "Four blocks, several kinds of Customization. Which one when?"

TIME — 2 minutes.
-->

---
<!-- version: 1h 2h -->

# Which Surface for Which Need?

| You need… | Use | Because |
|---|---|---|
| a rule that always applies | **Instruction file** | read on every matching request |
| expertise that is needed sometimes | **Skill** | loaded only when the task matches its description |
| a role with its own Tools, mode, and Agent handoffs | **Custom agent** | its body is the mode — it wins conflicts |
| a guarantee that holds even if the Model disagrees | **Hook** | the host runs it; exit code `2` blocks |
| reach into a system outside the repository | **MCP server** | typed Tools, per-call approval, its own process |
| knowledge that must survive the session | **Memory Bank** | versioned, reviewed, routed |

> Instruction files, Skills, and Custom agents are **text the Model reads**. Hooks and MCP servers are **code the host runs**. Choose by what must hold, not by what is easiest to write.

<!--
CONTEXT — The fifth learning outcome of the abstract: choose the right surface for a recurring
need. Every row appeared in today's demos.

PRESENT
- Read the left column as questions to the room: "You need a rule that always applies — what
  do you use?" Let them answer before you reveal the middle column.
- Row 3 links back to block 2: the Skill lost; the Custom agent won.
- Row 4 links back to block 3: PreCompact and PostToolUse are Hooks.
- Row 5 is block 1; row 6 is block 3.
- Blockquote: the dividing line is enforcement. Text can be ignored; code the host runs can't.
  That is the whole reason Hooks exist.

TRANSITION — "One image to take home."

TIME — 2 minutes.
-->

---
<!-- version: 1h 2h -->

<!-- _class: lead -->

# Sergeant and Commander

> *"The AI is the tactical sergeant on the ground. You are the strategic commander above it."*
> — paraphrased from **Matt Pocock**, *"Claude Code for real engineers"*, 2026

- **Sergeant (AI)** — executes, reports, surfaces casualties (failing tests, broken builds).
- **Commander (you)** — holds the map, sets the objective, decides what counts as victory, owns the consequences.

> Lose the commander and the sergeant still moves — but no longer *toward* anything. That is heteromation by another name.

<!--
CONTEXT — The closing metaphor, reused from the ending of Part 1 (a paraphrase of Matt Pocock,
2026).

PRESENT
- Map today's blocks onto it: the commander answers the grill questions, signs off the
  Design Concept, clicks the fix round, and decides what counts as done. The sergeant does
  everything between those decisions.
- Heteromation: if the human only rubber-stamps, the roles invert and the human becomes the
  machine's tool. Today's gates exist to keep the commander in command.

TRANSITION — "Here is where everything lives."

TIME — 1 minute.
-->

---
<!-- version: 1h 2h -->

# Resources

### This talk

- **Slides, demos, the PowerShell MCP server:** github.com/raandree/AgenticOperatingModel
- **Custom agents, Skills, and Hooks used today:** github.com/raandree/CopilotAtelier
- **Install them from the PowerShell Gallery:** `Install-Module CopilotAtelier`

### Specifications and documentation

- **MCP specification:** modelcontextprotocol.io
- **VS Code custom agents and Agent handoffs:** code.visualstudio.com/docs/agent-customization/custom-agents
- **VS Code Hooks:** code.visualstudio.com/docs/agent-customization/hooks
- **The Lethal trifecta:** simonwillison.net/2025/Jun/16/the-lethal-trifecta

<!--
CONTEXT — Everything shown today is public and MIT-licensed.

PRESENT
- First block: the two repositories. CopilotAtelier installs from the PowerShell Gallery; the
  Custom agents in the demo are software-architect, software-engineer, security-reviewer, and
  technical-writer.
- Second block: the primary sources behind the claims about MCP, Agent handoffs, Hooks, and
  the Lethal trifecta.
- Mention that the published slides carry these speaker notes, so attendees can read the
  reasoning behind every slide.

TRANSITION — "Questions."

TIME — 30 seconds.
-->

---
<!-- version: 1h 2h -->

<!-- _class: lead -->

![center w:150](../../assets/AOM-glyph-on-light.png)

# Questions?

github.com/raandree/AgenticOperatingModel · github.com/raandree/CopilotAtelier

<!--
CONTEXT — Q&A: 4 minutes at 60, 8 minutes at 90.

PREPARED ANSWERS
- "Is MCP safe for production?" — As safe as the identity it runs under and the Tools it
  exposes. Use least privilege, confirm destructive Tools, and never combine the Lethal
  trifecta in one Agent.
- "Does routing ever miss?" — It can. That is why it fails open and is tested: zero critical
  misses on 25 audited cases in CopilotAtelier, plus a separate eval for route selection.
- "Why not let the Agents loop until the tests pass?" — Fifteen round trips. Put the bound in
  structure, not in prose.
- "Do I need all four Custom agents?" — No. Start with one Instruction file and a Memory Bank;
  add the architect when vague requests keep producing rework.
- "Where does host-native memory fit?" — Personal preferences, at most. It is not reviewed or
  versioned, so it never outranks the Memory Bank.
-->
