# Tutorial 5: Power User Features

## Objectives
By the end of this tutorial, you will:
- Use advanced session management
- Leverage custom agents
- Implement structured output
- Work with worktrees for isolation
- Maximize productivity with advanced features

## Advanced Session Management

### Session Overview

Each Claude conversation is a "session" - a unique ID that maintains context.

### Listing Sessions

```bash
# Interactive session picker
claude -r

# This shows recent sessions with options to select
```

### Session Naming Strategy

Use meaningful patterns for easy identification:

```bash
# Personal project work
claude --session-id $(uuidgen) "Working on payment feature"

# Client work
claude --session-id client-2024-01-15-$(uuidgen) "Client feature request"

# Bug hunting
claude --session-id bug-search-$(uuidgen) "Debugging production issue"
```

### Forking Sessions for Exploration

When you want to explore alternatives without losing your main thread:

```bash
# Original session
claude -r main-session-id

# Fork to try something different
claude -r main-session-id --fork-session

# Your fork is independent, original session unchanged
```

### Long-Running Projects

```bash
# Day 1: Start project
claude --session-id project-2024-feature-xyz "Design the system"

# Day 2: Continue
claude -r project-2024-feature-xyz "Implement the first module"

# Day 3: More work
claude -c  # Or -r with full session ID

# When complete
claude -r project-2024-feature-xyz "Summarize what we built"
```

## Custom Agents

Agents are specialized versions of Claude for specific roles.

### Define Custom Agents

```bash
claude --agents '{
  "architect": {
    "description": "System design expert",
    "prompt": "You are a software architect specializing in scalable systems design"
  },
  "security_expert": {
    "description": "Security specialist",
    "prompt": "You are a cybersecurity expert reviewing code for vulnerabilities"
  },
  "performance_guru": {
    "description": "Performance optimization expert",
    "prompt": "You are a performance optimization specialist"
  }
}' --agent architect "Design a caching layer"
```

### Using Agents in Workflows

```bash
# Code review with security focus
claude --agents '{"security": {"description": "Security reviewer", "prompt": "Review for security issues"}}' --agent security "review this code"

# Architecture discussion
claude --agents '{"architect": {"description": "Architect", "prompt": "Expert in system design"}}' --agent architect "Should we use microservices?"

# Performance optimization
claude --agents '{"perf": {"description": "Performance expert", "prompt": "Optimize for speed"}}' --agent perf "This code is slow"
```

### Agent Best Practices

1. **Clear descriptions**: So you remember what each agent does
2. **Specific prompts**: Don't be vague about the expert role
3. **Consistent naming**: Use predictable agent names
4. **Document your agents**: Keep a reference of your custom agents

### Agent Library

Save your agents in a file:

```json
// ~/.claude/agents.json
{
  "architect": {
    "description": "System architecture expert",
    "prompt": "You are a senior software architect..."
  },
  "code_reviewer": {
    "description": "Code quality expert",
    "prompt": "You are an expert code reviewer..."
  },
  "docs_writer": {
    "description": "Technical writer",
    "prompt": "You are a technical documentation expert..."
  }
}
```

Then reference it in scripts:

```bash
#!/bin/bash
agents=$(cat ~/.claude/agents.json | jq -c .)

claude --agents "$agents" --agent code_reviewer "review this: $1"
```

## Structured Output

### JSON Output Mode

```bash
# Request JSON output
claude -p --json-schema '{"type":"object","properties":{"functions":{"type":"array"}}}' \
  "Extract all functions as JSON:" < file.js
```

### Parsing JSON Output

```bash
#!/bin/bash
# Extract data from JSON response

result=$(claude -p --output-format json "Extract as JSON: $data")

# Parse with jq
functions=$(echo "$result" | jq '.functions[].name')

for func in $functions; do
  echo "Found function: $func"
done
```

### JSON Schema Examples

**Extract objects**:
```bash
claude -p --json-schema '{
  "type":"object",
  "properties":{
    "users":{"type":"array"},
    "count":{"type":"integer"}
  }
}' "Extract user data as JSON"
```

**Validate responses**:
```bash
claude -p --json-schema '{
  "type":"object",
  "properties":{
    "name":{"type":"string"},
    "email":{"type":"string","format":"email"},
    "age":{"type":"integer","minimum":0}
  },
  "required":["name","email"]
}' "Extract contact info"
```

## Git Worktrees for Isolation

### Why Use Worktrees?

- Separate directory for each task
- Different branch per feature
- Isolated context
- Easy cleanup

### Create a Worktree Session

```bash
# Create new worktree for feature
claude --worktree feature-auth

# Inside the worktree session, you can:
# - Make changes
# - Ask Claude for help
# - Commit work
```

### Worktree with Tmux

```bash
# Create worktree and tmux session for complex work
claude --worktree feature-complex --tmux "Build the complex feature"

# In tmux, split windows:
# :split-window -h
# :new-window
# etc.
```

### Worktree Workflow

