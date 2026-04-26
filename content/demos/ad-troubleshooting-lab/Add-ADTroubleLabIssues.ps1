<#
.SYNOPSIS
    Injects 5 complex AD issues into the ADTroubleLab
    for AI-assisted troubleshooting practice.

.DESCRIPTION
    Implements the following breakage scenarios:

    1. AD Replication Failure — blocks RPC between DCs
    2. DNS Misconfiguration   — deletes SRV records,
                                breaks DNS client config
    3. Group Policy Failure   — removes security filtering,
                                corrupts SYSVOL ACLs
    4. Kerberos Auth Failure  — introduces time skew,
                                registers duplicate SPNs
    5. Account Lockout        — creates stale credentials
                                in scheduled tasks

    Each scenario can be run individually via the
    -Scenario parameter, or all at once with -All.

    Use Restore-LabVMSnapshot to revert to a clean state
    after troubleshooting.

.PARAMETER Scenario
    The scenario number(s) to inject (1-5).

.PARAMETER All
    Inject all 5 scenarios at once.

.EXAMPLE
    .\Add-ADTroubleLabIssues.ps1 -Scenario 1
    Injects only Scenario 1 (AD Replication Failure).

.EXAMPLE
    .\Add-ADTroubleLabIssues.ps1 -All
    Injects all 5 scenarios.

.EXAMPLE
    .\Add-ADTroubleLabIssues.ps1 -Scenario 2,4
    Injects Scenario 2 (DNS) and Scenario 4 (Kerberos).

.NOTES
    Run Deploy-ADTroubleLab.ps1 first to create the lab.
    Always take a snapshot before injecting issues:
      Checkpoint-LabVM -All -SnapshotName 'Pre-Break'

    Restore with:
      Restore-LabVMSnapshot -All -SnapshotName 'Healthy-Baseline'
#>
#Requires -RunAsAdministrator

[CmdletBinding(DefaultParameterSetName = 'ByScenario')]
param(
    [Parameter(
        ParameterSetName = 'ByScenario',
        Mandatory
    )]
    [ValidateRange(1, 5)]
    [int[]]$Scenario,

    [Parameter(ParameterSetName = 'All')]
    [switch]$All
)

$ErrorActionPreference = 'Stop'

# ── Pre-flight ───────────────────────────────────────────────
$currentIdentity = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = [Security.Principal.WindowsPrincipal]$currentIdentity
if (-not $principal.IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator
)) {
    throw 'This script must run in an elevated PowerShell session.'
}

Import-Lab -Name 'ADTroubleLab' -NoValidation

# Retrieve domain info from the lab definition
$lab = Get-Lab
$domainName = $lab.Domains[0].Name
$domainDN = ($domainName -split '\.' | ForEach-Object { "DC=$_" }) -join ','
$domainNetBIOS = ($domainName -split '\.')[0]

# Resolve the actual VM names (may have a prefix)
$labVMs = Get-LabVM
$dc1Name = ($labVMs | Where-Object { $_.Name -like '*DC1' }).Name
$dc2Name = ($labVMs | Where-Object { $_.Name -like '*DC2' }).Name
$fs1Name = ($labVMs | Where-Object { $_.Name -like '*FS1' }).Name
$dev1Name = ($labVMs | Where-Object { $_.Name -like '*DEV1' }).Name

if (-not $dc1Name -or -not $dc2Name) {
    throw 'Could not find DC1 and DC2 in the lab.'
}

Write-Host 'ADTroubleLab imported successfully.'
Write-Host "  DC1:  $dc1Name"
Write-Host "  DC2:  $dc2Name"
Write-Host "  FS1:  $fs1Name"
Write-Host "  DEV1: $dev1Name"

if ($All) {
    $Scenario = 1..5
}

# Take a pre-break snapshot
Write-Host ''
Write-Host 'Taking Pre-Break snapshot...'
Checkpoint-LabVM -All -SnapshotName 'Pre-Break'

