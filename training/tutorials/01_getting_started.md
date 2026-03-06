# Tutorial 1: Getting Started with Claude Code

## Objectives
By the end of this tutorial, you will:
- Understand what Claude Code is and how it works
- Launch your first interactive session
- Send a simple prompt to Claude
- Understand basic session management

## What is Claude Code?

Claude Code is a command-line interface (CLI) that connects you to Claude, an AI assistant made by Anthropic. It allows you to:
- Have conversations with an AI right from your terminal
- Analyze and generate code
- Automate repetitive tasks
- Research and learn new concepts
- Process and transform data

Unlike web interfaces, Claude Code integrates directly with your file system and terminal, making it ideal for developers.

## Prerequisites

- Claude Code 2.1.70 installed
- A terminal/command prompt
- Basic familiarity with command-line tools

## Starting Your First Session

### Step 1: Open a Terminal

Open your terminal or command prompt and navigate to any directory:

```bash
cd ~
```

### Step 2: Launch Claude Code

To start an interactive session with Claude, simply type:

```bash
claude
```

You should see a welcome message and a prompt ready for input.

### Step 3: Send Your First Prompt

Type a simple request and press Enter:

```
Tell me what Claude Code is in 2-3 sentences.
```

Claude will respond with an answer. You can continue the conversation by typing more prompts.

### Step 4: Multi-turn Conversation

Claude remembers the context of your conversation. Try:

```
What are the main benefits for developers?
```

Claude will answer based on the previous context.

### Step 5: Exit the Session

To exit the interactive session, type:

```
/exit
```

Or press `Ctrl+D` (on Mac/Linux) or `Ctrl+Z` then `Enter` (on Windows).

## Your First Interactive Session Summary

What you just did:
1. ✅ Launched an interactive Claude Code session
2. ✅ Sent prompts and received responses
3. ✅ Had a multi-turn conversation
4. ✅ Exited gracefully

## Understanding Session Modes

Claude Code has two main modes:

### Interactive Mode (Default)
```bash
claude
```
- Multi-turn conversation
- Good for exploration and learning
- Sessions can be resumed later
- Most intuitive for beginners

### Print Mode (Non-Interactive)
```bash
claude -p "Your prompt"
```
- Single interaction
- Output printed to terminal
- Good for scripting and automation
- Useful for piping into other commands

## Common First Prompts to Try

Here are some good starter prompts:

1. **Learning about a topic**
   ```
   Tell me about Python decorators
   ```

2. **Getting code help**
   ```
   Write a Python function that reverses a string
   ```

3. **Explaining concepts**
   ```
   What's the difference between == and === in JavaScript?
   ```

4. **Writing boilerplate**
   ```
   Create a basic HTML page with Bootstrap
   ```

## Session Persistence

One powerful feature: Claude can resume sessions. When you exit a session normally, Claude saves it. Later, you can resume:

```bash
claude -c
```

This continues your last conversation!

## Next Steps

1. **Practice**: Try 5-10 more interactive sessions with different prompts
2. **Explore print mode**: Try `claude -p "your prompt"` from scripts
3. **Move to Tutorial 2**: Learn about the most important commands

## Key Takeaways

- `claude` starts an interactive session
- `claude -p "prompt"` uses print mode for non-interactive use
- Sessions are saved and can be resumed with `-c`
- Use `/exit` to quit gracefully
- You can have multi-turn conversations

## Troubleshooting

**Q: Claude isn't responding**
- Check your internet connection
- Verify Claude Code is properly installed

**Q: How do I see previous sessions?**
- Use `claude -r` to see a list of sessions

**Q: Can I clear the conversation history?**
- Exit and start a new session with `-c` to skip resuming

## Further Learning

- Check **commands.md** for all available options
- Read **workflows.md** for real-world patterns
- Try **lab1_cli_exploration.md** for hands-on practice
