# Claude Code Command Reference (v2.1.70)

## Basic Usage

```
Usage: claude [options] [command] [prompt]
```

Claude Code defaults to an interactive session unless otherwise specified.

## Core Commands

### Interactive & Session Management

| Command | Description |
|---------|-------------|
| `claude` | Start an interactive session |
| `claude "your prompt"` | Send a prompt and start interactive session |
| `claude -p "prompt"` | Print mode: non-interactive output |
| `claude -c` | Continue the most recent conversation |
| `claude -r [session_id]` | Resume a specific session |
| `claude --fork-session` | Create new session ID when resuming |
| `claude --session-id <uuid>` | Use specific session ID |

### System Commands

| Command | Description |
|---------|-------------|
| `claude --version` | Display Claude Code version |
| `claude --help` | Display help information |
| `claude agents` | List configured agents |
| `claude auth` | Manage authentication |
| `claude setup-token` | Create long-lived auth token |
| `claude mcp` | Configure MCP servers |
| `claude plugin` | Manage plugins |
| `claude doctor` | Check auto-updater health |
| `claude update` | Check and install updates |
| `claude install` | Install Claude Code native build |

## Key Options

### Prompting & Model Control

| Option | Description | Example |
|--------|-------------|---------|
| `--system-prompt <prompt>` | Custom system prompt | `--system-prompt "You are a Python expert"` |
| `--append-system-prompt <prompt>` | Append to default system prompt | `--append-system-prompt "Always use type hints"` |
| `--model <model>` | Specify model (alias or full name) | `--model sonnet` or `--model claude-sonnet-4-6` |
| `--fallback-model <model>` | Fallback when primary is overloaded | `--fallback-model opus` |
| `--agents <json>` | Define custom agents | `--agents '{"reviewer": {"description": "Code reviewer"}}'` |
| `--agent <agent>` | Use specific agent | `--agent reviewer` |
| `--effort <level>` | Set effort level | `--effort high` (low, medium, high) |

### I/O & Output

| Option | Description | Example |
|--------|-------------|---------|
| `-p, --print` | Non-interactive output | `claude -p "analyze this code"` |
| `--output-format <format>` | Output format | `--output-format json` (text, json, stream-json) |
| `--input-format <format>` | Input format | `--input-format stream-json` |
| `--include-partial-messages` | Stream partial responses | Works with --print and stream-json |
| `--replay-user-messages` | Re-emit input on stdout | Works with stream-json formats |
| `--json-schema <schema>` | Validate structured output | `--json-schema '{"type":"object"}'` |

### Directory & File Access

| Option | Description | Example |
|--------|-------------|---------|
| `--add-dir <directories>` | Allow access to additional directories | `--add-dir /path/to/dir` |
| `--file <specs>` | Download file resources | `--file file_id:path.txt` |
| `--plugin-dir <paths>` | Load plugins from directories | `--plugin-dir /path/to/plugins` |

### Permissions & Security

| Option | Description | Example |
|--------|-------------|---------|
| `--permission-mode <mode>` | Permission handling mode | `--permission-mode plan` (acceptEdits, bypassPermissions, default, dontAsk, plan) |
| `--dangerously-skip-permissions` | Bypass all permission checks | Use only in sandboxes |
| `--allow-dangerously-skip-permissions` | Enable permission bypass option | |
| `--allowedTools <tools>` | Whitelist tools | `--allowedTools "Bash(git:*) Edit"` |
| `--disallowedTools <tools>` | Blacklist tools | `--disallowedTools "Bash(rm:*)"` |
| `--tools <tools>` | Specify available tools | `--tools "Bash,Edit,Read"` |

### Git & Development

| Option | Description | Example |
|--------|-------------|---------|
| `-w, --worktree [name]` | Create new git worktree | `--worktree feature-branch` |
| `--tmux` | Create tmux session for worktree | Requires --worktree |
| `--from-pr [value]` | Resume session from PR | By PR number or URL |

### Debug & Configuration

| Option | Description | Example |
|---------|-------------|---------|
| `-d, --debug [filter]` | Enable debug mode | `--debug api,hooks` |
| `--debug-file <path>` | Write debug logs to file | `--debug-file debug.log` |
| `--verbose` | Override verbose setting | |
| `--settings <file-or-json>` | Load custom settings | `--settings settings.json` |
| `--setting-sources <sources>` | Load from sources | `--setting-sources user,project,local` |
| `--disable-slash-commands` | Disable all skills | |

### IDE & Platform Integration

| Option | Description | Example |
|--------|-------------|---------|
| `--ide` | Auto-connect to IDE | |
| `--chrome` | Enable Chrome integration | |
| `--no-chrome` | Disable Chrome integration | |

### MCP & Advanced

| Option | Description | Example |
|--------|-------------|---------|
| `--mcp-config <configs>` | Load MCP servers | `--mcp-config servers.json` |
| `--strict-mcp-config` | Only use specified MCP configs | |
| `--betas <betas>` | Include beta headers | API key users only |

### Session & Behavior

| Option | Description | Example |
|--------|-------------|---------|
| `--no-session-persistence` | Disable saving sessions | |
| `--max-budget-usd <amount>` | Limit API spending | `--max-budget-usd 10` |

## Common Patterns

### Print Mode for Scripting
```bash
claude -p "Generate a Python function for factorial" --model sonnet
```

### Resume and Continue
```bash
# Continue last conversation
claude -c

# Resume specific session
claude -r abc12345-def67890-ghi...

# Resume and create fork
claude -r abc12345-def67890-ghi... --fork-session
```

### Custom Agents
```bash
claude --agents '{"reviewer": {"description": "Code review expert", "prompt": "You specialize in code reviews"}}' --agent reviewer "review this code"
```

### Structured Output
```bash
claude -p "Extract user info" --json-schema '{"type":"object","properties":{"name":{"type":"string"}}}' "from this text"
```

### Permission Control
```bash
# Interactive permission mode
claude --permission-mode plan

# Accept all edits
claude --permission-mode acceptEdits

# Skip all checks (sandboxes only)
claude --permission-mode bypassPermissions
```

### Worktree for Isolated Development
```bash
claude --worktree feature-xyz "implement the new feature"
claude --worktree feature-xyz --tmux "work with tmux support"
```

## Environment Variables

Claude Code respects standard CLI environment variables:
- `HOME`: User home directory
- `SHELL`: Current shell
- `PATH`: Command search path
- `EDITOR`: Default editor for configuration

## File Locations

- **User Config**: `~/.claude/config.json`
- **Keybindings**: `~/.claude/keybindings.json`
- **Sessions**: `~/.claude/sessions/` (or project-specific locations)
- **Plugins**: `~/.claude/plugins/` or custom paths

## Tips

- Use `--help` with any command for more information
- Print mode (`-p`) is essential for scripting and integration
- Permission modes help balance security and convenience
- Session persistence allows you to maintain context across days
- MCP servers extend Claude's capabilities significantly
