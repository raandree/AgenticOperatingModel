# Module 12: The Lab as the Agent's Sandbox

## Version Guide

| Slide | Title | 1h | 2h | 4h |
|-------|-------|:---:|:---:|:---:|
| 12.1 | Why Sysadmins Don't Let Agents Touch Prod | — | ✅ | ✅ |
| 12.2 | The Four Properties of a Good Agent Sandbox | — | ✅ | ✅ |
| 12.3 | AutomatedLab in 60 Seconds | — | — | ✅ |
| 12.4 | A Minimal Lab Definition | — | — | ✅ |
| 12.5 | The Agent's Feedback Loop on Infrastructure | — | ✅ | ✅ |
| 12.6 | Live Example — The Kerberos RC4 Lab | — | — | ✅ |
| 12.7 | Snapshot-Driven Iteration | — | — | ✅ |
| 12.8 | Invoke-LabCommand as a First-Class Tool | — | — | ✅ |
| 12.9 | Lab vs. Cloud vs. Dev Container | — | — | ✅ |
| 12.10 | What You Can Actually Test Safely | — | ✅ | ✅ |
| 12.11 | Demo Reference | — | ✅ | ✅ |
| 12.12 | Key Takeaway | — | ✅ | ✅ |

> **This module completes the system-engineer track started in M11.**
> It shows how AutomatedLab turns "agentic coding" into *agentic operations* that is safe to run.

> *"In theory, there is no difference between theory and practice. In practice, there is."*
> — attributed to **Jan L. A. van de Snepscheut**

---

## Slide 12.1: Why Sysadmins Don't Let Agents Touch Prod

# The Operator's Dilemma

### An agent that can act on real infrastructure is also an agent that can:

- Reboot a domain controller at 14:07 on a Tuesday.
- Change `msDS-SupportedEncryptionTypes` across 400 service accounts.
- Delete the wrong GPO.
- Commit a `Remove-ADOrganizationalUnit -Recursive` to main.

> **You cannot give an agent free hands on production. But you also cannot benefit from its speed if you gate every action behind a three-person approval board.**

### The way out:

> **Give it full autonomy — in a place where nothing matters.**

---

## Slide 12.2: The Four Properties of a Good Agent Sandbox

# What Makes a Lab "Agentic-Ready"?

| Property | Why the agent needs it |
|---|---|
| **Reversibility** | Every destructive action is undoable (snapshots) |
| **Reproducibility** | The environment can be re-created deterministically (code-defined) |
| **Observability** | The agent can *see* the result of its actions (event logs, registry, services) |
| **Isolation** | Broad admin rights inside; no bridge to prod |

### Lab platforms that score well:

| Platform | Score |
|---|---|
| **AutomatedLab (Hyper-V)** | ★★★★★ — all four properties, Windows-native |
| Dev Containers | ★★★☆☆ — reversible + reproducible, weak observability for Windows infra |
| Terraform + sandbox cloud account | ★★★★☆ — great for cloud, cost/cleanup discipline required |
| Kind / Minikube | ★★★★☆ — for container orchestration only |
| Bare-metal test lab | ★★☆☆☆ — not reproducible enough for iteration |

---

## Slide 12.3: AutomatedLab in 60 Seconds

# What AutomatedLab Is

> **An open-source PowerShell framework for provisioning complete Hyper-V lab environments from code.**

### What it gives you:

- **Lab definitions as PowerShell** — domains, networks, DCs, member servers, clients, SQL, CM, routing, PKI — all as code.
- **One command to build** — `Install-Lab` spins up VMs, installs OSes, promotes DCs, configures networking.
- **One command to tear down** — `Remove-Lab` returns the host to a clean state.
- **First-class remoting** — `Invoke-LabCommand` runs arbitrary PowerShell on any VM.
- **Snapshot management** — `Checkpoint-LabVM`, `Restore-LabVMSnapshot`.

### Crucially:

> **Everything is scriptable. Everything the agent needs to know is discoverable via PowerShell.**

---

## Slide 12.4: A Minimal Lab Definition

