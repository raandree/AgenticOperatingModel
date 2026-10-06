#requires -Version 7.0
<#
.SYNOPSIS
    Builds the Part 2 deck in its 60- and 90-minute variants, gates both on
    overflow and speaker notes, and optionally exports PPTX and PNG files.

.DESCRIPTION
    Generates each variant from aom-part2.md with
    content/pptx/Build-MarpVersions.ps1, then takes over from there. Slide
    version tags select the variant: `1h` slides form the 60-minute deck, `2h`
    slides the 90-minute deck.

    Each generated deck must pass two gates before anything is exported:

    - Overflow: every slide is rendered and measured with
      content/pptx/overflow-check.mjs. Any clipped slide fails the build.
    - Speaker notes: every slide must carry a presenter note, and an exported
      PPTX must contain exactly one notes page per slide.

    The wrapper deliberately does not use the builder's -CheckOverflow,
    -ExportPptx, or -ExportPng switches:

    - Its overflow checker always measures the main deck's files in content/pptx.
    - The builder writes a slide separator straight after the frontmatter, which
      makes Marp emit an empty first slide. The wrapper removes that separator
      before it measures or exports.
    - Its browser lookup fails outside content/pptx. The wrapper resolves the
      Chromium that the overflow checker's puppeteer already downloaded.

.PARAMETER Variant
    The deck to build: 60, 90, or All. Defaults to All.

.PARAMETER ExportPptx
    Export aom-part2-<n>min.pptx after the gates pass.

.PARAMETER ExportPng
    Export one PNG per slide into png-aom-part2-<n>min/ for visual review.

.EXAMPLE
    .\Build-Part2Deck.ps1

    Builds and gates both variants without exporting anything.

.EXAMPLE
    .\Build-Part2Deck.ps1 -ExportPptx -ExportPng

    Builds and gates both variants, then exports PPTX and PNG files.

.OUTPUTS
    PSCustomObject. One result per variant with slide, overflow, note, and
    export counts.
#>
[CmdletBinding()]
[OutputType([pscustomobject])]
param(
    [Parameter()]
    [ValidateSet('60', '90', 'All')]
    [string]$Variant = 'All',

    [Parameter()]
    [switch]$ExportPptx,

    [Parameter()]
    [switch]$ExportPng
)

Set-StrictMode -Version 3.0
$ErrorActionPreference = 'Stop'

$deckDirectory = $PSScriptRoot
$pptxDirectory = Join-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -ChildPath 'pptx'
$builderPath = Join-Path -Path $pptxDirectory -ChildPath 'Build-MarpVersions.ps1'
$checkerPath = Join-Path -Path $pptxDirectory -ChildPath 'overflow-check.mjs'
$sourcePath = Join-Path -Path $deckDirectory -ChildPath 'aom-part2.md'

$variantMap = [ordered]@{
    '60' = @{ Tag = '1h'; Generated = 'marp-1h-keynote.md' }
    '90' = @{ Tag = '2h'; Generated = 'marp-2h-standard.md' }
}

function Invoke-MarpBuilder {
    <#
    .SYNOPSIS
        Generates one variant with Build-MarpVersions.ps1, outside this script's strict mode.
    .DESCRIPTION
        The builder reads .Count on a null split-file list when the source folder
        has no NN-*.md split files, which strict mode turns into a terminating
        error. Strict mode is scoped, so switching it off here covers only the
        builder call.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Tag
    )

    Set-StrictMode -Off
    & $builderPath -SourcePath $sourcePath -OutputDir $deckDirectory -Version $Tag | Out-Null
}

function Remove-LeadingSeparator {
    <#
    .SYNOPSIS
        Removes the slide separator that directly follows the frontmatter.
    .DESCRIPTION
        A separator directly after the closing frontmatter delimiter makes Marp
        render an empty first slide.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    $lines = [Collections.Generic.List[string]]::new([string[]]([IO.File]::ReadAllText($Path) -split "`r?`n"))
    $closingIndex = -1
    for ($index = 1; $index -lt $lines.Count; $index++) {
        if ($lines[$index] -eq '---') {
            $closingIndex = $index
            break
        }
    }

    if ($closingIndex -gt 0 -and $closingIndex + 1 -lt $lines.Count -and $lines[$closingIndex + 1] -eq '---' -and $PSCmdlet.ShouldProcess($Path, 'Remove the leading slide separator')) {
        $lines.RemoveAt($closingIndex + 1)
        [IO.File]::WriteAllText($Path, ($lines -join "`n"), [Text.UTF8Encoding]::new($false))
    }
}

