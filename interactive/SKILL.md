---
name: helper
description: Claude Code assistant providing immediate help via /helper commands.
---

# Claude Code Helper Skill

## Commands

### Helper Commands — Immediate Assistance
- `/helper ask <question>` — Ask any Claude Code usage question
- `/helper search <keyword>` — Search local docs and external resources
- `/helper guide new-project` — Start a new project with Claude Code
- `/helper guide debug` — Debug and recover from errors
- `/helper guide team` — Team collaboration workflows
- `/helper guide deploy` — Pre-release checklist and deployment
- `/helper guide parallel` — Parallel development with worktrees
- `/helper help` — Show all available commands
- `/helper status` — Show explored scenarios and recent Q&A

## Helper Command Details

### /helper ask <question>
Ask any question about using Claude Code. The helper will search:
1. Local knowledge base
2. Your current project context (TASK.md, files, git status)
3. Context7 MCP (official docs)
4. WebFetch (fallback)

Example: `/helper ask How do I define scope in TASK.md?`

### /helper search <keyword>
Search for documentation by keyword across all available sources.

Example: `/helper search worktree`

### /helper guide <scenario>
Start a scenario-based learning path:
- `new-project` — Starting fresh with Claude Code
- `debug` — Troubleshooting and recovery
- `team` — Team collaboration patterns
- `deploy` — Pre-release and deployment
- `parallel` — Worktree-based parallel dev

### /helper help
Display all available helper and tutorial commands.

### /helper status
Show:
- Which scenarios you've explored
- Recent questions you've asked
- Learning progress

## Available Guides

### new-project
Starting fresh with Claude Code:
- Setting up TASK.md
- Configuring AGENT_RULES.md
- Best practices for first-time users

### debug
Troubleshooting and recovery:
- Error reporting techniques
- Unstuck strategies
- File access issues

### team
Team collaboration patterns:
- Shared TASK.md conventions
- Feature branch workflows
- Code review with AI-generated code

### deploy
Pre-release and deployment:
- Review checklist
- Security review
- Deployment documentation

### parallel
Worktree-based parallel development:
- Git worktree fundamentals
- Isolated development environments
- Concurrent feature development

## Features
- Immediate Q&A via /helper commands
- Scenario-based learning guides
- Context-aware assistance
- Safety-focused approach

## Target Audience
- Beginners: Complete Claude Code newcomers (use /helper guide new-project)
- Advanced: Experienced developers (use /helper guide parallel)
- Troubleshooting: Anyone stuck (use /helper guide debug)
