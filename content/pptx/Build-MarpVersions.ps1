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
    [switch]$Report,

    # Opt-in: assemble the full source from per-module split files instead of
    # using the monolithic marp-presentation.md. Off by default — the splits
    # currently contain expanded prose that overflows the slide canvas.
    [Parameter()]
    [switch]$AssembleFromSplits,

    # Default ON when split files exist: pull speaker-note HTML comments out
    # of the split files and inject them into the matching monolith slide
    # (matched by normalized H1 title). Set -MergeNotesFromSplits:$false to
    # disable.
    [Parameter()]
    [Nullable[bool]]$MergeNotesFromSplits = $null
)

$ErrorActionPreference = 'Stop'

# --- Assemble source from per-module split files ---
# Reads frontmatter from $SourcePath, then concatenates NN-*.md files in the
# same folder. Each split file's "Version Guide" table is parsed to derive
# per-slide version tags; a section-divider slide is synthesized from the
# module header + quote block; "## Slide X.Y:" markers are stripped.
function Build-AssembledSource {
    param(
        [Parameter(Mandatory)][string]$FrontmatterFile,
        [Parameter(Mandatory)][System.IO.FileInfo[]]$SplitFiles
    )

    # Extract frontmatter (everything up to and including the closing --- of YAML)
    $fmLines = Get-Content $FrontmatterFile -Encoding UTF8
    $fmEnd = -1
    $seenOpen = $false
    for ($i = 0; $i -lt $fmLines.Count; $i++) {
        if ($fmLines[$i].TrimEnd() -eq '---') {
            if (-not $seenOpen) { $seenOpen = $true; continue }
            $fmEnd = $i
            break
        }
    }
    if ($fmEnd -lt 0) {
        throw "Could not locate YAML frontmatter in $FrontmatterFile"
    }
    $frontmatter = ($fmLines[0..$fmEnd]) -join "`n"

    $out = [System.Text.StringBuilder]::new()
    [void]$out.AppendLine($frontmatter)

    foreach ($file in $SplitFiles) {
        $text = Get-Content $file.FullName -Raw -Encoding UTF8
        $lines = $text -split "`r?`n"

        # --- Parse Version Guide table ---
        # Header row: | Slide | Title | 1h | 2h | 4h |
        $versionMap = @{}
        $tableHeaderIdx = -1
        for ($i = 0; $i -lt $lines.Count; $i++) {
            if ($lines[$i] -match '^\|\s*Slide\s*\|.*\|\s*1h\s*\|\s*2h\s*\|\s*4h\s*\|') {
                $tableHeaderIdx = $i
                break
            }
        }
        if ($tableHeaderIdx -ge 0) {
            for ($i = $tableHeaderIdx + 2; $i -lt $lines.Count; $i++) {
                $row = $lines[$i]
                if ($row -notmatch '^\|') { break }
                # | 3.1 | Title | ✅ | ✅ | ✅ |
                $cells = ($row -split '\|') | ForEach-Object { $_.Trim() }
                # cells[0] = '', cells[1] = id, cells[2] = title, cells[3..5] = ver flags
                if ($cells.Count -lt 6) { continue }
                $id = $cells[1]
                if (-not $id) { continue }
                $vers = @()
                if ($cells[3] -match '✅|x|X|yes') { $vers += '1h' }
                if ($cells[4] -match '✅|x|X|yes') { $vers += '2h' }
                if ($cells[5] -match '✅|x|X|yes') { $vers += '4h' }
                $versionMap[$id] = $vers
            }
        }

        # --- Extract module title + quote for section-divider synthesis ---
        $moduleNumber = $null
        $moduleTitle = $null
        $quoteLines = [System.Collections.Generic.List[string]]::new()
        foreach ($line in $lines) {
            if (-not $moduleNumber -and $line -match '^#\s+Module\s+(\d+)\s*:\s*(.+)$') {
                $moduleNumber = $Matches[1]
                $moduleTitle = $Matches[2].Trim()
                continue
            }
            if ($line -match '^\s*>\s') {
                $quoteLines.Add($line)
            }
            elseif ($quoteLines.Count -gt 0 -and $line.Trim() -eq '') {
                # blank between quote lines is OK; stop on next non-quote non-blank
                continue
            }
            elseif ($quoteLines.Count -gt 0) {
                break
            }
        }

        if ($moduleNumber) {
            $divider = @(
                '---'
                '<!-- version: 1h 2h 4h -->'
                ''
                '<!-- _class: section-divider -->'
                ''
                "# Module $moduleNumber"
                "## $moduleTitle"
            )
            if ($quoteLines.Count -gt 0) {
                $divider += ''
                $divider += $quoteLines
            }
            [void]$out.AppendLine(($divider -join "`n"))
        }

        # --- Split body into slide chunks at top-level --- ---
        # Skip everything up to the first "## Slide " marker; from there,
        # treat each `---`-bounded chunk that contains a "## Slide X.Y:" line
        # as a slide.
        $firstSlideIdx = -1
        for ($i = 0; $i -lt $lines.Count; $i++) {
            if ($lines[$i] -match '^##\s+Slide\s+') { $firstSlideIdx = $i; break }
        }
        if ($firstSlideIdx -lt 0) { continue }

        $body = $lines[$firstSlideIdx..($lines.Count - 1)]
        $chunks = [System.Collections.Generic.List[System.Collections.Generic.List[string]]]::new()
        $current = [System.Collections.Generic.List[string]]::new()
        $inCode = $false
        foreach ($line in $body) {
            if ($line -match '^```') { $inCode = -not $inCode }
            if (-not $inCode -and $line.TrimEnd() -eq '---') {
                if ($current.Count -gt 0) { $chunks.Add($current); $current = [System.Collections.Generic.List[string]]::new() }
                continue
            }
            $current.Add($line)
        }
        if ($current.Count -gt 0) { $chunks.Add($current) }

        foreach ($chunk in $chunks) {
            $slideId = $null
            $cleaned = [System.Collections.Generic.List[string]]::new()
            $skipBlankAfterMarker = $false
            foreach ($line in $chunk) {
                if (-not $slideId -and $line -match '^##\s+Slide\s+([0-9]+\.[0-9]+[a-z]?)\s*:') {
                    $slideId = $Matches[1]
                    $skipBlankAfterMarker = $true
                    continue
                }
                if ($skipBlankAfterMarker -and $line.Trim() -eq '') {
                    $skipBlankAfterMarker = $false
                    continue
                }
                $skipBlankAfterMarker = $false
                $cleaned.Add($line)
            }
            if (-not $slideId) { continue }

            $vers = $versionMap[$slideId]
            if (-not $vers -or $vers.Count -eq 0) { $vers = @('4h') }
            $tag = '<!-- version: ' + ($vers -join ' ') + ' -->'

            [void]$out.AppendLine('---')
            [void]$out.AppendLine($tag)
            [void]$out.AppendLine('')
            [void]$out.AppendLine(($cleaned -join "`n").TrimEnd())
        }
    }

    return $out.ToString()
}

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

