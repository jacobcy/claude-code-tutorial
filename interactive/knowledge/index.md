# Claude Code Knowledge Base

This file contains frequently asked questions and answers, organized by tags for quick lookup.

---

## tags: task, task.md, scope, definition

**Q: How do I define the scope of work for an agent?**

Use `TASK.md` file in your project root. Define:
- Context: What are we building?
- Requirements: What must be done?
- Constraints: What should NOT be done?

Example:
```markdown
# Task: Add user authentication

## Context
Adding login/signup to a web application using OAuth.

## Requirements
- [ ] Google OAuth integration
- [ ] Session management
- [ ] Protected route middleware

## Constraints
- Do not modify existing user schema
- Do not deploy to production
```

---

## tags: task, task.md, update, evolve

**Q: Can I change the TASK.md during work?**

Yes. If scope evolves:
1. Update TASK.md
2. Inform Claude: "I've updated TASK.md. The scope now includes X."

This keeps Claude aligned with your intentions.

---

## tags: agent-rules, rules, AGENT_RULES.md, constraints

**Q: What should I put in AGENT_RULES.md?**

Use AGENT_RULES.md to constrain Claude's behavior:
- Allowed actions: What files can it modify?
- Forbidden actions: What must it NEVER do?
- Patterns: Coding style, naming conventions

Example:
```markdown
# Agent Rules

## Allowed Actions
- Read source files
- Write new code in src/
- Run tests with npm test

## Forbidden Actions
- Do not modify package.json (except for scripts)
- Do not deploy to production
- Do not commit to git

## Code Style
- Use TypeScript strict mode
- Follow existing naming conventions
```

---

## tags: hooks, pre-commit, automation, git

**Q: How do I run a check before every commit?**

Use a git pre-commit hook. In `.git/hooks/pre-commit`:
```bash
#!/bin/bash
npm test
if [ $? -ne 0 ]; then
  echo "Tests failed. Aborting commit."
  exit 1
fi
```

Make it executable: `chmod +x .git/hooks/pre-commit`

Or use husky in package.json:
```json
{
  "husky": {
    "hooks": {
      "pre-commit": "npm test"
    }
  }
}
```

---

## tags: worktree, git, parallel, isolation

**Q: What is a git worktree and when should I use one?**

A worktree is a separate checkout of your repo linked to the same git history.

Use worktrees when:
- Working on multiple features concurrently
- Need to switch between tasks without context pollution
- Want multiple Claude Code sessions on the same repo

Create:
```bash
git worktree add ../feature-branch feature-branch
```

---

## tags: claude, stuck, confused, troubleshooting

**Q: Claude keeps giving me the same wrong answer.**

Start fresh and clarify:
```
That's not working. Let me clarify the requirement:
[clear, specific explanation]
```

Claude can get stuck on an incorrect interpretation from earlier in the conversation. Resetting with clear new instructions helps.

---

## tags: claude, permission, denied, access

**Q: Claude says it can't read a file.**

Check:
1. Does the file exist at the path you mentioned?
2. Are you in the correct working directory?
3. Try providing an absolute path

If using a worktree, ensure Claude is in the worktree directory, not the main repo.

---

## tags: testing, coverage, tdd

**Q: How much test coverage should I aim for?**

Aim for 80%+ coverage. Use test-driven development:
1. Write test first (it should fail)
2. Write minimal implementation
3. Verify test passes
4. Refactor

Use `/tdd` command for guided TDD workflow.

---

## tags: claude, context, conversation, limit

**Q: How do I avoid hitting context limits?**

- Work in smaller batches
- Use worktrees for isolation
- Summarize context after long sessions
- Use TASK.md to keep scope focused
- Avoid asking Claude to read entire large files (specific line ranges instead)

---

## tags: deploy, production, safety

**Q: Should Claude deploy directly to production?**

No. Best practice:
1. Use AGENT_RULES.md to forbid production deployments
2. Claude generates changes locally
3. You review and test
4. You deploy manually after verification

Example AGENT_RULES.md:
```markdown
## Forbidden Actions
- Do not deploy to production
- Do not run deployment commands
```

---

## tags: team, collaboration, commit, attribution

**Q: How do I document that Claude generated code in a commit?**

Use Co-Authored-By attribution:
```bash
git commit -m "feat: add user authentication

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>"
```

This makes AI-assisted work transparent to your team.

---

## tags: error, debugging, stuck

**Q: The build failed and Claude can't fix it.**

1. Copy the exact error message
2. Share it with Claude: "I'm getting this error: [paste]"
3. Provide context about what you were doing
4. Ask Claude to read the relevant file

If still stuck, try:
- Simplify the task
- Restart the conversation
- Use `/helper:guide debug` for systematic troubleshooting

---

## tags: claude, command, slash, help

**Q: What slash commands does this skill provide?**

**Tutorial commands:**
- `/learn-claude-code` — Start beginner tutorial
- `/learn-claude-advanced` — Advanced learning

**Helper commands:**
- `/helper:ask <question>` — Ask a question
- `/helper:search <keyword>` — Search docs
- `/helper:guide <scenario>` — Scenario-based guide
- `/helper:help` — Show all commands
- `/helper:status` — Show progress

Run `/helper:help` to see the complete list.
