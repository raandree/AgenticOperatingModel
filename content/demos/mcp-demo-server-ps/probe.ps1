#requires -Version 7.0
<#
.SYNOPSIS
    Smoke-test the PowerShell MCP demo server end-to-end without an MCP client.

.DESCRIPTION
    Spawns Start-AgenticDemoMcp.ps1 as a child process, talks JSON-RPC over its
    stdio, exercises every tool, prints the responses, and exits 0 on success.

    The server's stderr is inherited, so you see its instrumentation interleaved
    with the probe's output — perfect for a live demo of the protocol.
#>
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version 3.0

$serverScript = Join-Path $PSScriptRoot 'Start-AgenticDemoMcp.ps1'
if (-not (Test-Path -LiteralPath $serverScript)) {
    throw "Server script not found: $serverScript"
}

$psi = [System.Diagnostics.ProcessStartInfo]::new()
$psi.FileName = (Get-Process -Id $PID).Path  # current pwsh
$psi.ArgumentList.Add('-NoProfile')
$psi.ArgumentList.Add('-NonInteractive')
$psi.ArgumentList.Add('-File')
$psi.ArgumentList.Add($serverScript)
$psi.RedirectStandardInput  = $true
$psi.RedirectStandardOutput = $true
$psi.RedirectStandardError  = $false  # let stderr surface in the parent terminal
$psi.UseShellExecute        = $false
$psi.StandardInputEncoding  = [System.Text.UTF8Encoding]::new($false)
$psi.StandardOutputEncoding = [System.Text.UTF8Encoding]::new($false)

$proc = [System.Diagnostics.Process]::Start($psi)
$writer = $proc.StandardInput
$reader = $proc.StandardOutput
$script:NextId = 1

function Send-Frame {
    param([hashtable]$Message)
    $json = $Message | ConvertTo-Json -Compress -Depth 20
    $writer.WriteLine($json)
    $writer.Flush()
}

function Receive-Response {
    param([int]$ExpectedId)
    while ($true) {
        $line = $reader.ReadLine()
        if ($null -eq $line) { throw 'Server closed stdout unexpectedly' }
        if ([string]::IsNullOrWhiteSpace($line)) { continue }
        $msg = $line | ConvertFrom-Json
        # Skip notifications (no id field).
        if ($msg.PSObject.Properties.Match('id').Count -eq 0) { continue }
        if ($msg.id -ne $ExpectedId) { continue }
        return $msg
    }
}

function Invoke-Call {
    param(
        [Parameter(Mandatory)] [string]$Method,
        [Parameter()] $Params
    )
    $id = $script:NextId++
    $msg = @{ jsonrpc = '2.0'; id = $id; method = $Method }
    if ($null -ne $Params) { $msg.params = $Params }
    Send-Frame -Message $msg
    Receive-Response -ExpectedId $id
}

function Send-Notify {
    param(
        [Parameter(Mandatory)] [string]$Method,
        [Parameter()] $Params
    )
    $msg = @{ jsonrpc = '2.0'; method = $Method }
    if ($null -ne $Params) { $msg.params = $Params }
    Send-Frame -Message $msg
}

function Get-ToolText {
    param($Response)
    return $Response.result.content[0].text
}

try {
    $init = Invoke-Call -Method 'initialize' -Params @{
        protocolVersion = '2025-06-18'
        capabilities = @{}
        clientInfo = @{ name = 'probe'; version = '0' }
    }
    Write-Host "INIT: $($init.result.serverInfo | ConvertTo-Json -Compress)"
    Send-Notify -Method 'notifications/initialized'

    $tools = Invoke-Call -Method 'tools/list'
    Write-Host "TOOLS: $((($tools.result.tools).name) -join ', ')"

    $add = Invoke-Call -Method 'tools/call' -Params @{ name = 'notes_add'; arguments = @{ text = 'hello from ps probe' } }
    Write-Host "ADD: $(Get-ToolText $add)"

    $list = Invoke-Call -Method 'tools/call' -Params @{ name = 'notes_list'; arguments = @{} }
    Write-Host "LIST: $(Get-ToolText $list)"

    $search = Invoke-Call -Method 'tools/call' -Params @{ name = 'notes_search'; arguments = @{ query = 'probe' } }
    Write-Host "SEARCH: $(Get-ToolText $search)"

    $os = Invoke-Call -Method 'tools/call' -Params @{ name = 'system_os_info'; arguments = @{} }
    Write-Host "OS: $((Get-ToolText $os) -split "`n" | Select-Object -First 4 | Join-String -Separator ' | ')"

    $top = Invoke-Call -Method 'tools/call' -Params @{ name = 'system_top_processes'; arguments = @{ count = 3 } }
    Write-Host "TOP:`n$(Get-ToolText $top)"

    $disk = Invoke-Call -Method 'tools/call' -Params @{ name = 'system_disk_free'; arguments = @{} }
    Write-Host "DISK:`n$(Get-ToolText $disk)"

    $del = Invoke-Call -Method 'tools/call' -Params @{ name = 'notes_delete'; arguments = @{ id = 1 } }
    Write-Host "DEL: $(Get-ToolText $del)"
}
finally {
    if (-not $proc.HasExited) {
        $writer.Close()
        if (-not $proc.WaitForExit(2000)) { $proc.Kill() }
    }
}
