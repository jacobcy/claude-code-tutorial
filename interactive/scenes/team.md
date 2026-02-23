# Guide: Team Collaboration

## When to use this guide
Use this when working with a team on a shared codebase using Claude Code.

## Prerequisites
- [ ] Team is using shared git repository
- [ ] Everyone has Claude Code installed
- [ ] Team alignment on TASK.md conventions

## Steps

### Step 1: Align on TASK.md conventions

Agree on how your team writes TASK.md:
- Where it lives (root? per directory?)
- What format to use
- How to track completed items

Template: See `main/templates/TASK.md`

### Step 2: Use feature branches

Always work on feature branches, not main:
```
git checkout -b feature/user-auth
```
Tell Claude about the branch in TASK.md context.

### Step 3: Communicate scope clearly

In your team's AGENT_RULES.md or project README, document:
- What Claude is allowed to do in this repo
- What patterns/conventions to follow
- Any team-specific constraints

### Step 4: Review Claude's changes

Before merging:
1. Review the diff: `git diff`
2. Ensure changes are within the agreed scope
3. Run tests: Claude should do this, but verify yourself

### Step 5: Document what Claude did

In your commit messages, indicate what Claude generated:
```
feat: add user authentication flow (Claude-generated)

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
```

## Common Questions

**Q: How do we ensure consistent code style across the team?**
A: Configure linters/prettier in your repo. Claude should respect these when generating code. Document expectations in AGENT_RULES.md.

**Q: What if two team members use Claude on the same branch?**
A: Avoid this. Each person should have their own feature branch. If you must collaborate, communicate what each person is working on.

**Q: How do we track what Claude did vs. what humans wrote?**
A: Use commit attribution (Co-Authored-By) and PR descriptions that call out AI-generated portions.

**Q: Can we share a TASK.md across the team?**
A: Yes, commit TASK.md to the repo. This keeps everyone aligned on current scope.

## Related Commands
- `/helper:ask How do I document Claude-generated code?`
- `/helper:ask What should go in team AGENT_RULES.md?`
- `/learn-claude-advanced best-practices`

## Go Deeper
For enterprise collaboration patterns, see: `main/docs/best_practices.md` and `/learn-claude-advanced safety`
