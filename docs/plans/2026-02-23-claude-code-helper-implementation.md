# Claude Code Helper Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Extend the existing claude-code-tutorial skill with `/helper:*` commands for immediate assistance and scenario-based guides.

**Architecture:** Single skill with dual command namespaces (`/helper:*` for assistance, `/learn-claude-*` for existing tutorials), local knowledge base with Context7/WebFetch fallback for external docs.

**Tech Stack:** Markdown-based skill files, Context7 MCP (preferred), WebFetch (fallback)

---

## Task 1: Create scenes directory structure

**Files:**
- Create: `interactive/scenes/` (directory)

**Step 1: Create the scenes directory**

Run: `mkdir -p /Users/jacobcy/src/claude-code-tutorial/main/interactive/scenes`

**Step 2: Verify directory created**

Run: `ls -la /Users/jacobcy/src/claude-code-tutorial/main/interactive/scenes`
Expected: Directory exists (empty)

**Step 3: Commit**

```bash
git add /Users/jacobcy/src/claude-code-tutorial/main/interactive/scenes
git commit -m "feat: add scenes directory structure"
```

---

## Task 2: Create new-project scenario guide

**Files:**
- Create: `interactive/scenes/new-project.md`

**Step 1: Write new-project.md file**

```markdown
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
```

**Step 2: Verify file created**

Run: `cat /Users/jacobcy/src/claude-code-tutorial/main/interactive/scenes/new-project.md | head -20`
Expected: File content begins with "# Guide: Starting a New Project"

**Step 3: Commit**

```bash
git add /Users/jacobcy/src/claude-code-tutorial/main/interactive/scenes/new-project.md
git commit -m "feat: add new-project scenario guide"
```

---

## Task 3: Create debug scenario guide

**Files:**
- Create: `interactive/scenes/debug.md`

**Step 1: Write debug.md file**

```markdown
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

```
Error: Cannot find module './utils'
    at require (internal/modules/cjs/loader.js:...)
```

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
```

**Step 2: Verify file created**

Run: `cat /Users/jacobcy/src/claude-code-tutorial/main/interactive/scenes/debug.md | head -20`
Expected: File content begins with "# Guide: Debugging and Troubleshooting"

**Step 3: Commit**

```bash
git add /Users/jacobcy/src/claude-code-tutorial/main/interactive/scenes/debug.md
git commit -m "feat: add debug scenario guide"
```

---

## Task 4: Create team scenario guide

**Files:**
- Create: `interactive/scenes/team.md`

**Step 1: Write team.md file**

```markdown
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
```

**Step 2: Verify file created**

Run: `cat /Users/jacobcy/src/claude-code-tutorial/main/interactive/scenes/team.md | head -20`
Expected: File content begins with "# Guide: Team Collaboration"

**Step 3: Commit**

```bash
git add /Users/jacobcy/src/claude-code-tutorial/main/interactive/scenes/team.md
git commit -m "feat: add team scenario guide"
```

---

## Task 5: Create deploy scenario guide

**Files:**
- Create: `interactive/scenes/deploy.md`

**Step 1: Write deploy.md file**

```markdown
# Guide: Pre-Release Checklist and Deployment

## When to use this guide
Use this when preparing to deploy code that was developed with Claude Code assistance.

## Prerequisites
- [ ] Code changes are complete
- [ ] Tests pass locally
- [ ] You have deployment access/permissions

## Steps

### Step 1: Review all Claude-generated changes

Use git to see what changed:
```
git diff main
```

Look for:
- Unexpected file modifications
- Dependencies added
- Configuration changes
- Database schema changes

### Step 2: Validate tests and coverage

Claude should have written tests, but verify:
- All tests pass
- Coverage is acceptable (aim for 80%+)
- Edge cases are covered

### Step 3: Security review

Check for:
- No hardcoded secrets (API keys, passwords)
- Input validation on all endpoints
- No SQL injection vulnerabilities
- XSS prevention where applicable

### Step 4: Manual testing

- Test the full user flow
- Verify error handling works
- Check edge cases
- Test with production-like data if possible

### Step 5: Create deployment documentation

Document:
- What changed
- How to deploy (commands, processes)
- Rollback procedure if issues occur
- What to monitor post-deploy

### Step 6: Deploy with monitoring

- Deploy the changes
- Monitor for errors (logs, metrics)
- Have rollback plan ready
- Verify critical functionality works

## Common Questions

**Q: Can Claude deploy directly to production?**
A: Generally no. Use AGENT_RULES.md to forbid production deployments. Manual deployment with review is safer.

**Q: What if Claude made a security mistake?**
A: Use `/helper:guide team` patterns for code review. Consider adding a security reviewer agent before deployment.

**Q: Should I tell users the code was AI-generated?**
A: Follow your organization's policy. In open source, attribution in commits is common.

**Q: How do I track AI-assisted development for compliance?**
A: Document in PR/commit messages. Some organizations have specific requirements—check yours.

## Related Commands
- `/helper:ask How do I create a rollback plan?`
- `/helper:ask What security checks should I do?`
- `/learn-claude-advanced safety`

## Go Deeper
For production readiness patterns, see: `main/docs/best_practices.md`
```

