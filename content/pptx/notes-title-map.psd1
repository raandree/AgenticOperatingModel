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

    # Lower confidence — review before enabling
    # 'Your AI Configuration Files'                                 = 'Five Types of Copilot Instruction Files'
    # 'Teach AI When to Use What'                                   = 'Priority Order'
    # 'Beyond the Chat Window'                                      = 'Beyond Code — Anything You Can Script'
    # 'Layer 6 — Make the Dangerous Action *Structurally* Unavailable' = 'GitOps as the Architectural Guardrail'
    # 'The New Layer of Work — and Its Failure Modes'               = 'The Vigilance Trap'
    # 'When the Guardrails All Fail at Once'                        = 'Real Incident — 9 Seconds, One Database'
}
