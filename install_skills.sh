#!/bin/bash
# Installation script for Claude Code Tutorial Skills

echo "Installing Claude Code Tutorial Skills..."
echo ""

SKILL_DIR="$HOME/.claude/skills"
TUTORIAL_SKILL_DIR="$SKILL_DIR/claude-code-tutorial"

# Create directories if they don't exist
mkdir -p "$TUTORIAL_SKILL_DIR"

# Copy skill files to the Claude skills directory
cp skills/*.yaml "$TUTORIAL_SKILL_DIR/"

# Copy scripts to the Claude skills directory
mkdir -p "$TUTORIAL_SKILL_DIR/scripts"
cp scripts/*.sh "$TUTORIAL_SKILL_DIR/scripts/"

echo "Skills installed successfully!"
echo ""
echo "Available commands:"
echo "  /learn-claude-code          - Main interactive tutorial"
echo "  /learn-claude-advanced      - Advanced topics"
echo "  /learn-claude-code start    - Beginner tutorial"
echo "  /learn-claude-code worktrees - Worktrees tutorial"
echo "  /learn-claude-code safety   - Safety practices"
echo ""
echo "To use these skills, simply type any of the above commands in Claude."
echo ""