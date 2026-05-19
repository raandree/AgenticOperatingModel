#requires -Version 7.0
<#
.SYNOPSIS
    Agentic Operating Model - Demo MCP Server (PowerShell edition).

.DESCRIPTION
    A minimal Model Context Protocol server speaking JSON-RPC 2.0 over stdio.
    Mirrors the Node.js reference server in the sibling folder, but written in
    pure PowerShell so it can be presented at a PowerShell conference without
    a Node.js dependency.

    Two tool families:
      notes_*  -> persistence the LLM does not have (JSON file on disk)
      system_* -> reach into the host the LLM does not have (native cmdlets)

    Transport: stdio. No auth, no network. Teaching prop, not production code.
#>
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

# Force UTF-8 (no BOM) on stdio so JSON survives the round trip.
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)
[Console]::InputEncoding  = [System.Text.UTF8Encoding]::new($false)

# ---------- notes store ----------
$script:StoreDir = if ($env:AGENTIC_DEMO_DIR) {
    $env:AGENTIC_DEMO_DIR
} elseif ($env:LOCALAPPDATA) {
    Join-Path $env:LOCALAPPDATA 'AgenticDemoMcp'
} else {
    Join-Path $HOME '.local/share/AgenticDemoMcp'
}
$script:StoreFile = Join-Path $script:StoreDir 'notes.json'

function Get-Notes {
    if (-not (Test-Path -LiteralPath $script:StoreFile)) { return @() }
    try {
        $raw = Get-Content -LiteralPath $script:StoreFile -Raw -Encoding utf8
        if ([string]::IsNullOrWhiteSpace($raw)) { return @() }
        $parsed = $raw | ConvertFrom-Json
        # ConvertFrom-Json returns $null for empty array; force to array.
        return @($parsed)
    } catch {
        return @()
    }
}

function Save-Notes {
    param([object[]] $Notes)
    if (-not (Test-Path -LiteralPath $script:StoreDir)) {
        New-Item -ItemType Directory -Path $script:StoreDir -Force | Out-Null
    }
    $json = (@($Notes) | ConvertTo-Json -Depth 5)
    if ($null -eq $json) { $json = '[]' }
    Set-Content -LiteralPath $script:StoreFile -Value $json -Encoding utf8
}

# ---------- helpers ----------
function New-TextResult {
    param([string] $Text)
    [ordered]@{
        content = @(
            [ordered]@{ type = 'text'; text = [string]$Text }
        )
    }
}

function Write-Log {
    param([string] $Message)
    [Console]::Error.WriteLine("[agentic-demo-mcp-ps] $Message")
}

# ---------- tool implementations ----------
function Invoke-NotesAdd {
    param([hashtable] $Arguments)
    $text = [string]$Arguments.text
    if ([string]::IsNullOrWhiteSpace($text)) { throw "Parameter 'text' is required." }
    $notes  = @(Get-Notes)
    $nextId = if ($notes.Count -gt 0) { ([int]($notes[-1].id)) + 1 } else { 1 }
    $note   = [ordered]@{
        id      = $nextId
        text    = $text
        created = (Get-Date).ToUniversalTime().ToString('o')
    }
    $notes += [pscustomobject]$note
    Save-Notes -Notes $notes
    New-TextResult "Added note #$nextId. Total notes: $($notes.Count). Stored at $script:StoreFile"
}

function Invoke-NotesList {
    $notes = @(Get-Notes)
    if ($notes.Count -eq 0) { return (New-TextResult '(no notes yet)') }
    $lines = $notes | ForEach-Object { "#$($_.id) [$($_.created)] $($_.text)" }
    New-TextResult (($lines) -join "`n")
}