# ═════════════════════════════════════════════════════════════
# SCENARIO 1: AD Replication Failure
# ═════════════════════════════════════════════════════════════
if (1 -in $Scenario) {
    Write-Host ''
    Write-Host '=== Scenario 1: AD Replication Failure ===' `
        -ForegroundColor Red

    # Block ALL TCP traffic between DC2 and DC1 so
    # replication fails regardless of port/transport
    Invoke-LabCommand -ComputerName $dc2Name `
        -ActivityName 'S1: Block DC1 RPC on DC2' -ScriptBlock {

        # Disable built-in AD DC allow rules so our block
        # rules are not overridden by lsass.exe exemptions
        Get-NetFirewallRule -DisplayName 'Active Directory*' `
            -ErrorAction SilentlyContinue |
            Disable-NetFirewallRule

        if (-not (Get-NetFirewallRule -DisplayName 'YOURLAB-Block-DC1-RPC' -ErrorAction SilentlyContinue)) {
            New-NetFirewallRule `
                -DisplayName 'YOURLAB-Block-DC1-RPC' `
                -Direction Inbound `
                -RemoteAddress '192.168.110.10' `
                -Protocol TCP `
                -Action Block `
                -Profile Any | Out-Null
        }

        if (-not (Get-NetFirewallRule -DisplayName 'YOURLAB-Block-DC1-RPC-Out' -ErrorAction SilentlyContinue)) {
            New-NetFirewallRule `
                -DisplayName 'YOURLAB-Block-DC1-RPC-Out' `
                -Direction Outbound `
                -RemoteAddress '192.168.110.10' `
                -Protocol TCP `
                -Action Block `
                -Profile Any | Out-Null
        }

        # Enable Windows Firewall so the rules take effect
        Set-NetFirewallProfile -Profile Domain, Private, Public `
            -Enabled True

        Write-Host 'Firewall rules created and firewall enabled'
    }

    # Create a user on DC1 that needs to replicate to DC2
    Invoke-LabCommand -ComputerName $dc1Name `
        -ActivityName 'S1: Create test user and force repl' `
        -ScriptBlock {
        if (-not (Get-ADUser -Filter "SamAccountName -eq 'repltestuser'" -ErrorAction SilentlyContinue)) {
            New-ADUser -Name 'ReplTestUser' `
                -SamAccountName 'repltestuser' `
                -Enabled $true `
                -AccountPassword (
                    ConvertTo-SecureString 'P@ssw0rd1!' `
                        -AsPlainText -Force
                )
            Write-Host 'Test user created'
        } else {
            Write-Host 'Test user already exists, skipping'
        }
        # Force replication attempt with timeout (will fail
        # due to DC2 firewall and RPC timeout is ~60s)
        $job = Start-Job -ScriptBlock {
            repadmin /syncall /AdeP 2>&1
        }
        $null = $job | Wait-Job -Timeout 15
        $job | Remove-Job -Force
        Write-Host 'Replication forced (expected to fail)'
    }

    Write-Host 'Scenario 1 injected.' -ForegroundColor Yellow
    Write-Host '  Symptoms:'
    Write-Host '    - repadmin /showrepl shows errors'
    Write-Host '    - Event ID 1722 (RPC unavailable)'
    Write-Host '    - ReplTestUser missing on DC2'
    Write-Host '  Fix: Remove firewall rules on DC2'
    Write-Host '    Remove-NetFirewallRule \'
    Write-Host '      -DisplayName YOURLAB-Block-DC1-RPC*'
}