# From Zero to a Working Domain

```powershell
New-LabDefinition -Name 'AgenticSandbox' -DefaultVirtualizationEngine HyperV

Add-LabVirtualNetworkDefinition -Name 'AgenticSandbox' `
    -AddressSpace 192.168.100.0/24

Set-LabInstallationCredential -Username Install -Password 'Somepass1'

Add-LabMachineDefinition -Name DC1 `
    -Network 'AgenticSandbox' `
    -IpAddress 192.168.100.10 `
    -OperatingSystem 'Windows Server 2025 Datacenter (Desktop Experience)' `
    -Roles RootDC `
    -DomainName 'contoso.com'

Add-LabMachineDefinition -Name S1 `
    -Network 'AgenticSandbox' `
    -IpAddress 192.168.100.20 `
    -OperatingSystem 'Windows Server 2025 Datacenter (Desktop Experience)' `
    -DomainName 'contoso.com'

Install-Lab
```

> **Twelve lines of PowerShell → a fully functioning AD domain the agent can experiment on.**

---

## Slide 12.5: The Agent's Feedback Loop on Infrastructure

# How the Agentic Loop Maps to a Lab

```
┌─────────────────────────────────────────────────────────────┐
│                  AGENTIC LOOP ON INFRA                      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   User: "Move the lab to RC4 Phase 2 and verify"           │
│                        │                                   │
│                        ▼                                   │
│   OBSERVE  ──  Get-LabVM, Get-LabVMStatus,                 │
│                Invoke-LabCommand { Get-ItemProperty ... }  │
│                        │                                   │
│                        ▼                                   │
│   PLAN    ──  Decide which DCs, what registry value,       │
│                reboot order                                │
│                        │                                   │
│                        ▼                                   │
│   ACT     ──  Checkpoint-LabVM (safety)                   │
│                Invoke-LabCommand { Set-ItemProperty ... }  │
│                Restart-LabVM -Wait                         │
│                        │                                   │
│                        ▼                                   │
│   VERIFY  ──  Invoke-LabCommand {                         │
│                   Get-WinEvent -Id 205,206,209            │
│                } → does event 205 appear? Yes/No           │
│                        │                                   │
│                        ▼                                   │
│   ITERATE ──  If failed: Restore-LabVMSnapshot, fix,      │
│                retry. If passed: git commit runbook.       │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Slide 12.6: Live Example — The Kerberos RC4 Lab

# From Runbook to Verified Change

### Starting state:
- 5-VM lab: 2 DCs, 2 member servers, 1 client.
- Runbook document: `ADDC - RC4 Shutdown.md` (phases, events, actions).

### The agent's session:

1. **Reads** the runbook and the current registry state on both DCs.
2. **Drafts** `51 Set-RC4DefaultDisablementPhase.ps1`.
3. **Checkpoints** the DCs.
4. **Applies** the change via `Invoke-LabCommand`.
5. **Reboots** the DCs via `Restart-LabVM -Wait`.
6. **Reads** event 205 across all DCs via `35 Get-KerberosEncryptionEvents.ps1`.
7. **Updates** the runbook with the observed behaviour and known side effects.
8. **Commits** script + runbook changes together.

> **Output: one git commit, reviewable by a human operator, that captures both the change and the evidence it worked.**

---

## Slide 12.7: Snapshot-Driven Iteration

# The Agent's "Ctrl-Z" for Infrastructure

```powershell
# Agent's first action on any destructive task:
Checkpoint-LabVM -ComputerName DC1, DC2 -SnapshotName 'pre-phase-2'

# Try something
Invoke-LabCommand -ComputerName DC1, DC2 -ScriptBlock {
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\...' -Name 'DefaultDomainSupportedEncTypes' -Value 0x18
}

# Verify
$result = Invoke-LabCommand -ComputerName DC1 -ScriptBlock {
    Get-WinEvent -LogName System -MaxEvents 50 |
        Where-Object Id -in 201..209
}

