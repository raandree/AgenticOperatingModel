# AD Troubleshooting Lab

A Hyper-V lab environment for demonstrating AI-assisted
troubleshooting of common Active Directory issues. Uses
[AutomatedLab](https://automatedlab.org) to deploy a
multi-DC domain with a file server and a Windows 11
development client.

## Beyond Code: AI for Anything You Can Script or Command

> [!IMPORTANT]
> GitHub Copilot and similar AI coding agents are **not limited to writing code**. They can assist with **anything you can do from the command line or programmatically** — parsing `repadmin` output, diagnosing DNS failures, correlating Event Log entries across multiple servers, or interpreting `gpresult` XML. If you can run it in a terminal, an AI agent can help you understand, automate, and troubleshoot it.

This lab demonstrates that principle: learners use the
same agentic workflow (observe → plan → act → verify)
to diagnose and fix Active Directory infrastructure
problems — not by writing application code, but by
running diagnostic commands, interpreting their output,
and applying targeted fixes. The AI agent becomes an
**operations co-pilot**, not just a code generator.

> *"Die Wirkung solcher Systeme erschließt sich erst im eigenen Umgang — nicht auf Folien. Wer heute nur zuschaut, entscheidet morgen im Blindflug."*
> *"The impact of these systems only reveals itself through hands-on experience — not on slides. Those who only watch today will decide blindly tomorrow."*
> — **Stephan Scheuer**, Handelsblatt (Feb 2026)

## Prerequisites

- Windows 10/11 host with **Hyper-V** enabled
- [AutomatedLab](https://automatedlab.org) module installed
- ISOs in `LabSources\ISOs`:
  - Windows Server 2025 Standard (Desktop Experience)
  - Windows 11 Enterprise
- At least **16 GB RAM** free (4 VMs with dynamic memory)
- Elevated (Run as Administrator) PowerShell session

## Lab Architecture

```
┌──────────────────────────────────────────────────────┐
│                ADTroubleNet (Internal)                │
│                192.168.110.0/24                       │
│                                                      │
│  ┌────────┐  ┌────────┐  ┌────────┐  ┌────────────┐ │
│  │  DC1   │  │  DC2   │  │  FS1   │  │   DEV1     │ │
│  │ RootDC │  │   DC   │  │ FileSrv│  │  Win 11    │ │
│  │ .10    │  │ .11    │  │ .20    │  │  .30       │ │
│  │ Srv2025│  │ Srv2025│  │ Srv2025│  │  ┌───────┐ │ │
│  │        │  │        │  │        │  │  │Default│ │ │
│  │  No    │  │  No    │  │  No    │  │  │Switch │ │ │
│  │ Internet│ │ Internet│ │ Internet│ │  │(NAT)  │ │ │
│  └────────┘  └────────┘  └────────┘  │  └───┬───┘ │ │
│                                      └──────┼─────┘ │
└──────────────────────────────────────────────┼───────┘
                                               │
                                          Internet
```

| VM | IP | OS | Role | Internet |
|---|---|---|---|---|
| DC1 | 192.168.110.10 | Server 2025 | Root DC | No |
| DC2 | 192.168.110.11 | Server 2025 | Additional DC | No |
| FS1 | 192.168.110.20 | Server 2025 | File Server | No |
| DEV1 | 192.168.110.30 | Windows 11 | Dev Client | **Yes** |

**Domain:** `troublelab.com`
**Credentials:** `Install` / `Somepass1`

## Quick Start

```powershell
# 1. Deploy the lab (~40 min)
.\Deploy-ADTroubleLab.ps1

# 2. Break it — inject one or more scenarios
.\Add-ADTroubleLabIssues.ps1 -Scenario 1
.\Add-ADTroubleLabIssues.ps1 -Scenario 2,4
.\Add-ADTroubleLabIssues.ps1 -All

# 3. Troubleshoot using AI on DEV1
Connect-LabVM -ComputerName <DEV1-name>

# 4. Restore to clean state
Restore-LabVMSnapshot -All -SnapshotName 'Healthy-Baseline'

# 5. Tear down when done
Remove-Lab -Name ADTroubleLab -Confirm:$false
```

## Scripts

### Deploy-ADTroubleLab.ps1

Deploys the full lab environment. Handles:

- OS image verification
- VM storage path detection
- Name collision avoidance (auto-prefixes if needed)
- Network creation (internal + Default Switch)
- AD forest and domain setup
- File Server role and share creation
- Baseline snapshot (`Healthy-Baseline`)

### Add-ADTroubleLabIssues.ps1

Injects breakage scenarios into the running lab. Supports
selective injection via `-Scenario <n>` or `-All`.
Takes a `Pre-Break` snapshot before making changes.

## Troubleshooting Scenarios

### Scenario 1 — AD Replication Failure

| Attribute | Detail |
|---|---|
| **What breaks** | Firewall rule on DC2 blocks all RPC/LDAP traffic from DC1 |
| **Affected VMs** | DC1, DC2 |
| **Symptoms** | `repadmin /showrepl` errors, Event ID 1722, new users don't replicate |
| **Key tools** | `repadmin /showrepl`, `repadmin /replsummary`, Event Viewer (Directory Service log) |
| **Fix** | Remove the firewall rule `YOURLAB-Block-DC1-RPC` on DC2 |

**Why AI helps:** `repadmin` output across multiple naming
contexts is verbose and cryptic. AI can correlate the
error codes with the blocked ports and identify the root
cause in seconds.

### Scenario 2 — DNS Misconfiguration

| Attribute | Detail |
|---|---|
| **What breaks** | Critical `_ldap._tcp` SRV records deleted from `_msdcs` zone; DC2's DNS client pointed to non-existent server |
| **Affected VMs** | DC1, DC2, all domain members |
| **Symptoms** | `dcdiag /test:dns` fails, `nltest /dsgetdc:` fails, domain logon problems |
| **Key tools** | `dcdiag /test:dns /v`, `nslookup`, `Resolve-DnsName`, DNS Manager |
| **Fix** | Re-register SRV records (`nltest /dsregdns` or restart Netlogon), restore DC2 DNS to `192.168.110.10` |

**Why AI helps:** `dcdiag /test:dns /v` produces 200+
lines of output. AI can parse this wall of text, identify
the missing SRV records, explain why domain services
depend on them, and provide the exact fix commands.

### Scenario 3 — Group Policy Not Applying

| Attribute | Detail |
|---|---|
| **What breaks** | "Desktop Lockdown Policy" GPO created but Authenticated Users removed from security filtering; SYSVOL ACL inheritance disabled |
| **Affected VMs** | All domain members |
| **Symptoms** | `gpresult /r` doesn't list the GPO, `gpresult /z` shows access denied, Event log GPO errors |
| **Key tools** | `gpresult /r`, `gpresult /z`, `Get-GPO`, GPMC, Event Viewer (Group Policy log) |
| **Fix** | Restore Authenticated Users read permission on the GPO, re-enable SYSVOL ACL inheritance |

**Why AI helps:** GPO application involves a complex
precedence chain (site, domain, OU, filtering, WMI
filters, ACLs). AI can analyze `gpresult` XML output
and immediately identify which layer is blocking.

### Scenario 4 — Kerberos Authentication Failures

| Attribute | Detail |
|---|---|
| **What breaks** | DC2 clock set 10 minutes ahead (exceeds 5-min Kerberos tolerance); duplicate SPNs registered for FS1 on DC2's account |
| **Affected VMs** | DC2, FS1, clients authenticating through DC2 |
| **Symptoms** | Error `-2146893022`, Event ID 1908, intermittent auth failures |
| **Key tools** | `klist`, `setspn -X` (find duplicates), `w32tm /monitor`, `nltest /sc_verify:` |
| **Fix** | Correct DC2 time (`w32tm /resync`), restart W32Time, remove duplicate SPNs with `setspn -D` |

**Why AI helps:** Kerberos errors produce obscure
numeric codes. AI can decode `-2146893022` as a
target-principal-name mismatch, correlate it with the
time skew and duplicate SPN, and explain the full
Kerberos ticket flow that broke.

### Scenario 5 — Account Lockout from Unknown Source

| Attribute | Detail |
|---|---|
| **What breaks** | Service account `svc_backup` has its password changed, but a scheduled task and stored `cmdkey` credential on FS1 still use the old password |
| **Affected VMs** | DC1 (lockout events), FS1 (lockout source) |
| **Symptoms** | `svc_backup` locks out every ~5 min, Security events 4740, 4771, 4776 |
| **Key tools** | `Search-ADAccount -LockedOut`, Event Viewer Security log (filter 4740), `Get-ScheduledTask`, `cmdkey /list` |
| **Fix** | Update or remove the `BackupSync` scheduled task and `cmdkey` entry on FS1 |

**Why AI helps:** Account lockout events are distributed
across multiple DCs and member servers. AI can
correlate event timestamps, source workstation names,
and caller process IDs across all machines to pinpoint
the FS1 scheduled task as the lockout source.

## Recommended Workflow

1. **Deploy** the lab with `Deploy-ADTroubleLab.ps1`
2. **Snapshot** is taken automatically (`Healthy-Baseline`)
3. **Inject** one scenario at a time for focused practice
4. **Troubleshoot** from DEV1 using RSAT tools and AI
5. **Restore** to `Healthy-Baseline` between scenarios
6. **Repeat** with the next scenario

For a workshop format, inject all 5 scenarios at once
and let participants work through them as a "Game Day"
exercise.

## Snapshots

| Snapshot | When created | Purpose |
|---|---|---|
| `Healthy-Baseline` | End of deployment | Clean state, all services working |
| `Pre-Break` | Before each injection run | Rollback point if injection itself fails |

```powershell
# Restore to clean state
Restore-LabVMSnapshot -All -SnapshotName 'Healthy-Baseline'

# List available snapshots
Get-LabVMSnapshot -All
```

## VM Name Prefixes

If other AutomatedLab labs are running with names like
`DC1` or `FS1`, the deploy script auto-generates a
2-letter prefix (e.g., `IW`). All VM names then become
`IWDC1`, `IWDC2`, `IWFS1`, `IWDEV1`. The issues script
resolves these names automatically.

## See Also

- [AutomatedLab documentation](https://automatedlab.org/en/latest/)
- [Microsoft AD Replication Troubleshooting](https://learn.microsoft.com/en-us/troubleshoot/windows-server/active-directory/common-active-directory-replication-errors)
- [Group Policy Troubleshooting](https://learn.microsoft.com/en-us/troubleshoot/windows-server/group-policy/group-policy-overview)