# ═════════════════════════════════════════════════════════════
# SCENARIO 2: DNS Misconfiguration Breaking Domain Services
# ═════════════════════════════════════════════════════════════
if (2 -in $Scenario) {
    Write-Host ''
    Write-Host '=== Scenario 2: DNS Misconfiguration ===' `
        -ForegroundColor Red

    # Delete critical _msdcs SRV records on DC1
    Invoke-LabCommand -ComputerName $dc1Name `
        -ActivityName 'S2: Delete _msdcs SRV records' `
        -Variable (Get-Variable -Name domainName) `
        -ScriptBlock {
        $zone = "_msdcs.$domainName"
        $records = Get-DnsServerResourceRecord `
            -ZoneName $zone -RRType SRV -ErrorAction SilentlyContinue |
            Where-Object { $_.HostName -like '_ldap._tcp*' }
        foreach ($rec in $records) {
            Remove-DnsServerResourceRecord `
                -ZoneName $zone `
                -InputObject $rec `
                -Force -ErrorAction SilentlyContinue
        }
        Write-Host "Deleted $($records.Count) SRV records"
    }

    # Point DC2's DNS to a non-existent server
    Invoke-LabCommand -ComputerName $dc2Name `
        -ActivityName 'S2: Break DC2 DNS config' -ScriptBlock {
        $adapter = Get-NetAdapter |
            Where-Object Status -eq 'Up' |
            Select-Object -First 1
        Set-DnsClientServerAddress `
            -InterfaceIndex $adapter.ifIndex `
            -ServerAddresses '192.168.110.99'
        Write-Host 'DC2 DNS pointed to non-existent server'
    }

    Write-Host 'Scenario 2 injected.' -ForegroundColor Yellow
    Write-Host '  Symptoms:'
    Write-Host '    - dcdiag /test:dns fails'
    Write-Host "    - nltest /dsgetdc:$domainName fails"
    Write-Host '    - Clients cannot locate DCs'
    Write-Host '  Fix: Re-register SRV records on DC1 and'
    Write-Host '       restore DC2 DNS to 192.168.110.10'
}

# ═════════════════════════════════════════════════════════════
# SCENARIO 3: Group Policy Not Applying
# ═════════════════════════════════════════════════════════════
if (3 -in $Scenario) {
    Write-Host ''
    Write-Host '=== Scenario 3: Group Policy Failure ===' `
        -ForegroundColor Red

    Invoke-LabCommand -ComputerName $dc1Name `
        -ActivityName 'S3: Create and break GPO' `
        -Variable (Get-Variable -Name domainDN, domainName) `
        -ScriptBlock {
        Import-Module GroupPolicy

        # Create a GPO with a visible registry setting
        $gpo = Get-GPO -Name 'Desktop Lockdown Policy' -ErrorAction SilentlyContinue
        if (-not $gpo) {
            $gpo = New-GPO -Name 'Desktop Lockdown Policy'
        }

        Set-GPRegistryValue `
            -Name $gpo.DisplayName `
            -Key 'HKCU\Software\Policies\Microsoft\Windows\Explorer' `
            -ValueName 'NoStartMenuMFUprogramsList' `
            -Type DWord -Value 1

        # Link to the domain root
        New-GPLink `
            -Name $gpo.DisplayName `
            -Target $domainDN

        # Break 1: Remove Authenticated Users from
        #          security filtering via AD ACL (avoids
        #          interactive prompt in Set-GPPermission)
        $adPath = "AD:\CN={$($gpo.Id)},CN=Policies,CN=System,$domainDN"
        $acl = Get-Acl -Path $adPath
        $authUsers = 'NT AUTHORITY\Authenticated Users'
        $acl.Access |
            Where-Object { $_.IdentityReference -eq $authUsers } |
            ForEach-Object { $acl.RemoveAccessRule($_) | Out-Null }
        Set-Acl -Path $adPath -AclObject $acl

        # Break 2: Protect SYSVOL folder ACL (remove
        #          inheritance) so GPO files are unreadable
        $gpoId = $gpo.Id.ToString()
        $sysvolPath = Join-Path `
            "\\$domainName\SYSVOL\$domainName\Policies" `
            "{$gpoId}"

        # Wait for SYSVOL replication
        Start-Sleep -Seconds 5

        if (Test-Path $sysvolPath) {
            $acl = Get-Acl -Path $sysvolPath
            $acl.SetAccessRuleProtection($true, $false)
            Set-Acl -Path $sysvolPath -AclObject $acl
            Write-Host 'SYSVOL ACL broken for GPO'
        }

        Write-Host "GPO '$($gpo.DisplayName)' created and broken"
    }

    Write-Host 'Scenario 3 injected.' -ForegroundColor Yellow
    Write-Host '  Symptoms:'
    Write-Host '    - gpresult /r does not show the GPO'
    Write-Host '    - gpresult /z shows access denied'
    Write-Host '    - Event log: GPO processing errors'
    Write-Host '  Fix: Restore Authenticated Users read'
    Write-Host '       permission and re-enable ACL inheritance'
}

# ═════════════════════════════════════════════════════════════
# SCENARIO 4: Kerberos Authentication Failures
# ═════════════════════════════════════════════════════════════
if (4 -in $Scenario) {
    Write-Host ''
    Write-Host '=== Scenario 4: Kerberos Auth Failure ===' `
        -ForegroundColor Red

    # Introduce 10-minute time skew on DC2
    Invoke-LabCommand -ComputerName $dc2Name `
        -ActivityName 'S4: Set DC2 clock +10 min' -ScriptBlock {
        $currentTime = Get-Date
        Set-Date -Date $currentTime.AddMinutes(10)

        # Point NTP to non-existent server so it stays wrong
        w32tm /config `
            /manualpeerlist:"192.168.110.99" `
            /syncfromflags:MANUAL /update 2>&1 | Out-Null
        Stop-Service w32time -Force -ErrorAction SilentlyContinue
        Write-Host 'DC2 clock set +10 min, NTP broken'
    }

    # Register a duplicate SPN on the wrong account
    Invoke-LabCommand -ComputerName $dc1Name `
        -ActivityName 'S4: Register duplicate SPN' `
        -Variable (Get-Variable -Name fs1Name, domainName) `
        -ScriptBlock {
        $dc2Sam = (
            Get-ADComputer -Filter "Name -like '*DC2'" |
                Select-Object -First 1
        ).SamAccountName

        # Register FS1's HTTP SPN on DC2's computer account
        $fs1Short = $fs1Name
        setspn -A "HTTP/$fs1Short.$domainName" $dc2Sam 2>&1 |
            Out-Null
        setspn -A "HTTP/$fs1Short" $dc2Sam 2>&1 | Out-Null
        Write-Host "Duplicate SPN registered on $dc2Sam"
    }

    Write-Host 'Scenario 4 injected.' -ForegroundColor Yellow
    Write-Host '  Symptoms:'
    Write-Host '    - Kerberos error -2146893022'
    Write-Host '    - Event ID 1908 on clients'
    Write-Host '    - Ticket requests fail intermittently'
    Write-Host '  Fix: Correct DC2 time, restart w32time,'
    Write-Host '       remove duplicate SPNs'
}

