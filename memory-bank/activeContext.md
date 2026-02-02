# Active Context - Agentic Coding Presentation

## Current Focus

**Task**: Create comprehensive agenda for 2-4 hour agentic coding presentation
**Target Audience**: PowerShell Developers & DevOps Engineers
**Primary Tool**: Cline (VS Code Extension)

## Recent Decisions

### Memory Bank Structure (2026-02-02)
Created foundational Memory Bank with:
- `projectbrief.md` - Core requirements and objectives
- `productContext.md` - Audience analysis and learning journey
- `techContext.md` - Technology stack and dependencies
- `systemPatterns.md` - Presentation and coding patterns
- `progress.md` - Status tracking and resource inventory
- `activeContext.md` - Current working context (this file)

### Key Topics Identified
1. **User-Specified (Must Include)**:
   - Git as context provider for AI
   - Git for traceability of AI changes
   - Agent definitions and configuration
   - Instruction files (.clinerules)
   - Automated testing for self-verification

2. **Additional Topics for PowerShell/DevOps Audience**:
   - Pester integration patterns
   - PSScriptAnalyzer with AI
   - Module development workflows
   - CI/CD pipeline compatibility
   - Infrastructure as Code (Bicep/ARM)
   - Secret management awareness
   - Cross-platform PowerShell considerations

## Immediate Next Steps

1. **Research Phase** (Current)
   - [ ] Research Cline documentation for latest features
   - [ ] Identify additional relevant topics for audience
   - [ ] Document best practices and patterns

2. **Agenda Creation** (Next)
   - [ ] Draft detailed 2-hour core agenda
   - [ ] Draft extended 4-hour agenda with workshops
   - [ ] Define break points and flexible modules
   - [ ] Map demos to agenda sections

3. **Content Development** (Following)
   - [ ] Create demo PowerShell module project
   - [ ] Write sample .clinerules files
   - [ ] Develop hands-on exercises
   - [ ] Build slide deck

## Working Assumptions

### Presentation Format
- Primary: Live demonstration with VS Code + Cline
- Supporting: Slides for concepts and diagrams
- Interactive: Q&A encouraged throughout
- Hands-on: At least one attendee exercise

### Audience Assumptions
- Strong PowerShell scripting skills
- Familiar with Git basics (commit, push, pull, branch)
- Some VS Code experience
- May have tried GitHub Copilot or similar tools
- DevOps/automation mindset
- Windows-primary but cross-platform aware

### Technical Assumptions
- All demos on Windows 11
- PowerShell 7.x for cross-platform compatibility
- Pester 5.x for testing demonstrations
- Anthropic Claude or similar for LLM (Cline)
- Stable internet for API calls during demos

## Topics to Research

### Cline-Specific
- [ ] Latest Cline features and capabilities
- [ ] MCP server ecosystem and useful servers
- [ ] Checkpoint/rollback best practices
- [ ] Plan vs Act mode strategies
- [ ] Custom chat mode creation

### PowerShell-Specific
- [ ] Pester 5.x latest features for TDD
- [ ] PSScriptAnalyzer custom rules
- [ ] Module manifest automation
- [ ] Comment-based help generation
- [ ] SecretManagement module integration

### DevOps-Specific
- [ ] Azure DevOps pipeline integration
- [ ] GitHub Actions with AI-generated code
- [ ] Infrastructure as Code patterns
- [ ] GitOps workflows with AI

## Potential Demo Scenarios

### Demo 1: Module from Scratch (20-30 min)
- Empty repo → Full module with tests
- Shows: Context, generation, testing, iteration

### Demo 2: Add Feature to Existing Module (15-20 min)
- Existing module → New function
- Shows: Pattern recognition, consistency

### Demo 3: Debug and Fix (10-15 min)
- Failing tests → Working code
- Shows: Analysis, problem solving

### Demo 4: Documentation Generation (10-15 min)
- Undocumented code → Full docs
- Shows: Code understanding, help generation

### Demo 5: IaC with Bicep (Optional, 15-20 min)
- Request infrastructure → Bicep template
- Shows: Cross-language, DevOps application

## Risk Mitigation Notes

### Live Demo Backup Plans
- Pre-record key demos as fallback
- Have completed code checkpoints ready
- Test all demos morning-of session
- Prepare offline-capable examples

### Timing Flexibility
- Mark optional sections clearly
- Prepare natural stopping points
- Have "if time permits" bonus content
- Build in buffer for Q&A

### Attendee Environment Variance
- Provide pre-session setup guide
- Have troubleshooting FAQ ready
- Consider DevContainer option
- Demo-first, follow-along optional

## Questions for User

Before finalizing agenda:
1. Confirmed duration (2 hours strict, or flexible to 4)?
2. In-person, virtual, or hybrid format?
3. Attendee hands-on exercises required or optional?
4. Should attendees have pre-installed Cline?
5. Any specific PowerShell modules/scenarios to feature?
6. Recording planned?

## Session Context

### Current Task
Creating the agenda document based on Memory Bank content

### Key Constraints
- Must be practical and demo-heavy
- Must emphasize Git integration
- Must include automated testing
- Must be PowerShell/DevOps relevant
- Duration: 2-4 hours (flexible)

### Outputs Expected
1. Detailed agenda markdown file
2. Timing breakdown for each section
3. Demo descriptions per section
4. Break schedule