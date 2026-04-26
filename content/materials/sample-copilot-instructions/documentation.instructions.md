---
applyTo: "**/*.md,**/docs/**"
---

# Documentation File Instructions

> This is a sample `.github/instructions/documentation.instructions.md` file.
> It applies when editing Markdown files or any file under `docs/`.
> Place in `.github/instructions/` directory.

## Markdown Standards

- Use ATX-style headings (`#`, `##`, `###`)
- One H1 per document (document title)
- Don't skip heading levels (H1 → H2 → H3, not H1 → H3)
- Use sentence case for headings
- Add blank lines before and after headings, lists, and code blocks

## Comment-Based Help (for .ps1 files referenced in docs)

When documenting PowerShell functions, include:

- `.SYNOPSIS` — one-sentence summary
- `.DESCRIPTION` — detailed explanation (if needed)
- `.PARAMETER` — every parameter documented
- `.EXAMPLE` — at least one realistic usage example
- `.OUTPUTS` — return type description

## README Requirements

### Root README.md

Every project must have a README.md with:

- Project name and description
- Installation instructions
- Quick start / usage example
- Prerequisites
- License information

### Folder READMEs

Each major folder should have a README explaining:

- Folder purpose
- Contents overview
- Usage instructions

## Changelog

- Follow [Keep a Changelog](https://keepachangelog.com/) format
- Maintain an `[Unreleased]` section at the top
- Use categories: Added, Changed, Deprecated, Removed, Fixed, Security
- Date entries use ISO 8601 format (YYYY-MM-DD)

## Writing Style

- Use plain language — avoid unnecessary jargon
- Write for the reader who has never seen this project
- Use code blocks with language identifiers for all code examples
- Use tables for structured comparison data
- Keep lines under 80 characters where practical
