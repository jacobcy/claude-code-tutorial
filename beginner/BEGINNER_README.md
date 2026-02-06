# Claude Code Beginner Setup Script

## For Complete Beginners

This section is designed for developers who are completely new to Claude Code and want a simple, automated setup process.

## Quick Install Script

We provide an automated script that will:
- Install Claude Code
- Configure basic settings
- Install the Claude Code Tutorial skill
- Set up a safe learning environment

### Installation

Run this command to get started:

```bash
curl -fsSL https://raw.githubusercontent.com/your-username/claude-code-tutorial/main/install.sh | bash
```

Or download and inspect the script first:

```bash
# Download the script
curl -fsSL https://raw.githubusercontent.com/your-username/claude-code-tutorial/main/install.sh -o claude-code-install.sh

# Inspect the script (always good practice!)
cat claude-code-install.sh

# Run the script
bash claude-code-install.sh
```

## What the Script Does

The installation script performs the following actions:

1. **Checks Prerequisites**
   - Verifies Git installation
   - Checks Node.js availability
   - Validates system compatibility

2. **Installs Claude Code**
   - Downloads the latest version
   - Sets up the command-line interface
   - Configures basic authentication

3. **Configures Safe Learning Environment**
   - Creates isolated workspace directory
   - Sets up basic configuration files
   - Configures safety settings

4. **Installs Learning Skill**
   - Adds the Claude Code Tutorial skill
   - Sets up pre-configured templates
   - Creates initial learning materials

5. **Verifies Installation**
   - Tests Claude Code functionality
   - Confirms skill installation
   - Provides getting started instructions

## Getting Started After Installation

Once the script completes successfully, you can start your Claude Code journey:

```bash
# Start the interactive learning experience
/learn-claude-code

# Or begin with a simple guided tutorial
/learn-claude-code start
```

## Manual Setup (Alternative)

If you prefer to set up manually, see our detailed setup guide in [BEGINNER_MANUAL_SETUP.md](BEGINNER_MANUAL_SETUP.md).

## Troubleshooting

If you encounter any issues:

1. **Check prerequisites**: Ensure Git and Node.js are installed
2. **Verify permissions**: Make sure you have necessary system permissions
3. **Review logs**: The script outputs detailed logs for debugging
4. **Seek help**: Check our troubleshooting guide or community forums

## Safety First

The installation script is designed with safety as the top priority:
- All operations are contained in isolated directories
- No modifications to existing project files
- Configuration is scoped to the learning environment
- Easy uninstall option available

Continue to our [Interactive Learning Guide](INTERACTIVE_LEARNING.md) to start your Claude Code journey!