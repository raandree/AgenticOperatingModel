#requires -Modules @{ ModuleName = 'Pester'; ModuleVersion = '5.0.0' }

Describe 'Build-MarpVersions speaker-note merging' {
    BeforeAll {
        $script:scriptPath = Join-Path $PSScriptRoot 'Build-MarpVersions.ps1'
        $script:fixtureRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("marp-test-" + [guid]::NewGuid().ToString('N'))
        $script:slidesDir = Join-Path $script:fixtureRoot 'slides'
        $script:outDir = Join-Path $script:fixtureRoot 'pptx'
        New-Item -ItemType Directory -Path $script:slidesDir -Force | Out-Null
        New-Item -ItemType Directory -Path $script:outDir -Force | Out-Null

        $monolith = @(
            '---'
            'marp: true'
            'theme: default'
            '---'
            '<!-- version: 1h 2h 4h -->'
            ''
            '<!-- _class: section-divider -->'
            ''
            '# Module 1'
            '## Sample Module'
            ''
            '---'
            '<!-- version: 1h 2h 4h -->'
            ''
            '# README Provides Purpose'
            ''
            'Content for README slide.'
            ''
            '---'
            '<!-- version: 1h 2h 4h -->'
            ''
            '# Git Provides Traceability'
            ''
            'Content for traceability slide.'
            ''
            '---'
            '<!-- version: 1h 2h 4h -->'
            ''
            '# Checkpoint System -- Rollback When Needed'
            ''
            'Content for checkpoint slide.'
        ) -join "`n"
        Set-Content -Path (Join-Path $script:slidesDir 'marp-presentation.md') -Value $monolith -Encoding UTF8 -NoNewline

        # Split file with nested-fence pattern from slide 3.5 + notes on later slides.
        $tick3 = [string]([char]0x60) * 3
        $split = @(
            '# Module 1: Sample Module'
            ''
            '## Version Guide'
            ''
            '| Slide | Title | 1h | 2h | 4h |'
            '|-------|-------|:---:|:---:|:---:|'
            '| 9.1 | README Effect | OK | OK | OK |'
            '| 9.2 | Traceability  | OK | OK | OK |'
            '| 9.3 | Checkpoint    | OK | OK | OK |'
            ''
            '## Slide 9.1: README Effect'
            ''
            '# README Provides Purpose'
            ''
            "${tick3}markdown"
            '# Inner'
            '## Usage'
            "${tick3}powershell"
            'Do-Thing'
            $tick3
            $tick3
            ''
            'Body text.'
            ''
            '---'
            ''
            '## Slide 9.2: Traceability'
            ''
            '# Knowing What AI Changed'
            ''
            'Body.'
            ''
            '<!--'
            'Speaker notes (for newcomers):'
            '- Diff note belongs here only.'
            '-->'
            ''
            '---'
            ''
            '## Slide 9.3: Checkpoint'
            ''
            '# Rollback When Needed'
            ''
            'Body.'
            ''
            '<!--'
            'Speaker notes (for newcomers):'
            '- Checkpoint note belongs here only.'
            '-->'
            ''
            '---'
            ''
            '## Slide 9.4: Traceability (deep dive)'
            ''
            '# Git Provides Traceability'
            ''
            'Body for the deep-dive perspective on the same monolith slide.'
            ''
            '<!--'
            'Second note: deep-dive framing for the same Traceability slide.'
            '-->'
            ''
            '## Speaker Notes - Module 1'
            ''
            '### Timing: 10 min'
            ''
            'Module-level appendix content.'
        ) -join "`n"
        Set-Content -Path (Join-Path $script:slidesDir '01-sample.md') -Value $split -Encoding UTF8 -NoNewline

        & $script:scriptPath -Version 4h `
            -SourcePath (Join-Path $script:slidesDir 'marp-presentation.md') `
            -OutputDir $script:outDir *> $null

        $script:output = Get-Content (Join-Path $script:outDir 'marp-4h-workshop.md') -Raw
    }

    AfterAll {
        if (Test-Path $script:fixtureRoot) { Remove-Item $script:fixtureRoot -Recurse -Force }
    }

    It 'does not attach unrelated notes to the README slide (nested-fence regression)' {
        $segment = [regex]::Match($script:output, '(?s)# README Provides Purpose.*?(?=\n---\n|\z)').Value
        $segment | Should -Not -Match 'Diff note belongs here'
        $segment | Should -Not -Match 'Checkpoint note belongs here'
    }

    It 'attaches the Diff note to Git Provides Traceability via the title-map alias' {
        $segment = [regex]::Match($script:output, '(?s)# Git Provides Traceability.*?(?=\n---\n|\z)').Value
        $segment | Should -Match 'Diff note belongs here'
    }

    It 'concatenates notes when multiple split slides target the same monolith slide' {
        $segment = [regex]::Match($script:output, '(?s)# Git Provides Traceability.*?(?=\n---\n|\z)').Value
        # Both the aliased note (Slide 9.2 -> Knowing What AI Changed) and the
        # direct-match note (Slide 9.4 -> Git Provides Traceability) must be present.
        $segment | Should -Match 'Diff note belongs here'
        $segment | Should -Match 'deep-dive framing'
    }

    It 'attaches the Checkpoint note via the title-map alias' {
        $segment = [regex]::Match($script:output, '(?s)# Checkpoint System -- Rollback When Needed.*?(?=\n---\n|\z)').Value
        $segment | Should -Match 'Checkpoint note belongs here'
    }

    It 'attaches the module appendix to the section-divider slide' {
        $segment = [regex]::Match($script:output, '(?s)# Module 1\n.*?(?=\n---\n|\z)').Value
        $segment | Should -Match 'Module 1 appendix'
        $segment | Should -Match 'Module-level appendix content'
    }
}

