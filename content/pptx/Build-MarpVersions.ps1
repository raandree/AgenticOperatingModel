# Build-MarpVersions.ps1
# Generates three version-specific MARP presentation files from the single source.
#
# Usage:
#   .\Build-MarpVersions.ps1                           # Generate MD for all three versions
#   .\Build-MarpVersions.ps1 -Version 2h               # Generate MD only for the 2h version
#   .\Build-MarpVersions.ps1 -AddMissingTags           # Add default tags to untagged slides
#   .\Build-MarpVersions.ps1 -ExportPptx               # Also build PPTX files
#   .\Build-MarpVersions.ps1 -ExportPng                # Also export PNG snapshots for visual review
#   .\Build-MarpVersions.ps1 -CheckOverflow            # Programmatic overflow check (Puppeteer)
#   .\Build-MarpVersions.ps1 -Report                   # PNG + HTML side-by-side review report (implies -CheckOverflow)
#   .\Build-MarpVersions.ps1 -ExportPptx -ExportPng    # Full build + visual post-check
#
# Each slide in the source file should have a version tag comment right after
# the --- separator:
#   ---
#   <!-- version: 1h 2h 4h -->
#
# Slides without a tag default to "4h" only (safest default — include in longest version).

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateSet('1h', '2h', '4h', 'all')]
    [string]$Version = 'all',

    [Parameter()]
    [string]$SourcePath = (Join-Path $PSScriptRoot '..\slides\marp-presentation.md'),

    [Parameter()]
    [string]$OutputDir = $PSScriptRoot,

    [Parameter()]
    [switch]$AddMissingTags,

    [Parameter()]
    [switch]$ExportPptx,

    [Parameter()]
    [switch]$ExportPng,

    [Parameter()]
    [switch]$CheckOverflow,

    [Parameter()]
    [switch]$Report
)

$ErrorActionPreference = 'Stop'

# --- Parse the MARP source file into slides ---
function Split-MarpSlides {
    param([string]$Content)

    $lines = $Content -split "`n"
    $slides = [System.Collections.Generic.List[hashtable]]::new()
    $currentLines = [System.Collections.Generic.List[string]]::new()
    $inCodeBlock = $false
    $inFrontmatter = $false
    $frontmatterDone = $false
    $frontmatterLines = [System.Collections.Generic.List[string]]::new()

    foreach ($line in $lines) {
        $trimmed = $line.TrimEnd("`r")

        # Track code blocks (``` toggles)
        if ($trimmed -match '^```') {
            $inCodeBlock = -not $inCodeBlock
        }

        # Handle --- separators (only outside code blocks)
        if (-not $inCodeBlock -and $trimmed -eq '---') {
            if (-not $frontmatterDone) {
                if ($inFrontmatter) {
                    # End of YAML frontmatter
                    $frontmatterLines.Add($line)
                    $frontmatterDone = $true
                    $inFrontmatter = $false
                    continue
                }
                else {
                    # Start of YAML frontmatter
                    $frontmatterLines.Add($line)
                    $inFrontmatter = $true
                    continue
                }
            }

            # Real slide separator — save current slide and start new one
            if ($currentLines.Count -gt 0) {
                $slides.Add(@{
                    Lines = [string[]]$currentLines.ToArray()
                })
            }
            $currentLines = [System.Collections.Generic.List[string]]::new()
            continue
        }

        if ($inFrontmatter) {
            $frontmatterLines.Add($line)
        }
        else {
            $currentLines.Add($line)
        }
    }

    # Last slide
    if ($currentLines.Count -gt 0) {
        $slides.Add(@{
            Lines = [string[]]$currentLines.ToArray()
        })
    }

    return @{
        Frontmatter = [string[]]$frontmatterLines.ToArray()
        Slides      = $slides.ToArray()
    }
}

