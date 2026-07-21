# Catalogo skill

Generato da `gen-catalog.sh`. Non modificare a mano.

Attiva con `./link-skill.sh <nome>` — disponibile subito, senza riavvio.

Per sapere quali sono attive ora: `./link-skill.sh -l` (stato locale,
non elencato qui per non sporcare il diff a ogni attivazione).

| Skill | Cosa fa |
|---|---|
| `academic-source-extractor` | Build a structured Obsidian-compatible knowledge network from academic PDF sources for a university paper (tesina). Produces per-PDF markdown files with YAML fr |
| `context-audit` | Audit your Claude Code setup for token waste and context bloat. Use when the user says "audit my context", "check my settings", "why is Claude so slow", "token  |
| `design-an-interface` | Generate multiple radically different interface designs for a module using parallel sub-agents. Use when user wants to design an API, explore interface options, |
| `domain-model` | Grilling session that challenges your plan against the existing domain model, sharpens terminology, and updates documentation (CONTEXT.md, ADRs) inline as decis |
| `domain-modeling` | Build and sharpen a project's domain model. Use when the user wants to pin down domain terminology or a ubiquitous language, record an architectural decision, o |
| `edit-article` | Edit and improve articles by restructuring sections, improving clarity, and tightening prose. Use when user wants to edit, revise, or improve an article draft. |
| `gdrive-sync` | Download files from Google Drive into the current local project. Files on Drive are organized under ClaudeCode/<github-owner>/<repo-name>/ mirroring the local s |
| `git-guardrails-claude-code` | Set up Claude Code hooks to block dangerous git commands (push, reset --hard, clean, branch -D, etc.) before they execute. Use when user wants to prevent destru |
| `github-triage` | Triage GitHub issues through a label-based state machine. Use when user wants to create an issue, triage issues, review incoming bugs or feature requests, prepa |
| `grill-me` | Interview the user relentlessly about a plan or design until reaching shared understanding, resolving each branch of the decision tree. Use when user wants to s |
| `grill-with-docs` | A relentless interview to sharpen a plan or design, which also creates docs (ADR's and glossary) as we go. |
| `grilling` | Interview the user relentlessly about a plan or design. Use when the user wants to stress-test a plan before building, or uses any 'grill' trigger phrases. |
| `handoff` | Compact the current conversation into a handoff document for another agent to pick up. |
| `humanizer` | Rimuove i segnali di scrittura AI dalla prosa italiana. Usare quando si scrive, edita o revisiona testo italiano, in particolare accademico e musicologico. |
| `improve-codebase-architecture` | Find deepening opportunities in a codebase, informed by the domain language in CONTEXT.md and the decisions in docs/adr/. Use when the user wants to improve arc |
| `new-feature` | Full TDD workflow for new features and refactoring in the PythonGranularEngine project. Creates feature branch, runs impact analysis, proposes design, then driv |
| `no-ai-slop` | Regole ed esempi pratici per scrivere prosa italiana che non suoni AI-generata. Da consultare prima di scrivere o revisionare qualunque testo in italiano, in pa |
| `obsidian-vault` | Search, create, and manage notes in the Obsidian vault with wikilinks and index notes. Use when user wants to find, create, or organize notes in Obsidian. |
| `qa` | Interactive QA session where user reports bugs or issues conversationally, and the agent files GitHub issues. Explores the codebase in the background for contex |
| `request-refactor-plan` | Create a detailed refactor plan with tiny commits via user interview, then file it as a GitHub issue. Use when user wants to plan a refactor, create a refactori |
| `skill-creator` | Create new skills, modify and improve existing skills, and measure skill performance. Use when users want to create a skill from scratch, edit, or optimize an e |
| `tdd` | Test-driven development with red-green-refactor loop. Use when user wants to build features or fix bugs using TDD, mentions "red-green-refactor", wants integrat |
| `teach` | Teach the user a new skill or concept, within this workspace. |
| `thesis-advisor-reviewer` | Rigorous academic supervisor for graduate-level (master's / second-level "biennio") electronic music thesis work. Use this whenever the user shares thesis prose |
| `to-issues` | Break a plan, spec, or PRD into independently-grabbable GitHub issues using tracer-bullet vertical slices. Use when user wants to convert a plan into issues, cr |
| `to-prd` | Turn the current conversation context into a PRD and submit it as a GitHub issue. Use when user wants to create a PRD from the current context. |
| `triage-issue` | Triage a bug or issue by exploring the codebase to find root cause, then create a GitHub issue with a TDD-based fix plan. Use when user reports a bug, wants to  |
| `ubiquitous-language` | Extract a DDD-style ubiquitous language glossary from the current conversation, flagging ambiguities and proposing canonical terms. Saves to UBIQUITOUS_LANGUAGE |
| `write-a-skill` | Create new agent skills with proper structure, progressive disclosure, and bundled resources. Use when user wants to create, write, or build a new skill. |
| `zoom-out` | Tell the agent to zoom out and give broader context or a higher-level perspective. Use when you're unfamiliar with a section of code or need to understand how i |
| `zsh-autocomplete` | Configura autocompletion zsh dinamica in un repository — analizza il Makefile per trovare target e variabili, crea .zsh_completions/, .envrc, e setup.sh idempot |
