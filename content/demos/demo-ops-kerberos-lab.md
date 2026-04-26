# Demo: Agentic Operations — Kerberos RC4 Lab

## Overview

This demo shows **agentic coding applied to systems engineering**, not code. The agent:

1. Reads a runbook Markdown document.
2. Proposes a PowerShell change script.
3. Executes the change against a live multi-VM Hyper-V lab.
4. Verifies the outcome by reading Windows event logs back.
5. Updates the runbook and commits — all in one cohesive loop.

Use this demo for:
- **M12** (The Lab as the Agent's Sandbox) in the **4-hour workshop**.
- Optional extension after M11 (Agentic Work Beyond Code) in the **2-hour standard** when the audience is system engineers.

> **Pedagogical payload**: the agentic loop you learned for code — Observe → Plan → Act → Verify → Iterate — applies unchanged to infrastructure, when the sandbox is right.

---

## Audience

| Profile | Fit |
|---|---|
| System engineers / AD admins | **Primary** |
| DevOps / SRE | Strong |
| Platform engineers | Strong |
| Pure developers | Useful as contrast |

---

## Prerequisites

### Host machine

- Windows 11 Pro / Enterprise or Windows Server 2022+ with **Hyper-V enabled**.
- ≥ 32 GB RAM, ≥ 200 GB free SSD.
- PowerShell 7+.
- VS Code with GitHub Copilot Agent Mode enabled.
- `AutomatedLab` PowerShell module installed (`Install-Module AutomatedLab`).
- Git.

### Lab built **before** the session

Do **not** build the lab live. Pre-build it and snapshot a clean state.

```powershell
# Minimal AutomatedLab definition for the demo (trimmed from a full production-readiness lab)
New-LabDefinition -Name 'AgenticDemoKrb' -DefaultVirtualizationEngine HyperV

Add-LabVirtualNetworkDefinition -Name 'AgenticDemoKrb' -AddressSpace 192.168.173.0/24

Set-LabInstallationCredential -Username Install -Password 'Somepass1'

Add-LabMachineDefinition -Name demoDC1 -Network 'AgenticDemoKrb' `
    -IpAddress 192.168.173.10 `
    -OperatingSystem 'Windows Server 2022 Datacenter (Desktop Experience)' `
    -Roles RootDC -DomainName 'contoso.com'

Add-LabMachineDefinition -Name demoDC2 -Network 'AgenticDemoKrb' `
    -IpAddress 192.168.173.11 `
    -OperatingSystem 'Windows Server 2022 Datacenter (Desktop Experience)' `
    -Roles DC -DomainName 'contoso.com'

Add-LabMachineDefinition -Name demoS1 -Network 'AgenticDemoKrb' `
    -IpAddress 192.168.173.20 `
    -OperatingSystem 'Windows Server 2022 Datacenter (Desktop Experience)' `
    -DomainName 'contoso.com'

Install-Lab

# Take a clean snapshot of every VM
Checkpoint-LabVM -ComputerName demoDC1, demoDC2, demoS1 -SnapshotName 'clean-phase-1'
```

### Workspace prepared

- Repository opened in VS Code with:
  - `runbook/ADDC-RC4-Shutdown.md` — a simplified 40-line runbook describing the three phases and events 201–209.
  - `.github/copilot-instructions.md` — PowerShell + AutomatedLab conventions.
  - `.memory-bank/activeContext.md` — current focus: *"Move lab to Phase 2 and verify."*
- Clean git working tree.
- Copilot Chat open in **Agent** mode, with terminal access allowed.

---

## Talking Points Before Starting

> "You've seen agentic coding. Same loop, same tools — but the deliverable now is not code, it's a **verified infrastructure change plus the runbook that proves it works**. The agent writes code, but the goal is operational readiness."

Show on-screen:
- The runbook (Markdown).
- The memory bank (six files).
- The empty `Lab/` folder where the agent will write scripts.

---

## The Demo Flow

### Part 1 — Observe (3 min)

**Prompt to agent:**
> Read `runbook/ADDC-RC4-Shutdown.md` and `.memory-bank/activeContext.md`. Summarise the current state of the lab with respect to RC4 enforcement. Use `Invoke-LabCommand` against `demoDC1` and `demoDC2` to inspect the actual registry values.

**What to show the audience:**
- Agent reads both Markdown files.
- Agent issues one `Invoke-LabCommand` call to read `HKLM:\SYSTEM\CurrentControlSet\Services\Kdc` on both DCs.
- Agent reports back: "Both DCs are in Phase 1 (audit). Goal: move to Phase 2."

> **Teaching point**: the agent used structured Markdown + PowerShell remoting to form a real operational picture — not just text generation.

---

### Part 2 — Plan (2 min)

**Prompt to agent:**
> Draft a PowerShell script `Lab/50-Set-Phase2.ps1` that:
> 1. Takes a checkpoint of both DCs named `pre-phase-2`.
> 2. Sets `RC4DefaultDisablementPhase` to 2 on both DCs.
> 3. Restarts both DCs and waits for them to return.
> 4. Reads events 201–209 from each DC to confirm phase.
>
> Follow the existing Pester + PowerShell conventions in `.github/copilot-instructions.md`. Do not run the script yet.

**What to show the audience:**
- The generated script is clean, idempotent, uses `Invoke-LabCommand`, `Checkpoint-LabVM`, `Restart-LabVM -Wait`.
- Script has comment-based help and parameter validation.

> **Teaching point**: the same instruction files that enforce coding standards also produce operationally sound scripts. The agent is not less disciplined when it writes ops code.

---

### Part 3 — Act (3 min)

**Prompt to agent:**
> Execute `Lab/50-Set-Phase2.ps1`. Stream the output.

**What to show the audience:**
- Agent runs the script in the integrated terminal.
- Checkpoints appear in Hyper-V Manager (have it visible on a second screen).
- DCs reboot; the agent waits on `Restart-LabVM -Wait`.
- Agent captures structured results back.

> **Teaching point**: the agent has hands — but the hands are in a lab, not in prod. Every destructive action is undoable.

---

### Part 4 — Verify (4 min)

**Deliberately arrange** (or let it happen naturally on Windows Server 2022 lab): verification should **fail or produce a partial result** the first time — e.g., event 205 doesn't fire yet because no RC4 ticket has been requested since reboot.

**Prompt to agent:**
> Event 205 is missing on `demoDC1`. Diagnose why and propose a fix.

**What to show the audience:**
- Agent inspects the system state, realises events only fire on actual Kerberos traffic.
- Agent authors `Invoke-TestKerberosTicket.ps1` using `klist` / `Get-ADUser` from `demoS1`.
- Agent re-runs verification — event 205 now appears.

> **Teaching point**: the **Verify + Iterate** phases are what distinguish an agent from a script generator. The lab is what makes the iteration cheap.

---

### Part 5 — Document & Commit (3 min)

**Prompt to agent:**
> Update `runbook/ADDC-RC4-Shutdown.md` with the exact procedure we just executed, the event-triggering requirement for verification, and the observed output. Then stage and commit all changes with a message that references the runbook section.

**What to show the audience:**
- `git diff` on the runbook: clean, reviewable Markdown changes.
- `git status`: new script + runbook update.
- Commit message cites the Phase 2 section.

> **Teaching point**: the output is **one commit** that is reviewable by any human operator, contains the change *and* the evidence it worked, and links back into project memory.

---

## Timing Summary

| Part | Duration |
|---|---|
| 1. Observe | 3 min |
| 2. Plan | 2 min |
| 3. Act | 3 min |
| 4. Verify (with iteration) | 4 min |
| 5. Document & Commit | 3 min |
| **Total** | **≈ 15 min** |

Add 3–5 minutes for introductions and Q&A → fits the 20-minute M12 demo slot.

---

## Reset Between Runs

```powershell
Restore-LabVMSnapshot -ComputerName demoDC1, demoDC2, demoS1 -SnapshotName 'clean-phase-1'
git -C $RepoPath restore .
git -C $RepoPath clean -fd
```

---

## Common Pitfalls

| Pitfall | Mitigation |
|---|---|
| Lab not pre-built; you try to build live | **Never build live.** Snapshot beforehand. |
| Hyper-V network not routing | Verify `Get-VMSwitch` + host IP config before starting. |
| Agent tries to run against prod credentials | Keep the demo machine signed out of any prod AD / Entra session. |
| Event 205 doesn't fire at all | Ensure `Invoke-TestKerberosTicket.ps1` uses an account with explicit RC4 in `msDS-SupportedEncryptionTypes`. |
| Script runs too fast to narrate | Add `Write-Host` markers and `Start-Sleep 2` between phases. |

---

## What the Audience Should Leave With

- **The agentic loop is not a code thing.** It is a general operating model.
- **A lab transforms an LLM from a scripter to an operator.** Reversibility + observability + isolation = safe autonomy.
- **One commit, one decision, one evidence trail.** This is the missing standard of rigour for operations work.