# ═════════════════════════════════════════════════════════════
# SCENARIO 5: Account Lockout from Unknown Source
# ═════════════════════════════════════════════════════════════
if (5 -in $Scenario) {
    Write-Host ''
    Write-Host '=== Scenario 5: Account Lockout ===' `
        -ForegroundColor Red

    # Create service account and lockout policy on DC1
    Invoke-LabCommand -ComputerName $dc1Name `
        -ActivityName 'S5: Create svc_backup and lockout policy' `
        -ScriptBlock {
        # Create the service account
        if (-not (Get-ADUser -Filter "SamAccountName -eq 'svc_backup'" -ErrorAction SilentlyContinue)) {
            New-ADUser -Name 'svc_backup' `
                -SamAccountName 'svc_backup' `
                -Enabled $true `
                -AccountPassword (
                    ConvertTo-SecureString 'OldP@ss1' `
                        -AsPlainText -Force
                ) `
                -PasswordNeverExpires $true
        }

        # Create a fine-grained password policy with
        # strict lockout (3 attempts, 30 min duration)
        $fgpp = try { Get-ADFineGrainedPasswordPolicy -Identity 'StrictLockout' } catch { $null }
        if (-not $fgpp) {
            New-ADFineGrainedPasswordPolicy `
                -Name 'StrictLockout' `
                -Precedence 10 `
                -LockoutThreshold 3 `
                -LockoutDuration '00:30:00' `
                -LockoutObservationWindow '00:30:00' `
                -ComplexityEnabled $true `
                -MinPasswordLength 8 `
                -MaxPasswordAge '90.00:00:00' `
                -MinPasswordAge '1.00:00:00' `
                -PasswordHistoryCount 5 `
                -ReversibleEncryptionEnabled $false

            Add-ADFineGrainedPasswordPolicySubject `
                -Identity 'StrictLockout' `
                -Subjects 'svc_backup'
        }

        Write-Host 'Service account and lockout policy created'
    }

    # Create stale credential triggers on FS1
    if ($fs1Name) {
        Invoke-LabCommand -ComputerName $fs1Name `
            -ActivityName 'S5: Create stale cred triggers' `
            -Variable (Get-Variable -Name domainNetBIOS) `
            -ScriptBlock {
            # Scheduled task running every 5 min with OLD pwd
            $action = New-ScheduledTaskAction `
                -Execute 'cmd.exe' `
                -Argument '/c dir \\DC1\SYSVOL >nul 2>&1'

            $trigger = New-ScheduledTaskTrigger `
                -RepetitionInterval (
                    New-TimeSpan -Minutes 5
                ) `
                -Once -At (Get-Date)

            if (Get-ScheduledTask -TaskName 'BackupSync' -ErrorAction SilentlyContinue) {
                Unregister-ScheduledTask -TaskName 'BackupSync' -Confirm:$false
            }

            Register-ScheduledTask `
                -TaskName 'BackupSync' `
                -Action $action `
                -Trigger $trigger `
                -User "$domainNetBIOS\svc_backup" `
                -Password 'OldP@ss1'

            # Store stale credentials via cmdkey
            cmdkey /add:DC1 /user:"$domainNetBIOS\svc_backup" /pass:OldP@ss1 2>&1 | Out-Null

            Write-Host 'Stale credential triggers created'
        }
    }

    # Change the password AFTER registering the task so the
    # saved OldP@ss1 credentials become stale
    Invoke-LabCommand -ComputerName $dc1Name `
        -ActivityName 'S5: Change svc_backup password' `
        -ScriptBlock {
        Set-ADAccountPassword -Identity 'svc_backup' `
            -NewPassword (
                ConvertTo-SecureString 'NewP@ss2!' `
                    -AsPlainText -Force
            ) -Reset
        Write-Host 'Password changed, stale creds now active'
    }

    Write-Host 'Scenario 5 injected.' -ForegroundColor Yellow
    Write-Host '  Symptoms:'
    Write-Host '    - svc_backup locks out every ~5 min'
    Write-Host '    - Security events 4740, 4771, 4776'
    Write-Host '    - Lockout source hard to find'
    Write-Host '  Fix: Find the scheduled task and cmdkey'
    Write-Host '       entry on FS1, update or remove them'
}

# ═════════════════════════════════════════════════════════════
# Summary
# ═════════════════════════════════════════════════════════════
Write-Host ''
Write-Host '============================================' `
    -ForegroundColor Cyan
Write-Host 'Issues injected for scenarios:' `
    ($Scenario -join ', ') -ForegroundColor Cyan
Write-Host '============================================' `
    -ForegroundColor Cyan
Write-Host ''
Write-Host 'Troubleshooting tools to use on DEV1:'
Write-Host '  repadmin /showrepl        (Scenario 1)'
Write-Host '  dcdiag /test:dns /v       (Scenario 2)'
Write-Host '  gpresult /r /z            (Scenario 3)'
Write-Host '  klist / setspn -X         (Scenario 4)'
Write-Host '  Get-EventLog Security     (Scenario 5)'
Write-Host ''
Write-Host 'Restore to clean state:'
Write-Host '  Restore-LabVMSnapshot -All \'
Write-Host '    -SnapshotName Healthy-Baseline'
