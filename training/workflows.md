# Claude Code Workflows & Best Practices

## Real-World Workflows

### 1. Code Review and Analysis

**Interactive Code Review**
```bash
claude -c
# In conversation, ask Claude to review your code
```

**Automated Code Quality Check**
```bash
claude -p --permission-mode plan "Analyze this codebase for code quality issues" --add-dir ./src
```

**Best Practice**: Use `--permission-mode plan` when you want Claude to suggest edits safely.

---

### 2. Documentation Generation

**Generate README**
```bash
claude -p "Generate a comprehensive README for a Node.js REST API project with these features: user auth, CRUD operations, error handling"
```

**Document Existing Code**
```bash
claude -p "Create JSDoc comments for this code" --model sonnet
```

**API Documentation**
```bash
claude -p --json-schema '{"type":"object"}' "Extract API endpoints from this code as JSON"
```

---

### 3. Code Generation and Refactoring

**Generate Code**
```bash
claude -p "Write a Python class for managing a queue with push, pop, and peek methods"
```

**Refactor Existing Code**
```bash
claude -c
# Ask Claude to refactor for readability, performance, etc.
```

**Migrate Codebase**
```bash
claude --permission-mode plan "Migrate this JavaScript to TypeScript with proper types"
```

---

### 4. Bug Debugging and Fixes

**Interactive Debugging Session**
```bash
claude -c
# Describe the bug, share error messages, discuss solutions interactively
```

**Automated Bug Analysis**
```bash
claude -p "Debug this error: [error message and code]"
```

**Systematic Debugging**
```bash
# Start a long-running session
claude
# Ask questions to narrow down the issue
# Request specific tests or logging
# Iterate on solutions
```

---

### 5. Learning and Research

**Learn a Technology**
```bash
claude
# Ask about React patterns, async/await in Node.js, etc.
# Continue the conversation for deeper understanding
```

**Research Documentation**
```bash
claude -p "Explain the differences between async/await and promises in JavaScript"
```

**Solve Algorithm Challenges**
```bash
claude
# Get step-by-step help with algorithm problems
# Ask for explanations and different approaches
```

---

### 6. Scripting and Automation

**Generate Shell Scripts**
```bash
claude -p "Create a bash script that backs up all .txt files in a directory to a dated archive"
```

**Create Build Pipelines**
```bash
claude -p "Generate a GitHub Actions workflow for testing and deploying a Node.js app"
```

**Automate Repetitive Tasks**
```bash
#!/bin/bash
# Use Claude in scripts
result=$(claude -p "Process this data: $1" --model sonnet)
echo "Result: $result"
```

---

### 7. Testing and Quality Assurance

**Generate Tests**
```bash
claude -p "Write comprehensive Jest tests for this calculator function"
```

**Test Plan Creation**
```bash
claude -p "Create a test plan for an e-commerce checkout feature"
```

**Performance Analysis**
```bash
claude -p "Analyze this code for performance bottlenecks"
```

---

### 8. Project Setup and Scaffolding

**Generate Project Structure**
```bash
claude -p "Create a well-organized project structure for a Vue.js e-commerce application"
```

**Initialize New Projects**
```bash
claude -p "Generate package.json and basic file structure for a TypeScript backend service"
```

---

## Advanced Workflows

### Custom Agents for Specialized Tasks

Define agents for specific roles:

```bash
claude --agents '
{
  "architect": {
    "description": "System architecture expert",
    "prompt": "You are an expert in software architecture. Analyze designs from first principles."
  },
  "security_expert": {
    "description": "Security specialist",
    "prompt": "You are a cybersecurity expert. Review code for vulnerabilities."
  }
}
' --agent architect "design a caching layer for our application"
```

### Session Management for Long Projects

```bash
# Start project work
claude --session-id $(uuidgen)

# Continue the next day
claude -r last-session-id

# Fork to explore alternative approaches
claude -r session-id --fork-session
```

### Structured Output Processing

```bash
# Generate structured JSON
claude -p --output-format json "Extract all functions from this code" | jq '.functions[] | .name'

# Stream results for real-time processing
claude -p --output-format stream-json "Analyze this data point by point" | while read line; do
  echo "Processing: $line"
done
```

### Git-Integrated Development

```bash
# Work in isolated branch
claude --worktree feature-new-auth

# Implement feature with Claude's help
claude -c

# When done, merge back to main
git checkout main && git merge feature-new-auth
```

### Multi-Model Strategy

**Fast iteration with Haiku, detailed analysis with Sonnet/Opus:**

```bash
# Quick drafts
claude -p "Write basic structure" --model haiku

# Detailed implementation
claude -p "Expand with full implementation" --model sonnet

# Complex problem-solving
claude "This is tricky, help me think through it" --model opus
```

---

## Best Practices

### 1. Permission Modes
- **plan**: Safe mode, Claude suggests changes without executing
- **acceptEdits**: Auto-accept edits (use with trusted prompts)
- **default**: Interactive approval for each action
- **dontAsk**: Trust all operations (use in sandboxes)

### 2. Prompt Engineering
- **Be specific**: "Generate a React component for..." vs "make a component"
- **Provide context**: Share relevant code snippets and requirements
- **Ask for formats**: Specify JSON, markdown, code format preferences
- **Iterate**: Use interactive sessions for refinement

### 3. Session Management
- **Name sessions**: Use meaningful session IDs for tracking
- **Fork for exploration**: Try alternatives without losing original work
- **Clean up**: Remove completed sessions to avoid clutter
- **Resume strategically**: Continue complex tasks across time

### 4. Tool Integration
- **MCP servers**: Extend capabilities with custom tools
- **Custom agents**: Define specialists for different domains
- **IDE integration**: Use IDE features for editing and navigation
- **Workstations**: Leverage tmux for complex development sessions

### 5. Performance & Cost
- **Model selection**: Use haiku for simple tasks, opus for complex
- **Budget control**: Set `--max-budget-usd` for cost limits
- **Batch processing**: Group related tasks in single session
- **Print mode**: Use for scripting to avoid interactive overhead

### 6. Security
- **Permission modes**: Match mode to trust level
- **Tool restrictions**: Use `--allowedTools` and `--disallowedTools`
- **Sensitive data**: Be cautious with passwords and API keys
- **Audit**: Enable `--debug` when needed for troubleshooting

---

## Common Command Patterns

### Development Loop
```bash
# Start work
claude --worktree dev-feature

# Interactive development
claude -c

# Commit changes
git add . && git commit -m "Feature implementation"
```

### Documentation Pipeline
```bash
# Generate docs
claude -p "Create API documentation for these endpoints"

# Generate examples
claude -p "Create usage examples for the API documentation"

# Generate guides
claude -p "Create a getting started guide"
```

### Testing Strategy
```bash
# Generate unit tests
claude -p "Write Jest tests for this function"

# Generate integration tests
claude -p "Write integration test scenarios for this API"

# Generate E2E tests
claude -p "Write Cypress E2E tests for user workflows"
```

---

## Troubleshooting Workflows

**Claude isn't helping effectively**
- Provide more context and examples
- Use a more capable model (`--model opus`)
- Ask Claude to ask clarifying questions

**Slow responses**
- Use `--fallback-model` to avoid overloads
- Switch to a faster model for iteration
- Break large tasks into smaller ones

**Permission issues**
- Review `--permission-mode` settings
- Check `--allowedTools` restrictions
- Verify file access with `--add-dir`

**Session problems**
- Check available sessions: `claude -r [search]`
- Use `--fork-session` to isolate issues
- Start fresh if session is corrupted
