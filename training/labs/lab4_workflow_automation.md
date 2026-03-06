# Lab 4: Workflow Automation

## Overview
Create practical automation scripts using Claude to solve real development problems.

**Time:** 90-120 minutes
**Difficulty:** Intermediate to Advanced
**Prerequisites:** Labs 1-3 completed

## Part 1: Bash Script Basics (20 minutes)

### Exercise 1.1: Your First Claude Script

Create your first automation script:

```bash
#!/bin/bash
# test-script.sh

# Make it executable
chmod +x test-script.sh

# Simple script that uses Claude
result=$(claude -p --model haiku "What is GitHub?")
echo "Response: $result"
```

Run it:
```bash
./test-script.sh
```

### Exercise 1.2: Script with Arguments

Create a script that takes user input:

```bash
#!/bin/bash
# claude-helper.sh

if [ $# -eq 0 ]; then
  echo "Usage: $0 <prompt>"
  exit 1
fi

# Get the prompt from command line
prompt="$1"

# Send to Claude
claude -p "$prompt" --model haiku
```

Use it:
```bash
chmod +x claude-helper.sh
./claude-helper.sh "Explain what Docker is"
./claude-helper.sh "How do I learn Python?"
```

### Exercise 1.3: Error Handling

Create a robust script:

```bash
#!/bin/bash
# robust-helper.sh

set -e  # Exit on error

if [ $# -eq 0 ]; then
  echo "Error: No prompt provided" >&2
  exit 1
fi

# Check if Claude is available
if ! command -v claude &> /dev/null; then
  echo "Error: Claude is not installed" >&2
  exit 1
fi

# Run Claude with error handling
if ! result=$(claude -p "$1" 2>&1); then
  echo "Error: Claude failed" >&2
  echo "$result" >&2
  exit 1
fi

echo "$result"
```

## Part 2: Code Generation Automation (25 minutes)

### Exercise 2.1: Component Generator

```bash
#!/bin/bash
# generate-react-component.sh

component_name=$1
description=$2

if [ -z "$component_name" ] || [ -z "$description" ]; then
  echo "Usage: $0 <component-name> <description>"
  exit 1
fi

echo "Generating React component: $component_name"

# Generate component
claude -p "Generate a React component named '$component_name' that $description. Include TypeScript types." > "${component_name}.tsx"

echo "Generated: ${component_name}.tsx"

# Optionally, generate tests
echo "Generating tests..."
claude -p "Generate Jest tests for the React component created above" > "${component_name}.test.tsx"

echo "Generated: ${component_name}.test.tsx"
```

Use it:
```bash
chmod +x generate-react-component.sh
./generate-react-component.sh Button "renders a clickable button with customizable text"
./generate-react-component.sh UserCard "displays user profile information"
```

### Exercise 2.2: Function Generator

```bash
#!/bin/bash
# generate-function.sh

language=$1
function_description=$2

if [ -z "$language" ] || [ -z "$function_description" ]; then
  echo "Usage: $0 <language> <description>"
  exit 1
fi

# Map language to file extension
case $language in
  python) ext=".py" ;;
  javascript|js) ext=".js" ;;
  typescript|ts) ext=".ts" ;;
  go) ext=".go" ;;
  rust) ext=".rs" ;;
  *) ext=".txt" ;;
esac

filename="generated_function$ext"

echo "Generating $language function: $function_description"

claude -p "Write a well-documented $language function that $function_description. Include:
- Clear function name
- Parameter documentation
- Return value documentation
- Example usage
- Error handling" > "$filename"

echo "Generated: $filename"
cat "$filename"
```

Use it:
```bash
./generate-function.sh python "calculates the factorial of a number"
./generate-function.sh javascript "validates an email address"
```

### Exercise 2.3: Boilerplate Generator

