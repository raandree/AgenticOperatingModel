# Test-SlideOverflow.ps1
# Detects content overflow in Marp slide decks.
#
# Workflow:
#   1. (Optional) Rebuild the version-specific Marp source files.
#   2. Render each version to a single HTML file via Marp CLI.
#   3. Load the HTML in headless Chromium (Puppeteer) and measure the
#      scrollHeight of every <section> against the slide viewBox.
#   4. Report any slides whose content overflows the 1280x720 frame.
#
# This is the only reliable way to detect overflow: Marp silently clips
# anything larger than the slide and PowerPoint/PDF/PNG export all inherit
# that clipping. A line-count or character-count heuristic misses tables,
# code blocks with long lines, wrapped headings, and CSS-driven layouts.
#
# Prerequisites:
#   - Node.js (npx is used to invoke @marp-team/marp-cli)
#   - npm install in this folder (installs puppeteer the first time)
#
# Usage:
#   .\Test-SlideOverflow.ps1                      # Check all three versions
#   .\Test-SlideOverflow.ps1 -Version 4h          # Check only the 4h version
#   .\Test-SlideOverflow.ps1 -SkipBuild           # Skip rebuilding md files
#   .\Test-SlideOverflow.ps1 -Json                # Emit JSON instead of text
#   .\Test-SlideOverflow.ps1 -Report              # Also generate HTML side-by-side review report
#
# Exit code:
#   0 = no overflow detected
#   1 = at least one slide overflows
#   2 = tooling error (missing dependency, render failure, etc.)

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
    [switch]$Json,

    [Parameter()]
    [switch]$Report,

    [Parameter()]
    [switch]$KeepHtml
)

$ErrorActionPreference = 'Stop'

# --- Pre-flight ---
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Error "node not found in PATH. Install Node.js to use the overflow checker."
    exit 2
}
if (-not (Get-Command npx -ErrorAction SilentlyContinue)) {
    Write-Error "npx not found in PATH. Install Node.js to use the overflow checker."
    exit 2
}

$pkgJson = Join-Path $PSScriptRoot 'package.json'
$nodeMods = Join-Path $PSScriptRoot 'node_modules'
if (-not (Test-Path $pkgJson)) {
    Write-Error "package.json not found at $pkgJson — overflow checker requires it."
    exit 2
}
if (-not (Test-Path $nodeMods)) {
    Write-Host "First run: installing Node dependencies (puppeteer, ~150 MB Chromium)..." -ForegroundColor Cyan
    Push-Location $PSScriptRoot
    try {
        & npm install --no-audit --no-fund --loglevel=error
        if ($LASTEXITCODE -ne 0) {
            Write-Error "npm install failed (exit $LASTEXITCODE)."
            exit 2
        }
    }
    finally {
        Pop-Location
    }
}

# --- Optional: rebuild version files first ---
if (-not $SkipBuild) {
    Write-Host "Rebuilding version-specific Marp files..." -ForegroundColor Cyan
    & "$PSScriptRoot\Build-MarpVersions.ps1" -Version $Version
}

$versions = if ($Version -eq 'all') { @('1h', '2h', '4h') } else { @($Version) }

$summary = [System.Collections.Generic.List[hashtable]]::new()
$overallOverflow = 0

foreach ($ver in $versions) {
    $md = switch ($ver) {
        '1h' { 'marp-1h-keynote.md' }
        '2h' { 'marp-2h-standard.md' }
        '4h' { 'marp-4h-workshop.md' }
    }
    $mdPath = Join-Path $PSScriptRoot $md
    if (-not (Test-Path $mdPath)) {
        Write-Warning "Skipping ${ver}: $md not found. Run Build-MarpVersions.ps1 first."
        continue
    }

    $htmlPath = Join-Path $OutputDir "_overflow_${ver}.html"

    Write-Host ""
    Write-Host "[$ver] Rendering $md -> HTML..." -ForegroundColor Cyan
    $marpArgs = @('--yes', '@marp-team/marp-cli@latest', $mdPath, '--html', '--allow-local-files', '-o', $htmlPath)
    & npx @marpArgs 2>&1 | ForEach-Object {
        if ($_ -match '\[ ERROR \]') { Write-Host "  $_" -ForegroundColor Red }
        elseif ($_ -match '\[  INFO \]') { Write-Host "  $_" -ForegroundColor DarkGray }
    }
    if (-not (Test-Path $htmlPath)) {
        Write-Error "Marp HTML output not produced for ${ver}."
        exit 2
    }

    Write-Host "[$ver] Measuring overflow..." -ForegroundColor Cyan
    $checker = Join-Path $PSScriptRoot 'overflow-check.mjs'
    $jsonOut = & node $checker $htmlPath '--json'
    $nodeExit = $LASTEXITCODE
    if ($nodeExit -eq 2) {
        Write-Error "overflow-check.mjs failed for ${ver}."
        exit 2
    }

    try {
        $results = $jsonOut | ConvertFrom-Json
    }
    catch {
        Write-Error "Failed to parse JSON output from overflow-check.mjs for ${ver}: $_"
        exit 2
    }

    $overflowing = @($results | Where-Object { $_.overflows })
    $overallOverflow += $overflowing.Count

    if ($Json) {
        # JSON mode: print structured results per version.
        [PSCustomObject]@{
            version       = $ver
            slidesTotal   = $results.Count
            slidesOverflow = $overflowing.Count
            slides        = $results
        } | ConvertTo-Json -Depth 6
    }
    else {
        $ok = $results.Count - $overflowing.Count
        $color = if ($overflowing.Count -eq 0) { 'Green' } else { 'Yellow' }
        Write-Host ("[{0}] {1} slides, {2} fit, {3} overflow" -f $ver, $results.Count, $ok, $overflowing.Count) -ForegroundColor $color
        if ($overflowing.Count -gt 0) {
            foreach ($o in $overflowing) {
                $title = if ($o.title) { ' "' + $o.title + '"' } else { '' }
                $line = "  Slide {0}{1}  overflow Y={2}px  X={3}px  fill={4}" -f $o.slide, $title, $o.overflowY, $o.overflowX, $o.fillRatio
                Write-Host $line -ForegroundColor Red
            }
        }
    }

    $summary.Add(@{
        Version     = $ver
        Md          = $mdPath
        Html        = $htmlPath
        Results     = $results
        Overflowing = $overflowing
    })
}

# --- Optional: HTML side-by-side review report ---
if ($Report) {
    Write-Host ""
    Write-Host "Generating side-by-side review report..." -ForegroundColor Cyan
    $reportArgs = @{
        OutputDir = $OutputDir
        Summary   = $summary
    }
    & "$PSScriptRoot\New-SlideReviewReport.ps1" @reportArgs
}

# --- Cleanup intermediate HTML unless caller wants to keep it ---
if (-not $KeepHtml -and -not $Report) {
    foreach ($s in $summary) {
        if (Test-Path $s.Html) { Remove-Item $s.Html -Force -ErrorAction SilentlyContinue }
    }
}

if ($overallOverflow -gt 0) {
    Write-Host ""
    Write-Host "$overallOverflow slide(s) overflow across all checked versions." -ForegroundColor Red
    exit 1
}
else {
    Write-Host ""
    Write-Host "No overflow detected." -ForegroundColor Green
    exit 0
}
