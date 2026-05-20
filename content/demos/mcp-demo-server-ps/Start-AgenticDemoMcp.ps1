#requires -Version 7.0
<#
.SYNOPSIS
    Agentic Operating Model demo MCP server, implemented in pure PowerShell.

.DESCRIPTION
    Speaks the Model Context Protocol (JSON-RPC 2.0 over stdio) directly, with no
    SDK dependency. Designed as a teaching prop for a PowerShell-conference demo:

    - notes_*  -> persistence the LLM does not have (JSON file on disk).
    - system_* -> reach into the host the LLM does not have (CIM / Get-Process).

    All human-readable output goes to STDERR; STDOUT is reserved for newline-
    delimited JSON-RPC frames. Toggle verbosity with -Quiet or
    $env:AGENTIC_DEMO_VERBOSE=0; disable ANSI color with -NoColor or
    $env:AGENTIC_DEMO_NO_COLOR=1.

.PARAMETER StorePath
    Override the notes store location. Defaults to
    $env:AGENTIC_DEMO_DIR\notes.json, then $env:LOCALAPPDATA\AgenticDemoMcp\notes.json.

.PARAMETER Quiet
    Suppress per-call STEP/DEBUG lines on stderr (errors/warnings still shown).

.PARAMETER NoColor
    Disable ANSI color escape sequences in stderr logging.

.EXAMPLE
    pwsh -NoProfile -File .\Start-AgenticDemoMcp.ps1

    Run the server. Wire it into VS Code via mcp.example.json.

.EXAMPLE
    .\probe.ps1

    Smoke test the server end-to-end without an MCP client.

.NOTES
    Author : Agentic Operating Model workshop
    Demo   : PowerShell-native MCP server, single file, no dependencies.
#>
[CmdletBinding()]
param(
    [Parameter()]
    [string]$StorePath,

    [Parameter()]
    [switch]$Quiet,

    [Parameter()]
    [switch]$NoColor
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version 3.0

# ---------- stdio hygiene ----------
# STDOUT carries JSON-RPC frames only; everything else must go to STDERR.
# Force UTF-8 so non-ASCII tool output survives the wire.
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)
[Console]::InputEncoding = [System.Text.UTF8Encoding]::new($false)

# ---------- logging ----------
$script:Verbose = ($env:AGENTIC_DEMO_VERBOSE -ne '0') -and -not $Quiet
$script:UseColor = ($env:AGENTIC_DEMO_NO_COLOR -ne '1') -and -not $NoColor
$script:Color = if ($script:UseColor) {
    @{
        Dim = "`e[2m"; Reset = "`e[0m"; Bold = "`e[1m"
        Cyan = "`e[36m"; Green = "`e[32m"; Yellow = "`e[33m"
        Red = "`e[31m"; Magenta = "`e[35m"
    }
}
else {
    @{ Dim = ''; Reset = ''; Bold = ''; Cyan = ''; Green = ''; Yellow = ''; Red = ''; Magenta = '' }
}

function Write-McpLog {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateSet('info', 'ok', 'warn', 'err', 'debug', 'step')]
        [string]$Level,

        [Parameter(Mandatory, ValueFromPipeline)]
        [string]$Message
    )
    process {
        if (-not $script:Verbose -and ($Level -in @('debug', 'step'))) { return }
        $c = $script:Color
        $tag = switch ($Level) {
            'info' { "$($c.Cyan)INFO $($c.Reset)" }
            'ok' { "$($c.Green)OK   $($c.Reset)" }
            'warn' { "$($c.Yellow)WARN $($c.Reset)" }
            'err' { "$($c.Red)ERR  $($c.Reset)" }
            'debug' { "$($c.Magenta)DEBUG$($c.Reset)" }
            'step' { "$($c.Dim)STEP $($c.Reset)" }
        }
        $stamp = (Get-Date).ToString('HH:mm:ss.fff')
        [Console]::Error.WriteLine("$($c.Dim)$stamp$($c.Reset) $tag $Message")
    }
}

