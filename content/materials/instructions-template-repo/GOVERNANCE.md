# Governance for AI customization files

Five rules that decide who may change agent behaviour, and how. Half a page,
because a governance document nobody reads governs nothing.

## Why rule files need governance at all

An instruction file is not documentation. It is configuration that changes what
an agent does in every repository that loads it — silently, without a build
failing and without anyone noticing at the time. A rule added on a Friday can
change how fifty pull requests get written the following week.

Treat these files with the same discipline as production configuration.

## Rule 1: Every rule file has a named owner

No orphan files. Ownership is declared in `CODEOWNERS`, so review requests are
routed automatically.

```text
/Instructions/security.instructions.md   @acme/security
/Instructions/powershell.instructions.md @acme/platform
/Hooks/                                  @acme/security
/Agents/                                 @acme/platform
/Skills/                                 @acme/platform
```

If a file has no owner, it is a candidate for deletion, not for a rewrite.

## Rule 2: Rule changes go through a pull request

No direct pushes to `main`, no exceptions for "just a typo" — a typo in an
`applyTo` pattern silently disables a whole rule set. Branch protection
enforces this; goodwill does not.

The pull request must state which behaviour changes, not only which lines
change.

## Rule 3: The specific layer wins, except on security

Documented precedence, from weakest to strongest: **personal**, then **team**,
then **project**. A project may tighten or override a team rule for a good,
stated reason.

The one-way exception: a rule marked as a security rule may be **tightened** by
a lower layer, never relaxed. An agent that can talk its way past a control is
not a control.

> [!WARNING]
> The tooling does not enforce this precedence. All matching instruction files
> are supplied to the model, and the model decides how to reconcile them. If a
> rule must hold regardless of what the model decides, it belongs in a **hook**,
> where the exit code is honoured by the host, and not in prose.

## Rule 4: No rule without a case it fixes

Every proposed rule cites a concrete incident, review comment, or failing
example that it prevents. Rules invented in the abstract accumulate, contradict
each other, and quietly consume context budget in every session.

For a skill, the case includes a **trigger test**: a prompt that should load the
skill, and one that should not.

## Rule 5: Deprecate, version, and announce

- Releases are tagged with SemVer. A rule that becomes stricter or is removed is
  a **breaking** change, because it can fail builds downstream.
- Retired rules are marked deprecated for one release before removal, so
  consuming repositories get a window to react.
- Every release records what changed in `CHANGELOG.md`, in behavioural terms.

## Who may do what

| Role | May propose | May approve | May release |
| ---- | :---------: | :---------: | :---------: |
| Any engineer | Yes | No | No |
| File owner (`CODEOWNERS`) | Yes | Yes, for their files | No |
| Template maintainer group | Yes | Yes | Yes |
| Security group | Yes | Yes, mandatory for security rules and hooks | No |

## Hooks are a special case

A hook is executed by the host, so it is the only customization type that
enforces rather than requests. That makes it both the strongest control and the
most attractive target.

- Hook scripts stay **outside** the agent's auto-approved edit scope. An agent
  that can edit its own guardrails does not have guardrails.
- Hook changes require security-group approval, per the table above.

## See Also

- [README.md](README.md) — repository layout and distribution paths
- [destructive-operations-guardrails.md](../destructive-operations-guardrails.md)
  — the defence-in-depth model these rules sit inside
