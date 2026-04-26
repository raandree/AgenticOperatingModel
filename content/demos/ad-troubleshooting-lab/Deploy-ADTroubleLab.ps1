#Requires -RunAsAdministrator
<#
.SYNOPSIS
    Deploys the ADTroubleLab environment for AI-assisted
    Active Directory troubleshooting demos.

.DESCRIPTION
    Creates a Hyper-V lab with AutomatedLab containing:
    - DC1:  Root Domain Controller
    - DC2:  Additional Domain Controller
    - FS1:  File Server (domain member)
    - DEV1: Development server (domain member)

    All VMs are on an isolated internal network.

    After deployment the script takes a 'Healthy-Baseline'
    snapshot so you can restore after breaking things.

.PARAMETER LabName
    Name of the AutomatedLab lab. Default: 'ADTroubleLab'.

.PARAMETER DomainName
    Active Directory domain name. Default: 'contoso.com'.

.PARAMETER AdminUserName
    Lab install / domain admin user name. Default: 'Install'.

.PARAMETER AdminPassword
    Lab install / domain admin password. Default: 'Somepass1'.

.PARAMETER OperatingSystem
    Operating system for all VMs. Must match an ISO in
    LabSources. Default: 'Windows Server 2025 Standard
    (Desktop Experience)'.

.PARAMETER ServerMemory
    Startup memory for DC1, DC2, and FS1.
    Default: 2GB.

.PARAMETER ServerMinMemory
    Minimum dynamic memory for DC1, DC2, and FS1.
    Default: 1GB.

.PARAMETER ServerMaxMemory
    Maximum dynamic memory for DC1, DC2, and FS1.
    Default: 4GB.

.PARAMETER DevMemory
    Startup memory for DEV1. Default: 4GB.

.PARAMETER DevMinMemory
    Minimum dynamic memory for DEV1. Default: 2GB.

.PARAMETER DevMaxMemory
    Maximum dynamic memory for DEV1. Default: 8GB.

.PARAMETER Processors
    Number of virtual processors per VM. Default: 2.

.PARAMETER AddressSpace
    Network address space for the internal lab network.
    Default: '192.168.110.0/24'.

.NOTES
    Requires AutomatedLab, Hyper-V, and a matching ISO
    in LabSources.

    Default credentials: Install / Somepass1
    Default domain:      contoso.com
    Default network:     192.168.110.0/24

.EXAMPLE
    .\Deploy-ADTroubleLab.ps1

.EXAMPLE
    .\Deploy-ADTroubleLab.ps1 -OperatingSystem 'Windows Server 2022 Standard (Desktop Experience)' -ServerMemory 1GB

.EXAMPLE
    .\Deploy-ADTroubleLab.ps1 -LabName 'MyLab' -DomainName 'mylab.local' -AdminPassword 'P@ssw0rd!'
#>

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$LabName = 'ADTroubleLab',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$DomainName = 'contoso.com',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$AdminUserName = 'Install',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$AdminPassword = 'Somepass1',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$OperatingSystem = 'Windows Server 2025 Datacenter Evaluation (Desktop Experience)',

    [Parameter()]
    [long]$ServerMemory = 2GB,

    [Parameter()]
    [long]$ServerMinMemory = 1GB,

    [Parameter()]
    [long]$ServerMaxMemory = 4GB,

    [Parameter()]
    [long]$DevMemory = 4GB,

    [Parameter()]
    [long]$DevMinMemory = 2GB,

    [Parameter()]
    [long]$DevMaxMemory = 8GB,

    [Parameter()]
    [ValidateRange(1, 8)]
    [int]$Processors = 2,

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$AddressSpace = '192.168.110.0/24'
)

$ErrorActionPreference = 'Stop'

# ── Pre-flight: Admin rights ─────────────────────────────────
$currentIdentity = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = [Security.Principal.WindowsPrincipal]$currentIdentity
if (-not $principal.IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator
)) {
    throw 'This script must run in an elevated PowerShell session.'
}

# ── Pre-flight: Verify OS availability ───────────────────────
$labSources = Get-LabSourcesLocation
$availableOS = Get-LabAvailableOperatingSystem -Path $labSources

$serverOS = $availableOS |
    Where-Object {
        $_.OperatingSystemName -eq $OperatingSystem
    } | Select-Object -First 1

if (-not $serverOS) {
    throw "'$OperatingSystem' ISO not found in LabSources\ISOs."
}

Write-Host 'OS images verified.' -ForegroundColor Green

# ── Pre-flight: VM storage path ──────────────────────────────
$existingVmPath = Get-CimInstance -ClassName Win32_LogicalDisk `
    -Filter "DriveType = 3" |
    ForEach-Object {
        $candidate = Join-Path $_.DeviceID 'AutomatedLab-VMs'
        if (Test-Path -Path $candidate) { $candidate }
    } | Select-Object -First 1

$vmPathParams = @{}
if ($existingVmPath) {
    Write-Host "Reusing VM path: $existingVmPath"
    $vmPathParams['VmPath'] = $existingVmPath
}

# ── Pre-flight: VM name collision avoidance ──────────────────
$plannedNames = @('DC1', 'DC2', 'FS1', 'DEV1')

$existingNames = [System.Collections.Generic.List[string]]::new()
foreach ($lab in (Get-Lab -List)) {
    try {
        Import-Lab -Name $lab -NoValidation `
            -ErrorAction SilentlyContinue
        $vms = Get-LabVM -ErrorAction SilentlyContinue
        if ($vms) {
            $vms.Name | ForEach-Object {
                $existingNames.Add($_)
            }
        }
    }
    catch { }
}

