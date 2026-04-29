# New-SlideReviewReport.ps1
# Generates an HTML side-by-side review report for one or more Marp deck versions.
# For each slide it shows:
#   - The source markdown (sliced from the version-specific Marp file)
#   - The rendered slide image (PNG snapshot exported via Marp CLI)
#   - An overflow badge (from Test-SlideOverflow.ps1 results, if supplied)
#
# This makes it easy to scroll through every slide and confirm that what's in
# the source markdown actually fits inside the rendered slide. Particularly
# useful after content edits to spot silently clipped tables, code blocks,
# and long paragraphs.
#
# Usage (typical, called via Test-SlideOverflow.ps1 -Report):
#   .\New-SlideReviewReport.ps1 -Summary $summary
#
# Usage (standalone — generates PNGs and report from scratch):
#   .\New-SlideReviewReport.ps1 -Version 4h
#   .\New-SlideReviewReport.ps1 -Version all
#
# Output:
#   slide-review-<version>.html  — open in any browser

[CmdletBinding(DefaultParameterSetName = 'Standalone')]
param(
    [Parameter(ParameterSetName = 'Standalone')]
    [ValidateSet('1h', '2h', '4h', 'all')]
    [string]$Version = 'all',

    [Parameter(ParameterSetName = 'FromSummary')]
    [hashtable[]]$Summary,

    [Parameter()]
    [string]$OutputDir = $PSScriptRoot,

    [Parameter()]
    [switch]$SkipPngExport,

    [Parameter()]
    [switch]$SkipOverflowCheck
)

$ErrorActionPreference = 'Stop'

# --- Helpers ---
function ConvertTo-EncodedHtml {
    param([string]$Text)
    if ($null -eq $Text) { return '' }
    return [System.Net.WebUtility]::HtmlEncode($Text)
}

function Split-MarpSlidesFromFile {
    param([string]$Path)
    $content = Get-Content $Path -Raw -Encoding UTF8
    $lines = $content -split "`n"
    $slides = [System.Collections.Generic.List[string]]::new()
    $cur = [System.Collections.Generic.List[string]]::new()
    $inCode = $false
    $fmDone = $false
    $inFm = $false
    foreach ($l in $lines) {
        $t = $l.TrimEnd("`r")
        if ($t -match '^```') { $inCode = -not $inCode }
        if (-not $inCode -and $t -eq '---') {
            if (-not $fmDone) {
                if ($inFm) { $fmDone = $true; $inFm = $false; continue }
                else { $inFm = $true; continue }
            }
            # Slide separator (also matches Marp's behaviour: an empty section
            # is created when two '---' appear back-to-back, e.g. when the
            # build script writes a '---' immediately after the frontmatter
            # close. We preserve this so source-md slide numbers align with
            # Marp's pagination and the PNG snapshot file numbers.)
            [void]$slides.Add(($cur -join "`n").Trim("`n"))
            $cur = [System.Collections.Generic.List[string]]::new()
            continue
        }
        if (-not $inFm) { [void]$cur.Add($l) }
    }
    [void]$slides.Add(($cur -join "`n").Trim("`n"))
    return ,$slides.ToArray()
}

function Invoke-MarpCli {
    param(
        [Parameter(Mandatory)][string]$InputFile,
        [Parameter(Mandatory)][string[]]$ExtraArgs
    )
    $npxArgs = @('--yes', '@marp-team/marp-cli@latest', $InputFile) + $ExtraArgs + @('--allow-local-files')
    & npx @npxArgs 2>&1 | ForEach-Object {
        if ($_ -match '\[ ERROR \]') { Write-Host $_ -ForegroundColor Red }
        elseif ($_ -match '\[  INFO \]') { Write-Host "  $_" -ForegroundColor DarkGray }
    }
}

# --- Build the work-set (either from passed-in $Summary or from disk) ---
$workSet = [System.Collections.Generic.List[hashtable]]::new()

if ($PSCmdlet.ParameterSetName -eq 'FromSummary') {
    foreach ($s in $Summary) { [void]$workSet.Add($s) }
}
else {
    $versions = if ($Version -eq 'all') { @('1h', '2h', '4h') } else { @($Version) }
    foreach ($ver in $versions) {
        $md = switch ($ver) {
            '1h' { 'marp-1h-keynote.md' }
            '2h' { 'marp-2h-standard.md' }
            '4h' { 'marp-4h-workshop.md' }
        }
        $mdPath = Join-Path $PSScriptRoot $md
        if (-not (Test-Path $mdPath)) {
            Write-Warning "Skipping ${ver}: $md not found."
            continue
        }
        [void]$workSet.Add(@{
            Version     = $ver
            Md          = $mdPath
            Html        = $null
            Results     = $null
            Overflowing = @()
        })
    }
}