# --- Extract version tag from a slide ---
function Get-SlideVersion {
    param([string[]]$SlideLines)

    foreach ($line in $SlideLines) {
        $trimmed = $line.TrimEnd("`r").Trim()
        if ($trimmed -match '^<!--\s*version:\s*(.+?)\s*-->') {
            return $Matches[1].Trim()
        }
        # Stop looking after first non-empty, non-comment line
        if ($trimmed -ne '' -and $trimmed -notmatch '^<!--') {
            break
        }
    }
    return $null
}

# --- Remove version tag from slide lines ---
function Remove-VersionTag {
    param([string[]]$SlideLines)

    $result = [System.Collections.Generic.List[string]]::new()
    $foundTag = $false
    foreach ($line in $SlideLines) {
        $trimmed = $line.TrimEnd("`r").Trim()
        if (-not $foundTag -and $trimmed -match '^<!--\s*version:') {
            $foundTag = $true
            continue  # Skip the version tag line
        }
        $result.Add($line)
    }
    return [string[]]$result.ToArray()
}

# --- Main logic ---
$sourcePath = (Resolve-Path $SourcePath -ErrorAction Stop).Path
$content = Get-Content $sourcePath -Raw -Encoding UTF8
$parsed = Split-MarpSlides -Content $content

Write-Host "Parsed: $($parsed.Slides.Count) slides from source" -ForegroundColor Cyan

# --- AddMissingTags mode ---
if ($AddMissingTags) {
    $untagged = 0
    foreach ($slide in $parsed.Slides) {
        $version = Get-SlideVersion -SlideLines $slide.Lines
        if (-not $version) { $untagged++ }
    }

    if ($untagged -eq 0) {
        Write-Host "All slides already have version tags." -ForegroundColor Green
        return
    }

    Write-Host "$untagged slides are missing version tags. Adding default '4h' tag..." -ForegroundColor Yellow

    $newLines = [System.Collections.Generic.List[string]]::new()
    $newLines.AddRange($parsed.Frontmatter)

    for ($i = 0; $i -lt $parsed.Slides.Count; $i++) {
        $slide = $parsed.Slides[$i]
        $version = Get-SlideVersion -SlideLines $slide.Lines
        $newLines.Add('---')
        if (-not $version) {
            # Insert default tag as first line of slide
            $newLines.Add('<!-- version: 4h -->')
        }
        $newLines.AddRange($slide.Lines)
    }

    $newContent = $newLines -join "`n"
    Set-Content -Path $sourcePath -Value $newContent -Encoding UTF8 -NoNewline
    Write-Host "Added $untagged default version tags. Review and adjust them." -ForegroundColor Green
    return
}

# --- Build mode: generate version-specific files ---
$versions = if ($Version -eq 'all') { @('1h', '2h', '4h') } else { @($Version) }

foreach ($ver in $versions) {
    $outputSlides = [System.Collections.Generic.List[string[]]]::new()
    $included = 0
    $excluded = 0

    for ($i = 0; $i -lt $parsed.Slides.Count; $i++) {
        $slide = $parsed.Slides[$i]
        $versionTag = Get-SlideVersion -SlideLines $slide.Lines

        if (-not $versionTag) {
            # No tag = 4h only (conservative default)
            $versionTag = '4h'
        }

        # Check if this version is included
        if ($versionTag -match "\b$ver\b") {
            $cleanLines = Remove-VersionTag -SlideLines $slide.Lines
            $outputSlides.Add($cleanLines)
            $included++
        }
        else {
            $excluded++
        }
    }

    # Assemble output
    $outputLines = [System.Collections.Generic.List[string]]::new()
    $outputLines.AddRange($parsed.Frontmatter)

    for ($i = 0; $i -lt $outputSlides.Count; $i++) {
        $outputLines.Add('---')
        $outputLines.AddRange($outputSlides[$i])
    }

    # Write output file
    $fileName = switch ($ver) {
        '1h' { 'marp-1h-keynote.md' }
        '2h' { 'marp-2h-standard.md' }
        '4h' { 'marp-4h-workshop.md' }
    }
    $outputPath = Join-Path $OutputDir $fileName
    $outputContent = $outputLines -join "`n"
    Set-Content -Path $outputPath -Value $outputContent -Encoding UTF8 -NoNewline

    Write-Host "Generated $fileName — $included slides (excluded $excluded)" -ForegroundColor Green
}