function Format-McpSummary {
    [CmdletBinding()]
    [OutputType([string])]
    param(
        [Parameter(Mandatory)]
        [AllowNull()]
        $Value,

        [int]$MaxLength = 120
    )
    $text = if ($null -eq $Value) {
        'null'
    }
    elseif ($Value -is [string]) {
        $Value
    }
    else {
        try { $Value | ConvertTo-Json -Compress -Depth 6 } catch { "$Value" }
    }
    $text = ($text -replace '\s+', ' ')
    if ($text.Length -gt $MaxLength) { $text.Substring(0, $MaxLength) + [char]0x2026 } else { $text }
}

# ---------- notes store ----------
if (-not $StorePath) {
    $dir = if ($env:AGENTIC_DEMO_DIR) {
        $env:AGENTIC_DEMO_DIR
    }
    elseif ($env:LOCALAPPDATA) {
        Join-Path $env:LOCALAPPDATA 'AgenticDemoMcp'
    }
    else {
        Join-Path $HOME '.local/share/AgenticDemoMcp'
    }
    $StorePath = Join-Path $dir 'notes.json'
}
$script:StorePath = $StorePath

function Get-NoteStore {
    [CmdletBinding()]
    [OutputType([object[]])]
    param()
    if (-not (Test-Path -LiteralPath $script:StorePath)) { return @() }
    try {
        $raw = Get-Content -LiteralPath $script:StorePath -Raw -Encoding utf8
        if ([string]::IsNullOrWhiteSpace($raw)) { return @() }
        # -DateKind String (PS 7.5+) keeps ISO timestamps as strings instead of
        # auto-coercing them to [datetime] (which then re-formats in local culture).
        $convertParams = @{ ErrorAction = 'Stop' }
        if ((Get-Command ConvertFrom-Json).Parameters.ContainsKey('DateKind')) {
            $convertParams.DateKind = 'String'
        }
        $parsed = $raw | ConvertFrom-Json @convertParams
        return @($parsed)
    }
    catch {
        Write-McpLog warn "notes store unreadable, starting empty: $_"
        return @()
    }
}

function Save-NoteStore {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [AllowEmptyCollection()]
        [object[]]$Notes
    )
    $dir = Split-Path -Parent $script:StorePath
    if (-not (Test-Path -LiteralPath $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
    ($Notes | ConvertTo-Json -Depth 6) | Set-Content -LiteralPath $script:StorePath -Encoding utf8
}

# ---------- powershell child helper (kept for symmetry with the Node version) ----------
function Invoke-DemoScriptBlock {
    [CmdletBinding()]
    [OutputType([string])]
    param(
        [Parameter(Mandatory)]
        [scriptblock]$ScriptBlock,

        [Parameter()]
        [hashtable]$ProgressContext
    )
    if ($ProgressContext) {
        & $ProgressContext.Log "evaluating scriptblock ($($ScriptBlock.ToString().Length) chars)"
    }
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    try {
        $result = & $ScriptBlock
    }
    finally {
        $sw.Stop()
        if ($ProgressContext) {
            & $ProgressContext.Log ('scriptblock done in {0} ms' -f $sw.ElapsedMilliseconds)
        }
    }
    if ($null -eq $result) { return '' }
    return ($result | Out-String).Trim()
}

function New-McpTextResult {
    [CmdletBinding()]
    [OutputType([hashtable])]
    param(
        [Parameter(Mandatory)]
        [AllowEmptyString()]
        [string]$Text
    )
    @{ content = @( @{ type = 'text'; text = $Text } ) }
}

# ---------- tool registry ----------
# Each tool: name, description, inputSchema (JSON Schema), handler scriptblock.
# Handler receives a hashtable: @{ Arguments=<hashtable>; Progress=<scriptblock>; Log=<scriptblock> }.
$script:Tools = [System.Collections.Generic.List[object]]::new()

function Register-McpTool {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [string]$Name,
        [Parameter(Mandatory)] [string]$Description,
        [Parameter(Mandatory)] [hashtable]$InputSchema,
        [Parameter(Mandatory)] [scriptblock]$Handler
    )
    $script:Tools.Add([pscustomobject]@{
            Name        = $Name
            Description = $Description
            InputSchema = $InputSchema
            Handler     = $Handler
        })
}

