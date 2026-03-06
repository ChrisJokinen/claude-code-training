# Tutorial 4: Automation Workflows

## Objectives
By the end of this tutorial, you will:
- Create automation scripts using Claude
- Integrate Claude into shell scripts
- Automate code generation
- Build CI/CD pipeline helpers
- Create development workflow scripts

## Why Automate with Claude?

Instead of manual work:
- Generate repetitive code
- Transform data formats
- Analyze logs and reports
- Create deployments
- Generate documentation
- Refactor code automatically

## Bash Script Integration

Claude's `-p` (print) mode is perfect for scripts.

### Basic Script Template

```bash
#!/bin/bash

# Simple Claude automation
result=$(claude -p "Describe what to do with: $1")
echo "Result: $result"
```

### Example 1: Code Generator Script

```bash
#!/bin/bash
# generate_component.sh - Generate a React component

component_name=$1
component_description=$2

if [ -z "$component_name" ]; then
  echo "Usage: $0 <component-name> <description>"
  exit 1
fi

claude -p "Generate a React component named '$component_name' that is $component_description" > "$component_name.jsx"
echo "Generated $component_name.jsx"
```

Usage:
```bash
./generate_component.sh Button "A reusable button component with click handling"
```

### Example 2: Documentation Generator

```bash
#!/bin/bash
# gen-docs.sh - Generate documentation from code

project_dir=${1:-.}

cd "$project_dir"

echo "Generating README..."
claude -p "Generate a comprehensive README" > README.md

echo "Generating API docs..."
claude -p "Generate API documentation" > docs/API.md

echo "Generating contributing guide..."
claude -p "Generate CONTRIBUTING guide" > CONTRIBUTING.md

echo "Documentation generated!"
```

### Example 3: Code Linter/Reviewer

```bash
#!/bin/bash
# code-review.sh - Quick code review

file=$1

if [ ! -f "$file" ]; then
  echo "File not found: $file"
  exit 1
fi

echo "=== Code Review for $file ==="
claude -p "Review this code for:
- Bugs
- Security issues
- Performance problems
- Code style" < "$file"
```

Usage:
```bash
./code-review.sh src/utils.js
```

## Real-World Automation Scenarios

### Scenario 1: Daily Report Generation

```bash
#!/bin/bash
# daily-report.sh - Generate daily development report

echo "Generating daily report..."

claude -p "Generate a daily standup report based on these commits:" $(git log --oneline --since="24 hours ago") > report.txt

echo "Report saved to report.txt"
```

### Scenario 2: Database Migration Generator

```bash
#!/bin/bash
# gen-migration.sh - Generate database migration

migration_description=$1

if [ -z "$migration_description" ]; then
  echo "Usage: $0 '<migration description>'"
  exit 1
fi

timestamp=$(date +%Y%m%d%H%M%S)
filename="migrations/${timestamp}_${migration_description}.sql"

mkdir -p migrations

claude -p "Generate a SQL migration for: $migration_description" > "$filename"

echo "Migration created: $filename"
```

### Scenario 3: Test Generator

```bash
#!/bin/bash
# gen-tests.sh - Generate tests for a function/component

file=$1

if [ ! -f "$file" ]; then
  echo "File not found: $file"
  exit 1
fi

output="${file%.js}.test.js"  # Generate test file name

claude -p "Generate comprehensive tests using Jest for this file:" < "$file" > "$output"

echo "Test file created: $output"
```

### Scenario 4: Dependency Analyzer

```bash
#!/bin/bash
# check-deps.sh - Analyze dependencies for security/updates

echo "Analyzing dependencies for security issues..."

claude -p "Analyze these npm dependencies and suggest updates:

$(cat package.json | grep dependencies -A 50)"
```

### Scenario 5: Changelog Generator

```bash
#!/bin/bash
# gen-changelog.sh - Generate changelog from git history

version=$1

if [ -z "$version" ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

commits=$(git log --oneline v$(git describe --tags --abbrev=0)..HEAD)

claude -p "Generate a professional changelog entry for version $version based on these commits:

$commits" >> CHANGELOG.md

echo "Changelog updated for version $version"
```

## CI/CD Integration

### GitHub Actions Example

```yaml
name: Code Quality

on: [push, pull_request]

jobs:
  analyze:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - name: Analyze code with Claude
        run: |
          # Install Claude CLI
          # Run analysis
          claude -p "Analyze this code for improvements:" < src/main.js > analysis.txt

      - name: Comment on PR
        if: github.event_name == 'pull_request'
        uses: actions/github-script@v6
        with:
          script: |
            const fs = require('fs');
            const analysis = fs.readFileSync('analysis.txt', 'utf8');
            github.rest.issues.createComment({
              issue_number: context.issue.number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              body: '## Code Analysis\n' + analysis
            });
```