if ($workSet.Count -eq 0) {
    Write-Warning "Nothing to do. No versions resolved."
    return
}

# --- Optional: run overflow check if not already supplied ---
if (-not $SkipOverflowCheck) {
    foreach ($w in $workSet) {
        if ($null -ne $w.Results) { continue }
        $ver = $w.Version
        $htmlPath = Join-Path $OutputDir "_overflow_${ver}.html"
        Write-Host "[$ver] Rendering HTML for overflow check..." -ForegroundColor Cyan
        Invoke-MarpCli -InputFile $w.Md -ExtraArgs @('--html', '-o', $htmlPath)
        $w.Html = $htmlPath
        if (Test-Path $htmlPath) {
            $checker = Join-Path $PSScriptRoot 'overflow-check.mjs'
            $jsonOut = & node $checker $htmlPath '--json'
            if ($LASTEXITCODE -eq 2) {
                Write-Warning "[$ver] overflow-check.mjs failed; report will not show overflow badges."
            }
            else {
                try {
                    $w.Results = $jsonOut | ConvertFrom-Json
                    $w.Overflowing = @($w.Results | Where-Object { $_.overflows })
                }
                catch {
                    Write-Warning "[$ver] Failed to parse overflow JSON: $_"
                }
            }
        }
    }
}

# --- Export PNG snapshots if not present ---
foreach ($w in $workSet) {
    $ver = $w.Version
    $base = "agentic-operating-model-${ver}"
    $pngDir = Join-Path $OutputDir "png-${base}"

    if ($SkipPngExport -and (Test-Path $pngDir)) {
        Write-Host "[$ver] Reusing existing PNGs in $pngDir" -ForegroundColor DarkGray
    }
    else {
        if (Test-Path $pngDir) { Remove-Item $pngDir -Recurse -Force }
        New-Item -ItemType Directory -Path $pngDir | Out-Null

        Write-Host "[$ver] Exporting PNG snapshots to $pngDir..." -ForegroundColor Cyan
        $pngBase = Join-Path $pngDir 'slide'
        Invoke-MarpCli -InputFile $w.Md -ExtraArgs @('--images', 'png', '-o', $pngBase)

        Get-ChildItem $pngDir -File |
            Where-Object { $_.Extension -ne '.png' } |
            ForEach-Object { Rename-Item $_.FullName ($_.FullName + '.png') }
    }

    $w.PngDir = $pngDir
}

