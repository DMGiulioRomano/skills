# Skills

A curated collection of agent skills for Claude Code.

## Setup (run once after cloning)

```bash
git clone git@github.com:DMGiulioRomano/skills.git
cd skills
./install.sh
```

`install.sh` does two things:
1. Creates symlinks from `~/.claude/skills/` to each skill in this repo
2. Installs `post-merge` and `post-checkout` git hooks so symlinks stay in sync automatically on every `git pull` or branch switch

After that, new skills added by others appear in your `~/.claude/skills/` after a `git pull` with no manual steps.

## How It Works

Skills are loaded by Claude Code from `~/.claude/skills/`. Each skill in this repo is symlinked there, so the repo is the single source of truth across all your machines.

Add an alias to your `.zshrc` (or `.bashrc`) if you want skills loaded via `--add-dir` instead of symlinks:

```bash
alias claude="claude --add-dir /path/to/this/repo"
```

> The directory structure must place skill files inside `.claude/skills/` within the repo root — that's the path Claude Code expects when resolving skills from an external directory.

---

## Planning & Design

- **to-prd** — Turn the current conversation context into a PRD and submit it as a GitHub issue. No interview — just synthesizes what you've already discussed.

- **to-issues** — Break any plan, spec, or PRD into independently-grabbable GitHub issues using vertical slices.

- **grill-me** — Get relentlessly interviewed about a plan or design until every branch of the decision tree is resolved.

- **design-an-interface** — Generate multiple radically different interface designs for a module using parallel sub-agents.

- **request-refactor-plan** — Create a detailed refactor plan with tiny commits via user interview, then file it as a GitHub issue.

## Development

- **tdd** — Test-driven development with a red-green-refactor loop. Builds features or fixes bugs one vertical slice at a time.

- **triage-issue** — Investigate a bug by exploring the codebase, identify the root cause, and file a GitHub issue with a TDD-based fix plan.

- **improve-codebase-architecture** — Find deepening opportunities in a codebase, informed by the domain language in `CONTEXT.md` and the decisions in `docs/adr/`.

- **migrate-to-shoehorn** — Migrate test files from `as` type assertions to @total-typescript/shoehorn.

- **scaffold-exercises** — Create exercise directory structures with sections, problems, solutions, and explainers.

## Tooling & Setup

- **setup-pre-commit** — Set up Husky pre-commit hooks with lint-staged, Prettier, type checking, and tests.

- **git-guardrails-claude-code** — Set up Claude Code hooks to block dangerous git commands (push, reset --hard, clean, etc.) before they execute.

## Writing & Knowledge

- **write-a-skill** — Create new skills with proper structure, progressive disclosure, and bundled resources.

- **edit-article** — Edit and improve articles by restructuring sections, improving clarity, and tightening prose.

- **ubiquitous-language** — Extract a DDD-style ubiquitous language glossary from the current conversation.

- **obsidian-vault** — Search, create, and manage notes in an Obsidian vault with wikilinks and index notes.
