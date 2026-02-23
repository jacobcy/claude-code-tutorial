---
name: ask
description: Use when asking any Claude Code usage question
---

# Ask Claude Code Helper

Ask any question about using Claude Code. The helper will search:

1. **Local knowledge base** - Your project's documentation
2. **Current project context** - TASK.md, files, git status
3. **Context7 MCP** - Official Claude Code documentation
4. **WebFetch** - Fallback to web search

## Usage

```
/helper ask <question>
```

## Examples

```
/helper ask How do I define scope in TASK.md?
/helper ask What's the difference between plan mode and implementation?
/helper ask How do I use git worktrees for parallel development?
```