# Empty-object JSON Schema used for tools with no parameters.
$emptySchema = @{ type = 'object'; properties = @{}; additionalProperties = $false }

Register-McpTool -Name 'notes_add' `
    -Description 'Append a note to the persistent demo notes store. Returns the new note id.' `
    -InputSchema @{
    type                 = 'object'
    properties           = @{ text = @{ type = 'string'; minLength = 1; description = 'Note body' } }
    required             = @('text')
    additionalProperties = $false
} `
    -Handler {
    param($ctx)
    & $ctx.Progress 'loading store' 3
    $notes = @(Get-NoteStore)
    & $ctx.Progress "store has $($notes.Count) note(s)" 3
    $nextId = if ($notes.Count -eq 0) { 1 } else { ([int]($notes[-1].id)) + 1 }
    $notes += [pscustomobject]@{
        id      = $nextId
        text    = [string]$ctx.Arguments.text
        created = (Get-Date).ToUniversalTime().ToString('o')
    }
    Save-NoteStore -Notes $notes
    & $ctx.Progress "saved note #$nextId" 3
    New-McpTextResult -Text "Added note #$nextId. Total notes: $($notes.Count). Stored at $script:StorePath"
}

Register-McpTool -Name 'notes_list' `
    -Description 'List all notes in the persistent demo notes store.' `
    -InputSchema $emptySchema `
    -Handler {
    param($ctx)
    & $ctx.Progress 'loading store' 1
    $notes = @(Get-NoteStore)
    & $ctx.Log "returning $($notes.Count) note(s)"
    if ($notes.Count -eq 0) { return New-McpTextResult -Text '(no notes yet)' }
    $lines = $notes | ForEach-Object { "#$($_.id) [$($_.created)] $($_.text)" }
    New-McpTextResult -Text ($lines -join "`n")
}

Register-McpTool -Name 'notes_search' `
    -Description 'Case-insensitive substring search across all notes.' `
    -InputSchema @{
    type                 = 'object'
    properties           = @{ query = @{ type = 'string'; minLength = 1; description = 'Search substring' } }
    required             = @('query')
    additionalProperties = $false
} `
    -Handler {
    param($ctx)
    $q = [string]$ctx.Arguments.query
    & $ctx.Progress "searching for `"$q`"" 2
    $notes = @(Get-NoteStore)
    $hits = @($notes | Where-Object { $_.text -match [regex]::Escape($q) })
    & $ctx.Progress "$($hits.Count) hit(s) in $($notes.Count) note(s)" 2
    if ($hits.Count -eq 0) { return New-McpTextResult -Text "No notes match `"$q`"." }
    New-McpTextResult -Text (($hits | ForEach-Object { "#$($_.id) $($_.text)" }) -join "`n")
}

