# Tutorial 3: Analyzing Repositories

## Objectives
By the end of this tutorial, you will:
- Analyze code repositories with Claude
- Generate documentation from code
- Identify code patterns and issues
- Ask meaningful questions about codebases

## Why Analyze Repositories?

Common tasks:
- Understanding unfamiliar codebases
- Generating documentation
- Finding bugs and security issues
- Refactoring or optimizing code
- Onboarding new developers

## Starting Repository Analysis

### Step 1: Navigate to a Repository

```bash
cd /path/to/your/project
```

### Step 2: Ask Claude About the Project

**Basic overview**:
```bash
claude -p "What does this project do? Analyze the structure and main files."
```

**Specific analysis**:
```bash
claude -p "List all the main components in this project and their responsibilities"
```

**Find the architecture**:
```bash
claude -p "Describe the architecture of this project in one paragraph"
```

## Practical Examples

### Example 1: Understand a New Repository

```bash
cd ~/projects/new-project
claude
```

Type:
```
I'm new to this project. Walk me through the structure and help me understand what it does.
```

Claude will analyze the directory and files, explaining the purpose and structure.

### Example 2: Generate Documentation

```bash
claude -p "Generate comprehensive documentation for the API endpoints in this project"
```

Claude will:
- Find API files
- Extract endpoints
- Document parameters and responses
- Create usage examples

### Example 3: Code Quality Analysis

```bash
claude -p --permission-mode plan "Review this code for:
- Security vulnerabilities
- Performance issues
- Code style inconsistencies
- Potential bugs"
```

Claude suggests fixes you can review.

### Example 4: Find Best Practices Violations

```bash
claude -p "Identify any violations of best practices in this TypeScript project"
```

## Advanced Analysis Patterns

### Pattern 1: Dependency Analysis
```bash
claude -p "What are the major external dependencies in this project and why are they used?"
```

### Pattern 2: Data Flow Understanding
```bash
claude -p "Trace the data flow through this application from user input to database"
```

### Pattern 3: Migration Planning
```bash
claude -p "Create a plan to upgrade this Express.js v4 app to Express v5 with breaking changes"
```

### Pattern 4: Performance Profiling
```bash
claude -p "Analyze this code for performance bottlenecks and suggest optimizations"
```

### Pattern 5: Test Coverage
```bash
claude -p "What are the critical paths in this application that should have test coverage?"
```

## Working with Large Repositories

For very large projects, be specific:

```bash
# Focus on specific area
claude -p --add-dir ./src/components "Analyze the React component architecture"

# Focus on specific file patterns
claude -p "Summarize all API routes in this backend project"

# Multiple directories
claude -p --add-dir ./src --add-dir ./tests "How are tests organized relative to source files?"
```

## Asking Good Questions

### Good Questions
- "What is the purpose of each module?"
- "How do these components interact?"
- "What are the data models?"
- "What edge cases might not be handled?"
- "How would I add a new feature?"

### Vague Questions (to avoid)
- "Tell me about this code" (too broad)
- "Is this good?" (too subjective)
- "Fix everything" (too vague)
- "What's wrong?" (too open-ended)

## Collaborative Analysis Session

Start an interactive session for deeper analysis:

```bash
claude
```

Then ask progressively detailed questions:

1. "What is this project?"
2. "What are the main modules?"
3. "How does module X work in detail?"
4. "What are potential improvements?"
5. "Help me write a test for this functionality"

## Generating Documentation

### API Documentation
```bash
claude -p "Generate OpenAPI/Swagger documentation for all REST endpoints"
```

### README
```bash
claude -p "Generate a comprehensive README for this project including installation, usage, and contribution guidelines"
```

### Architecture Diagram
```bash
claude -p "Create ASCII art or textual description of the system architecture"
```

### Contributing Guide
```bash
claude -p "Create a CONTRIBUTING.md with development setup and pull request guidelines"
```

## Practical Exercise: Analyze a Real Project

### Steps:

1. **Navigate to a project**:
   ```bash
   cd ~/projects/your-project
   ```

2. **Get overview**:
   ```bash
   claude -p "What is this project and what problem does it solve?"
   ```

3. **Understand structure**:
   ```bash
   claude -p "Describe the directory structure and what each part does"
   ```

4. **Identify issues**:
   ```bash
   claude -p "What are potential improvements or issues in this code?"
   ```

5. **Generate docs**:
   ```bash
   claude -p "Generate API documentation for this project"
   ```

6. **Plan refactoring**:
   ```bash
   claude -p "Create a refactoring plan to improve code quality"
   ```

## Tips for Repository Analysis

1. **Be in the project directory**: Claude can see the files better
2. **Ask specific questions**: Better results than generic asks
3. **Use interactive sessions**: For back-and-forth discussion
4. **Provide context**: Share error messages, requirements, constraints
5. **Request specific formats**: JSON, Markdown, diagrams, etc.
6. **Review suggestions**: Don't blindly apply all recommendations

## Common Analysis Tasks

| Task | Command |
|------|---------|
| Quick overview | `claude -p "What does this project do?"` |
| Architecture | `claude -p "Describe the architecture"` |
| Generate docs | `claude -p "Generate documentation"` |
| Find bugs | `claude -p "Find potential bugs"` |
| Security audit | `claude -p "Security analysis"` |
| Test ideas | `claude -p "What should we test?"` |
| Refactor plan | `claude -p "How should we refactor?"` |
| Dependency analysis | `claude -p "Analyze dependencies"` |

## Next Steps

1. **Practice**: Analyze 3 different repositories
2. **Document**: Generate documentation for a project
3. **Improve**: Use feedback to improve code
4. **Share**: Show results to your team
5. **Continue**: Move to Tutorial 4 for automation

## Key Takeaways

- Use Claude to understand new codebases quickly
- Generate accurate documentation automatically
- Identify issues and improvement opportunities
- Ask specific, focused questions
- Use interactive sessions for detailed exploration
- Leverage Claude to onboard new developers faster
