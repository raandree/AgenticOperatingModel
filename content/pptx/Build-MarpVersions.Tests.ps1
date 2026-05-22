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
