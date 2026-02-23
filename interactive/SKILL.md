---
name: claude-code-tutorial
description: Claude Code assistant providing immediate help via /helper:* commands and structured learning via /learn-claude-*.
---

# Claude Code Tutorial & Helper Skill

## Commands

### Helper Commands — Immediate Assistance
- `/helper:ask <question>` — Ask any Claude Code usage question
- `/helper:search <keyword>` — Search local docs and external resources
- `/helper:guide new-project` — Start a new project with Claude Code
- `/helper:guide debug` — Debug and recover from errors
- `/helper:guide team` — Team collaboration workflows
- `/helper:guide deploy` — Pre-release checklist and deployment
- `/helper:guide parallel` — Parallel development with worktrees
- `/helper:help` — Show all available commands
- `/helper:status` — Show explored scenarios and recent Q&A

### Tutorial Commands — Structured Learning
- `/learn-claude-code`: Start the interactive beginner tutorial
- `/learn-claude-code start`: Begin with basic concepts
- `/learn-claude-code setup`: Learn about setup and configuration
- `/learn-claude-code tasks`: Understand TASK.md files
- `/learn-claude-code rules`: Learn about AGENT_RULES.md

### Advanced Commands
- `/learn-claude-advanced`: Access advanced learning materials
- `/learn-claude-advanced worktrees`: Master Git worktree strategies
- `/learn-claude-advanced parallel`: Learn parallel development techniques
- `/learn-claude-advanced safety`: Advanced safety practices
- `/learn-claude-advanced best-practices`: Industry best practices

### Utility Commands
- `/learn-claude-code help`: Show available commands
- `/learn-claude-code status`: Show learning progress
- `/learn-claude-code reset`: Reset learning progress
- `/learn-claude-code examples`: Access practical examples

## Helper Command Details

### /helper:ask <question>
Ask any question about using Claude Code. The helper will search:
1. Local knowledge base
2. Your current project context (TASK.md, files, git status)
3. Context7 MCP (official docs)
4. WebFetch (fallback)

Example: `/helper:ask How do I define scope in TASK.md?`

### /helper:search <keyword>
Search for documentation by keyword across all available sources.

Example: `/helper:search worktree`

### /helper:guide <scenario>
Start a scenario-based learning path:
- `new-project` — Starting fresh with Claude Code
- `debug` — Troubleshooting and recovery
- `team` — Team collaboration patterns
- `deploy` — Pre-release and deployment
- `parallel` — Worktree-based parallel dev

### /helper:help
Display all available helper and tutorial commands.

### /helper:status
Show:
- Which scenarios you've explored
- Recent questions you've asked
- Learning progress

## Learning Modules

### Module 1: Introduction to Claude Code
- Understanding the Claude Code workflow
- Setting up your environment
- Basic safety practices
- First interaction patterns

### Module 2: Task Definition and Constraints
- Creating effective TASK.md files
- Defining clear AGENT_RULES.md
- Boundary setting techniques
- Scope management

### Module 3: Parallel Development
- Git worktree strategies
- Multi-agent coordination
- Conflict prevention
- Isolation techniques

### Module 4: Advanced Safety
- Security considerations
- Production readiness
- Team collaboration patterns
- Review and approval processes

## Features
- Immediate Q&A via /helper:* commands
- Scenario-based learning guides
- Structured tutorial modules
- Progressive difficulty levels
- Context-aware assistance
- Safety-focused approach

## Target Audience
- Beginners: Complete Claude Code newcomers (use /helper:guide new-project)
- Advanced: Experienced developers (use /helper:guide parallel)
- Troubleshooting: Anyone stuck (use /helper:guide debug)
