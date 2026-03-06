# Lab 1: CLI Exploration

## Overview
This hands-on lab helps you explore Claude Code's CLI features and become familiar with different modes and options.

**Time:** 30-45 minutes
**Difficulty:** Beginner
**Prerequisites:** Claude Code installed

## Part 1: Basic Command Exploration (10 minutes)

### Exercise 1.1: Help and Version
```bash
# 1. Check your Claude version
claude --version

# 2. View the full help
claude --help

# 3. List available commands
claude help
```

**Questions to answer:**
- What version of Claude Code are you running?
- How many command options are available?
- What command let's you manage authentication?

### Exercise 1.2: First Interactive Session
```bash
# 1. Start an interactive session
claude

# 2. Try these prompts in order:
# Prompt 1: "What is Claude Code used for?"
# Prompt 2: "Can it analyze code?"
# Prompt 3: "What are the main benefits?"

# 4. Exit with /exit
```

**Observations:**
- How did Claude remember context between prompts?
- Can you refer back to previous responses in later prompts?

## Part 2: Print Mode vs Interactive (10 minutes)

### Exercise 2.1: Compare Modes

```bash
# Interactive mode (exits after response)
claude "What is machine learning?"

# Print mode (output only)
claude -p "What is machine learning?"
```

**Compare the outputs:**
- How are they different?
- When would you use each mode?

### Exercise 2.2: Print Mode in Scripts

```bash
# Save output to a file
claude -p "Write a Python function that counts words in a string" > word_counter.py

# View what was generated
cat word_counter.py
```

**Task:**
- Generate 3 different code snippets using print mode
- Save each to a different file

## Part 3: Model Selection (10 minutes)

### Exercise 3.1: Model Comparison

Run the same prompt with different models and compare:

```bash
# Fast model
echo "=== Haiku (Fast) ==="
claude -p --model haiku "Explain recursion in 2 sentences"

# Balanced model
echo -e "\n=== Sonnet (Balanced) ==="
claude -p --model sonnet "Explain recursion in 2 sentences"

# Most capable model
echo -e "\n=== Opus (Most Capable) ==="
claude -p --model opus "Explain recursion in 2 sentences"
```

**Analysis:**
- Which model gave the quickest response?
- Which gave the most detailed answer?
- Which would you use for quick questions?
- Which for complex problems?

### Exercise 3.2: Speed Test

```bash
# Time each model
time claude -p --model haiku "Write a hello world in 5 languages"
time claude -p --model sonnet "Write a hello world in 5 languages"
```

## Part 4: Session Management (10 minutes)

### Exercise 4.1: Session Persistence

```bash
# Start a session
claude

# Ask: "What is my name?"
# Claude will say it doesn't know

# Ask follow-up: "My name is [Your Name]"
# Ask: "What is my name now?"

# Exit with /exit
```

### Exercise 4.2: Resume Session

```bash
# Resume the last session
claude -c

# Ask: "What did I tell you my name was?"
# Claude should remember from the previous session!

# Exit
```

### Exercise 4.3: Multiple Sessions

```bash
# See recent sessions
claude -r

# Choose one to resume
# Or type 'q' to cancel
```

## Part 5: Permission Modes (10 minutes)

### Exercise 5.1: Different Permission Modes

```bash
# Default mode (asks for permissions)
claude --permission-mode default "Show me how to improve this code" << 'EOF'
function add(a, b) {
  return a + b;
}
EOF

# Plan mode (suggests changes, you approve)
claude --permission-mode plan "Format and improve this code" << 'EOF'
const x=1
const y=2
const z=x+y
EOF

# (Don't use bypassPermissions outside sandboxes!)
```

**Observations:**
- How do the modes differ?
- When would you use each?

## Challenges

### Challenge 1: Find a Command
Find the command that:
- Creates a new git worktree
- Loads MCP servers
- Sets up authentication

### Challenge 2: Feature Discovery
Use `claude --help` to answer:
- How can you limit API spending?
- How can you use Claude in your IDE?
- What's the difference between -r and -c?

### Challenge 3: Script Exploration
Create a script that:
```bash
#!/bin/bash
# 1. Gets a prompt from the user
# 2. Sends it to Claude with --model haiku
# 3. Saves the response to output.txt
```

## Reflection Questions

1. **Modes**: When would you use print mode vs interactive mode?
2. **Models**: What's the trade-off between haiku and opus?
3. **Sessions**: How do sessions help maintain context?
4. **Permissions**: Why do permission modes matter?

## Summary

In this lab, you:
- ✅ Explored Claude Code CLI options
- ✅ Practiced interactive and print modes
- ✅ Tested different AI models
- ✅ Learned about session management
- ✅ Understood permission modes

## Next Steps

- Complete Lab 2: Prompt Engineering
- Try writing your first automated script
- Explore permission modes more deeply