Write-Host "`nDone. Output files are in: $OutputDir" -ForegroundColor Cyan

# --- Optional: export PPTX and/or PNG for each generated version ---
function Invoke-MarpCli {
    param(
        [Parameter(Mandatory)][string]$InputFile,
        [Parameter(Mandatory)][string[]]$ExtraArgs
    )
    $npxArgs = @('--yes', '@marp-team/marp-cli@latest', $InputFile) + $ExtraArgs + @('--allow-local-files')
    & npx @npxArgs 2>&1 | ForEach-Object {
        if ($_ -match '\[ ERROR \]') {
            Write-Host $_ -ForegroundColor Red
        }
        elseif ($_ -match '\[ WARN \]') {
            # suppress local-file warning — it is expected
        }
        elseif ($_ -match '\[  INFO \]') {
            Write-Host "  $_" -ForegroundColor DarkGray
        }
    }
}

if ($ExportPptx -or $ExportPng) {
    if (-not (Get-Command npx -ErrorAction SilentlyContinue)) {
        Write-Warning "npx not found — skipping PPTX/PNG export. Install Node.js to enable."
        return
    }

    $targets = $versions | ForEach-Object {
        switch ($_) {
            '1h' { @{ Md = 'marp-1h-keynote.md';   Base = 'agentic-operating-model-1h' } }
            '2h' { @{ Md = 'marp-2h-standard.md';  Base = 'agentic-operating-model-2h' } }
            '4h' { @{ Md = 'marp-4h-workshop.md';  Base = 'agentic-operating-model-4h' } }
        }
    }

    Push-Location $OutputDir
    try {
        foreach ($t in $targets) {
            if ($ExportPptx) {
                $pptx = "$($t.Base).pptx"
                Write-Host "`nExporting PPTX: $pptx" -ForegroundColor Cyan
                Invoke-MarpCli -InputFile $t.Md -ExtraArgs @('--pptx', '-o', $pptx)
            }

            if ($ExportPng) {
                $pngDir = "png-$($t.Base)"
                if (Test-Path $pngDir) { Remove-Item $pngDir -Recurse -Force }
                New-Item -ItemType Directory -Path $pngDir | Out-Null

                Write-Host "`nExporting PNGs for review: $pngDir/" -ForegroundColor Cyan
                # marp-cli writes <basename>.NNN without an extension; we rename afterward
                $pngBase = Join-Path $pngDir 'slide'
                Invoke-MarpCli -InputFile $t.Md -ExtraArgs @('--images', 'png', '-o', $pngBase)

                Get-ChildItem $pngDir -File |
                    Where-Object { $_.Extension -ne '.png' } |
                    ForEach-Object { Rename-Item $_.FullName ($_.FullName + '.png') }

                $count = (Get-ChildItem $pngDir -Filter *.png).Count
                Write-Host "  $count slide images in $pngDir/" -ForegroundColor Green
            }
        }
    }
    finally {
        Pop-Location
    }

    Write-Host "`nExport complete." -ForegroundColor Cyan
    if ($ExportPng) {
        Write-Host "Review tip: open png-agentic-operating-model-<ver>/ in Explorer and flip through with Preview (Space) to spot overflow." -ForegroundColor Yellow
    }
}

# --- Optional: programmatic overflow detection / side-by-side review report ---
if ($Report) {
    # -Report implies -CheckOverflow plus the HTML side-by-side report.
    Write-Host "`nGenerating side-by-side review report (this also runs the overflow check)..." -ForegroundColor Cyan
    & "$PSScriptRoot\Test-SlideOverflow.ps1" -Version $Version -SkipBuild -Report
}
elseif ($CheckOverflow) {
    Write-Host "`nRunning overflow check (Puppeteer)..." -ForegroundColor Cyan
    & "$PSScriptRoot\Test-SlideOverflow.ps1" -Version $Version -SkipBuild
}