Describe 'Built MARP outputs have speaker notes on every slide' {
    BeforeAll {
        $script:pptxDir = $PSScriptRoot

        # Code-fence-aware parser. Mirrors Split-MarpSlides in Build-MarpVersions.ps1:
        # `---` only counts as a slide separator outside ```fenced blocks```. Without
        # this, `---` appearing inside YAML examples (e.g. `.agent.md` frontmatter
        # shown in a ```markdown fence) is mis-counted as a slide break.
        function Get-MarpSlide {
            param([Parameter(Mandatory)][string]$Path)

            $lines = Get-Content -Path $Path -Encoding UTF8
            $sepIdx = [System.Collections.Generic.List[int]]::new()
            $inCode = $false
            $sawFm = $false
            $inFm = $false
            for ($i = 0; $i -lt $lines.Count; $i++) {
                $t = $lines[$i].TrimEnd()
                if ($t -match '^```') { $inCode = -not $inCode; continue }
                if ($inCode) { continue }
                if ($t -ne '---') { continue }
                if (-not $sawFm) {
                    if ($inFm) { $sawFm = $true; $inFm = $false; continue }
                    $inFm = $true; continue
                }
                [void]$sepIdx.Add($i)
            }

            $slides = [System.Collections.Generic.List[object]]::new()
            for ($n = 0; $n -lt $sepIdx.Count; $n++) {
                $start = $sepIdx[$n] + 1
                $end = if (($n + 1) -lt $sepIdx.Count) { $sepIdx[$n + 1] - 1 } else { $lines.Count - 1 }
                $body = if ($start -le $end) { $lines[$start..$end] -join "`n" } else { '' }
                $title = ($lines[$start..$end] | Where-Object { $_ -match '^#\s+(.+)$' } | Select-Object -First 1)
                if ($title) { $title = ($title -replace '^#\s+', '').Trim() }
                [void]$slides.Add([pscustomobject]@{
                        Number    = $n + 1
                        Title     = $title
                        Body      = $body
                        IsDivider = ($body -match '(?s)<!--\s*_class:\s*section-divider\s*-->')
                    })
            }
            return , $slides.ToArray()
        }

        function Test-SlideHasNote {
            param([Parameter(Mandatory)][string]$Body)
            $regexMatches = [regex]::Matches($Body, '(?s)<!--(.*?)-->')
            foreach ($m in $regexMatches) {
                $inner = $m.Groups[1].Value.Trim()
                # Skip Marp / Marpit single-line directives and the editorial _split_
                # marker; require a substantive comment block (>40 chars).
                if ($inner -match '^(version:|_class:|_paginate:|_color:|_backgroundColor:|fit|_split_)') { continue }
                if ($inner.Length -gt 40) { return $true }
            }
            return $false
        }
    }

    It 'every slide in <File> has a speaker-note HTML comment block' -ForEach @(
        @{ File = 'marp-1h-keynote.md' }
        @{ File = 'marp-2h-standard.md' }
        @{ File = 'marp-4h-workshop.md' }
    ) {
        $path = Join-Path $script:pptxDir $File
        if (-not (Test-Path $path)) {
            Set-ItResult -Skipped -Because "$File not built yet — run Build-MarpVersions.ps1 first"
            return
        }

        $slides = Get-MarpSlide -Path $path
        $missing = foreach ($s in $slides) {
            if ($s.IsDivider) { continue }   # section dividers get the module appendix; covered by the other test
            if (-not (Test-SlideHasNote -Body $s.Body)) {
                ('  Slide {0}: {1}' -f $s.Number, $(if ($s.Title) { $s.Title } else { '(no H1)' }))
            }
        }

        $missing | Should -BeNullOrEmpty -Because (
            "every content slide in $File must carry a multi-line <!-- ... --> speaker-note block " +
            "(>40 chars, not a Marp directive). Slides without notes:`n" + ($missing -join "`n")
        )
    }

    It 'section-divider slides in <File> carry a module appendix' -ForEach @(
        @{ File = 'marp-1h-keynote.md' }
        @{ File = 'marp-2h-standard.md' }
        @{ File = 'marp-4h-workshop.md' }
    ) {
        $path = Join-Path $script:pptxDir $File
        if (-not (Test-Path $path)) {
            Set-ItResult -Skipped -Because "$File not built yet — run Build-MarpVersions.ps1 first"
            return
        }

        $slides = Get-MarpSlide -Path $path
        $dividersMissing = foreach ($s in $slides) {
            if (-not $s.IsDivider) { continue }
            # The appendix injection writes "Speaker notes — Module N appendix"
            # as the first content line of the comment block.
            if ($s.Body -notmatch 'Speaker\s+notes\s*[-–—]\s*Module\s+\d+\s+appendix') {
                ('  Slide {0}: {1}' -f $s.Number, $(if ($s.Title) { $s.Title } else { '(no H1)' }))
            }
        }

        $dividersMissing | Should -BeNullOrEmpty -Because (
            "every section-divider slide in $File must receive its module appendix. " +
            "Dividers without appendix:`n" + ($dividersMissing -join "`n")
        )
    }
}
