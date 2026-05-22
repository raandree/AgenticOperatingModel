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

<!--
The four examples in the bullet list are not hypothetical — each one has happened in field reports during 2025–26. The reboot of a domain controller at 14:07 on a Tuesday is paraphrased from a real Reddit thread. The mass-change of `msDS-SupportedEncryptionTypes` is the kind of thing the Kerberos RC4 deprecation timeline produced as agents misread Microsoft's guidance. The recursive OU delete is a periodic Microsoft 365 incident.

The dilemma framing matters because it cuts through the binary discourse common in operations contexts. "Just don't use AI agents on infrastructure" is one answer, and it leaves the productivity gains on the table; "trust the agent because the demos look great" is the opposite answer, and it produces the incidents above. The sandbox pattern is the middle path: give the agent full autonomy in a structurally safe place, then promote only the verified change to production through normal change-management channels.
-->

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
<!--
The four properties — reversibility, reproducibility, observability, isolation — are the minimum set for an environment that an agent can operate in safely and usefully. Take any one of them away and either the agent becomes unsafe (no isolation, no reversibility) or it stops being useful (no reproducibility means each iteration starts from a different baseline; no observability means the agent cannot close its verification loop).

The scoring table is a frank assessment, not a marketing claim. AutomatedLab scores well for Windows infrastructure work because every property maps to a native PowerShell cmdlet (`Restore-LabVMSnapshot`, `Install-Lab`, `Invoke-LabCommand`, Hyper-V isolation). Dev containers score lower on observability because Windows event logs and registry state are not first-class inside a Linux container. Cloud sandboxes score well *if* cost discipline holds; teams that forget the teardown script discover that an "isolated" agent can run up a four-figure cloud bill over a weekend.
-->
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

<!--
Speaker notes (for newcomers):
- **AutomatedLab** = open-source PowerShell module that builds entire Windows lab environments (DCs, member servers, SQL, etc.) from a script.
- **Hyper-V** = Microsoft's built-in virtualisation in Windows Pro/Enterprise/Server. Free, already installed in most enterprise setups.
- Why does the AI need this? Because it needs a place where rebooting a domain controller costs nothing. AutomatedLab gives that place.
- Alternatives exist (Vagrant, Terraform + Azure) but none are as Windows-native or as PowerShell-first.
-->

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

<!--
The sample script on this slide is a complete working lab definition; nothing has been elided for the slide. The `Install-Lab` call at the bottom triggers AutomatedLab to download (or use locally cached) Windows Server ISOs, provision two Hyper-V VMs, promote the first to a domain controller, join the second to the new domain, and configure the virtual network. The whole sequence takes roughly twenty to forty minutes depending on the host and whether the ISOs are cached.

The brevity is deliberate evidence of the broader claim: infrastructure-as-code is mature enough that a non-trivial environment fits in a twelve-line script. That brevity is what makes the lab a credible sandbox for agents — if rebuilding the environment cost an afternoon, no one would let the agent break it. Because rebuilding takes one command and the agent can drive it, the cost of letting the agent be wrong is essentially the wall-clock time of the next `Install-Lab` invocation.
-->

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
<!--
The diagram is the most explicit mapping in the curriculum between the abstract agentic loop and a concrete infrastructure workflow. Each phase has a literal PowerShell cmdlet behind it — `Get-LabVM` for observe, `Checkpoint-LabVM` and `Invoke-LabCommand` for act, `Get-WinEvent` for verify, `Restore-LabVMSnapshot` for the iteration fallback. None of these were designed with AI agents in mind; they were designed for human operators, and they happen to give the agent the same affordances.

The verify step is the one most often misunderstood. "Did event 205 appear?" is a binary check the agent can run by reading the system event log; it succeeds or fails in a way the agent can act on. By contrast, "is the domain healthy?" is a check no agent can perform reliably because it is not operationalised. The discipline of designing verification steps as concrete log entries or registry values is what makes the loop closable; vague verification criteria collapse the loop back into the cheating-agent trap from Module 5.
-->
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

