<#
.SYNOPSIS
    Root-level entry point that builds the presentation slide decks.

.DESCRIPTION
    Thin wrapper around content/pptx/Build-MarpVersions.ps1 so the Marp deck
    build can be triggered from the repository root without changing into
    content/pptx first. All parameters are forwarded to the underlying build
    script; see content/pptx/Build-MarpVersions.ps1 (and
    content/pptx/README-how-to-create-pptx.md) for the full parameter
    reference, overflow-check flags, and Marp CLI setup.

.PARAMETER Version
    Which version(s) to build: 1h, 2h, 4h, or all (default).

.PARAMETER AddMissingTags
    Add default <!-- version: --> tags to any untagged slide in the source.

.PARAMETER ExportPptx
    After building the Marp .md files, also export each version to PPTX via
    the Marp CLI. Requires @marp-team/marp-cli.

.PARAMETER ExportPng
    After building, export PNG snapshots of every slide for visual review.

.PARAMETER CheckOverflow
    Run the Puppeteer-based overflow detector against each built deck and
    fail the build if any slide exceeds the 720 px frame.

.PARAMETER Report
    Generate the side-by-side slide-review-<version>.html report. Implies
    -CheckOverflow and PNG export.

.PARAMETER AssembleFromSplits
    Advanced: assemble the source from per-module split files instead of the
    monolith. Off by default because the splits currently overflow.

.PARAMETER MergeNotesFromSplits
    Advanced: control whether speaker-note HTML comments from the split
    files are merged into the monolith slides. Defaults to auto-on when
    split files exist; pass -MergeNotesFromSplits:$false to disable.

.EXAMPLE
    .\build.ps1

    Build all three Marp version files (1h, 2h, 4h) from the monolith source
    with split-file speaker notes merged. No PPTX export.

.EXAMPLE
    .\build.ps1 -Version 2h -ExportPptx

    Build only the 2h Marp version file and export it to PPTX.

.EXAMPLE
    .\build.ps1 -Version all -ExportPptx -CheckOverflow

    Full pre-delivery build: all three versions, exported to PPTX, with the
    Puppeteer-based overflow check enforcing the 720 px slide frame.

.NOTES
    For advanced overrides (custom SourcePath / OutputDir) call
    content/pptx/Build-MarpVersions.ps1 directly.
#>
[CmdletBinding()]
param(
    [Parameter()]
    [ValidateSet('1h', '2h', '4h', 'all')]
    [string]$Version = 'all',

    [Parameter()]
    [switch]$AddMissingTags,

    [Parameter()]
    [switch]$ExportPptx,

    [Parameter()]
    [switch]$ExportPng,

    [Parameter()]
    [switch]$CheckOverflow,

    [Parameter()]
    [switch]$Report,

    [Parameter()]
    [switch]$AssembleFromSplits,

    [Parameter()]
    [Nullable[bool]]$MergeNotesFromSplits = $null
)

$ErrorActionPreference = 'Stop'

$buildScript = Join-Path $PSScriptRoot 'content/pptx/Build-MarpVersions.ps1'
if (-not (Test-Path -LiteralPath $buildScript)) {
    throw "Build script not found at '$buildScript'."
}

& $buildScript @PSBoundParameters