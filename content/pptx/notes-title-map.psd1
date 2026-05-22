# notes-title-map.psd1
# Maps split-file slide H1 titles to monolith slide H1 titles when they
# differ. Used by Build-MarpVersions.ps1 to pair speaker notes with the
# correct monolith slide even when titles drift. Keys and values are
# case-insensitive after normalisation (lowercase + non-alphanumerics
# stripped). Leave entries commented out if uncertain.
@{
    # High confidence
    'Knowing What AI Changed'                                       = 'Git Provides Traceability'
    'Rollback When Needed'                                          = 'Checkpoint System — Rollback When Needed'
    'Observe → Plan → Act → Verify → Iterate'                       = 'The Agentic Loop'
    'In Your copilot-instructions.md'                               = 'What Goes Inside copilot-instructions.md'
    'Make the *Spec* the Primary Artefact — Not the Code'           = 'Spec-Driven Development — Make the Spec the Primary Artefact'
    'Agents That Work Together'                                     = 'Agent Handoff Chains'
    'Create Slash Commands for Repeated Tasks'                      = 'Prompt Files — Reusable Slash Commands'
    'Model Context Protocol'                                        = 'MCP — The Universal Connector'
    'Practical Rollback'                                            = 'Checkpoints & Rollback'
    'When AI Validates Its Own Lies'                                = 'The Cheating-Agent Trap'
    'The Single Most Important Cmdlet'                              = 'Invoke-LabCommand — The Key Cmdlet'
    'What AutomatedLab Is'                                          = 'AutomatedLab in 60 Seconds'
    'Why Markdown Wins for Non-Code Work'                           = 'Markdown as the Reasoning Substrate'
    'Durable Context Across Sessions'                               = 'The Memory Bank Pattern'
    'Share Your Setup Across Machines'                              = 'Cross-Machine Customization Sync'
    'AI Coding Has Evolved in Three Waves'                          = 'AI Has Evolved in Three Waves'
    'How do YOU use AI for coding today?'                           = 'How Do YOU Use AI in Your Work Today?'
    "What We'll Cover"                                              = "Today's Journey"
    'As PowerShell Developers / DevOps Engineers'                   = 'Why This Matters to You — If You Already Write Code'

    # Module 2-5 split → monolith aliases
    'Additional Verification'                                       = 'Beyond Pester — Additional Verification'
    'AI + Git = Full Audit Trail'                                   = 'AI Does the Git Forensics for You'
    'An Alternative Approach'                                       = 'Test-First with AI'
    'Best Practices'                                                = 'Maximize AI Effectiveness'
    'Beyond the Chat Window'                                        = 'Beyond Code — Anything You Can Script'
    'Documenting AI Contributions'                                  = 'Commit Strategies for AI Work'
    'Grill-Me + Ubiquitous Language'                                = 'Two Patterns for Context — Grill-Me + Ubiquitous Language'
    'Instruction Files'                                             = 'Instruction Files — The Solution'
    'Layer 6 — Make the Dangerous Action *Structurally* Unavailable' = 'GitOps as the Architectural Guardrail'
    'Layers of Verification'                                        = 'Trust Hierarchy'
    'Same Prompt, Different Results?'                               = 'The Consistency Problem'
    'Self-Correction Example'                                       = 'Self-Correction in Action'
    'Six Types of Copilot Customization'                            = 'The Complete Customization Ecosystem'
    'Specialized Agent Behaviors'                                   = 'Custom Agents — Specialized Behaviors'
    'Teach AI When to Use What'                                     = 'Skills — Domain Knowledge on Demand'
    'Tests as Specifications'                                       = 'Test-First — In Practice'
    'The New Layer of Work — and Its Failure Modes'                 = 'The Vigilance Trap'
    'What Goes Inside'                                              = 'What Goes Inside copilot-instructions.md'
    'What the Agent Sees'                                           = 'Repository as Knowledge Base'
    'When the Guardrails All Fail at Once'                          = 'Real Incident — 9 Seconds, One Database'
    'Why Each Strategy Matters'                                     = 'Commit Strategies — Explained'
    'Your AI Configuration Files'                                   = 'Five Types of Copilot Instruction Files'

    # Module 8-12 split → monolith aliases
    'A Universal Protocol for AI Tools'                             = 'How MCP Works'
    'Configuring MCP Servers'                                       = 'MCP in VS Code'
    'What Can You Connect?'                                         = 'MCP Use Cases'
    'Trust but Verify (Again)'                                      = 'MCP Security Considerations'
    'Your Safety Net'                                               = 'Checkpoints & Rollback'
    'Coordinated Changes Across Your Codebase'                      = 'Multi-File Operations'
    'Copilot Coding Agent — PRs from Issues'                        = 'Cloud Agent Workflow'
    "What's Coming Next"                                            = "The Horizon — What's Coming"
    'The Landscape Keeps Moving — Fast'                             = "What's New in 2026 Q2"
    'Advanced Capabilities Expand Your Reach'                       = 'M8 Key Takeaway'
    'When the Memory Bank Is Not Enough'                            = 'Scaling the Backlog — When to Reach for Beads'
    'When Is the Agentic Operating Model Right?'                    = 'The Judgment Question'
    'The Model Shines Here ✅'                                       = 'Where the Model Excels ✅'
    'Proceed with Caution ⚠️'                                       = 'Where to Be Careful ⚠️'
    'Extra Scrutiny Required ⚠️'                                    = 'Security-Sensitive Code ⚠️'
    'What Can the Agent Do?'                                        = 'Agent Security & Boundaries'
    'Know What You Are Doing'                                       = 'The Cardinal Rule'
    "Don't Use the Model Here ❌"                                   = 'When to Avoid ❌'
    'What You Still Do'                                             = 'The Human Role Remains'
    "Two Words for the Feeling You Can't Name"                      = 'Job Hollowing & Heteromation'
    'Build for Comprehension, Not for Tokens'                       = 'Deep Modules — A Codebase the Agent Can Navigate'
    'Why Babysitting AI Breaks Humans — and Has Done So for 78 Years' = 'The Vigilance Trap'
    'What to Do This Week'                                          = 'Getting Started — Weeks 2–3'
    'Start Simple, Iterate'                                         = 'Evolving Your Instructions'
    'Start Small, Build Confidence'                                 = 'Getting Started — Week 1'
    'The Stockfish Pattern — and How This Curriculum Operationalises It' = 'With AI, Not From AI — The Stockfish Pattern'
    'Evidence from the Field'                                       = 'Three Real Projects, One Pattern'
    'One Model, Three Projects'                                     = 'The Universal Operating Model'
    'Concrete Examples'                                             = 'What Counts as "Non-Coding"?'
    'Git for Prose, Decisions, and Evidence'                        = 'Git Is Not Just for Code'
    'The Agent Needs Hands in Your World'                           = 'PowerShell as the "Fingers"'
    'Not Everything Belongs in Every Model'                         = 'Data Governance & Confidentiality'
    "The Operator's Dilemma"                                        = "Why Sysadmins Don't Let Agents Touch Prod"
    'What Makes a Lab "Agentic-Ready"?'                             = 'The Four Properties of a Good Agent Sandbox'
    'From Zero to a Working Domain'                                 = 'A Minimal Lab Definition'
    'How the Agentic Loop Maps to a Lab'                            = "The Agent's Feedback Loop on Infrastructure"
    'From Runbook to Verified Change'                               = 'Live Example — The Kerberos RC4 Lab'
    'The Agent''s "Ctrl-Z" for Infrastructure'                      = 'Snapshot-Driven Iteration'
    'Choosing the Right Sandbox'                                    = 'Lab vs. Cloud vs. Dev Container'
    'Real Tasks Suitable for an Agent + Lab'                        = 'What You Can Actually Test Safely'
    'What Stops the 9-Second Disaster'                              = 'Guardrails for Destructive Operations'

    # Lower confidence — review before enabling
    # 'Your AI Configuration Files'                                 = 'Five Types of Copilot Instruction Files'
    # 'Teach AI When to Use What'                                   = 'Priority Order'
    # 'Beyond the Chat Window'                                      = 'Beyond Code — Anything You Can Script'
    # 'Layer 6 — Make the Dangerous Action *Structurally* Unavailable' = 'GitOps as the Architectural Guardrail'
    # 'The New Layer of Work — and Its Failure Modes'               = 'The Vigilance Trap'
    # 'When the Guardrails All Fail at Once'                        = 'Real Incident — 9 Seconds, One Database'
}