Register-McpTool -Name 'notes_delete' `
    -Description 'Delete a note by its id.' `
    -InputSchema @{
    type                 = 'object'
    properties           = @{ id = @{ type = 'integer'; minimum = 1; description = 'Note id to delete' } }
    required             = @('id')
    additionalProperties = $false
} `
    -Handler {
    param($ctx)
    & $ctx.Progress 'loading store' 2
    $notes = @(Get-NoteStore)
    $before = $notes.Count
    $id = [int]$ctx.Arguments.id
    $kept = @($notes | Where-Object { [int]$_.id -ne $id })
    Save-NoteStore -Notes $kept
    & $ctx.Progress "store $before $([char]0x2192) $($kept.Count)" 2
    if ($before -eq $kept.Count) {
        New-McpTextResult -Text "No note with id $id."
    }
    else {
        New-McpTextResult -Text "Deleted note #$id."
    }
}

Register-McpTool -Name 'system_os_info' `
    -Description 'Report basic operating system info (name, version, uptime) from the host.' `
    -InputSchema $emptySchema `
    -Handler {
    param($ctx)
    & $ctx.Progress 'querying Win32_OperatingSystem' 2
    $text = Invoke-DemoScriptBlock -ProgressContext $ctx -ScriptBlock {
        $os = Get-CimInstance -ClassName Win32_OperatingSystem
        [pscustomobject]@{
            Caption  = $os.Caption
            Version  = $os.Version
            Build    = $os.BuildNumber
            Uptime   = ((Get-Date) - $os.LastBootUpTime).ToString('d\.hh\:mm\:ss')
            Hostname = $env:COMPUTERNAME
            User     = $env:USERNAME
        } | Format-List | Out-String
    }
    & $ctx.Progress 'formatting result' 2
    New-McpTextResult -Text $text
}

Register-McpTool -Name 'system_disk_free' `
    -Description 'Report free space on all fixed disks of the host.' `
    -InputSchema $emptySchema `
    -Handler {
    param($ctx)
    & $ctx.Progress 'enumerating fixed disks' 2
    $text = Invoke-DemoScriptBlock -ProgressContext $ctx -ScriptBlock {
        Get-CimInstance -ClassName Win32_LogicalDisk -Filter 'DriveType=3' |
            Select-Object DeviceID,
            @{ n = 'SizeGB'; e = { [math]::Round($_.Size / 1GB, 2) } },
            @{ n = 'FreeGB'; e = { [math]::Round($_.FreeSpace / 1GB, 2) } } |
            Format-Table -AutoSize | Out-String
    }
    & $ctx.Progress 'formatting result' 2
    New-McpTextResult -Text $text
}

Register-McpTool -Name 'system_top_processes' `
    -Description 'Return the top N processes by working-set memory on the host.' `
    -InputSchema @{
    type                 = 'object'
    properties           = @{
        count = @{ type = 'integer'; minimum = 1; maximum = 50; default = 5; description = 'How many processes to return' }
    }
    additionalProperties = $false
} `
    -Handler {
    param($ctx)
    $n = if ($ctx.Arguments.PSObject.Properties.Match('count').Count -gt 0 -and $ctx.Arguments.count) { [int]$ctx.Arguments.count } else { 5 }
    & $ctx.Progress "collecting top $n processes" 2
    $text = Invoke-DemoScriptBlock -ProgressContext $ctx -ScriptBlock {
        Get-Process | Sort-Object WS -Descending |
            Select-Object -First $n Name, Id,
            @{ n = 'MemMB'; e = { [math]::Round($_.WS / 1MB, 1) } } |
            Format-Table -AutoSize | Out-String
    }.GetNewClosure()
    & $ctx.Progress 'formatting result' 2
    New-McpTextResult -Text $text
}

# ---------- JSON-RPC plumbing ----------
function Send-McpFrame {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [hashtable]$Message
    )
    $json = $Message | ConvertTo-Json -Compress -Depth 20
    [Console]::Out.WriteLine($json)
    [Console]::Out.Flush()
}

function Send-McpResponse {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] $Id,
        [Parameter()] $Result,
        [Parameter()] [hashtable]$Error
    )
    $msg = @{ jsonrpc = '2.0'; id = $Id }
    if ($Error) { $msg.error = $Error } else { $msg.result = $Result }
    Send-McpFrame -Message $msg
}

