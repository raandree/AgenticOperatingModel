# Export-MarpToPptx.ps1
# Converts Marp presentations to PowerPoint (PPTX) or PDF.
# Handles broken emoji rendering by replacing Unicode emoji with styled HTML spans
# before export (only outside code blocks). Source files are not modified.
#
# Prerequisites:
#   npm install -g @marp-team/marp-cli
#
# Usage:
#   .\Export-MarpToPptx.ps1                     # Export all versions to PPTX
#   .\Export-MarpToPptx.ps1 -Version 2h         # Export only the 2h version
#   .\Export-MarpToPptx.ps1 -Pdf                # Export to PDF instead
#   .\Export-MarpToPptx.ps1 -SkipBuild          # Skip regenerating version files

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateSet('1h', '2h', '4h', 'all')]
    [string]$Version = 'all',

    [Parameter()]
    [string]$OutputDir = $PSScriptRoot,

    [Parameter()]
    [switch]$SkipBuild,

    [Parameter()]
    [switch]$Pdf
)

$ErrorActionPreference = 'Stop'

# --- Check prerequisites ---
if (-not (Get-Command marp -ErrorAction SilentlyContinue)) {
    Write-Error "Marp CLI not found. Install with: npm install -g @marp-team/marp-cli"
    return
}

# --- Emoji replacement map ---
# Marp converts Unicode emoji to Twemoji <img> tags referencing a CDN.
# These remote images break during PPTX/PDF export (rendered offline by Chromium).
# We replace them with styled HTML spans using non-emoji Unicode characters.
$emojiReplacements = [ordered]@{
    '❌' = '<span style="color:#ef4444;font-weight:bold;font-size:1.1em">✗</span>'
    '✅' = '<span style="color:#22c55e;font-weight:bold;font-size:1.1em">✓</span>'
    '⚠️'  = '<span style="color:#f59e0b;font-weight:bold;font-size:1.1em">⚠</span>'
    '🤖' = '<span style="font-size:1.1em">[AI]</span>'
    '🔒' = '<span style="color:#f59e0b;font-size:1.1em">🔐</span>'
}

# --- Replace emoji outside of code blocks ---
function ConvertTo-NativeEmoji {
    param(
        [string]$Content,
        [System.Collections.Specialized.OrderedDictionary]$Replacements
    )

    $lines = $Content -split "`n"
    $result = [System.Collections.Generic.List[string]]::new()
    $inCodeBlock = $false

    foreach ($line in $lines) {
        $trimmed = $line.TrimEnd("`r")

        if ($trimmed -match '^```') {
            $inCodeBlock = -not $inCodeBlock
        }

        if (-not $inCodeBlock) {
            foreach ($key in $Replacements.Keys) {
                $line = $line.Replace($key, $Replacements[$key])
            }
        }

        $result.Add($line)
    }

    return $result -join "`n"
}

# --- Step 1: Build version-specific Marp files from source ---
if (-not $SkipBuild) {
    Write-Host 'Building version-specific Marp files...' -ForegroundColor Cyan
    & "$PSScriptRoot\Build-MarpVersions.ps1" -Version $Version
    Write-Host ''
}

# --- Step 2: Export each version ---
$versions = if ($Version -eq 'all') { @('1h', '2h', '4h') } else { @($Version) }
$ext = if ($Pdf) { 'pdf' } else { 'pptx' }

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

    # Create a temporary copy with emoji replaced by HTML spans
    $tempPath = Join-Path $PSScriptRoot "_export_temp_$fileName"
    $content = Get-Content $sourcePath -Raw -Encoding UTF8
    $content = ConvertTo-NativeEmoji -Content $content -Replacements $emojiReplacements
    Set-Content -Path $tempPath -Value $content -Encoding UTF8 -NoNewline

    # Run Marp CLI
    $outputFile = Join-Path $OutputDir "agentic-operating-model-$ver.$ext"
    Write-Host "Exporting $fileName -> $outputFile" -ForegroundColor Green

    $marpArgs = @(
        $tempPath
        "--$ext"
        '--html'
        '--allow-local-files'
        '-o'
        $outputFile
    )
    & marp @marpArgs

    if ($LASTEXITCODE -ne 0) {
        Write-Warning "Marp export failed for $fileName (exit code $LASTEXITCODE)"
    }

    # Clean up temp file
    Remove-Item $tempPath -Force -ErrorAction SilentlyContinue
}

Write-Host "`nExport complete. Output directory: $OutputDir" -ForegroundColor Cyan
