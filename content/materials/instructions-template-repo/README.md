# AI Customization Template Repository

A blueprint for the **team layer** of AI customization: one repository that
holds your organization's instruction files, custom agents, skills, prompts,
and hooks, plus a documented way to roll them out to project repositories and
to keep them up to date.

This folder is a design document, not a working template repository. It
describes what to create, how to distribute it, and who is allowed to change
it. The payload — ready-made example files — lives in
[sample-copilot-instructions/](../sample-copilot-instructions/) and
[memory-bank-template/](../memory-bank-template/).

## Who this is for

Teams that have moved past "everyone writes their own
`copilot-instructions.md`" and now need a shared, reviewable, versioned set of
rules that behaves the same way in every project.

## The three layers

Customization lives on three layers at once. Confusing them is the most common
source of "the agent behaves differently on my machine".

| Layer | Lives in | Scope | Owner |
| ----- | -------- | ----- | ----- |
| **Personal** | A synced folder (the *Atelier*) | One person, every project | The individual |
| **Team** | The template repository described here | Every project of a team | A named group |
| **Project** | `.github/` inside the project repository | One project | The project team |

The team layer is the one most organizations are missing. Without it, personal
Ateliers drift apart and project files repeat the same rules with small,
undocumented differences.

## Repository layout

```text
ai-customizations/            # GitHub template repository
├── README.md                 # What this is, how to consume it
├── GOVERNANCE.md             # Who may change what, and how
├── CODEOWNERS                # Named owner per rule file
├── CHANGELOG.md              # What changed per release tag
├── plugin.json               # Installable Agents + Skills manifest
├── Agents/                   # *.agent.md
├── Instructions/             # *.instructions.md, copilot-instructions.md
├── Skills/                   # <skill-name>/SKILL.md
├── Prompts/                  # *.prompt.md
├── Hooks/                    # *.hooks.json + guard scripts
└── Setup-AiCustomizations.ps1  # Idempotent per-machine setup
```

The five content folders match the five VS Code customization surfaces, so a
consuming machine can point its settings straight at them:

```jsonc
// VS Code settings.json
"chat.agentFilesLocations":        { "~/ai-customizations/Agents": true }
"chat.instructionsFilesLocations": { "~/ai-customizations/Instructions": true }
"chat.agentSkillsLocations":       { "~/ai-customizations/Skills": true }
"chat.promptFilesLocations":       { "~/ai-customizations/Prompts": true }
"chat.hookFilesLocations":         { "~/ai-customizations/Hooks": true }
```

## Distribution paths

There is no single mechanism that carries all five surfaces *and* stays
updatable. Pick per surface, and be explicit about the trade-off.

| Path | Carries | Update path | Best for |
| ---- | ------- | ----------- | -------- |
| **GitHub template repository** (*Use this template*) | Everything | None — it is a one-time copy | Bootstrapping a new project |
| **`plugin.json`** via *Chat: Install Plugin From Source* | Agents + Skills **only** | Yes — reinstall from the Git URL | Personal and team libraries |
| **Setup script / package** | Everything, including Instructions and Hooks | Yes — rerun the script or bump the package | Machines and build agents |
| **Git remote + tag diff** | Everything | Yes — see below | Long-lived project repositories |

> [!IMPORTANT]
> Instructions and hooks are **not** part of the plugin manifest format. A
> `plugin.json` alone will never distribute your `copilot-instructions.md` or
> your guard hooks. Whoever owns the template must own a second path for those
> two surfaces.

## Keeping consumers up to date

A copy without a version number cannot be updated safely, because nobody can
tell what it was copied from.

1. **Tag every release** of the template repository with SemVer
   (`v1.4.0`). Treat a rule that becomes stricter, or is removed, as a
   **breaking** change — it can fail builds in consuming repositories.
2. **Record the consumed version** in each project repository, in a
   `.github/ai-template-version` file containing nothing but the tag.
3. **Diff to update**. In the consuming repository:

   ```powershell
   git remote add template https://github.com/<org>/ai-customizations.git
   git fetch template --tags
   git diff v1.3.0..v1.4.0 -- Instructions/ Hooks/
   ```

   Apply what is relevant, then update the version marker in the same pull
   request. The diff is the review artifact — it is what a reviewer reads
   instead of the whole template.

## Rollout checklist

- [ ] Template repository created and marked as a **template** in its settings.
- [ ] `CODEOWNERS` names a real person or group for every rule file.
- [ ] `GOVERNANCE.md` reviewed and accepted by those owners.
- [ ] Branch protection on `main`: no direct pushes, review required.
- [ ] `plugin.json` validated by installing it on a second machine.
- [ ] Setup script tested on a clean machine, run twice, to prove idempotence.
- [ ] One pilot project consumes the template end to end before a wider rollout.
- [ ] Version marker and update procedure documented in the pilot project.

## See Also

- [GOVERNANCE.md](GOVERNANCE.md) — who may change what, and how
- [plugin.json](plugin.json) — example manifest
- [sample-copilot-instructions/](../sample-copilot-instructions/) — example
  instruction, agent, and skill files to seed the template
- [memory-bank-template/](../memory-bank-template/) — project memory scaffold
- [CopilotAtelier](https://github.com/raandree/CopilotAtelier) — a public
  reference implementation of the *personal* layer
