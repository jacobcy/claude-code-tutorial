#!/bin/bash
# Unified installer for Claude Code Helper Skill

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Target skill directory
SKILL_NAME="claude-code-helper"
SKILL_DIR="$HOME/.claude/skills/$SKILL_NAME"
INTERACTIVE_DIR="$SCRIPT_DIR/interactive"

# Print header
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Claude Code Helper Installer${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Check for dependencies
check_dependencies() {
    echo -e "${BLUE}Checking dependencies...${NC}"

    # Check if Git is installed
    if ! command -v git &> /dev/null; then
        echo -e "${RED}✗ Git is not installed${NC}"
        exit 1
    else
        echo -e "${GREEN}✓ Git found: $(git --version)${NC}"
    fi

    echo ""
}

# Check Claude Code directory
check_claude_config() {
    echo -e "${BLUE}Checking Claude Code directory...${NC}"

    CLAUDE_DIR="$HOME/.claude"

    if [ -d "$CLAUDE_DIR" ]; then
        echo -e "${GREEN}✓ Claude Code config directory found: $CLAUDE_DIR${NC}"
    else
        echo -e "${RED}✗ Claude Code config directory not found: $CLAUDE_DIR${NC}"
        echo -e "${YELLOW}Please ensure Claude Code is installed and has been run at least once${NC}"
        exit 1
    fi

    echo ""
}

# Install skill
install_skill() {
    echo -e "${BLUE}Installing Claude Code Helper Skill...${NC}"
    echo ""

    # Check if interactive directory exists
    if [ ! -d "$INTERACTIVE_DIR" ]; then
        echo -e "${RED}✗ Error: interactive directory not found in $SCRIPT_DIR${NC}"
        exit 1
    fi

    # Remove existing installation
    if [ -L "$SKILL_DIR" ]; then
        echo -e "${YELLOW}Removing existing symlink...${NC}"
        rm "$SKILL_DIR"
    elif [ -d "$SKILL_DIR" ]; then
        echo -e "${YELLOW}Removing existing directory...${NC}"
        rm -rf "$SKILL_DIR"
    fi

    # Create symlink for development mode
    echo -e "${GREEN}Creating symlink for development mode...${NC}"
    ln -sf "$INTERACTIVE_DIR" "$SKILL_DIR"

    # Verify installation
    if [ -L "$SKILL_DIR" ] && [ -f "$SKILL_DIR/SKILL.md" ]; then
        echo ""
        echo -e "${GREEN}✓ Skills installed successfully!${NC}"
        echo ""
        echo "Installation path: $SKILL_DIR"
        echo "Source path: $INTERACTIVE_DIR"
        echo ""
    else
        echo -e "${RED}✗ Installation verification failed${NC}"
        exit 1
    fi
}

# Print usage information
print_usage() {
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}Available Commands:${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo -e "${BLUE}Helper Commands — Immediate Assistance${NC}"
    echo "  /helper:ask <question>     — Ask any Claude Code usage question"
    echo "  /helper:search <keyword>    — Search local docs and external resources"
    echo "  /helper:guide new-project   — Start a new project with Claude Code"
    echo "  /helper:guide debug         — Debug and recover from errors"
    echo "  /helper:guide team          — Team collaboration workflows"
    echo "  /helper:guide deploy        — Pre-release checklist and deployment"
    echo "  /helper:guide parallel      — Parallel development with worktrees"
    echo "  /helper:help                — Show all available commands"
    echo "  /helper:status              — Show explored scenarios and recent Q&A"
    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}Available Guides:${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo "  new-project  — Starting fresh with Claude Code"
    echo "  debug        — Troubleshooting and recovery"
    echo "  team         — Team collaboration patterns"
    echo "  deploy       — Pre-release and deployment"
    echo "  parallel     — Worktree-based parallel development"
    echo ""
    echo -e "${YELLOW}Development mode enabled:${NC}"
    echo "  Changes to files in $INTERACTIVE_DIR will be immediately available."
    echo ""
    echo -e "${BLUE}Getting Started:${NC}"
    echo "  1. Start a new Claude Code session: claude-code"
    echo "  2. Use /helper:guide new-project to start learning"
    echo ""
    echo -e "${GREEN}🎉 Installation complete! Happy learning!${NC}"
}

# Main execution
main() {
    check_dependencies
    check_claude_config
    install_skill
    print_usage
}

main "$@"