# Detect split files (NN-*.md) in the same folder as the monolith.
$slidesDir = Split-Path $sourcePath -Parent
$splitFiles = Get-ChildItem -Path $slidesDir -Filter '*.md' |
    Where-Object { $_.Name -match '^\d{2}-.+\.md$' } |
    Sort-Object Name

$useSplits = [bool]$AssembleFromSplits
$mergeNotes = if ($null -ne $MergeNotesFromSplits) { [bool]$MergeNotesFromSplits } else { (-not $useSplits) -and ($splitFiles.Count -gt 0) }

if ($useSplits -and $splitFiles.Count -gt 0) {
    Write-Host "Assembling source from $($splitFiles.Count) split files in $slidesDir" -ForegroundColor Cyan
    $content = Build-AssembledSource -FrontmatterFile $sourcePath -SplitFiles $splitFiles
}
else {
    $content = Get-Content $sourcePath -Raw -Encoding UTF8
}

$parsed = Split-MarpSlides -Content $content

Write-Host "Parsed: $($parsed.Slides.Count) slides from source" -ForegroundColor Cyan

# --- Merge speaker notes from split files into monolith slides ---
if ($mergeNotes) {
    function Get-NormalizedTitle {
        param([string]$Title)
        if (-not $Title) { return '' }
        $t = $Title.ToLowerInvariant()
        $t = [regex]::Replace($t, '[^a-z0-9]+', ' ')
        return $t.Trim()
    }

    function Get-SlideTitle {
        param([string[]]$Lines)
        foreach ($line in $Lines) {
            if ($line -match '^#\s+(.+?)\s*$') { return $Matches[1].Trim() }
        }
        return $null
    }

    # Build map: normalized-title -> speaker-note block (raw HTML comment text)
    # Marker-driven scan: walk each split file line by line. The current "slide"
    # is bounded by `## Slide X.Y:` markers — we do NOT split on `---`, which
    # would break on the mismatched nested triple-backtick fences present in
    # some split files (e.g. slide 3.5).
    $notesMap = @{}
    foreach ($file in $splitFiles) {
        $lines = (Get-Content $file.FullName -Raw -Encoding UTF8) -split "`r?`n"

        $currentTitle = $null
        $inSlide = $false
        $inComment = $false
        $commentBuf = $null

        foreach ($raw in $lines) {
            $line = $raw.TrimEnd("`r")
            $t = $line.Trim()

            if ($line -match '^##\s+Slide\s+') {
                # New slide starts — reset state
                $currentTitle = $null
                $inSlide = $true
                $inComment = $false
                $commentBuf = $null
                continue
            }

            if (-not $inSlide) { continue }

            if ($inComment) {
                [void]$commentBuf.Add($line)
                if ($t -eq '-->') {
                    $blockText = ($commentBuf -join "`n")
                    if ($blockText -match 'Speaker\s*notes' -and $currentTitle) {
                        $key = Get-NormalizedTitle -Title $currentTitle
                        if ($notesMap.ContainsKey($key)) {
                            $notesMap[$key] = $notesMap[$key] + "`n" + $blockText
                        }
                        else {
                            $notesMap[$key] = $blockText
                        }
                    }
                    $inComment = $false
                    $commentBuf = $null
                }
                continue
            }

            # Capture first H1 after the slide marker as the slide title
            if (-not $currentTitle -and $line -match '^#\s+(.+?)\s*$') {
                $currentTitle = $Matches[1].Trim()
                continue
            }

            # Detect start of multi-line HTML comment
            if ($t -eq '<!--' -or $t -match '^<!--\s*$') {
                $inComment = $true
                $commentBuf = [System.Collections.Generic.List[string]]::new()
                [void]$commentBuf.Add($line)
                continue
            }
        }
    }

    Write-Host "Speaker-note pool: $($notesMap.Count) titled slides from splits" -ForegroundColor Cyan

    # Inject notes into monolith slides
    $injected = 0
    $unmatchedSplit = [System.Collections.Generic.HashSet[string]]::new()
    foreach ($k in $notesMap.Keys) { [void]$unmatchedSplit.Add($k) }
    foreach ($slide in $parsed.Slides) {
        $title = Get-SlideTitle -Lines $slide.Lines
        if (-not $title) { continue }
        $key = Get-NormalizedTitle -Title $title
        if (-not $notesMap.ContainsKey($key)) { continue }

        # Skip if the monolith slide already contains a Speaker-notes comment
        $existing = ($slide.Lines -join "`n")
        if ($existing -match '(?ms)<!--\s*\r?\n[^-]*Speaker\s*notes') {
            [void]$unmatchedSplit.Remove($key)
            continue
        }

        $newLines = [System.Collections.Generic.List[string]]::new()
        $newLines.AddRange([string[]]$slide.Lines)
        # Trim trailing blank lines
        while ($newLines.Count -gt 0 -and $newLines[$newLines.Count - 1].Trim() -eq '') {
            $newLines.RemoveAt($newLines.Count - 1)
        }
        $newLines.Add('')
        $newLines.Add($notesMap[$key])
        $slide.Lines = [string[]]$newLines.ToArray()
        $injected++
        [void]$unmatchedSplit.Remove($key)
    }

    Write-Host "Injected speaker notes into $injected monolith slides" -ForegroundColor Green
    if ($unmatchedSplit.Count -gt 0) {
        Write-Host "  $($unmatchedSplit.Count) split-file note(s) had no matching monolith slide (title drift):" -ForegroundColor DarkYellow
        $unmatchedSplit | Sort-Object | Select-Object -First 10 | ForEach-Object {
            Write-Host "    - $_" -ForegroundColor DarkYellow
        }
        if ($unmatchedSplit.Count -gt 10) {
            Write-Host "    ... and $($unmatchedSplit.Count - 10) more" -ForegroundColor DarkYellow
        }
    }
}

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
