#requires -Version 7.0
<#
.SYNOPSIS
    Stand-alone smoke test for server.ps1 (no MCP client required).
.DESCRIPTION
    Spawns server.ps1, drives the JSON-RPC handshake, calls every tool once,
    prints a compact summary.
#>
[CmdletBinding()]
param(
    [string] $ServerPath = (Join-Path $PSScriptRoot 'server.ps1')
)

$ErrorActionPreference = 'Stop'

$psi = [System.Diagnostics.ProcessStartInfo]::new()
$psi.FileName               = (Get-Process -Id $PID).Path  # same pwsh
$psi.ArgumentList.Add('-NoLogo')
$psi.ArgumentList.Add('-NoProfile')
$psi.ArgumentList.Add('-File')
$psi.ArgumentList.Add($ServerPath)
$psi.RedirectStandardInput  = $true
$psi.RedirectStandardOutput = $true
$psi.RedirectStandardError  = $true
$psi.UseShellExecute        = $false
$psi.StandardOutputEncoding = [System.Text.UTF8Encoding]::new($false)
$psi.StandardInputEncoding  = [System.Text.UTF8Encoding]::new($false)

$proc = [System.Diagnostics.Process]::Start($psi)
$proc.EnableRaisingEvents = $true

$script:nextId = 1
function Invoke-Rpc {
    param([string] $Method, $Params)
    $id  = $script:nextId++
    $msg = [ordered]@{ jsonrpc = '2.0'; id = $id; method = $Method; params = $Params }
    $proc.StandardInput.WriteLine(($msg | ConvertTo-Json -Depth 10 -Compress))
    $proc.StandardInput.Flush()
    while ($true) {
        $line = $proc.StandardOutput.ReadLine()
        if ($null -eq $line) { throw 'server closed stdout' }
        $resp = $line | ConvertFrom-Json
        if ($resp.id -eq $id) { return $resp }
    }
}
function Send-Notify {
    param([string] $Method, $Params)
    $msg = [ordered]@{ jsonrpc = '2.0'; method = $Method; params = $Params }
    $proc.StandardInput.WriteLine(($msg | ConvertTo-Json -Depth 10 -Compress))
    $proc.StandardInput.Flush()
}

try {
    $init = Invoke-Rpc 'initialize' @{ protocolVersion = '2025-06-18'; capabilities = @{}; clientInfo = @{ name = 'probe-ps'; version = '0' } }
    Write-Host "INIT:   $($init.result.serverInfo.name) $($init.result.serverInfo.version)"

    Send-Notify 'notifications/initialized' @{}

    $tools = Invoke-Rpc 'tools/list' @{}
    Write-Host "TOOLS:  $(($tools.result.tools | ForEach-Object name) -join ', ')"

    $add = Invoke-Rpc 'tools/call' @{ name = 'notes_add'; arguments = @{ text = 'hello from PowerShell probe' } }
    Write-Host "ADD:    $($add.result.content[0].text)"

    $list = Invoke-Rpc 'tools/call' @{ name = 'notes_list'; arguments = @{} }
    Write-Host "LIST:`n$($list.result.content[0].text)"

    $search = Invoke-Rpc 'tools/call' @{ name = 'notes_search'; arguments = @{ query = 'probe' } }
    Write-Host "SEARCH: $($search.result.content[0].text)"

    $os = Invoke-Rpc 'tools/call' @{ name = 'system_os_info'; arguments = @{} }
    Write-Host "OS:`n$($os.result.content[0].text)"

    $top = Invoke-Rpc 'tools/call' @{ name = 'system_top_processes'; arguments = @{ count = 3 } }
    Write-Host "TOP:`n$($top.result.content[0].text)"

    $disk = Invoke-Rpc 'tools/call' @{ name = 'system_disk_free'; arguments = @{} }
    Write-Host "DISK:`n$($disk.result.content[0].text)"

    $del = Invoke-Rpc 'tools/call' @{ name = 'notes_delete'; arguments = @{ id = 1 } }
    Write-Host "DEL:    $($del.result.content[0].text)"
}
finally {
    if (-not $proc.HasExited) { $proc.Kill() }
}