# --- Generate one HTML report per version ---
foreach ($w in $workSet) {
    $ver = $w.Version
    $slides = Split-MarpSlidesFromFile -Path $w.Md
    $pngFiles = @(Get-ChildItem $w.PngDir -Filter '*.png' | Sort-Object Name)

    $reportPath = Join-Path $OutputDir "slide-review-${ver}.html"
    $relPngDir = Split-Path $w.PngDir -Leaf

    $css = @'
:root { color-scheme: light; }
* { box-sizing: border-box; }
body { font-family: 'Segoe UI', Arial, sans-serif; margin: 0; padding: 0; background: #f8fafc; color: #1e293b; }
header { background: #0c4a6e; color: white; padding: 16px 24px; position: sticky; top: 0; z-index: 10; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
header h1 { margin: 0; font-size: 20px; }
header .meta { margin-top: 4px; font-size: 13px; opacity: 0.85; }
.toolbar { background: #e2e8f0; padding: 8px 24px; font-size: 13px; position: sticky; top: 64px; z-index: 9; }
.toolbar a { margin-right: 12px; text-decoration: none; color: #0369a1; padding: 2px 8px; border-radius: 3px; }
.toolbar a.overflow { background: #fee2e2; color: #b91c1c; font-weight: 600; }
.toolbar a:hover { background: #cbd5e1; }
.slide { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; padding: 16px 24px; border-bottom: 1px solid #cbd5e1; background: white; }
.slide.overflow { background: #fef2f2; border-left: 6px solid #dc2626; }
.slide-header { grid-column: 1 / -1; display: flex; justify-content: space-between; align-items: baseline; }
.slide-header h2 { margin: 0; font-size: 16px; color: #0c4a6e; }
.badge { display: inline-block; padding: 2px 10px; border-radius: 12px; font-size: 12px; font-weight: 600; margin-left: 8px; }
.badge.ok { background: #dcfce7; color: #166534; }
.badge.overflow { background: #fee2e2; color: #991b1b; }
.badge.unknown { background: #e2e8f0; color: #475569; }
.col { background: #f8fafc; border-radius: 6px; padding: 8px; }
.col h3 { margin: 0 0 6px 0; font-size: 12px; text-transform: uppercase; letter-spacing: 0.05em; color: #64748b; }
pre { background: #1e293b; color: #f1f5f9; padding: 12px; border-radius: 4px; overflow: auto; max-height: 720px; font-size: 12px; line-height: 1.4; margin: 0; white-space: pre; }
.png-frame { position: relative; }
.png-frame img { width: 100%; border: 1px solid #cbd5e1; border-radius: 4px; display: block; }
.png-frame .clip-marker { position: absolute; left: 0; right: 0; bottom: 0; height: 4px; background: repeating-linear-gradient(45deg, #dc2626, #dc2626 6px, #fee2e2 6px, #fee2e2 12px); border-radius: 0 0 4px 4px; }
'@

    $sb = [System.Text.StringBuilder]::new()
    [void]$sb.AppendLine('<!DOCTYPE html>')
    [void]$sb.AppendLine('<html lang="en"><head><meta charset="utf-8">')
    [void]$sb.AppendLine("<title>Slide Review — $ver</title>")
    [void]$sb.AppendLine("<style>$css</style></head><body>")
    [void]$sb.AppendLine("<header><h1>Slide Review — agentic-operating-model-$ver</h1>")
    $totalSlides = $slides.Count
    $overflowCount = if ($w.Overflowing) { @($w.Overflowing).Count } else { 0 }
    [void]$sb.AppendLine("<div class='meta'>$totalSlides slides &middot; $overflowCount overflow &middot; generated $(Get-Date -Format 'yyyy-MM-dd HH:mm UTC')</div></header>")

    # Toolbar with quick links to overflow slides
    if ($overflowCount -gt 0) {
        [void]$sb.Append("<div class='toolbar'>Overflow: ")
        foreach ($o in $w.Overflowing) {
            [void]$sb.Append("<a class='overflow' href='#slide-$($o.slide)'>#$($o.slide)</a>")
        }
        [void]$sb.AppendLine('</div>')
    }
    else {
        [void]$sb.AppendLine("<div class='toolbar'>No overflow detected.</div>")
    }

    $maxIdx = [Math]::Max($totalSlides, $pngFiles.Count)
    for ($i = 0; $i -lt $maxIdx; $i++) {
        $slideNo = $i + 1
        $md = if ($i -lt $totalSlides) { $slides[$i] } else { '(missing source)' }
        $png = if ($i -lt $pngFiles.Count) { "$relPngDir/$($pngFiles[$i].Name)" } else { $null }

        # Overflow info for this slide (from $w.Results)
        $info = if ($w.Results) { $w.Results | Where-Object { $_.slide -eq $slideNo } | Select-Object -First 1 } else { $null }
        $isOverflow = $info -and $info.overflows
        $badgeHtml = if ($null -eq $info) {
            "<span class='badge unknown'>?</span>"
        }
        elseif ($isOverflow) {
            "<span class='badge overflow'>OVERFLOW Y=$($info.overflowY)px X=$($info.overflowX)px fill=$($info.fillRatio)</span>"
        }
        else {
            "<span class='badge ok'>fits (fill=$($info.fillRatio))</span>"
        }

        $title = ''
        if ($info -and $info.title) { $title = ' — ' + (ConvertTo-EncodedHtml $info.title) }

        $klass = if ($isOverflow) { 'slide overflow' } else { 'slide' }
        [void]$sb.AppendLine("<div class='$klass' id='slide-$slideNo'>")
        [void]$sb.AppendLine("  <div class='slide-header'><h2>Slide $slideNo$title</h2><div>$badgeHtml</div></div>")
        [void]$sb.AppendLine("  <div class='col'><h3>Source markdown</h3><pre>$(ConvertTo-EncodedHtml $md)</pre></div>")
        [void]$sb.Append("  <div class='col'><h3>Rendered slide</h3>")
        if ($png) {
            [void]$sb.Append("<div class='png-frame'><img src='$png' alt='Slide $slideNo'>")
            if ($isOverflow) { [void]$sb.Append("<div class='clip-marker' title='Content extends beyond the slide'></div>") }
            [void]$sb.Append('</div>')
        }
        else {
            [void]$sb.Append('<em>(no PNG)</em>')
        }
        [void]$sb.AppendLine('</div></div>')
    }

    [void]$sb.AppendLine('</body></html>')
    Set-Content -Path $reportPath -Value $sb.ToString() -Encoding UTF8
    Write-Host "[$ver] Wrote $reportPath" -ForegroundColor Green
}

Write-Host ""
Write-Host "Open the slide-review-<ver>.html files in a browser to scroll through source <-> rendered slide pairs." -ForegroundColor Cyan