function Get-MarpSlideText {
    <#
    .SYNOPSIS
        Returns the text of each slide in a generated Marp file.
    .DESCRIPTION
        Mirrors Marp's splitting: a line that is exactly `---` separates slides
        unless it sits inside a code fence; the frontmatter is skipped.
    #>
    [CmdletBinding()]
    [OutputType([string[]])]
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    $lines = [IO.File]::ReadAllText($Path) -split "`r?`n"
    $slides = [Collections.Generic.List[string]]::new()
    $current = [Collections.Generic.List[string]]::new()
    $inFence = $false
    $separatorCount = 0

    foreach ($line in $lines) {
        if ($line -match '^```') {
            $inFence = -not $inFence
        }

        if (-not $inFence -and $line -eq '---') {
            $separatorCount++
            if ($separatorCount -gt 2) {
                $slides.Add(($current -join "`n"))
            }

            $current = [Collections.Generic.List[string]]::new()
            continue
        }

        if ($separatorCount -ge 2) {
            $current.Add($line)
        }
    }

    $slides.Add(($current -join "`n"))
    return [string[]]$slides
}

function Test-SlideNote {
    <#
    .SYNOPSIS
        Tests whether a slide carries a presenter note rather than only Marp directives.
    #>
    [CmdletBinding()]
    [OutputType([bool])]
    param(
        [Parameter(Mandatory)]
        [AllowEmptyString()]
        [string]$SlideText
    )

    $directivePattern = '^\s*_?(class|paginate|footer|header|backgroundColor|backgroundImage|color|theme|size|style|version)\s*:'
    foreach ($comment in [regex]::Matches($SlideText, '(?s)<!--(.*?)-->')) {
        $inner = $comment.Groups[1].Value
        if ($inner -match $directivePattern) {
            continue
        }

        if ($inner.Trim().Length -gt 40) {
            return $true
        }
    }

    return $false
}

function Invoke-MarpCli {
    <#
    .SYNOPSIS
        Runs Marp CLI on one deck with an optional browser for PPTX and PNG export.
    #>
    [CmdletBinding()]
    [OutputType([string[]])]
    param(
        [Parameter(Mandatory)]
        [string]$MarkdownPath,

        [Parameter(Mandatory)]
        [string[]]$Arguments,

        [Parameter()]
        [AllowNull()]
        [string]$ChromiumPath
    )

    $priorChromePath = $env:CHROME_PATH
    try {
        if ($ChromiumPath) {
            $env:CHROME_PATH = $ChromiumPath
        }

        $marpArguments = @('--yes', '@marp-team/marp-cli@latest', $MarkdownPath) + $Arguments + @('--allow-local-files')
        return [string[]](& npx @marpArguments 2>&1 | ForEach-Object { "$_" })
    }
    finally {
        $env:CHROME_PATH = $priorChromePath
    }
}

function Invoke-OverflowGate {
    <#
    .SYNOPSIS
        Renders a generated deck to HTML and measures every slide for overflow.
    #>
    [CmdletBinding()]
    [OutputType([object[]])]
    param(
        [Parameter(Mandatory)]
        [string]$MarkdownPath,

        [Parameter(Mandatory)]
        [string]$HtmlPath
    )

    # Render next to the Markdown so relative image paths resolve.
    $marpOutput = Invoke-MarpCli -MarkdownPath $MarkdownPath -Arguments @('--html', '-o', $HtmlPath)
    if (-not (Test-Path -LiteralPath $HtmlPath)) {
        throw "Marp did not render $MarkdownPath to HTML: $($marpOutput -join [Environment]::NewLine)"
    }

    try {
        $json = & node $checkerPath $HtmlPath '--json'
        if ($LASTEXITCODE -eq 2) {
            throw "overflow-check.mjs failed for $MarkdownPath."
        }

        return @(($json -join "`n") | ConvertFrom-Json)
    }
    finally {
        Remove-Item -LiteralPath $HtmlPath -Force -ErrorAction SilentlyContinue
    }
}

function Get-PptxNoteCount {
    <#
    .SYNOPSIS
        Counts the notes pages inside a PPTX file.
    #>
    [CmdletBinding()]
    [OutputType([int])]
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $archive = [IO.Compression.ZipFile]::OpenRead($Path)
    try {
        return @($archive.Entries | Where-Object { $_.FullName -like 'ppt/notesSlides/notesSlide*.xml' }).Count
    }
    finally {
        $archive.Dispose()
    }
}

foreach ($requiredPath in $builderPath, $checkerPath, $sourcePath) {
    if (-not (Test-Path -LiteralPath $requiredPath)) {
        throw "Required file not found: $requiredPath"
    }
}

foreach ($command in 'npx', 'node') {
    if (-not (Get-Command -Name $command -ErrorAction SilentlyContinue)) {
        throw "$command was not found on PATH. Install Node.js 20 or later."
    }
}

if (-not (Test-Path -LiteralPath (Join-Path -Path $pptxDirectory -ChildPath 'node_modules'))) {
    throw "Puppeteer is not installed. Run 'npm install' in $pptxDirectory first."
}

# Marp needs a browser to export PPTX and PNG. Use the Chromium that the
# overflow checker's puppeteer downloaded into content/pptx/node_modules.
$chromiumPath = $null
if (($ExportPptx -or $ExportPng) -and -not ($env:CHROME_PATH -and (Test-Path -LiteralPath $env:CHROME_PATH))) {
    Push-Location -LiteralPath $pptxDirectory
    try {
        $chromiumPath = & node -e "process.stdout.write(require('puppeteer').executablePath())"
    }
    finally {
        Pop-Location
    }

    if (-not ($chromiumPath -and (Test-Path -LiteralPath $chromiumPath))) {
        $chromiumPath = $null
    }
}