$collisions = $plannedNames |
    Where-Object { $_ -in $existingNames }

$prefix = ''
if ($collisions) {
    do {
        $prefix = -join (
            (65..90) | Get-Random -Count 2 |
                ForEach-Object { [char]$_ }
        )
        $prefixedNames = $plannedNames |
            ForEach-Object { "$prefix$_" }
        $stillCollides = $prefixedNames |
            Where-Object { $_ -in $existingNames }
    } while ($stillCollides)

    Write-Host "Name collision detected. Using prefix '$prefix'."
}

# ── Lab Definition ───────────────────────────────────────────
New-LabDefinition -Name $LabName `
    -DefaultVirtualizationEngine HyperV @vmPathParams

Set-LabInstallationCredential `
    -Username $AdminUserName -Password $AdminPassword
Add-LabDomainDefinition `
    -Name $DomainName `
    -AdminUser $AdminUserName -AdminPassword $AdminPassword

if ($prefix) {
    Set-LabGlobalNamePrefix -Name $prefix
}

# ── Networks ─────────────────────────────────────────────────
# Internal network with NAT for internet access on all VMs
Add-LabVirtualNetworkDefinition -Name 'ADTroubleNet' `
    -AddressSpace $AddressSpace -UseNat

# ── DC1 — Root Domain Controller ─────────────────────────────
$networkPrefix = ($AddressSpace -split '\.\d+/')[0]

Add-LabMachineDefinition -Name 'DC1' `
    -OperatingSystem $OperatingSystem `
    -Memory $ServerMemory -MinMemory $ServerMinMemory -MaxMemory $ServerMaxMemory `
    -Processors $Processors `
    -Roles RootDC `
    -DomainName $DomainName `
    -Network 'ADTroubleNet' `
    -IpAddress "$networkPrefix.10"

# ── DC2 — Additional Domain Controller ───────────────────────
Add-LabMachineDefinition -Name 'DC2' `
    -OperatingSystem $OperatingSystem `
    -Memory $ServerMemory -MinMemory $ServerMinMemory -MaxMemory $ServerMaxMemory `
    -Processors $Processors `
    -Roles DC `
    -DomainName $DomainName `
    -Network 'ADTroubleNet' `
    -IpAddress "$networkPrefix.11"

# ── FS1 — File Server (domain member) ────────────────────────
Add-LabMachineDefinition -Name 'FS1' `
    -OperatingSystem $OperatingSystem `
    -Memory $ServerMemory -MinMemory $ServerMinMemory -MaxMemory $ServerMaxMemory `
    -Processors $Processors `
    -Roles FileServer `
    -DomainName $DomainName `
    -Network 'ADTroubleNet' `
    -IpAddress "$networkPrefix.20"

# ── DEV1 — Development Server (internet via NetNat) ──────────
Add-LabMachineDefinition -Name 'DEV1' `
    -OperatingSystem $OperatingSystem `
    -Memory $DevMemory -MinMemory $DevMinMemory -MaxMemory $DevMaxMemory `
    -Processors $Processors `
    -DomainName $DomainName `
    -Network 'ADTroubleNet' `
    -IpAddress "$networkPrefix.30"

# ── Deploy ───────────────────────────────────────────────────
Write-Host '============================================'
Write-Host 'Starting ADTroubleLab deployment...'
Write-Host '============================================'

Install-Lab -NoValidation

Write-Host '============================================'
Write-Host 'Deployment complete!'
Write-Host '============================================'

Show-LabDeploymentSummary

# ── Post-deployment: Ensure NetNat exists ─────────────────────
# Older AL versions accept -UseNat but may not create the
# NetNat object. Create it if missing so all VMs get internet.
$networkName = 'ADTroubleNet'
if (-not (Get-NetNat -Name $networkName -ErrorAction SilentlyContinue)) {
    Write-Host "Creating NetNat '$networkName'..."
    New-NetNat -Name $networkName `
        -InternalIPInterfaceAddressPrefix $AddressSpace
}

# ── Post-deployment: Create file share on FS1 ────────────────
Invoke-LabCommand -ComputerName 'FS1' `
    -ActivityName 'Create Data share' -ScriptBlock {
    $path = 'C:\Shares\Data'
    New-Item -Path $path -ItemType Directory -Force | Out-Null
    $domainNetBIOS = ($using:DomainName -split '\.')[0]
    New-SmbShare -Name 'Data' -Path $path `
        -FullAccess "$domainNetBIOS\Domain Admins" `
        -ChangeAccess "$domainNetBIOS\Domain Users"
}

# ── Post-deployment: Take baseline snapshot ──────────────────
Write-Host 'Taking Healthy-Baseline snapshot...'
Checkpoint-LabVM -All -SnapshotName 'Healthy-Baseline'
Write-Host 'Baseline snapshot saved.' -ForegroundColor Green

Write-Host ''
Write-Host 'Lab is ready. Next steps:'
Write-Host '  1. Connect:  Connect-LabVM -ComputerName <name>'
Write-Host '  2. Break it: .\Add-ADTroubleLabIssues.ps1'
Write-Host '  3. Restore:  Restore-LabVMSnapshot -All \'
Write-Host '                 -SnapshotName Healthy-Baseline'
Write-Host "  4. Teardown: Remove-Lab -Name $LabName ``"
Write-Host '                 -Confirm:$false'