function Invoke-NotesSearch {
    param([hashtable] $Arguments)
    $query = [string]$Arguments.query
    if ([string]::IsNullOrWhiteSpace($query)) { throw "Parameter 'query' is required." }
    $q    = $query.ToLowerInvariant()
    $hits = @(Get-Notes) | Where-Object { $_.text.ToLowerInvariant().Contains($q) }
    if (-not $hits) { return (New-TextResult "No notes match `"$query`".") }
    $lines = $hits | ForEach-Object { "#$($_.id) $($_.text)" }
    New-TextResult (($lines) -join "`n")
}

function Invoke-NotesDelete {
    param([hashtable] $Arguments)
    if (-not $Arguments.ContainsKey('id')) { throw "Parameter 'id' is required." }
    $id     = [int]$Arguments.id
    $notes  = @(Get-Notes)
    $before = $notes.Count
    $kept   = @($notes | Where-Object { [int]$_.id -ne $id })
    Save-Notes -Notes $kept
    if ($before -eq $kept.Count) { New-TextResult "No note with id $id." }
    else                         { New-TextResult "Deleted note #$id." }
}

function Invoke-SystemOsInfo {
    if ($IsWindows -or $null -eq $IsWindows) {
        $os = Get-CimInstance Win32_OperatingSystem
        $uptime = (Get-Date) - $os.LastBootUpTime
        $obj = [pscustomobject]@{
            Caption  = $os.Caption
            Version  = $os.Version
            Build    = $os.BuildNumber
            Uptime   = ('{0}.{1:hh\:mm\:ss}' -f $uptime.Days, $uptime)
            Hostname = $env:COMPUTERNAME
            User     = $env:USERNAME
        }
    } else {
        $obj = [pscustomobject]@{
            Caption  = [System.Runtime.InteropServices.RuntimeInformation]::OSDescription
            Version  = [System.Environment]::OSVersion.VersionString
            Build    = ''
            Uptime   = ''
            Hostname = [System.Net.Dns]::GetHostName()
            User     = $env:USER
        }
    }
    New-TextResult (($obj | Format-List | Out-String).TrimEnd())
}

function Invoke-SystemDiskFree {
    if ($IsWindows -or $null -eq $IsWindows) {
        $rows = Get-CimInstance Win32_LogicalDisk -Filter 'DriveType=3' |
            Select-Object DeviceID,
                @{n='SizeGB'; e={[math]::Round($_.Size/1GB,2)}},
                @{n='FreeGB'; e={[math]::Round($_.FreeSpace/1GB,2)}}
    } else {
        $rows = Get-PSDrive -PSProvider FileSystem | Select-Object Name,
            @{n='SizeGB'; e={[math]::Round(($_.Used + $_.Free)/1GB,2)}},
            @{n='FreeGB'; e={[math]::Round($_.Free/1GB,2)}}
    }
    New-TextResult (($rows | Format-Table -AutoSize | Out-String).TrimEnd())
}

function Invoke-SystemTopProcesses {
    param([hashtable] $Arguments)
    $count = if ($Arguments.ContainsKey('count')) { [int]$Arguments.count } else { 5 }
    if ($count -lt 1)  { $count = 1 }
    if ($count -gt 50) { $count = 50 }
    $rows = Get-Process | Sort-Object WS -Descending | Select-Object -First $count Name, Id,
        @{n='MemMB'; e={[math]::Round($_.WS/1MB,1)}}
    New-TextResult (($rows | Format-Table -AutoSize | Out-String).TrimEnd())
}

# ---------- tool registry ----------
$script:Tools = @(
    [ordered]@{
        name        = 'notes_add'
        description = 'Append a note to the persistent demo notes store. Returns the new note id.'
        inputSchema = [ordered]@{
            type       = 'object'
            properties = [ordered]@{ text = [ordered]@{ type = 'string'; minLength = 1; description = 'Note body' } }
            required   = @('text')
        }
        handler     = { param($a) Invoke-NotesAdd -Arguments $a }
    },
    [ordered]@{
        name        = 'notes_list'
        description = 'List all notes in the persistent demo notes store.'
        inputSchema = [ordered]@{ type = 'object'; properties = [ordered]@{} }
        handler     = { param($a) Invoke-NotesList }
    },
    [ordered]@{
        name        = 'notes_search'
        description = 'Case-insensitive substring search across all notes.'
        inputSchema = [ordered]@{
            type       = 'object'
            properties = [ordered]@{ query = [ordered]@{ type = 'string'; minLength = 1; description = 'Search substring' } }
            required   = @('query')
        }
        handler     = { param($a) Invoke-NotesSearch -Arguments $a }
    },
    [ordered]@{
        name        = 'notes_delete'
        description = 'Delete a note by its id.'
        inputSchema = [ordered]@{
            type       = 'object'
            properties = [ordered]@{ id = [ordered]@{ type = 'integer'; minimum = 1; description = 'Note id to delete' } }
            required   = @('id')
        }
        handler     = { param($a) Invoke-NotesDelete -Arguments $a }
    },
    [ordered]@{
        name        = 'system_os_info'
        description = 'Report basic operating system info (name, version, uptime) from the host.'
        inputSchema = [ordered]@{ type = 'object'; properties = [ordered]@{} }
        handler     = { param($a) Invoke-SystemOsInfo }
    },
    [ordered]@{
        name        = 'system_disk_free'
        description = 'Report free space on all fixed disks of the host.'
        inputSchema = [ordered]@{ type = 'object'; properties = [ordered]@{} }
        handler     = { param($a) Invoke-SystemDiskFree }
    },
    [ordered]@{
        name        = 'system_top_processes'
        description = 'Return the top N processes by working-set memory on the host.'
        inputSchema = [ordered]@{
            type       = 'object'
            properties = [ordered]@{ count = [ordered]@{ type = 'integer'; minimum = 1; maximum = 50; default = 5; description = 'How many processes to return' } }
        }
        handler     = { param($a) Invoke-SystemTopProcesses -Arguments $a }
    }
)

# ---------- JSON-RPC plumbing ----------
function ConvertTo-Hashtable {
    param($InputObject)
    if ($null -eq $InputObject) { return @{} }
    if ($InputObject -is [hashtable]) { return $InputObject }
    $h = @{}
    foreach ($p in $InputObject.PSObject.Properties) { $h[$p.Name] = $p.Value }
    $h
}

function Send-Message {
    param([object] $Message)
    $json = $Message | ConvertTo-Json -Depth 20 -Compress
    [Console]::Out.WriteLine($json)
    [Console]::Out.Flush()
}

function Send-Result {
    param($Id, $Result)
    Send-Message ([ordered]@{ jsonrpc = '2.0'; id = $Id; result = $Result })
}

function Send-Error {
    param($Id, [int] $Code, [string] $Message)
    Send-Message ([ordered]@{ jsonrpc = '2.0'; id = $Id; error = [ordered]@{ code = $Code; message = $Message } })
}

function Invoke-Method {
    param([string] $Method, $Params, $Id)

    switch ($Method) {
        'initialize' {
            Send-Result -Id $Id -Result ([ordered]@{
                protocolVersion = '2025-06-18'
                capabilities    = [ordered]@{ tools = [ordered]@{} }
                serverInfo      = [ordered]@{ name = 'agentic-demo-mcp-ps'; version = '0.1.0' }
            })
        }
        'tools/list' {
            $list = $script:Tools | ForEach-Object {
                [ordered]@{ name = $_.name; description = $_.description; inputSchema = $_.inputSchema }
            }
            Send-Result -Id $Id -Result ([ordered]@{ tools = @($list) })
        }
        'tools/call' {
            $p = ConvertTo-Hashtable $Params
            $name = [string]$p.name
            $tool = $script:Tools | Where-Object { $_.name -eq $name } | Select-Object -First 1
            if (-not $tool) {
                Send-Error -Id $Id -Code -32602 -Message "Unknown tool: $name"
                return
            }
            $argsHash = ConvertTo-Hashtable $p.arguments
            try {
                $result = & $tool.handler $argsHash
                Send-Result -Id $Id -Result $result
            } catch {
                Send-Result -Id $Id -Result ([ordered]@{
                    isError = $true
                    content = @(@{ type = 'text'; text = "Tool '$name' failed: $($_.Exception.Message)" })
                })
            }
        }
        'ping' {
            Send-Result -Id $Id -Result ([ordered]@{})
        }
        default {
            if ($null -ne $Id) {
                Send-Error -Id $Id -Code -32601 -Message "Method not found: $Method"
            }
        }
    }
}

# ---------- boot ----------
Write-Log "ready. notes store: $script:StoreFile"

while ($true) {
    $line = [Console]::In.ReadLine()
    if ($null -eq $line) { break }   # stdin closed
    if ([string]::IsNullOrWhiteSpace($line)) { continue }

    try {
        $msg = $line | ConvertFrom-Json
    } catch {
        Send-Error -Id $null -Code -32700 -Message "Parse error: $($_.Exception.Message)"
        continue
    }

    $method = [string]$msg.method
    $id     = if ($msg.PSObject.Properties.Name -contains 'id') { $msg.id } else { $null }

    # Notifications (no id) get no response.
    if ($null -eq $id) {
        if ($method -eq 'notifications/initialized') { continue }
        # silently ignore other notifications
        continue
    }

    try {
        Invoke-Method -Method $method -Params $msg.params -Id $id
    } catch {
        Send-Error -Id $id -Code -32603 -Message "Internal error: $($_.Exception.Message)"
    }
}