# If it didn't work as expected:
Restore-LabVMSnapshot -ComputerName DC1, DC2 -SnapshotName 'pre-phase-2'
```

> **Every experiment is cheap. Every mistake is a restore away from undone.**
> This is what turns an LLM into a trustworthy operator.

---

## Slide 12.8: Invoke-LabCommand as a First-Class Tool

# The Single Most Important Cmdlet

```powershell
Invoke-LabCommand -ComputerName DC1 -ScriptBlock {
    Get-ADUser -Filter * -Properties 'msDS-SupportedEncryptionTypes' |
        Where-Object { $_.'msDS-SupportedEncryptionTypes' -band 0x4 } |  # RC4 bit
        Select-Object Name, 'msDS-SupportedEncryptionTypes'
} -PassThru
```

### What the agent gets:

- Typed PowerShell objects back — not just text.
- Per-VM execution, with per-VM results.
- Runs as a lab-scoped admin; no credential handling.
- Scales from one VM to an entire domain with one line.

### Why this matters for GHCP:

- The terminal tool can run this.
- The result is read back as structured data.
- The agent can *reason over* the output — count, filter, correlate.

> **`Invoke-LabCommand` is to infrastructure what `Invoke-Pester` is to code.**

---

## Slide 12.9: Lab vs. Cloud vs. Dev Container

# Choosing the Right Sandbox

| Scenario | Best sandbox |
|---|---|
| Windows Server / AD / GPO / Kerberos / DSC | **AutomatedLab on Hyper-V** |
| Container workloads, microservices | Docker Compose / Kind |
| Cross-platform app code, CI pipelines | Dev Containers / GitHub Codespaces |
| Real cloud IAM, networking, managed services | Terraform + isolated Azure subscription |
| Pure scripting / PowerShell module work | Dev Container with PowerShell image |
| Multi-forest, cross-domain, PKI, SCCM scenarios | **AutomatedLab** (nothing else gets close) |

> **Pick the smallest sandbox that still contains the risk you are trying to de-risk.**

---

## Slide 12.10: What You Can Actually Test Safely

# Real Tasks Suitable for an Agent + Lab

| Task | Without a lab | With a lab + agent |
|---|---|---|
| Change `msDS-SupportedEncryptionTypes` on 400 accounts | 3-week CAB process | 20-minute script + snapshot + verify |
| Validate a GPO before rolling it to prod | Test OU, human verification | Full-domain lab, event-based verification |
| Build a new DSC composite resource | Spin up a VM manually | `AutomatedLab` + `Invoke-LabCommand` iteration |
| Upgrade DCs to newer OS | Months of planning | Rehearse end-to-end in hours |
| Test a monitoring rule | Beg for dev access | Generate the exact event pattern in the lab |

> **The lab is not a toy. It is the place where risk goes to get rehearsed.**

---

## Slide 12.11: Demo Reference

# See It in Action

> **Live demo script**: `content/demos/demo-ops-kerberos-lab.md`

### What the demo shows (15–20 minutes):
1. A fresh 2-DC lab already deployed.
2. A runbook Markdown file open in VS Code.
3. Copilot Agent reads the runbook and proposes a change script.
4. Agent calls `Checkpoint-LabVM`, applies the change, runs verification.
5. When verification fails the first time, agent diagnoses from event logs and iterates.
6. On success, agent updates the runbook and commits.

> **One cohesive workflow. No tab-switching between PowerShell ISE, a Word runbook, and a change ticket.**

---

## Slide 12.12: Key Takeaway

# What to Remember

1. **Agents are only as safe as their sandbox.** Choose a sandbox that is reversible, reproducible, observable, and isolated.
2. **AutomatedLab is the Hyper-V-native answer** for Windows, AD, and Microsoft-stack system engineering.
3. **`Invoke-LabCommand` is the agent's hands on infrastructure** — it runs code *and* reads back structured results.
4. **Snapshot before every destructive action.** Make "undo" the default.
5. **A verified change + a diffed runbook + a git commit** is the system engineer's equivalent of green tests.

> **You have just seen the full model: the agent writes code, runs it in a lab, verifies with events, documents the result, and commits. This is agentic operations.**
