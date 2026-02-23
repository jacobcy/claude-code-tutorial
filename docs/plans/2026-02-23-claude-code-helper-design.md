# Claude Code Helper — Design Document

**Date**: 2026-02-23
**Status**: Approved

## Problem Statement

The current project is scoped too narrowly as a tutorial collection. Users need both
structured learning content and immediate, contextual assistance at any point in their
workflow. The project should evolve into a dual-mode assistant: a skill that can answer
"how do I do X?" on demand, while also providing scenario-based learning paths.

## Solution

Extend the existing `interactive/SKILL.md` to support two co-existing command namespaces
within a single installed skill:

- `/helper:*` — immediate assistant (new)
- `/learn-claude-*` — structured tutorial (existing, unchanged)

---

## Architecture

```
claude-code-tutorial (Skill)
├── interactive/SKILL.md         ← extended with /helper:* commands
├── interactive/scenes/          ← new: scenario guide content files
│   ├── new-project.md
│   ├── debug.md
│   ├── team.md
│   ├── deploy.md
│   └── parallel.md
├── interactive/knowledge/       ← new: structured Q&A knowledge base
│   └── index.md
├── docs/                        ← unchanged, used as knowledge source
├── examples/                    ← unchanged, used as knowledge source
└── templates/                   ← unchanged, used as knowledge source
```

---

## Command Design

### Immediate Assistant Commands

| Command | Description |
|---|---|
| `/helper:ask <question>` | Answer any Claude Code usage question |
| `/helper:search <keyword>` | Search local docs + external resources |
| `/helper:help` | List all available commands |

### Scenario Guides

| Command | Description |
|---|---|
| `/helper:guide new-project` | Start a new project with Claude Code |
| `/helper:guide debug` | Debug and recover from errors |
| `/helper:guide team` | Team collaboration workflows |
| `/helper:guide deploy` | Pre-release checklist and deployment |
| `/helper:guide parallel` | Parallel development with worktrees |

### Progress Tracking

| Command | Description |
|---|---|
| `/helper:status` | Show explored scenarios and recent Q&A |

---

## Knowledge Resolution Order

When `/helper:ask` or `/helper:search` is invoked, the skill resolves answers in this
priority order:

1. **Local docs** — `docs/`, `examples/`, `templates/`, `interactive/knowledge/`
2. **Project context** — current directory structure, `TASK.md`, `AGENT_RULES.md`, git status
3. **Context7 MCP** — official Claude Code documentation (preferred external source)
4. **WebFetch** — fallback if Context7 is unavailable

The skill must attempt Context7 first for external lookups. Only fall back to WebFetch
when Context7 returns no result or is not configured.

---

## Scenario Guide Content Structure

Each scene file follows a consistent structure:

```markdown
# Guide: <Scenario Name>

## When to use this guide
<1-2 sentences>

## Prerequisites
- [ ] item 1
- [ ] item 2

## Steps
### Step 1: ...
### Step 2: ...

## Common Questions
**Q: ...**
A: ...

## Related Commands
- `/helper:ask ...`
- `/learn-claude-advanced ...`

## Go Deeper
Link to relevant tutorial module.
```

---

## Knowledge Base Format

`interactive/knowledge/index.md` uses a tagged Q&A format for fast lookup:

```markdown
## tags: task, task.md, scope
**Q: How do I define the scope of work for an agent?**
Use a `TASK.md` file in your project root. Define ...

## tags: hooks, pre-commit, automation
**Q: How do I run a check before every commit?**
...
```

---

## Files Changed

| File | Action |
|---|---|
| `interactive/SKILL.md` | Modify — add all `/helper:*` command definitions |
| `interactive/scenes/new-project.md` | Create |
| `interactive/scenes/debug.md` | Create |
| `interactive/scenes/team.md` | Create |
| `interactive/scenes/deploy.md` | Create |
| `interactive/scenes/parallel.md` | Create |
| `interactive/knowledge/index.md` | Create |
| `docs/`, `examples/`, `templates/` | No changes |

---

## Out of Scope

- Web UI or TUI
- User account / cloud sync
- Automated context scanning (proactive suggestions)
- Any changes to the `/learn-claude-*` command set