## Advanced Automation: Multi-Step Workflows

### Workflow 1: Full Feature Generation

```bash
#!/bin/bash
# generate-feature.sh - Generate complete feature

feature_name=$1
feature_description=$2

echo "Generating feature: $feature_name"

# Generate component
echo "Generating component..."
claude -p "Generate React component for: $feature_description" > "src/components/$feature_name.jsx"

# Generate tests
echo "Generating tests..."
claude -p "Generate Jest tests for the above component" > "src/components/$feature_name.test.jsx"

# Generate documentation
echo "Generating docs..."
claude -p "Generate documentation for: $feature_description" > "docs/$feature_name.md"

echo "Feature generated!"
git add .
git commit -m "feat: auto-generated feature $feature_name"
```

### Workflow 2: Project Setup Automation

```bash
#!/bin/bash
# setup-project.sh - Automated project setup

project_name=$1

mkdir -p "$project_name"
cd "$project_name"

# Generate package.json
echo "Setting up project structure..."
claude -p "Generate a package.json for a Node.js REST API with Express, PostgreSQL, and testing" > package.json

# Generate .gitignore
claude -p "Generate a .gitignore for a Node.js project" > .gitignore

# Generate README
claude -p "Generate a professional README" > README.md

# Generate initial project structure description
echo "Creating directory structure..."
mkdir -p src/{routes,models,middleware,config}
mkdir -p tests
mkdir -p docs

echo "Project '$project_name' initialized!"
```

## Data Processing with Claude

### Process Logs

```bash
#!/bin/bash
# analyze-logs.sh - Analyze error logs

logfile=$1

claude -p "Analyze these logs and identify issues:" < "$logfile"
```

### Transform Data

```bash
#!/bin/bash
# transform-data.sh - Transform CSV to JSON

csv_file=$1

claude -p "Convert this CSV to valid JSON format:" < "$csv_file" > "${csv_file%.csv}.json"
```

### Generate Reports

```bash
#!/bin/bash
# gen-report.sh - Generate report from data

data_file=$1
report_type=${2:-summary}

claude -p "Generate a $report_type report from this data:" < "$data_file"
```

## Error Handling in Scripts

```bash
#!/bin/bash
# robust-automation.sh - With error handling

set -e  # Exit on error

file=$1

if [ ! -f "$file" ]; then
  echo "Error: File not found: $file" >&2
  exit 1
fi

# Run Claude with error handling
if ! result=$(claude -p "Analyze this code:" < "$file" 2>&1); then
  echo "Error: Claude analysis failed" >&2
  exit 1
fi

echo "Analysis:"
echo "$result"
```

## Best Practices for Automation

1. **Use `-p` mode**: For non-interactive automation
2. **Specify the model**: `--model haiku` for speed, `--model sonnet` for quality
3. **Provide clear input**: Claude needs context to produce good results
4. **Validate output**: Check the results before using them
5. **Handle errors**: Add error checking to scripts
6. **Version control**: Track generated files appropriately
7. **Document workflows**: Explain what your automation does

## Performance Tips

```bash
# Use haiku for simple, fast tasks
claude -p --model haiku "Quick analysis:" < file.txt

# Use sonnet for more complex work
claude -p --model sonnet "Complex analysis:" < file.txt

# Batch operations
for file in *.js; do
  claude -p --model haiku "Review: $file" < "$file"
done
```

## Practice Exercises

### Exercise 1: Create a Component Generator
```bash
# Create a script that generates React components
# Input: component name and description
# Output: .jsx file with basic structure
```

### Exercise 2: Documentation Automation
```bash
# Create a script that generates documentation for all functions
# Input: source file
# Output: markdown documentation
```

### Exercise 3: Code Quality Pipeline
```bash
# Create a script that:
# 1. Analyzes code quality
# 2. Suggests refactoring
# 3. Generates test stubs
```

## Integration Examples

### With Git Hooks

```bash
# .git/hooks/pre-commit
#!/bin/bash

staged_files=$(git diff --cached --name-only)

for file in $staged_files; do
  if [[ $file == *.js ]]; then
    claude -p --model haiku "Quick quality check:" < "$file" > /tmp/review.txt
    # Act on review if needed
  fi
done
```

## Next Steps

1. **Create**: Build your first automation script
2. **Test**: Run it on sample data
3. **Refine**: Improve based on results
4. **Share**: Use with your team
5. **Expand**: Build more complex workflows

## Key Takeaways

- Use `-p` mode for scripting and automation
- Claude can generate, transform, and analyze data
- Automate repetitive development tasks
- Integrate with bash scripts and CI/CD
- Match model choice to task complexity
- Always validate output before using in production
- Error handling is essential for reliable automation
