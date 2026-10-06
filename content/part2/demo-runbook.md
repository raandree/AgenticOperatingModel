# Part 2 demo runbook

Setup, exact prompts, expected results, and fallbacks for the five live demos
in the Part 2 deck. Keep this page open on a second screen during the talk.

## The evening before

1. Create the demo repository next to this one. The script refuses to touch a
   folder that already has content.

   ```powershell
   .\New-Part2DemoRepo.ps1 -Path C:\Git\aom-part2-demo
   ```

2. Open `C:\Git\aom-part2-demo` in VS Code and trust the workspace. Run
   **MCP: List Servers**, start `agentic-demo-ps`, and check that seven Tools
   appear. Then ask the Agent once, *"Add a note saying buy milk"*, so the store
   holds note #1 for the delete step in demo 1.
3. Confirm the four Custom agents from CopilotAtelier are in the agent picker:
   `software-architect`, `software-engineer`, `security-reviewer`, and
   `technical-writer`.
4. Rehearse the whole development cycle once on a rehearsal branch, and keep a
   branch per stage as the fallback for the live run:

   ```powershell
   git switch -c rehearsal
   # after the architect's sign-off:       git add -A; git commit -m "demo: design concept"; git branch demo/1-concept
   # after the engineer's green run:        git add -A; git commit -m "demo: implementation";  git branch demo/2-implemented
   # after the first review's findings:     git add -A; git commit -m "demo: review findings"; git branch demo/3-review
   # after the writer's close-out commit:   git branch demo/4-done
   git switch main
   ```

5. Check that the System log has errors to show in the close:

   ```powershell
   Get-WinEvent -FilterHashtable @{ LogName = 'System'; Level = 1, 2; StartTime = (Get-Date).AddDays(-1) } -MaxEvents 5
   ```

6. Run the three read-only checks once, so nothing surprises you on stage:

   ```powershell
   $mb = "$HOME/.copilot/skills/memory-bank/scripts"
   & "$mb/Test-MemoryBankRouting.ps1" -Path C:\Git\CopilotAtelier
   & "$mb/Test-MemoryBankHealth.ps1" -Path C:\Git\AgenticOperatingModel
   Invoke-Pester C:\Git\CopilotAtelier\tests\DevelopmentCycle.Tests.ps1 -Output Detailed
   ```

7. Close the decks in PowerPoint before you rebuild them, set the editor font
   size for the room, and turn off notifications.

## Demo 1: Seven Tools, one PowerShell script (slide 9)

| Step | Action | Expect |
| --- | --- | --- |
| 1 | Open `Start-AgenticDemoMcp.ps1`; search `function Register-McpTool`, `'tools/call'`, `function Send-McpFrame` | A Tool is a list entry; one dispatcher; one writer to stdout |
| 2 | `$env:AGENTIC_DEMO_DIR = "$PWD\.demo-store"; .\probe.ps1` in the demo repository | `INIT`, `TOOLS`, `ADD` … `DEL` lines with the server's stderr log in between |
| 3 | Agent mode: *"What are the top 3 processes by memory right now?"* | A `system_top_processes` call to approve, then the answer |
| 4 | 90 minutes only: *"Delete note 1."* | A confirmation dialog; discuss before approving |

The probe deletes only the note it creates, so it is safe on the store that
VS Code uses, and setting `AGENTIC_DEMO_DIR` points it at that same store.

**If it fails:** the probe output from step 2 shows the same protocol. Say so
and move on.

## Demo 2: From a vague idea to a Design Concept (slide 14)

Select `software-architect` and send:

```text
cycle: full — add a Tool to the PowerShell MCP server that shows
recent errors from the Windows event log
```

- Expect the architect to announce its interview depth first, most likely the
  named subset for a contained change.
- Answers that keep the demo short: System and Application logs only; errors
  and critical events only; the last hour by default; at most 50 events;
  message text truncated; Windows only, with a clear error elsewhere;
  read-only.
- Answer one question with `not sure, you pick` and point out the flagged
  assumption in the Design Concept.
- When asked about the Security log, decide not to run the server elevated.
- Sign off, open `.memory-bank/decisions/`, then take the *Implement the
  Design Concept* handoff and return to the slides.

**If it fails or runs long:** `git switch demo/1-concept` and take the handoff
from the rehearsal's Design Concept.

## Demo 3: Measure a Memory Bank (slide 21)

```powershell
$mb = "$HOME/.copilot/skills/memory-bank/scripts"
& "$mb/Test-MemoryBankRouting.ps1" -Path C:\Git\CopilotAtelier
& "$mb/Test-MemoryBankHealth.ps1" -Path C:\Git\AgenticOperatingModel
```

- Routing, measured on 6 Oct 2026: `CaseCount` 25, `CoverageMisses` 0,
  `AverageContextReductionPercent` 78.57.
- Health (90 minutes only): `Passed` is `False` — missing metadata in the core
  files and line budgets exceeded, including `systemPatterns.md`.
- Then open the Design Concept in the demo repository: the engineer reads it
  from disk.

**If it fails:** the numbers are on the slide.

## Demo 4: Engineer, security reviewer, engineer (slide 27)

1. Show the engineer's diff in the Source Control view and the probe or Pester
   run it used to verify the new Tool.
2. Take *Run Security Review*. Findings to expect for an event-log Tool:
   - a free-text log name reads any log the server's identity can read,
     including `Microsoft-Windows-PowerShell/Operational`, where script-block
     logging can capture secrets; fix with an allow-list
   - event message text is untrusted input; truncate it and mark it as data
   - no cap on the number of events; add one
3. Take *Fix Issues Found*. The Prompt is pre-filled and not sent: this is the
   human click. Send it.
4. After the second review passes, take *Document the Change*; the writer
   writes the changelog entry and the commit.
5. Run the graph guard:

   ```powershell
   Invoke-Pester C:\Git\CopilotAtelier\tests\DevelopmentCycle.Tests.ps1 -Output Detailed
   ```

**If the first review passes:** the interview did its job. Show the failed round
with `git switch demo/3-review`.

**If a stage runs long:** switch to the next rehearsal branch and narrate it.
Never wait silently for more than a minute.

## Demo 5: Close the loop (slide 28)

1. **MCP: List Servers** → `agentic-demo-ps` → **Restart**; the new Tool now
   appears in the list.
2. In a new chat: *"Which errors did the System log record in the last hour?"*
   If the hour is quiet, ask for the last 24 hours.

## After the talk

```powershell
Set-Location C:\Git\aom-part2-demo
git switch main
git branch --list 'demo/*'   # keep or delete the rehearsal branches
```

The demo repository is disposable; delete the folder when you no longer need
it.

## See also

- [Part 2 overview and agenda](README.md)
- [PowerShell MCP demo server](../demos/mcp-demo-server-ps/README.md)
