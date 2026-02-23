# Guide: Parallel Development with Worktrees

## When to use this guide
Use this when you need to work on multiple features or branches simultaneously without context pollution.

## Prerequisites
- [ ] Git is installed and working
- [ ] You're comfortable with git branches
- [ ] You have multiple tasks to work on concurrently

## Steps

### Step 1: Create a worktree for each feature

A git worktree is a separate checkout of your repo linked to the same git history.

```
# From your main repo
git worktree add ../feature-a feature-a
git worktree add ../feature-b feature-b
```

Now you have three working directories:
- `project/` (main)
- `project-feature-a/` (feature-a worktree)
- `project-feature-b/` (feature-b worktree)

### Step 2: Work independently in each worktree

Each worktree has its own:
- Working files
- Git status
- Independent Claude Code session

Claude in `project-feature-a/` only sees that worktree's context.

### Step 3: Use TASK.md to scope each worktree

In `project-feature-a/`:
```markdown
# Task: Feature A - User Authentication

Focus only on user auth. Do not touch payment system.
```

In `project-feature-b/`:
```markdown
# Task: Feature B - Payment Integration

Focus only on payments. Do not touch user auth.
```

### Step 4: Parallel development

You can now:
- Have Claude Code working on Feature A in one terminal
- Have Claude Code working on Feature B in another terminal
- Switch between contexts by changing directories

### Step 5: Merge work back to main

When a feature is complete:
```
# From the worktree directory
git checkout main
git merge feature-a
git worktree remove ../feature-a
```

### Step 6: Clean up worktrees

List worktrees:
```
git worktree list
```

Remove a worktree:
```
git worktree remove <path>
```

## Common Questions

**Q: Do worktrees share git history?**
A: Yes. Commits in one worktree appear in others. But working files are independent.

**Q: Can I run Claude Code in multiple worktrees at once?**
A: Yes! Each terminal is a separate session. This is the primary benefit.

**Q: What if I need to share code between worktrees?**
A: Share via commits. Commit in one worktree, merge to main, then merge into the other worktree.

**Q: How do I avoid conflicts when merging?**
A: Commit frequently. Use feature branches that merge cleanly. TASK.md helps prevent overlap.

**Q: Do I need worktrees for simple projects?**
A: No. Worktrees are for concurrent work on the same repo. Single-task workflows don't need them.

## Related Commands
- `/helper:ask How do I resolve worktree merge conflicts?`
- `/helper:ask What's the max number of worktrees I should use?`
- `/learn-claude-advanced worktrees`
- `/learn-claude-advanced parallel`

## Go Deeper
For advanced worktree patterns, see: `main/docs/parallel_work.md` and `/learn-claude-advanced worktrees`
