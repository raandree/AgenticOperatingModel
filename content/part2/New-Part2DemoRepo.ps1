#requires -Version 7.0
<#
.SYNOPSIS
    Creates the demo repository for the Agentic Operating Model, Part 2.

.DESCRIPTION
    Copies the PowerShell MCP demo server into a new Git repository and adds
    everything the live development cycle needs: a workspace MCP configuration
    with an isolated notes store, a routed Memory Bank, a changelog, and a
    Pester baseline the engineer can extend. The result is committed on main as
    the starting point for the demos in content/part2/demo-runbook.md.

    The Memory Bank base is created by the CopilotAtelier memory-bank Skill's
    initializer, which must be installed under ~/.copilot/skills.

.PARAMETER Path
    The folder for the new repository. It must not exist or must be empty.

.EXAMPLE
    .\New-Part2DemoRepo.ps1 -Path C:\Git\aom-part2-demo

    Creates and commits the demo repository in C:\Git\aom-part2-demo.

.OUTPUTS
    PSCustomObject. The repository path, the baseline commit, and the files
    it contains.
#>
[CmdletBinding(SupportsShouldProcess)]
[OutputType([pscustomobject])]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$Path = (Join-Path -Path (Split-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -Parent) -ChildPath 'aom-part2-demo')
)

Set-StrictMode -Version 3.0
$ErrorActionPreference = 'Stop'

$serverDirectory = Join-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -ChildPath 'demos/mcp-demo-server-ps'
$initializerPath = Join-Path -Path $HOME -ChildPath '.copilot/skills/memory-bank/scripts/Initialize-MemoryBank.ps1'
$today = (Get-Date).ToUniversalTime().ToString('yyyy-MM-dd')

foreach ($requiredPath in (Join-Path $serverDirectory 'Start-AgenticDemoMcp.ps1'), (Join-Path $serverDirectory 'probe.ps1'), $initializerPath) {
    if (-not (Test-Path -LiteralPath $requiredPath)) {
        throw "Required file not found: $requiredPath"
    }
}

if (-not (Get-Command -Name git -ErrorAction SilentlyContinue)) {
    throw 'git was not found on PATH.'
}

if ((Test-Path -LiteralPath $Path) -and @(Get-ChildItem -LiteralPath $Path -Force).Count -gt 0) {
    throw "The folder '$Path' already has content. Choose an empty or new folder."
}

