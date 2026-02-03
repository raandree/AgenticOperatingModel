# Agentic Coding Presentation - Project Rules

## Project Context

This is a presentation/workshop project about agentic coding for PowerShell developers.
The project contains slides, demos, and supporting materials - NOT a PowerShell module.

## Content Standards

### Writing Style
- Target audience: PowerShell developers and DevOps engineers
- Use clear, concise language
- Explain technical concepts without oversimplification
- Use practical examples relevant to PowerShell/DevOps work

### Slide Content (content/slides/)
- Each module file covers one major topic
- Include speaker notes and timing estimates
- Use bullet points for key concepts
- Include ASCII diagrams for visual concepts
- Number files by module sequence (01, 02, 03, etc.)

### MARP Slides (content/pptx/)
- Condensed content suitable for projection
- One main concept per slide
- Use `---` for slide breaks
- Include MARP front matter with theme settings

## Documentation Requirements

### README Files
- Root README.md: Project overview and structure
- Each major folder should have a README explaining contents
- Keep README files updated when structure changes

### Memory Bank (memory-bank/)
- Update progress.md when tasks are completed
- Update activeContext.md for current work focus
- Keep projectbrief.md as the source of truth for scope

### Changelog
- Document significant content additions
- Track version/iteration of materials
- Note which modules are complete vs in-progress

## File Organization

### Directory Structure
```
├── agenda/              # Session agenda and timing
├── content/
│   ├── slides/          # Detailed presenter content
│   ├── demos/           # Demo scripts and instructions
│   ├── materials/       # Handouts, cheat sheets, samples
│   └── pptx/            # MARP slides for conversion
├── memory-bank/         # Project context files
└── .clinerules          # Project rules
```

### Naming Conventions
- Slide files: `XX-topic-name.md` (numbered by module)
- Demo files: `demo-script-*.md`
- Materials: descriptive names, lowercase with hyphens

## Demo Content

### Demo Scripts
- Include step-by-step instructions
- Add timing estimates for each section
- Include troubleshooting tips
- Provide fallback options if live demo fails

### Sample Code
- Test all code examples before including
- Use realistic scenarios relevant to PowerShell devs
- Include comments explaining key points

## Quality Checklist

Before marking content complete:
- [ ] Reviewed for spelling and grammar
- [ ] Code examples are tested and working
- [ ] Timing estimates are realistic
- [ ] Content aligns with target audience
- [ ] Links and references are valid
- [ ] Mermaid diagrams render correctly

---

**To use this**: Rename this file to `.clinerules` in your project root.