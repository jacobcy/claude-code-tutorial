# Guide: Starting a New Project

## When to use this guide
Use this when you're starting fresh with Claude Code or beginning a new feature in an existing codebase.

## Prerequisites
- [ ] Claude Code is installed
- [ ] You have an empty directory or a project to work with
- [ ] Git is initialized (recommended)

## Steps

### Step 1: Initialize a TASK.md file

Create a `TASK.md` file in your project root. This defines the scope for Claude Code.

Example:
```markdown
# Task: [Task Title]

## Context
[Brief project context - what are you building?]

## Requirements
- [ ] Requirement 1
- [ ] Requirement 2

## Constraints
- [ ] Constraint 1 (e.g., no external dependencies)
- [ ] Constraint 2 (e.g., must work on Python 3.8+)
```

### Step 2: Set up AGENT_RULES.md (optional)

If you need to constrain Claude's behavior, create an `AGENT_RULES.md` file.

Example:
```markdown
# Agent Rules

## Allowed Actions
- Read source files
- Write new code
- Run tests

## Forbidden Actions
- Do not modify production database schemas
- Do not deploy to production
```

### Step 3: Start with a clear command

Begin your work with an unambiguous request to Claude Code.

Good examples:
- "Implement the user authentication flow"
- "Add error handling to the API endpoints"
- "Refactor the checkout module to use event sourcing"

Bad examples:
- "Fix the code" (too vague)
- "Improve performance" (no specific area)

### Step 4: Iterate with feedback

- Review Claude's proposed changes
- Ask for clarification if something is unclear
- Request modifications before accepting

### Step 5: Validate and commit

- Run your tests
- Verify the changes work as expected
- Commit with clear messages

## Common Questions

**Q: Do I always need a TASK.md?**
A: For complex tasks, yes. For quick fixes or simple questions, you can work without one, but TASK.md helps maintain scope and prevents drift.

**Q: Can I change the TASK.md mid-task?**
A: Yes. If the scope evolves, update TASK.md and inform Claude about the changes.

**Q: What if Claude tries to do something outside scope?**
A: Refer it back to TASK.md. You can also use AGENT_RULES.md to explicitly forbid certain actions.

## Related Commands
- `/helper:ask How do I write a good TASK.md?`
- `/helper:ask What should I include in AGENT_RULES.md?`
- `/learn-claude-code tasks` — Detailed TASK.md tutorial
- `/learn-claude-code rules` — AGENT_RULES.md tutorial

## Go Deeper
For comprehensive task definition techniques, see: `main/templates/TASK.md` and `/learn-claude-code tasks`
