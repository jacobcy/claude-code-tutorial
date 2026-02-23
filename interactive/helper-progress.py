#!/usr/bin/env python3
"""Claude Code Helper - Progress tracking script"""

import json
import os
from datetime import datetime
from pathlib import Path

PROGRESS_FILE = Path.home() / ".claude" / "helper-progress.json"
SCENARIOS = ["new-project", "debug", "team", "deploy", "parallel"]


def load_progress():
    """Load progress from file"""
    if PROGRESS_FILE.exists():
        with open(PROGRESS_FILE, "r") as f:
            return json.load(f)
    return {
        "scenarios": {s: {"completed": False, "lastAccessed": None} for s in SCENARIOS},
        "questions": [],
        "createdSkills": []
    }


def save_progress(progress):
    """Save progress to file"""
    PROGRESS_FILE.parent.mkdir(parents=True, exist_ok=True)
    with open(PROGRESS_FILE, "w") as f:
        json.dump(progress, f, indent=2)


def show_status():
    """Display current status"""
    progress = load_progress()

    print("📊 Claude Code Helper - Learning Progress")
    print("=" * 50)

    # Scenarios
    print("\n📚 Scenarios Explored:")
    for scenario, data in progress["scenarios"].items():
        status = "✅" if data["completed"] else "⬜"
        last = data["lastAccessed"]
        if last:
            date = datetime.fromisoformat(last).strftime("%Y-%m-%d")
            print(f"  {status} {scenario:15s} (last: {date})")
        else:
            print(f"  {status} {scenario:15s}")

    # Questions
    print(f"\n❓ Questions Asked: {len(progress['questions'])}")
    if progress["questions"]:
        recent = progress["questions"][-3:]  # Last 3
        print("  Recent:")
        for q in recent:
            print(f"    • {q}")

    # Skills
    print(f"\n🎯 Skills Created: {len(progress['createdSkills'])}")
    if progress["createdSkills"]:
        for skill in progress["createdSkills"]:
            print(f"    • {skill}")

    print()


def update_scenario(scenario, completed=False):
    """Update scenario access"""
    progress = load_progress()
    if scenario in progress["scenarios"]:
        progress["scenarios"][scenario]["lastAccessed"] = datetime.now().isoformat()
        if completed:
            progress["scenarios"][scenario]["completed"] = True
        save_progress(progress)
        print(f"✅ Updated scenario: {scenario}")


def add_question(question):
    """Add question to history"""
    progress = load_progress()
    progress["questions"].append(question)
    if len(progress["questions"]) > 50:  # Keep last 50
        progress["questions"] = progress["questions"][-50:]
    save_progress(progress)


def add_skill(skill_name):
    """Add created skill"""
    progress = load_progress()
    if skill_name not in progress["createdSkills"]:
        progress["createdSkills"].append(skill_name)
        save_progress(progress)
        print(f"✅ Added skill: {skill_name}")


if __name__ == "__main__":
    import sys

    if len(sys.argv) < 2:
        show_status()
    elif sys.argv[1] == "show":
        show_status()
    elif sys.argv[1] == "scenario" and len(sys.argv) >= 3:
        scenario = sys.argv[2]
        completed = len(sys.argv) >= 4 and sys.argv[3] == "--completed"
        update_scenario(scenario, completed)
    elif sys.argv[1] == "question" and len(sys.argv) >= 3:
        add_question(" ".join(sys.argv[2:]))
    elif sys.argv[1] == "skill" and len(sys.argv) >= 3:
        add_skill(sys.argv[2])
    else:
        print("Usage: helper-progress.py [show|scenario|question|skill]")