**Step 2: Verify file created**

Run: `cat /Users/jacobcy/src/claude-code-tutorial/main/interactive/scenes/deploy.md | head -20`
Expected: File content begins with "# Guide: Pre-Release Checklist and Deployment"

**Step 3: Commit**

```bash
git add /Users/jacobcy/src/claude-code-tutorial/main/interactive/scenes/deploy.md
git commit -m "feat: add deploy scenario guide"
```

---

## Task 6: Create parallel scenario guide

**Files:**
- Create: `interactive/scenes/parallel.md`

**Step 1: Write parallel.md file**

```markdown
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
```

**Step 2: Verify file created**

Run: `cat /Users/jacobcy/src/claude-code-tutorial/main/interactive/scenes/parallel.md | head -20`
Expected: File content begins with "# Guide: Parallel Development with Worktrees"

**Step 3: Commit**

```bash
git add /Users/jacobcy/src/claude-code-tutorial/main/interactive/scenes/parallel.md
git commit -m "feat: add parallel scenario guide"
```

---

## Task 7: Create knowledge base directory

**Files:**
- Create: `interactive/knowledge/` (directory)

**Step 1: Create the knowledge directory**

Run: `mkdir -p /Users/jacobcy/src/claude-code-tutorial/main/interactive/knowledge`

**Step 2: Verify directory created**

Run: `ls -la /Users/jacobcy/src/claude-code-tutorial/main/interactive/knowledge`
Expected: Directory exists (empty)

**Step 3: Commit**

```bash
git add /Users/jacobcy/src/claude-code-tutorial/main/interactive/knowledge
git commit -m "feat: add knowledge directory structure"
```

---

## Task 8: Create knowledge base content

**Files:**
- Create: `interactive/knowledge/index.md`

**Step 1: Write knowledge base index.md file**

```markdown
# Claude Code Knowledge Base

This file contains frequently asked questions and answers, organized by tags for quick lookup.

---

## tags: task, task.md, scope, definition

**Q: How do I define the scope of work for an agent?**

Use a `TASK.md` file in your project root. Define:
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
```

**Step 2: Verify file created**

Run: `cat /Users/jacobcy/src/claude-code-tutorial/main/interactive/knowledge/index.md | head -30`
Expected: File content begins with "# Claude Code Knowledge Base"

**Step 3: Commit**

```bash
git add /Users/jacobcy/src/claude-code-tutorial/main/interactive/knowledge/index.md
git commit -m "feat: add knowledge base content"
```

---

## Task 9: Update SKILL.md with helper commands

**Files:**
- Modify: `interactive/SKILL.md`

**Step 1: Read current SKILL.md content**

Run: `cat /Users/jacobcy/src/claude-code-tutorial/main/interactive/SKILL.md`

**Step 2: Modify SKILL.md to add /helper:* commands**

The file should be updated to include a new "Helper Commands" section and updated description.

Complete new content for interactive/SKILL.md:

```markdown
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
```

**Step 3: Verify file updated**

Run: `grep -c "/helper:ask" /Users/jacobcy/src/claude-code-tutorial/main/interactive/SKILL.md`
Expected: Output shows 1 (the command is present)

**Step 4: Commit**

```bash
git add /Users/jacobcy/src/claude-code-tutorial/main/interactive/SKILL.md
git commit -m "feat: add /helper:* commands to SKILL.md"
````

---

## Task 10: Verify implementation

**Files:**
- Verify: All created files exist
- Verify: SKILL.md contains new commands

**Step 1: Verify all scene files exist**

Run: `ls -la /Users/jacobcy/src/claude-code-tutorial/main/interactive/scenes/`
Expected: Shows new-project.md, debug.md, team.md, deploy.md, parallel.md

**Step 2: Verify knowledge base exists**

Run: `ls -la /Users/jacobcy/src/claude-code-tutorial/main/interactive/knowledge/`
Expected: Shows index.md

**Step 3: Verify SKILL.md commands**

Run: `grep "/helper:" /Users/jacobcy/src/claude-code-tutorial/main/interactive/SKILL.md | head -10`
Expected: Shows /helper:ask, /helper:search, /helper:guide, etc.

**Step 4: Final commit**

```bash
git add -A
git commit -m "feat: complete Claude Code Helper implementation"
```

---

## Next Steps After Implementation

1. **Test the commands** — Try `/helper:help` in a Claude Code session
2. **Verify scenario guides** — Run `/helper:guide new-project` to see the guide
3. **Test knowledge base** — Ask `/helper:ask How do I write a TASK.md?`
4. **Update README.md** — Document the new /helper:* commands in the project README