$files = [ordered]@{
    'README.md'                        = @'
# PowerShell MCP demo server

The running example of *The Agentic Operating Model, Part 2*: a single-file
MCP server in PowerShell 7 that the live demos extend with new Tools.

## Run it

- VS Code starts the server from `.vscode/mcp.json`; the notes store lives in
  `.demo-store/`.
- `./probe.ps1` speaks the protocol without an MCP client.
- `Invoke-Pester ./tests -Output Detailed` runs the Tool tests.

## Add a Tool

Register it with `Register-McpTool` in `Start-AgenticDemoMcp.ps1`, add a test
to `tests/Server.Tests.ps1`, and restart the server in VS Code.
'@
    'CHANGELOG.md'                     = @'
# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]
'@
    '.gitignore'                       = @'
# Demo notes store (set by .vscode/mcp.json)
.demo-store/

# Local Memory Bank ephemera
.memory-bank/promptHistory.md
.memory-bank/session/
'@
    '.gitattributes'                   = @'
* text=auto eol=lf
*.ps1 text eol=crlf
'@
    '.vscode/mcp.json'                 = @'
{
  "servers": {
    "agentic-demo-ps": {
      "type": "stdio",
      "command": "pwsh",
      "args": [
        "-NoProfile",
        "-NonInteractive",
        "-File",
        "${workspaceFolder}/Start-AgenticDemoMcp.ps1"
      ],
      "env": {
        "AGENTIC_DEMO_DIR": "${workspaceFolder}/.demo-store"
      }
    }
  }
}
'@
    'tests/Server.Tests.ps1'           = @'
#requires -Version 7.0

BeforeAll {
    $script:serverPath = Join-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -ChildPath 'Start-AgenticDemoMcp.ps1'
    $script:storeDirectory = Join-Path -Path ([IO.Path]::GetTempPath()) -ChildPath ('mcp-server-tests-' + [guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $script:storeDirectory | Out-Null

    $startInfo = [System.Diagnostics.ProcessStartInfo]::new((Get-Process -Id $PID).Path)
    foreach ($argument in '-NoProfile', '-NonInteractive', '-File', $script:serverPath, '-Quiet', '-NoColor') {
        $startInfo.ArgumentList.Add($argument)
    }
    $startInfo.Environment['AGENTIC_DEMO_DIR'] = $script:storeDirectory
    $startInfo.RedirectStandardInput = $true
    $startInfo.RedirectStandardOutput = $true
    $startInfo.RedirectStandardError = $true
    $startInfo.UseShellExecute = $false
    $startInfo.StandardInputEncoding = [System.Text.UTF8Encoding]::new($false)
    $startInfo.StandardOutputEncoding = [System.Text.UTF8Encoding]::new($false)
    $script:server = [System.Diagnostics.Process]::Start($startInfo)
    # Drain stderr so a chatty server can never block on a full pipe.
    $script:server.BeginErrorReadLine()
    $script:nextId = 0

    function script:Invoke-McpRequest {
        param(
            [Parameter(Mandatory)]
            [string]$Method,

            [Parameter()]
            $Params
        )

        $script:nextId++
        $message = @{ jsonrpc = '2.0'; id = $script:nextId; method = $Method }
        if ($null -ne $Params) {
            $message.params = $Params
        }

        $script:server.StandardInput.WriteLine(($message | ConvertTo-Json -Compress -Depth 20))
        $script:server.StandardInput.Flush()

        while ($true) {
            $line = $script:server.StandardOutput.ReadLine()
            if ($null -eq $line) {
                throw 'The server closed its standard output.'
            }

            $response = $line | ConvertFrom-Json
            if ($response.PSObject.Properties.Match('id').Count -gt 0 -and $response.id -eq $script:nextId) {
                return $response
            }
        }
    }

    $script:initialize = Invoke-McpRequest -Method 'initialize' -Params @{
        protocolVersion = '2025-06-18'
        capabilities    = @{}
        clientInfo      = @{ name = 'pester'; version = '1.0' }
    }
    $script:server.StandardInput.WriteLine('{"jsonrpc":"2.0","method":"notifications/initialized"}')
    $script:server.StandardInput.Flush()
}

AfterAll {
    if ($script:server -and -not $script:server.HasExited) {
        $script:server.StandardInput.Close()
        if (-not $script:server.WaitForExit(5000)) {
            $script:server.Kill()
        }
    }

    Remove-Item -LiteralPath $script:storeDirectory -Recurse -Force -ErrorAction SilentlyContinue
}

Describe 'Start-AgenticDemoMcp.ps1' {
    It 'completes the initialize handshake' {
        $script:initialize.result.serverInfo.name | Should -Be 'agentic-demo-mcp-ps'
        $script:initialize.result.protocolVersion | Should -Not -BeNullOrEmpty
    }

    It 'lists every Tool with a description and an object input schema' {
        $tools = @((Invoke-McpRequest -Method 'tools/list').result.tools)

        $tools.Count | Should -BeGreaterOrEqual 7
        $tools.name | Should -Contain 'notes_add'
        foreach ($tool in $tools) {
            $tool.description | Should -Not -BeNullOrEmpty
            $tool.inputSchema.type | Should -Be 'object'
        }
    }

    It 'adds a note and deletes exactly that note in an isolated store' {
        $added = Invoke-McpRequest -Method 'tools/call' -Params @{ name = 'notes_add'; arguments = @{ text = 'pester note' } }
        $added.result.content[0].text -match 'Added note #(\d+)' | Should -BeTrue
        $noteId = [int]$Matches[1]

        $deleted = Invoke-McpRequest -Method 'tools/call' -Params @{ name = 'notes_delete'; arguments = @{ id = $noteId } }
        $deleted.result.content[0].text | Should -Be "Deleted note #$noteId."
    }
}
'@
    '.memory-bank/projectbrief.md'     = @"
---
status: current
last-verified: $today
owner: shared
source: repository evidence
---

# Project brief

## Purpose

A single-file PowerShell MCP server, used as the running example of *The
Agentic Operating Model, Part 2*. The live demos extend it with new Tools
through the full development cycle.

## Scope

- In scope: Tools in ``Start-AgenticDemoMcp.ps1``, the ``probe.ps1`` smoke
  test, and the Pester tests in ``tests/``.
- Out of scope: authentication, remote transports, and production use.

## Stakeholders

- The presenter, who runs and extends the demo.

## Acceptance criteria

1. ``tests/Server.Tests.ps1`` passes.
2. ``probe.ps1`` exits with code 0.
3. Every Tool declares a description and an input schema.
"@
    '.memory-bank/productContext.md'   = @"
---
status: current
last-verified: $today
owner: shared
source: repository evidence
---

# Product context

## Problem

Audiences treat MCP as magic. A server small enough to read on a projector
shows the whole protocol.

## Users

- Attendees watching the demo
- The presenter, extending the server live

## Core workflows

1. VS Code starts the server over stdio, and the Agent calls its Tools.
2. ``probe.ps1`` exercises the protocol without an MCP client.

## Experience goals

- Readable on a projector: one script, no SDK, no build step.
"@
    '.memory-bank/techContext.md'      = @"
---
status: current
last-verified: $today
owner: active-agent
source: repository evidence
---

# Tech context

## Stack

- PowerShell 7 or later, JSON-RPC 2.0 over stdio, MCP protocol version
  2025-06-18.

## Environment

- Windows for the ``system_*`` Tools, which use CIM; the ``notes_*`` Tools are
  cross-platform.
- Notes store: ``notes.json`` in ``AGENTIC_DEMO_DIR``, set to ``.demo-store/``
  by ``.vscode/mcp.json``.

## Constraints

- stdout carries only JSON-RPC messages; all logging goes to stderr.
- Every Tool is registered with ``Register-McpTool``: a name, a description, a
  JSON Schema, and a script block.

## Validation

- ``Invoke-Pester ./tests -Output Detailed``
- ``./probe.ps1``
"@
    '.memory-bank/systemPatterns.md'   = @"
---
status: current
last-verified: $today
owner: shared
source: repository evidence
---

# System patterns

## Architecture

One script holds a Tool registry (``Register-McpTool``), the JSON-RPC plumbing
(``Send-McpResponse``, ``Send-McpNotification``), and a dispatcher
(``Invoke-McpRequest``) for ``initialize``, ``tools/list``, and ``tools/call``.

## Decisions

Durable choices live in ``decisions/``, one record per file.
"@
}

if (-not $PSCmdlet.ShouldProcess($Path, 'Create the Part 2 demo repository')) {
    return
}

New-Item -ItemType Directory -Path $Path -Force | Out-Null
Copy-Item -LiteralPath (Join-Path $serverDirectory 'Start-AgenticDemoMcp.ps1'), (Join-Path $serverDirectory 'probe.ps1') -Destination $Path

foreach ($relativePath in $files.Keys) {
    $targetPath = Join-Path -Path $Path -ChildPath $relativePath
    New-Item -ItemType Directory -Path (Split-Path -Path $targetPath -Parent) -Force | Out-Null
    $content = ($files[$relativePath] -replace "`r`n", "`n").TrimEnd("`n") + "`n"
    # Match .gitattributes: PowerShell files use CRLF, everything else LF.
    if ($relativePath -like '*.ps1') {
        $content = $content -replace "`n", "`r`n"
    }

    [IO.File]::WriteAllText($targetPath, $content, [Text.UTF8Encoding]::new($false))
}

# Creates the remaining canonical files (index, activeContext, progress,
# promptHistory) and preserves the four written above.
& $initializerPath -Path $Path | Out-Null

Push-Location -LiteralPath $Path
try {
    git init --quiet --initial-branch=main
    if ($LASTEXITCODE -ne 0) { throw 'git init failed.' }

    git add --all
    git commit --quiet --message 'chore: create the Part 2 demo baseline'
    if ($LASTEXITCODE -ne 0) { throw 'The baseline commit failed. Check git user.name and user.email.' }

    $commit = (git rev-parse --short HEAD).Trim()
    $trackedFiles = @(git ls-files)
}
finally {
    Pop-Location
}

[pscustomobject]@{
    Path         = (Resolve-Path -LiteralPath $Path).Path
    Branch       = 'main'
    Commit       = $commit
    TrackedFiles = $trackedFiles
}