function Send-McpNotification {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [string]$Method,
        [Parameter()] $Params
    )
    $msg = @{ jsonrpc = '2.0'; method = $Method }
    if ($null -ne $Params) { $msg.params = $Params }
    Send-McpFrame -Message $msg
}

# Convert any object (PSCustomObject from ConvertFrom-Json, hashtable, etc.)
# into a hashtable for tool handlers that prefer key-lookup syntax.
function ConvertTo-McpHashtable {
    [CmdletBinding()]
    [OutputType([hashtable])]
    param([Parameter(ValueFromPipeline)] $InputObject)
    process {
        if ($null -eq $InputObject) { return @{} }
        if ($InputObject -is [hashtable]) { return $InputObject }
        $ht = @{}
        foreach ($prop in $InputObject.PSObject.Properties) {
            $ht[$prop.Name] = $prop.Value
        }
        $ht
    }
}

function Invoke-McpTool {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [string]$Name,
        [Parameter()] $Arguments,
        [Parameter()] $ProgressToken,
        [Parameter(Mandatory)] [int]$CallId
    )

    $tool = $script:Tools | Where-Object Name -EQ $Name | Select-Object -First 1
    if (-not $tool) { throw "Unknown tool: $Name" }

    $argHash = ConvertTo-McpHashtable -InputObject $Arguments
    $stepIndex = [ref] 0

    $logFn = {
        param($m)
        Write-McpLog step "  #$CallId $Name`: $m"
    }.GetNewClosure()

    $progressFn = {
        param($message, $total)
        $stepIndex.Value += 1
        $totalSuffix = if ($total) { "/$total" } else { '' }
        Write-McpLog step "  #$CallId $Name [$($stepIndex.Value)$totalSuffix] $message"
        if ($ProgressToken) {
            try {
                $params = @{
                    progressToken = $ProgressToken
                    progress      = $stepIndex.Value
                    message       = $message
                }
                if ($total) { $params.total = $total }
                Send-McpNotification -Method 'notifications/progress' -Params $params
            }
            catch {
                Write-McpLog warn "  #$CallId progress notify failed: $_"
            }
        }
    }.GetNewClosure()

    $ctx = @{ Arguments = $argHash; Log = $logFn; Progress = $progressFn }
    & $tool.Handler $ctx
}

function Get-McpToolList {
    [CmdletBinding()]
    [OutputType([hashtable])]
    param()
    $tools = foreach ($t in $script:Tools) {
        @{
            name        = $t.Name
            description = $t.Description
            inputSchema = $t.InputSchema
        }
    }
    @{ tools = @($tools) }
}

function Get-McpProgressToken {
    [CmdletBinding()]
    param($Params)
    if ($null -eq $Params) { return $null }
    $meta = $Params.PSObject.Properties.Match('_meta')
    if ($meta.Count -eq 0) { return $null }
    $metaValue = $Params._meta
    if ($null -eq $metaValue) { return $null }
    $tokenProp = $metaValue.PSObject.Properties.Match('progressToken')
    if ($tokenProp.Count -eq 0) { return $null }
    return $metaValue.progressToken
}

