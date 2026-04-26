# Technical Context

> **What this file is**: Tools, versions, platforms, environment. The "what runs this project" reference. On-demand read.

## Platform

- **OS**: <Windows 11 / Server 2025 / Ubuntu 24.04 / …>
- **Shell**: <PowerShell 7.x / bash / zsh>
- **Editor**: VS Code + GitHub Copilot (Agent Mode)

## Languages & runtimes

| Language / Runtime | Version | Where used |
|---|---|---|
| <PowerShell> | <7.4+> | <scripts/> |
| <Python> | <3.12> | <analysis/> |

## Key tools & libraries

| Tool | Version | Purpose |
|---|---|---|
| <AutomatedLab> | <5.x> | Lab provisioning |
| <pandoc> | <3.x> | Markdown → DOCX export |
| <git> | <2.40+> | Version control |

## External services

| Service | Purpose | Auth model |
|---|---|---|
| <GitHub> | <Repo hosting> | <SSH / PAT> |
| <M365 / Graph> | <Email, calendar> | <Device code / app reg> |

## Local environment assumptions

- <Requires Hyper-V enabled>
- <Requires `$env:AUTOMATEDLAB_ROOT` set>
- <Specific ExecutionPolicy>

## How to bring up a clean dev environment

```powershell
# Steps to install dependencies from scratch
```

## Known compatibility issues

| Issue | Workaround |
|---|---|
| <Issue> | <Workaround> |