```bash
#!/bin/bash
# generate-boilerplate.sh

project_type=$1
project_name=$2

if [ -z "$project_type" ] || [ -z "$project_name" ]; then
  echo "Usage: $0 <project-type> <project-name>"
  echo "Types: node-api, react-app, python-cli, nextjs-app"
  exit 1
fi

mkdir -p "$project_name"
cd "$project_name"

echo "Generating $project_type boilerplate for $project_name..."

case $project_type in
  node-api)
    claude -p "Generate package.json for a Node.js REST API with Express" > package.json
    claude -p "Generate basic Express server structure" > server.js
    ;;
  react-app)
    claude -p "Generate package.json for a React app with TypeScript and Tailwind" > package.json
    claude -p "Generate App.tsx starter component" > App.tsx
    ;;
  python-cli)
    claude -p "Generate requirements.txt for a Python CLI tool" > requirements.txt
    claude -p "Generate main.py for a CLI application" > main.py
    ;;
esac

echo "Project structure generated in $project_name/"
ls -la
```

Use it:
```bash
./generate-boilerplate.sh node-api my-api
./generate-boilerplate.sh react-app my-app
```

## Part 3: Documentation Automation (20 minutes)

### Exercise 3.1: Code Documentation Generator

```bash
#!/bin/bash
# generate-docs.sh

file=$1

if [ ! -f "$file" ]; then
  echo "Error: File not found: $file"
  exit 1
fi

docfile="${file%.*}_DOCS.md"

echo "Generating documentation for $file..."

claude -p "Generate comprehensive documentation for this code file:

$(cat "$file")

Include:
- File purpose
- Main functions/classes
- Usage examples
- Dependencies
- Configuration" > "$docfile"

echo "Documentation saved to: $docfile"
```

Use it:
```bash
./generate-docs.sh calculator.js
```

### Exercise 3.2: API Documentation Generator

```bash
#!/bin/bash
# gen-api-docs.sh

echo "Generating API documentation..."

claude -p "Generate API documentation in Markdown format for these endpoints:

$(grep -r "app\.\(get\|post\|put\|delete\)" . 2>/dev/null || echo "POST /users - Create user, GET /users - List users, GET /users/:id - Get user")" > API.md

echo "API docs generated: API.md"
```

### Exercise 3.3: README Generator

```bash
#!/bin/bash
# generate-readme.sh

project_name=${1:-.}

echo "Generating README for $project_name..."

claude -p "Generate a professional README.md for a project with:
- Clear project description
- Installation instructions
- Usage examples
- Features list
- Contributing guidelines
- License info

Project structure:
$(find "$project_name" -type f -name '*.json' -o -name '*.py' -o -name '*.js' | head -10)" > "$project_name/README.md"

echo "README generated: $project_name/README.md"
```

## Part 4: Code Transformation Automation (20 minutes)

### Exercise 4.1: Format Converter

```bash
#!/bin/bash
# convert-format.sh

from_format=$1
to_format=$2
file=$3

if [ ! -f "$file" ]; then
  echo "Error: File not found: $file"
  exit 1
fi

echo "Converting $file from $from_format to $to_format..."

claude -p "Convert this $from_format to $to_format format:

$(cat "$file")" > "${file%.*}.${to_format}"

echo "Converted file created: ${file%.*}.${to_format}"
```

Use it:
```bash
./convert-format.sh json yaml config.json  # JSON to YAML
./convert-format.sh yaml json config.yaml  # YAML to JSON
```

### Exercise 4.2: Code Refactorer

```bash
#!/bin/bash
# refactor-code.sh

file=$1
goal=$2

if [ ! -f "$file" ]; then
  echo "Error: File not found: $file"
  exit 1
fi

echo "Refactoring $file for: $goal"

claude -p "Refactor this code for $goal:

$(cat "$file")

Provide:
1. Complete refactored code
2. Explanation of changes
3. Benefits of new approach" > "${file%.* }_refactored.${file##*.}"

echo "Refactored code: ${file%.*}_refactored.${file##*.}"
```

Use it:
```bash
./refactor-code.sh messy.js "readability"
./refactor-code.sh slow.py "performance"
```

### Exercise 4.3: Language Translator