function Invoke-McpRequest {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] $Request
    )

    $method = [string]$Request.method
    $id = if ($Request.PSObject.Properties.Match('id').Count -gt 0) { $Request.id } else { $null }
    $isNotification = ($null -eq $id)
    $params = if ($Request.PSObject.Properties.Match('params').Count -gt 0) { $Request.params } else { $null }

    Write-McpLog info ('{0}{1}{2} {3}' -f $script:Color.Bold,
        ($(if ($isNotification) { '⇠ ' } else { '→ ' })),
        $method,
        $script:Color.Reset + ' params=' + (Format-McpSummary -Value $params))

    try {
        switch ($method) {
            'initialize' {
                $result = @{
                    protocolVersion = '2025-06-18'
                    capabilities    = @{ tools = @{ listChanged = $false } }
                    serverInfo      = @{ name = 'agentic-demo-mcp-ps'; version = '0.1.0' }
                }
                if (-not $isNotification) { Send-McpResponse -Id $id -Result $result }
            }
            'notifications/initialized' {
                Write-McpLog ok 'client ready'
            }
            'notifications/cancelled' {
                Write-McpLog warn "cancellation: $(Format-McpSummary -Value $params)"
            }
            'ping' {
                if (-not $isNotification) { Send-McpResponse -Id $id -Result @{} }
            }
            'tools/list' {
                if (-not $isNotification) { Send-McpResponse -Id $id -Result (Get-McpToolList) }
            }
            'tools/call' {
                $name = [string]$params.name
                $arguments = if ($params.PSObject.Properties.Match('arguments').Count -gt 0) { $params.arguments } else { $null }
                $progressToken = Get-McpProgressToken -Params $params
                $callId = if ($id -is [int]) { $id } else { 0 }
                $sw = [System.Diagnostics.Stopwatch]::StartNew()
                Write-McpLog info ('{0}{1}{2} #{3} args={4}' -f $script:Color.Bold, "→ $name", $script:Color.Reset, $callId, (Format-McpSummary -Value $arguments))
                try {
                    $result = Invoke-McpTool -Name $name -Arguments $arguments -ProgressToken $progressToken -CallId $callId
                    $sw.Stop()
                    Write-McpLog ok ("$($script:Color.Reset)← $name #$callId $($script:Color.Dim)({0} ms)$($script:Color.Reset)" -f $sw.ElapsedMilliseconds)
                    if (-not $isNotification) { Send-McpResponse -Id $id -Result $result }
                }
                catch {
                    $sw.Stop()
                    $err = $_
                    Write-McpLog err "✗ $name #$callId after $($sw.ElapsedMilliseconds) ms: $err"
                    if (-not $isNotification) {
                        $errorResult = @{ content = @( @{ type = 'text'; text = "Tool error: $err" } ); isError = $true }
                        Send-McpResponse -Id $id -Result $errorResult
                    }
                }
            }
            default {
                Write-McpLog warn "unknown method: $method"
                if (-not $isNotification) {
                    Send-McpResponse -Id $id -Error @{ code = -32601; message = "Method not found: $method" }
                }
            }
        }
    }
    catch {
        $err = $_
        Write-McpLog err "dispatch failure: $err"
        if (-not $isNotification) {
            Send-McpResponse -Id $id -Error @{ code = -32603; message = "Internal error: $err" }
        }
    }
}

# ---------- boot + read loop ----------
Write-McpLog info ("$($script:Color.Bold)agentic-demo-mcp-ps$($script:Color.Reset) starting (pid {0}, pwsh {1}, {2})" -f $PID, $PSVersionTable.PSVersion, $PSVersionTable.OS)
Write-McpLog info "notes store: $script:StorePath"
Write-McpLog info ('verbose={0} color={1}  (toggle with AGENTIC_DEMO_VERBOSE=0 / AGENTIC_DEMO_NO_COLOR=1 or -Quiet/-NoColor)' -f $script:Verbose, $script:UseColor)
Write-McpLog info ('registered {0} tool(s): {1}' -f $script:Tools.Count, (($script:Tools.Name) -join ', '))
Write-McpLog ok 'stdio transport ready, awaiting JSON-RPC requests'

$stdin = [Console]::In
while ($true) {
    $line = $stdin.ReadLine()
    if ($null -eq $line) {
        Write-McpLog warn 'stdin closed, shutting down'
        break
    }
    $line = $line.Trim()
    if ([string]::IsNullOrEmpty($line)) { continue }

    try {
        $request = $line | ConvertFrom-Json -ErrorAction Stop
    }
    catch {
        Write-McpLog err "JSON parse error: $_  raw=$(Format-McpSummary -Value $line -MaxLength 200)"
        continue
    }

    Invoke-McpRequest -Request $request
}
