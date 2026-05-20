# Export-PandocToPptx.ps1
# Converts the Marp Markdown decks to *editable* PowerPoint files via Pandoc.
# Unlike Marp's PPTX export (which embeds each slide as a single image), Pandoc
# produces native PPTX with selectable text, bullet lists, tables, and code
# blocks. Layout fidelity is lower than Marp, but the output is editable in
# PowerPoint.
#
# Prerequisites:
#   pandoc 3.x  (winget install --id JohnMacFarlane.Pandoc)
#
# Usage:
#   .\Export-PandocToPptx.ps1                       # all three versions
#   .\Export-PandocToPptx.ps1 -Version 2h           # one version
#   .\Export-PandocToPptx.ps1 -ReferenceDoc .\template.pptx  # use a corporate template
#   .\Export-PandocToPptx.ps1 -SkipBuild            # skip regenerating version files

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateSet('1h', '2h', '4h', 'all')]
    [string]$Version = 'all',

    [Parameter()]
    [string]$OutputDir = $PSScriptRoot,

    [Parameter()]
    [string]$ReferenceDoc,

    [Parameter()]
    [switch]$SkipBuild
)

$ErrorActionPreference = 'Stop'

if (-not (Get-Command pandoc -ErrorAction SilentlyContinue)) {
    Write-Error 'Pandoc not found. Install with: winget install --id JohnMacFarlane.Pandoc'
    return
}

# --- Strip Marp-specific syntax that Pandoc does not need ---
# - YAML frontmatter (Marp directives + embedded CSS) is removed wholesale;
#   styling will come from the reference doc instead.
# - HTML comments (Marp per-slide directives like <!-- _class: dense --> and
#   our own <!-- version: ... --> tags) are stripped so they do not appear
#   as raw text in the deck.
function ConvertTo-PandocMarkdown {
    param([string]$Content)

    # Remove leading YAML frontmatter (--- ... ---) at file start.
    if ($Content -match '^---\r?\n') {
        $idx = $Content.IndexOf("`n---", 4)
        if ($idx -ge 0) {
            # Skip past the closing --- and following newline(s)
            $rest = $Content.Substring($idx + 4)
            $rest = $rest -replace '^\r?\n', ''
            $Content = $rest
        }
    }

    # Strip HTML comments (single-line; Marp directives are always single-line).
    $lines = $Content -split "`n"
    $kept = [System.Collections.Generic.List[string]]::new()
    $inCodeBlock = $false
    foreach ($line in $lines) {
        $trimmed = $line.TrimEnd("`r")
        if ($trimmed -match '^```') { $inCodeBlock = -not $inCodeBlock }
        if (-not $inCodeBlock -and $trimmed -match '^\s*<!--.*-->\s*$') { continue }
        $kept.Add($line)
    }

    return ($kept -join "`n")
}

# --- Step 1: regenerate version files unless skipped ---
if (-not $SkipBuild) {
    Write-Host 'Building version-specific Marp files...' -ForegroundColor Cyan
    & "$PSScriptRoot\Build-MarpVersions.ps1" -Version $Version
    Write-Host ''
}

# --- Step 2: convert each version ---
$versions = if ($Version -eq 'all') { @('1h', '2h', '4h') } else { @($Version) }

foreach ($ver in $versions) {
    $fileName = switch ($ver) {
        '1h' { 'marp-1h-keynote.md' }
        '2h' { 'marp-2h-standard.md' }
        '4h' { 'marp-4h-workshop.md' }
    }

    $sourcePath = Join-Path $PSScriptRoot $fileName
    if (-not (Test-Path $sourcePath)) {
        Write-Warning "File not found: $fileName — run Build-MarpVersions.ps1 first."
        continue
    }

    $tempPath = Join-Path $PSScriptRoot "_pandoc_temp_$fileName"
    $content = Get-Content $sourcePath -Raw -Encoding UTF8
    $content = ConvertTo-PandocMarkdown -Content $content
    Set-Content -Path $tempPath -Value $content -Encoding UTF8 -NoNewline

    $outputFile = Join-Path $OutputDir "agentic-operating-model-$ver-editable.pptx"
    Write-Host "Exporting $fileName -> $outputFile" -ForegroundColor Green

    $pandocArgs = @(
        $tempPath
        '--from=gfm'
        '--to=pptx'
        '--slide-level=1'
        '-o', $outputFile
    )
    if ($ReferenceDoc) {
        $refPath = (Resolve-Path $ReferenceDoc -ErrorAction Stop).Path
        $pandocArgs += @('--reference-doc', $refPath)
    }

    & pandoc @pandocArgs

    if ($LASTEXITCODE -ne 0) {
        Write-Warning "Pandoc export failed for $fileName (exit code $LASTEXITCODE)"
    }

    Remove-Item $tempPath -Force -ErrorAction SilentlyContinue
}

Write-Host "`nExport complete. Output directory: $OutputDir" -ForegroundColor Cyan
Write-Host 'Tip: open one of the *-editable.pptx files in PowerPoint and click any text — it should be selectable.' -ForegroundColor DarkGray