<!--
The Kerberos RC4 deprecation is the textbook example for this module because it combines all the difficulty modes at once: production-critical (every domain logon depends on it), poorly documented (Microsoft's published guidance has moved several times), incremental (the change happens in named phases with specific event signatures), and irreversible-feeling (operators are afraid to test it because failure cascades across the directory). A lab where the entire environment can be reverted in seconds turns that fear into a routine test.

The eight-step session is the canonical agentic-operations workflow in eight bullets. The output — one commit that includes both the change script and the verified runbook — is what makes the work transferable. A human operator on the production change ticket can read the runbook, see the events that prove the script worked in the lab, and decide whether the same change is safe to roll out. The agent did not change production; the agent produced a reviewable artefact that lets a human change production with confidence.
-->

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

<!--
The snapshot-checkpoint-rollback sequence is the operational equivalent of the Git-based reversibility the curriculum has been arguing for since Module 3. Just as `git revert` makes code changes structurally reversible, `Checkpoint-LabVM` and `Restore-LabVMSnapshot` make infrastructure changes structurally reversible. The agent is allowed to be wrong because the cost of being wrong has been engineered down to seconds.

The rule embedded in the example — take a snapshot before any destructive change, automatically — should be a hard rule in the agent's instruction file for infrastructure work. It costs nothing on success (the snapshot is discarded with the lab teardown) and saves the entire investigation on failure (a single restore call returns to a known-good state). Teams that internalise this rule report dramatically more willingness to let the agent try novel sequences, because the downside has been removed.
-->

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

<!--
Speaker notes (for newcomers):
- One cmdlet to remember: **`Invoke-LabCommand`**. It runs PowerShell *inside* a lab VM and gives you the results back as real objects.
- This is what closes the agentic loop for infrastructure: the agent acts on a VM, then reads back what happened, then decides what to do next.
- Without something like this, the agent is just "typing scripts and hoping" — no feedback, no verification, no iteration.
-->

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

<!--
The table is intentionally specific about which sandbox suits which workload. There is no general-purpose answer; the right choice depends on what the agent is going to interact with. Windows-stack work (AD, GPO, Kerberos, DSC, SCCM) has essentially one defensible answer (AutomatedLab on Hyper-V); cloud-stack work has a different one (Terraform against an isolated subscription); cross-platform application code has yet another (dev containers).

The closing rule — pick the smallest sandbox that still contains the risk — is the parsimony principle for sandbox selection. A multi-forest AutomatedLab with PKI and SCCM is overkill for testing a single DSC composite resource; a dev container is insufficient for rehearsing a domain-wide Kerberos change. Matching the sandbox to the risk surface keeps the iteration cycle fast enough to be useful and complete enough to be trustworthy.
-->

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

<!--
The before/after comparison on this slide compresses what is often a multi-week procedural difference into a single table. The three-week CAB process for a mass attribute change is not paranoia — it is the rational response to a change that touches authentication for every account in the forest. The lab variant does not skip the rigour; it relocates it. The script is still reviewed, the change is still rehearsed, the verification is still required. What changes is that all of that happens in a place where mistakes cost minutes rather than incidents.

The closing line is the operational claim of the entire module. The lab is where risk is rehearsed *before* it touches production, not a place where risk is ignored. A team that uses agents in a lab to rehearse changes ends up with better change tickets — specific scripts, observed event sequences, documented side effects — not lower-quality ones. The CAB review on the production change is still required; it is now able to read a runbook that says "we did this in the lab, here is the event log proving it worked, here is the rollback snapshot reference."
-->

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

<!--
The demo's most instructive moment is step 5 — the first verification failure. In a successful demo the agent reads the event log, sees that the expected event 205 did not appear, looks at related events to diagnose, and proposes a different script. The audience sees the agentic loop working at infrastructure speed: minutes per cycle rather than days, with a full rollback path available at every step.

The "no tab-switching" closing line is a quietly important productivity claim. The traditional Windows operations workflow involves PowerShell ISE for scripting, a Word document for the runbook, a browser tab for the change ticket, and probably Outlook for the email thread tracking the conversation. The agentic operating model collapses all of these into one editor with one repository, one diff history, and one chat. The integration is the productivity gain; the individual tools were already mature.
-->

---

## Slide 12.12: Key Takeaway

# What to Remember

1. **Agents are only as safe as their sandbox.** Choose a sandbox that is reversible, reproducible, observable, and isolated.
2. **AutomatedLab is the Hyper-V-native answer** for Windows, AD, and Microsoft-stack system engineering.
3. **`Invoke-LabCommand` is the agent's hands on infrastructure** — it runs code *and* reads back structured results.
4. **Snapshot before every destructive action.** Make "undo" the default.
5. **A verified change + a diffed runbook + a git commit** is the system engineer's equivalent of green tests.

> **You have just seen the full model: the agent writes code, runs it in a lab, verifies with events, documents the result, and commits. This is agentic operations.**
<!--
The takeaway compresses the entire operations track to five rules. The first three are about structure (sandbox selection, AutomatedLab as the Windows answer, Invoke-LabCommand as the verification primitive); the fourth is the discipline (snapshot before destruction); the fifth is the deliverable framing (a verified change plus a diffed runbook plus a git commit equals green tests for the infrastructure operator).

The closing claim ('this is agentic operations') is the synthesis the curriculum has been building toward since Module 11. The agentic loop, applied to infrastructure through a properly designed lab, produces something the operations community has wanted for a decade and never quite had: changes that arrive at the production change board with their own rehearsal evidence attached. The agent is not bypassing the operational discipline; it is producing the artefacts that operational discipline has always required, at a speed that makes the discipline practical to follow.
-->


## Speaker Notes - Module 12

### Timing: 20-25 minutes (4h cut only)

Module 12 is the operations-track closer. The argument structure is: agents acting on production infrastructure are unsafe by default; a properly designed lab (reversible, reproducible, observable, isolated) makes the agentic loop safe to run; AutomatedLab on Hyper-V is the Hyper-V-native answer for Windows-stack work; Invoke-LabCommand closes the verification loop the way Invoke-Pester does for code.

The Kerberos RC4 example is deliberately chosen because it combines every difficulty mode at once — production-critical, poorly documented, incremental, irreversible-feeling. A lab that rebuilds in twenty minutes turns that fear into a routine test. The operational claim worth landing: the agent does not change production; the agent produces a reviewable artefact (script + runbook + event-log evidence) that lets a human change production with confidence. That is what 'agentic operations' actually means in practice.