```bash
# 1. Create worktree
claude --worktree feature-new-auth

# 2. Work on feature (interactive session continues)
# Ask Claude questions, make changes with permission

# 3. When done, review changes
git status

# 4. Commit
git add .
git commit -m "feat: new authentication system"

# 5. Switch back to main
cd ..

# 6. Merge
git merge feature-new-auth

# 7. (Optional) Delete worktree
git worktree remove feature-new-auth
```

## Streaming and Real-Time Output

### Stream JSON Output

```bash
# Get realtime streaming JSON
claude -p --output-format stream-json "Analyze this step by step:" < data.txt | \
  jq '.delta'
```

### Process Stream Events

```bash
#!/bin/bash
# Process streaming output line by line

claude -p --output-format stream-json "Generate 10 ideas:" | while read -r line; do
  event=$(echo "$line" | jq -r '.type // empty')

  case "$event" in
    "content_block_delta")
      text=$(echo "$line" | jq -r '.delta.text // empty')
      echo -n "$text"  # Print in real-time
      ;;
    "message_stop")
      echo ""  # Newline at end
      ;;
  esac
done
```

## Multiple Models in Workflows

### Compare Model Outputs

```bash
#!/bin/bash
# Compare different models

prompt="Design a database schema for an e-commerce platform"

echo "=== Haiku (fast) ==="
claude -p --model haiku "$prompt"

echo -e "\n=== Sonnet (balanced) ==="
claude -p --model sonnet "$prompt"

echo -e "\n=== Opus (most capable) ==="
claude -p --model opus "$prompt"
```

### Smart Model Selection

```bash
#!/bin/bash
# Choose model based on task complexity

complexity=$1  # low, medium, high

case "$complexity" in
  low) model="haiku" ;;
  medium) model="sonnet" ;;
  high) model="opus" ;;
  *) model="sonnet" ;;
esac

claude -p --model "$model" "Task: $2"
```

## Budget Control

### Set Spending Limits

```bash
# Limit to $10 per session
claude --max-budget-usd 10 "Do lots of work"

# Useful for scripts that might run many times
claude -p --max-budget-usd 5 --model opus "expensive task"
```

### Monitor API Usage

In scripts that do lots of work:

```bash
#!/bin/bash
set -e

budget=20
requests=0
max_requests=100

while [ $requests -lt $max_requests ]; do
  if [ $(echo "$budget < 1" | bc -l) -eq 1 ]; then
    echo "Budget exhausted"
    break
  fi

  claude -p --max-budget-usd "$budget" "Process item: $requests"

  ((requests++))
done

echo "Processed $requests items"
```

## IDE Integration

### Enable IDE Connection

```bash
# Automatically connect to IDE
claude --ide

# With specific settings
claude --ide --permission-mode acceptEdits
```

### IDE-Assisted Development

```bash
# Open in IDE with Claude assistance
claude --ide "Implement the user login feature"

# Claude can suggest edits in your editor
# You approve/reject changes
```

## Advanced Tips

### Debugging Complex Issues

```bash
# Enable full debug logging
claude -d "Help me debug this issue"

# Debug to file
claude --debug-file debug.log "Complex problem"

# Then analyze logs
cat debug.log | grep ERROR
```

### Working with Tokens

```bash
# Setup long-lived token for API key users
claude setup-token

# Useful for:
# - Unattended scripts
# - CI/CD pipelines
# - Long-running sessions
```

### Performance Optimization

```bash
# Combine optimization strategies
claude -p \
  --model haiku \
  --no-session-persistence \
  "Quick task" < input.txt > output.txt

# This runs fast without saving context
```

## Power User Checklists

### Session Management
- [ ] Organize sessions with meaningful IDs
- [ ] Use forking to explore alternatives
- [ ] Resume long-running projects
- [ ] Clean up completed sessions

### Custom Agents
- [ ] Create agents for your workflow
- [ ] Document agent purposes
- [ ] Reuse agents across projects
- [ ] Version control agent definitions

### Advanced Workflows
- [ ] Use worktrees for isolation
- [ ] Implement structured output
- [ ] Stream results when needed
- [ ] Monitor budget and performance

## Practice Challenges

### Challenge 1: Multi-Agent Workflow
Create agents for: architect, code reviewer, and tester. Use each to evaluate the same codebase.

### Challenge 2: Session Management
Start a 3-day project simulation:
- Day 1: Design phase (one session)
- Day 2: Implementation (resume and continue)
- Day 3: Testing (fork session for exploration)

### Challenge 3: Structured Data Pipeline
Build a script that:
- Extracts JSON from text
- Validates schema
- Processes results
- Generates report

## Key Takeaways

- Sessions maintain context for long-running work
- Custom agents specialize Claude for specific roles
- Structured output enables integration with tools
- Worktrees provide isolated development environments
- Stream mode enables real-time processing
- Model selection balances speed vs. capability
- Debug and budget controls optimize workflows

## Next Steps

1. **Create your agents**: Define custom agents for your work
2. **Organize sessions**: Start using meaningful session IDs
3. **Build workflows**: Create scripts using advanced features
4. **Experiment**: Try worktrees and streaming
5. **Optimize**: Use budget controls and model selection wisely