```bash
#!/bin/bash
# translate-code.sh

from_lang=$1
to_lang=$2
file=$3

if [ ! -f "$file" ]; then
  echo "Error: File not found: $file"
  exit 1
fi

echo "Translating $file from $from_lang to $to_lang..."

claude -p "Translate this $from_lang code to $to_lang, maintaining the same functionality:

$(cat "$file")" > "${file%.*}.$to_lang"

echo "Translated code: ${file%.*}.$to_lang"
```

Use it:
```bash
./translate-code.sh javascript python utils.js
```

## Part 5: Testing Automation (20 minutes)

### Exercise 5.1: Test Generator

```bash
#!/bin/bash
# generate-tests.sh

source_file=$1

if [ ! -f "$source_file" ]; then
  echo "Error: File not found: $source_file"
  exit 1
fi

# Determine test framework based on language
case $source_file in
  *.js|*.jsx) framework="Jest" ;;
  *.ts|*.tsx) framework="Jest" ;;
  *.py) framework="pytest" ;;
  *) framework="generic" ;;
esac

test_file="${source_file%.*}.test.${source_file##*.}"

echo "Generating $framework tests for $source_file..."

claude -p "Generate comprehensive $framework tests for:

$(cat "$source_file")

Include:
- Happy path tests
- Edge cases
- Error handling
- Mocking where needed" > "$test_file"

echo "Test file created: $test_file"
```

Use it:
```bash
./generate-tests.sh calculator.js
./generate-tests.sh utils.py
```

### Exercise 5.2: Test Case Generator

```bash
#!/bin/bash
# generate-test-cases.sh

feature=$1

echo "Generating test cases for: $feature"

claude -p "Generate comprehensive test cases for: $feature

Include:
1. Normal/happy path scenarios
2. Edge cases
3. Error cases
4. Security concerns
5. Performance considerations

Format as:
Test Case 1: [name]
  Input: ...
  Expected: ...
  Notes: ...
" > "test_cases_${feature}.txt"

cat "test_cases_${feature}.txt"
```

## Challenges

### Challenge 1: Multi-Function Automation
Create a script that:
- Takes multiple file formats
- Generates code + tests + docs
- Organizes in project structure

### Challenge 2: CI/CD Integration
Create a script that:
- Runs on git commit
- Analyzes changed files
- Generates documentation
- Creates code review comments

### Challenge 3: Documentation Pipeline
Build a system that:
- Generates README
- Generates API docs
- Generates contributing guide
- Generates changelog

### Challenge 4: Personal Developer Tools
Create 3 scripts that solve YOUR actual development problems

## Best Practices

```bash
# ✅ Good practices
- Input validation
- Error handling with exit codes
- Clear status messages
- Output organization
- Logging for debugging

# ❌ Bad practices
- No error checking
- Assuming Claude always succeeds
- Silent failures
- Poor organization
```

## Performance Optimization

```bash
# Use haiku for fast iterations
claude -p --model haiku "Quick task"

# Batch related operations
for file in *.js; do
  claude -p --model haiku "Analyze: $file" &
done
wait

# Use timeouts for long-running tasks
timeout 30 claude -p "Task that might hang"
```

## Practical Applications

Use these scripts for:
- Onboarding new developers
- Code generation
- Documentation
- Code reviews
- Refactoring
- Format conversion
- Testing

## Summary Checklist

- ✅ Created bash scripts using Claude
- ✅ Built code generation automation
- ✅ Generated documentation automatically
- ✅ Implemented code transformation tools
- ✅ Created test generation workflows
- ✅ Error handling and robustness
- ✅ Real-world automation examples

## Next Steps

1. **Customize**: Adapt scripts to your workflow
2. **Integrate**: Add to your git hooks or CI/CD
3. **Expand**: Build more specialized tools
4. **Share**: Create tools for your team
5. **Measure**: Track time savings and improvements

## Reflection

1. **What repetitive tasks** could Claude automate in your workflow?
2. **What constraints** exist for automation?
3. **How could you combine** multiple scripts?
4. **What would make** these scripts more useful?
5. **How would you verify** automated outputs?
