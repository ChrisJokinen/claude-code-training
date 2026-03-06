# Claude Code Commands Cheatsheet

## Quick Reference

### Starting Sessions
```bash
claude                          # Interactive session
claude "your prompt"            # Interactive with initial prompt
claude -p "prompt"              # Print mode (non-interactive)
claude -c                       # Continue last session
claude -r                       # Pick session to resume
claude -r session-id            # Resume specific session
```

### Model Selection
```bash
claude -p "prompt" --model haiku      # Fast model
claude -p "prompt" --model sonnet     # Balanced (default)
claude -p "prompt" --model opus       # Most capable
```

### Permission Modes
```bash
claude --permission-mode default          # Ask for each permission
claude --permission-mode plan             # Suggest changes (you approve)
claude --permission-mode acceptEdits      # Auto-accept edits
claude --permission-mode dontAsk          # Full automation
```

### System Instructions
```bash
claude --system-prompt "You are a Python expert" "help me"
claude --append-system-prompt "Always use types" "code"
```

### Output Control
```bash
claude -p --output-format text      # Plain text (default)
claude -p --output-format json      # JSON output
claude -p --output-format stream-json  # Real-time streaming
```

### Directory & File Access
```bash
claude --add-dir /path/to/dir "analyze"
claude --file file_id:path.txt "process"
```

### Git Integration
```bash
claude --worktree feature-name              # Create worktree
claude --worktree feature-name --tmux       # With tmux
claude --from-pr 123                        # Resume from PR
```

### Advanced Options
```bash
claude --json-schema '{...}' "prompt"       # Validate output
claude --max-budget-usd 10 "work"           # Spending limit
claude --session-id $(uuidgen) "work"       # Named session
claude --fork-session "explore"             # Fork session
claude --debug "help"                       # Debug logging
```

### System Commands
```bash
claude --version                    # Show version
claude --help                       # Show help
claude agents                       # List agents
claude auth                         # Manage auth
claude mcp                          # Manage MCP servers
claude plugin                       # Manage plugins
claude update                       # Check updates
```

## Command Patterns

### Print Mode Scripting
```bash
# Simple
claude -p "prompt"

# With model
claude -p --model haiku "quick task"

# With JSON output
claude -p --output-format json "extract"

# Pipe to file
claude -p "generate code" > output.txt
```

### Interactive Workflows
```bash
# Start and chat
claude
# Type prompts...
# Use /exit to quit

# Resume and continue
claude -c
# Continue where you left off
```

### Code Generation
```bash
claude -p --permission-mode plan "generate component"
claude -p --model haiku "quick boilerplate"
claude -p --system-prompt "expert" "complex problem"
```

### Code Analysis
```bash
claude -p "analyze this code" < file.js
claude -p "review for security" < app.py
claude --add-dir ./src "architecture review"
```

### Session Management
```bash
# Start named session
claude --session-id project-2024-feature

# Continue work
claude -r project-2024-feature

# Explore alternative
claude -r project-2024-feature --fork-session

# See sessions
claude -r
```

## Common Workflows

### Generate Code
```bash
claude -p "Write a React component that..."
claude -p --model haiku "Quick function..."
```

### Review Code
```bash
claude -p "Review for bugs:" < file.js
claude --permission-mode plan "Refactor this"
```

### Learn Topic
```bash
claude "Teach me about..."
claude -p "Explain recursion"
claude --system-prompt "teacher" "help with..."
```

### Debug Problem
```bash
claude -c
# Describe error, get help, iterate

claude "Help me debug:" << 'EOF'
Error message...
Code snippet...
EOF
```

### Automate Task
```bash
claude -p --model haiku "quick task" > output.txt
for file in *.js; do
  claude -p "review" < "$file"
done
```

## Option Quick Lookup

| Task | Command |
|------|---------|
| Start session | `claude` |
| Quick answer | `claude -p "q"` |
| Continue work | `claude -c` |
| Choose model | `--model opus` |
| Code safety | `--permission-mode plan` |
| Python expert | `--system-prompt "Python expert"` |
| JSON output | `--output-format json` |
| Git branch | `--worktree name` |
| Budget limit | `--max-budget-usd 10` |
| Debugging | `--debug` |

## Keyboard Shortcuts (Interactive Mode)

| Action | Keys |
|--------|------|
| Exit session | Type `/exit` |
| Abort message | `Ctrl+C` |
| Clear screen | `Ctrl+L` |
| Previous command | `↑` Arrow |
| Next command | `↓` Arrow |

## File Locations

```
~/.claude/config.json          # Settings
~/.claude/keybindings.json     # Keyboard bindings
~/.claude/sessions/            # Saved sessions
~/.claude/plugins/             # Plugins
```

## Environment

```bash
CLAUDE_HOME=path               # Custom home directory
HOME                           # User home
SHELL                          # Current shell
EDITOR                         # Default editor
```

## Common Errors & Solutions

```bash
# Command not found
-> Install Claude Code

# Permission denied
-> Check --permission-mode setting

# Claude not responding
-> Check internet connection

# Rate limited
-> Use --fallback-model or wait

# Budget exceeded
-> Use --max-budget-usd to set limit
```

## Pro Tips

1. **Use `-p` for scripts** - Non-interactive, easier to integrate
2. **Match model to task** - haiku fast, opus complex
3. **Use `-c` to continue** - Saves time and context
4. **Specify format** - "as JSON", "as markdown", etc.
5. **Provide context** - More info = better responses
6. **Use system prompts** - Specialize for your domain
7. **Plan mode safer** - Review changes before applying
8. **Worktrees for features** - Isolated, easy cleanup

## Example Scripts

### Generate and Format
```bash
claude -p "Write a function" | prettier --stdin
```

### Process Multiple Files
```bash
for file in *.py; do
  claude -p "Analyze: $file" < "$file"
done
```

### Save to File
```bash
claude -p "Generate docs" > docs.md
```

### Pipe Input
```bash
cat code.js | claude -p "Review this"
```

## Help & Documentation

```bash
claude --help                   # Full help
claude help                     # Commands
claude commands                 # List commands
man claude                      # Manual (if available)
```

## Version Info

```bash
claude --version                # Current version
claude update                   # Check updates
claude doctor                   # Check health
```

## Quick Start

1. `claude --version` - Verify installation
2. `claude` - Start interactive session
3. `claude -p "test"` - Try print mode
4. `claude --help` - Explore options
5. `claude -c` - Continue last session

---

**Version:** 2.1.70 (Claude Code)
**Last Updated:** 2026-03-06
