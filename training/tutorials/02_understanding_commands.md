# Tutorial 2: Understanding Commands and Options

## Objectives
By the end of this tutorial, you will:
- Understand the basic command structure
- Learn the most important options
- Know when to use each option
- Practice combining options effectively

## Claude Command Structure

All Claude Code commands follow this pattern:

```
claude [options] [command] [prompt]
```

### Examples

```bash
# Simple prompt
claude "Tell me about Python"

# With options
claude -p "Write a function" --model sonnet

# With system prompt
claude --system-prompt "You are a Python expert" -p "Best practices for async?"

# Resume with options
claude -r session-id --permission-mode plan
```

## The Most Important Options

### 1. `-p` (Print Mode)
**What it does**: Non-interactive output, exits after getting response

**When to use**: Scripting, automation, piping
```bash
claude -p "What is REST API?"
```

**Compare**:
- `claude "prompt"` → Interactive session (can continue talking)
- `claude -p "prompt"` → Gets answer and exits

### 2. `--model` (Choose AI Model)
**What it does**: Select which Claude model to use

**Available options**:
- `haiku` - Fast, good for simple tasks
- `sonnet` - Balanced speed and capability
- `opus` - Most capable, slower
- Full names: `claude-sonnet-4-6`, `claude-opus-4-6`, etc.

**When to use**:
```bash
# Quick answer
claude -p "Fix this typo" --model haiku

# Complex problem
claude "Design a database schema" --model opus

# Default is usually sonnet
```

**Rule of thumb**: Start with haiku, use sonnet for most work, use opus for complex tasks

### 3. `-c` (Continue)
**What it does**: Resume your last conversation

**When to use**: Continuing work from previous session
```bash
claude -c
```

Then just keep typing!

### 4. `-r` (Resume)
**What it does**: Resume a specific session

**When to use**: Return to a previous session
```bash
# See available sessions
claude -r

# Resume specific session
claude -r abc123def456
```

### 5. `--system-prompt` (System Instructions)
**What it does**: Set custom system instructions

**When to use**: Specializing Claude for a task
```bash
claude --system-prompt "You are a JavaScript expert" -p "Explain async/await"
```

### 6. `--permission-mode` (Control Permissions)
**What it does**: Set how strictly to handle permissions

**Options**:
- `default` - Ask for each permission
- `plan` - Claude suggests changes, you approve
- `acceptEdits` - Automatically accept edits
- `bypassPermissions` - Skip all checks (sandboxes only)

**When to use**:
```bash
# Safe mode
claude --permission-mode plan "refactor my code"

# Full trust mode
claude --permission-mode acceptEdits "fix formatting issues"
```

### 7. `--add-dir` (Extra Directory Access)
**What it does**: Allow Claude to access additional directories

**When to use**: Analyzing multiple project directories
```bash
claude --add-dir /path/to/other/project "analyze both codebases"
```

## Option Combinations (Common Patterns)

### Pattern 1: Quick Code Generation
```bash
claude -p --model haiku "Generate boilerplate for React component"
```

### Pattern 2: Safe Code Review
```bash
claude --permission-mode plan "Review this code for security issues"
```

### Pattern 3: Expert Consultation
```bash
claude --system-prompt "You are a DevOps expert" "Help me set up CI/CD"
```

### Pattern 4: Complex Problem-Solving
```bash
claude --model opus "Design a scalable architecture for a social network"
```

### Pattern 5: Production Script
```bash
#!/bin/bash
result=$(claude -p --model sonnet "Summarize: $input")
echo "$result"
```

## Understanding Help

To see all options:
```bash
claude --help
```

To see commands:
```bash
claude help
```

## Practice Exercises

### Exercise 1: Print vs Interactive
```bash
# Try both - notice the difference
claude "What is machine learning?"          # Interactive
claude -p "What is machine learning?"       # Print
```

### Exercise 2: Model Comparison
```bash
# Compare responses from different models
claude -p "Explain quantum computing" --model haiku
claude -p "Explain quantum computing" --model sonnet
claude -p "Explain quantum computing" --model opus
```

### Exercise 3: System Prompts
```bash
# Default behavior
claude -p "What should I learn first?"

# As a Python teacher
claude -p --system-prompt "You are a Python teacher for beginners" "What should I learn first?"

# As a security expert
claude -p --system-prompt "You are a security expert" "What should I learn first?"
```

### Exercise 4: Session Management
```bash
# Start a conversation
claude

# (Ask several questions)
# Exit with /exit

# Later, resume it
claude -c

# Or explicitly resume
claude -r [session-id]
```

## Option Reference Table

| Option | Short | Purpose | Example |
|--------|-------|---------|---------|
| `--print` | `-p` | Non-interactive mode | `-p "prompt"` |
| `--model` | | Choose model | `--model opus` |
| `--continue` | `-c` | Resume last session | `-c` |
| `--resume` | `-r` | Resume specific session | `-r session-id` |
| `--system-prompt` | | Custom instructions | `--system-prompt "..."` |
| `--permission-mode` | | Permission handling | `--permission-mode plan` |
| `--add-dir` | | Extra directory access | `--add-dir /path` |
| `--help` | `-h` | Show help | `-h` |
| `--version` | `-v` | Show version | `-v` |

## Tips for Success

1. **Start simple**: Use `-p` mode to test commands
2. **Choose models wisely**: haiku for quick, opus for complex
3. **Use print mode for automation**: Easier to script and integrate
4. **Understand permission modes**: Helps you work safely
5. **Check help often**: `claude --help` shows all options

## Common Mistakes to Avoid

❌ **Using opus for everything** - It's slower and costs more
❌ **Forgetting to use `-p` in scripts** - Interactive mode hangs
❌ **Ignoring permission modes** - Can lead to unwanted edits
❌ **Not resuming sessions** - You lose context and history

✅ **Do**: Match model to complexity
✅ **Do**: Use `-p` for scripting
✅ **Do**: Set appropriate permissions
✅ **Do**: Resume sessions when continuing work

## Next Steps

1. **Practice**: Run 10 commands with different options
2. **Experiment**: Try different model combinations
3. **Read**: Check out **commands.md** for complete reference
4. **Work**: Move to Tutorial 3 to analyze repositories

## Key Takeaways

- `claude [options] [prompt]` is the basic pattern
- `-p` for non-interactive, default is interactive
- `--model` to choose between haiku/sonnet/opus
- `-c` to continue, `-r` to resume specific sessions
- `--system-prompt` to specialize Claude's behavior
- `--permission-mode` to control safety/automation
