# Guide: Debugging and Troubleshooting

## When to use this guide
Use this when you encounter errors, unexpected behavior, or Claude Code seems stuck.

## Prerequisites
- [ ] You have encountered an error or issue
- [ ] You know what you were trying to do
- [ ] You can reproduce the issue (if intermittent)

## Steps

### Step 1: Gather context first

Before asking for help, collect this information:
- The exact error message
- What command or prompt you used
- What you expected vs. what happened
- Any relevant file paths

### Step 2: Share the error with Claude

Provide Claude with:
1. The error message
2. Your prompt/command
3. Any relevant code (Claude can read files if you mention them)

Example:
```
I'm getting this error when running tests:

Error: Cannot find module './utils'
    at require (internal/modules/cjs/loader.js:...)

I ran `npm test` after making changes to src/app.js.
```

### Step 3: If Claude's fix doesn't work

1. Be specific about what still fails
2. Provide the new error output
3. Ask Claude to verify assumptions

### Step 4: For stuck or confused Claude

If Claude seems stuck or keeps repeating the same thing:

1. Restart the conversation: "Let's restart. Here's the current situation..."
2. Simplify the task: Break it into smaller pieces
3. Provide clearer TASK.md: Update scope to be more concrete

### Step 5: For file access issues

If Claude says it can't read a file:
- Verify the file exists at the path you mentioned
- Check you're working in the correct directory
- Provide absolute paths if relative paths aren't resolving

## Common Questions

**Q: Claude keeps giving me the same wrong answer.**
A: Start fresh: "That's not right. Let me clarify: [clear explanation]." Sometimes it's stuck on a wrong interpretation from earlier in the conversation.

**Q: Claude refuses to do what I want.**
A: Check if you have AGENT_RULES.md that might forbid it. If so, temporarily remove or modify the rule, or explain why this exception is acceptable.

**Q: How do I recover from a large number of wrong changes?**
A: If using git: `git status` to see what changed, `git checkout -- <files>` to discard changes. Then restart with clearer instructions.

**Q: The task is too big and Claude is overwhelmed.**
A: Break it down. Update TASK.md to focus on the first piece, work through it, then iterate.

## Related Commands
- `/helper:ask How do I get Claude unstuck?`
- `/helper:ask How do I structure an error report?`
- `/helper:ask What if Claude keeps getting it wrong?`

## Go Deeper
For advanced debugging patterns, see: `main/docs/best_practices.md` and `/learn-claude-advanced safety`
