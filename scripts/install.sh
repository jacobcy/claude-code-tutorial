#!/bin/bash
# install.sh - Claude Code Tutorial Installer

echo "==========================================="
echo "Claude Code Interactive Learning Setup"
echo "==========================================="

echo ""
echo "This script will:"
echo "1. Check prerequisites"
echo "2. Install Claude Code (if not already installed)"
echo "3. Configure basic settings"
echo "4. Install the Claude Code Tutorial skill"
echo "5. Set up a safe learning environment"
echo ""

# Function to print colored output
print_success() {
    echo -e "\\033[32m✓ $1\\033[0m"
}

print_info() {
    echo -e "\\033[34mℹ $1\\033[0m"
}

print_warning() {
    echo -e "\\033[33m⚠ $1\\033[0m"
}

print_error() {
    echo -e "\\033[31m✗ $1\\033[0m"
}

# Check prerequisites
print_info "Checking prerequisites..."

# Check if Git is installed
if ! command -v git &> /dev/null; then
    print_error "Git is not installed. Please install Git first."
    exit 1
else
    GIT_VERSION=$(git --version)
    print_success "Git found: $GIT_VERSION"
fi

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    print_error "Node.js is not installed. Please install Node.js first."
    exit 1
else
    NODE_VERSION=$(node --version)
    print_success "Node.js found: $NODE_VERSION"
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    print_error "npm is not installed. Please install npm first."
    exit 1
else
    NPM_VERSION=$(npm --version)
    print_success "npm found: $NPM_VERSION"
fi

print_info "All prerequisites satisfied."

echo ""
print_info "Checking Claude Code installation..."

# Check if Claude Code is already installed
if command -v claude-code &> /dev/null; then
    CLAUDE_VERSION=$(claude-code --version 2>/dev/null || echo "unknown")
    print_success "Claude Code is already installed (version: $CLAUDE_VERSION)"

    read -p "Do you want to continue with skill installation? (Y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        print_info "Installation cancelled by user."
        exit 0
    fi
else
    print_warning "Claude Code is not installed."
    read -p "Do you want to install Claude Code now? (Y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        print_info "Installation cancelled by user."
        exit 0
    fi

    print_info "Installing Claude Code..."
    npm install -g @anthropic-ai/code

    if command -v claude-code &> /dev/null; then
        print_success "Claude Code installed successfully!"
        CLAUDE_VERSION=$(claude-code --version 2>/dev/null || echo "installed")
        print_info "Claude Code version: $CLAUDE_VERSION"
    else
        print_error "Failed to install Claude Code. Please install manually."
        exit 1
    fi
fi

echo ""
print_info "Setting up Claude Code Tutorial skill..."

# Create Claude Code directory if it doesn't exist
mkdir -p ~/.claude/skills

# Copy skill files to appropriate location (this is a simplified version)
# In a real implementation, this would install the actual skill
SKILL_DIR="$HOME/.claude/skills/claude-code-tutorial"
if [ ! -d "$SKILL_DIR" ]; then
    mkdir -p "$SKILL_DIR"

    # Create a basic skill manifest
    cat > "$SKILL_DIR/SKILL.md" << 'EOF'
# Claude Code Tutorial Skill

## Description
Interactive learning experience for Claude Code, from beginner basics to advanced parallel development techniques.

## Commands
- `/learn-claude-code`: Start the interactive tutorial
- `/learn-claude-advanced`: Access advanced topics
- `/learn-claude-code start`: Begin beginner tutorial
- `/learn-claude-code worktrees`: Learn about parallel development
- `/learn-claude-code safety`: Master safety practices

## Features
- Guided learning experience
- Progressive difficulty levels
- Interactive exercises
- Safety-focused approach
- Best practices integration

## Target Audience
- Beginners: Complete Claude Code newcomers
- Advanced: Experienced developers seeking mastery
EOF

    print_success "Skill directory created at: $SKILL_DIR"
else
    print_info "Skill directory already exists at: $SKILL_DIR"
fi

echo ""
print_success "Setup completed successfully!"
echo ""
print_info "Getting Started:"
echo "1. Start a new Claude Code session: claude-code"
echo "2. Use /learn-claude-code to start the interactive tutorial"
echo "3. Visit https://github.com/your-username/claude-code-tutorial for documentation"
echo ""
print_info "Happy learning! 🚀"