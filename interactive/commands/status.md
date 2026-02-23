---
name: status
description: Use when showing learning progress and explored scenarios
---

# Claude Code Helper Status

Show your learning progress and explored scenarios.

## Usage

```
/helper status
```

## Information Displayed

- Which scenarios you've explored
- Recent questions you've asked
- Learning progress tracking
- Skills you've developed

## Progress File

Progress is stored in `~/.claude/helper-progress.json`:

```json
{
  "scenarios": {
    "new-project": { "completed": false, "lastAccessed": null },
    "debug": { "completed": false, "lastAccessed": null },
    "team": { "completed": false, "lastAccessed": null },
    "deploy": { "completed": false, "lastAccessed": null },
    "parallel": { "completed": false, "lastAccessed": null }
  },
  "questions": [],
  "createdSkills": []
}
```

## How to Track Progress

Each time you complete a guide or ask a question, your progress is saved automatically.

## Commands to Get Started

- `/helper guide new-project` — Start your first learning scenario
- `/helper help` — See all available commands
- `/helper ask <question>` — Ask any question