$selectedVariants = if ($Variant -eq 'All') { @($variantMap.Keys) } else { @($Variant) }

foreach ($minutes in $selectedVariants) {
    $settings = $variantMap[$minutes]
    $deckName = "aom-part2-$($minutes)min"
    $deckMarkdownPath = Join-Path -Path $deckDirectory -ChildPath "$deckName.md"

    Write-Information -MessageData "[$deckName] Generating from the $($settings.Tag) version tags" -InformationAction Continue
    Invoke-MarpBuilder -Tag $settings.Tag
    Move-Item -LiteralPath (Join-Path -Path $deckDirectory -ChildPath $settings.Generated) -Destination $deckMarkdownPath -Force
    Remove-LeadingSeparator -Path $deckMarkdownPath

    $slides = Get-MarpSlideText -Path $deckMarkdownPath
    $withoutNotes = @(
        for ($index = 0; $index -lt $slides.Count; $index++) {
            if (-not (Test-SlideNote -SlideText $slides[$index])) {
                $index + 1
            }
        }
    )

    Write-Information -MessageData "[$deckName] Measuring $($slides.Count) slides for overflow" -InformationAction Continue
    $htmlPath = Join-Path -Path $deckDirectory -ChildPath "_overflow_$deckName.html"
    $measurements = Invoke-OverflowGate -MarkdownPath $deckMarkdownPath -HtmlPath $htmlPath
    $overflowing = @($measurements | Where-Object { $_.overflows })

    foreach ($slide in $overflowing) {
        Write-Warning -Message ("[{0}] Slide {1} '{2}' overflows by {3} px (fill {4})" -f $deckName, $slide.slide, $slide.title, $slide.overflowY, $slide.fillRatio)
    }

    if ($withoutNotes.Count -gt 0) {
        Write-Warning -Message "[$deckName] Slides without a speaker note: $($withoutNotes -join ', ')"
    }

    if ($measurements.Count -ne $slides.Count) {
        throw "[$deckName] Marp rendered $($measurements.Count) slides, but the source has $($slides.Count)."
    }

    if ($overflowing.Count -gt 0 -or $withoutNotes.Count -gt 0) {
        throw "[$deckName] Gate failed: $($overflowing.Count) overflowing slide(s), $($withoutNotes.Count) slide(s) without notes. Nothing was exported."
    }

    $pptxPath = $null
    $pptxNoteCount = $null
    $pngCount = $null

    if ($ExportPptx) {
        $pptxPath = Join-Path -Path $deckDirectory -ChildPath "$deckName.pptx"
        $exportStart = Get-Date
        Write-Information -MessageData "[$deckName] Exporting PPTX" -InformationAction Continue
        $marpOutput = Invoke-MarpCli -MarkdownPath $deckMarkdownPath -Arguments @('--pptx', '-o', $pptxPath) -ChromiumPath $chromiumPath
        if (-not (Test-Path -LiteralPath $pptxPath) -or (Get-Item -LiteralPath $pptxPath).LastWriteTime -lt $exportStart) {
            throw "[$deckName] The PPTX export did not produce a fresh file; it may be open in PowerPoint. Marp said: $($marpOutput -join ' ')"
        }

        $pptxNoteCount = Get-PptxNoteCount -Path $pptxPath
        if ($pptxNoteCount -ne $slides.Count) {
            throw "[$deckName] The PPTX has $pptxNoteCount notes pages for $($slides.Count) slides."
        }
    }

    if ($ExportPng) {
        $pngDirectory = Join-Path -Path $deckDirectory -ChildPath "png-$deckName"
        if (Test-Path -LiteralPath $pngDirectory) {
            Remove-Item -LiteralPath $pngDirectory -Recurse -Force
        }

        New-Item -ItemType Directory -Path $pngDirectory | Out-Null
        Write-Information -MessageData "[$deckName] Exporting PNG images" -InformationAction Continue
        $marpOutput = Invoke-MarpCli -MarkdownPath $deckMarkdownPath -Arguments @('--images', 'png', '-o', (Join-Path -Path $pngDirectory -ChildPath 'slide.png')) -ChromiumPath $chromiumPath
        $pngCount = @(Get-ChildItem -LiteralPath $pngDirectory -Filter '*.png').Count
        if ($pngCount -ne $slides.Count) {
            throw "[$deckName] The PNG export produced $pngCount images for $($slides.Count) slides. Marp said: $($marpOutput -join ' ')"
        }
    }

    [pscustomobject]@{
        Deck               = $deckName
        Slides             = $slides.Count
        Overflowing        = $overflowing.Count
        SlidesWithoutNotes = $withoutNotes.Count
        Pptx               = $pptxPath
        PptxNotePages      = $pptxNoteCount
        PngImages          = $pngCount
    }
}
