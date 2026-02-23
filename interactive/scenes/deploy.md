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
