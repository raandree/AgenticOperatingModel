# Glossary — The Agentic Operating Model (Ubiquitous Language)

This is the single source of truth for the project's vocabulary. Use only the
canonical terms in the **Term** column across slides, demos, materials, code,
comments, commit messages, and the Memory Bank. Never introduce a word listed in
a **Don't say** cell. If you need a word for a concept that is not here, propose
a new row rather than inventing a synonym.

> **Why this exists now, not "later":** the vocabulary below is already settled
> and used consistently across the curriculum — see the
> [cheat-sheet](../content/materials/cheat-sheet.md) "Key Concepts" table and
> [Slide 2.0 "Foundational Vocabulary"](../content/slides/02-what-is-agentic.md).
> This file *harvests* that settled language into one place; it does not invent
> it. New terms are appended as rows as the project grows.

## The paradigm

| Term | Means | Don't say |
| --- | --- | --- |
| Agentic Operating Model | The paradigm this project teaches: a universal pattern of versioned context → agent action → self-verification → human review, applied to any knowledge work. | the tool, agentic framework, PowerShell training, Copilot course |
| AOM | Accepted abbreviation of *Agentic Operating Model*, used in branding and assets. | — |
| Agentic coding | AI autonomously executing multi-step coding tasks — one instance of the paradigm, not the whole of it. | AI-assisted coding, autocomplete |

## Agent anatomy

| Term | Means | Don't say |
| --- | --- | --- |
| Model | The underlying large language model (LLM) that powers the tools. | GPT (brand-specific), the agent |
| Agent | An autonomous AI entity that plans, acts, and iterates toward a goal. | assistant, chatbot, autocomplete |
| Tool | A capability an agent can invoke (file I/O, terminal, search, web fetch). | plugin, add-in |
| Agent handoff | One agent delegating to another specialized agent (e.g. Dev → Reviewer). | escalation, transfer |

## Configuration files

| Term | Means | Don't say |
| --- | --- | --- |
| Instruction file | A rule set (`copilot-instructions.md`, `*.instructions.md`, `AGENTS.md`) that governs agent behavior. | config, rules file, system prompt, prompt file |
| Custom agent | An `*.agent.md` file defining a specialized agent persona with its tools and handoffs. | persona file, bot config, mode file |
| Skill | On-demand domain expertise packaged as a reusable `SKILL.md`, loaded only when relevant. | plugin, extension, instruction file |
| Prompt file | A `*.prompt.md` file exposing a reusable `/slash` command. | macro, snippet, instruction file |
| Prompt | The input or directive given to the model in the moment. | query, command |

## Context and memory

| Term | Means | Don't say |
| --- | --- | --- |
| Context | The repository structure, existing code, and patterns that give the agent understanding. | background |
| Context window | The maximum amount of text (tokens) a model can consider at once. | memory, buffer, RAM |
| Context engineering | Treating the context window as a finite budget and curating what fills it (guards against context rot). | prompt engineering |
| Token | The smallest unit of text the model processes (~4 characters in English). | word, character |
| Memory Bank | The versioned, per-repository knowledge base under `.memory-bank/` that persists understanding across sessions. | cache, notes, the AI's memory, context window |
| Memory Bank integrity | Protecting trusted project state through explicit write ownership, review, source labeling, version history, and recovery outside the Agent's authority. | memory poisoning (that is one mechanism) |

## Verification and the loop

| Term | Means | Don't say |
| --- | --- | --- |
| The Agentic Loop | The core cycle OBSERVE → PLAN → ACT → VERIFY → ITERATE that an agent runs autonomously. | the agent workflow, the AI pipeline; EXECUTE as the third-phase name (canonical is ACT) |
| Self-verification | The agent proving its own work by running tests, linters, or checking deterministic artefacts. | QA, generic "testing" |
| Traceability | Using Git history to track and attribute every AI-made change. | audit log |
| Evidence plane | One of three complementary forms of proof: Traceability, Agent observability, or claim provenance. | audit layer |
| Agent observability | Recording an Agent's execution path — Model calls, Tool calls, hooks, subagents, errors, cost, and outcomes — through traces, metrics, and events. | Traceability, target-system observability |
| Claim provenance | Linking a factual claim to the exact source passage and stable identifier that supports it. | citation alone |

## Protocol and control

| Term | Means | Don't say |
| --- | --- | --- |
| MCP | Model Context Protocol — the open standard for connecting agents to external tools and data sources. | the protocol, plugin API |
| MCP server | A process that exposes tools and data to an agent over MCP. | plugin, integration, connector |
| A2A | Agent2Agent Protocol — the open standard for discovery, delegation, and result exchange between independent Agents. | MCP (Agent-to-Tool), Agent handoff (in-process delegation) |
| Checkpoint | A restorable point that lets the operator undo an agent's actions. | snapshot, save |
| Host trust handoff | The point where Agent-controlled output becomes input to a more privileged host component such as a hook, extension, task runner, or local daemon. | sandbox escape (that is one possible outcome) |

## Governance, risk, and the human role

| Term | Means | Don't say |
| --- | --- | --- |
| Operator | The human who directs, reviews, approves, and can roll back the agent's work. | prompter |
| Human oversight | Review, approval, and rollback of agent work by the operator. | hand-holding, babysitting |
| Agent identity | The digital identity whose credentials, permissions, lifecycle, and records govern an Agent's actions. | the Operator's identity, API key |
| Comprehension debt | The gap between code that exists in the system and code any human can still explain. | technical debt, tech debt |
| GitOps guardrail (Layer 6) | The architectural control where the agent may only *propose* a change (commit + PR) and a gated pipeline reconciles it. | the agent deploys, the agent applies |
| Lethal trifecta | The dangerous combination of private data + untrusted content + external communication that enables data exfiltration (OWASP `LLM01`). | prompt injection (that is the mechanism) |
| Containment first | Capping what an agent *can reach* (sandbox, VM, egress limits), not just what it is *told* to do. | prompt hardening |

## Coined failure-mode terms

| Term | Means | Don't say |
| --- | --- | --- |
| Job hollowing | The role's title, salary, and desk remain while the cognitive substance (design, judgement) is extracted by the AI. | deskilling |
| Heteromation | An arrangement where the human becomes the machine's tool — validating output and holding responsibility — rather than the machine being the human's tool. | automation |
| Vigilance trap | The measurable failure of passive human monitoring after 15–30 minutes (Mackworth 1948), worsened by automation complacency. | inattention, carelessness |

---

**Maintenance:** append a row when a new canonical term settles; when a concept
is renamed, move its old wording into the **Don't say** cell. This file is part
of the always-loaded Memory Bank set, so keep it lean — one sentence per
definition.
