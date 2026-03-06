# Workflow Recipes

Quick solutions to common development tasks.

## Recipe 1: Rapid Prototyping

**Goal:** Build a quick proof-of-concept

```bash
# 1. Generate component/function
claude -p --model haiku "Generate a [COMPONENT] that [FEATURE]" > prototype.js

# 2. Add basic styling
claude -p "Add Tailwind CSS styling to make this look professional" < prototype.js

# 3. Create usage example
claude -p "Show how to use this component with a full example" > example.js

# 4. Quick review
claude -p "Rate this prototype on: functionality, code quality, performance (1-10 each)" < prototype.js
```

## Recipe 2: Feature Implementation

**Goal:** Implement a feature from requirements to tests

```bash
# 1. Create test cases
claude -p "Create comprehensive test cases for: [FEATURE]" > feature.test.js

# 2. Implement feature (using --permission-mode plan for safety)
claude --permission-mode plan "Implement [FEATURE]"

# 3. Generate documentation
claude -p "Generate user documentation for [FEATURE]" > docs.md

# 4. Security review
claude -p "Security analysis: [FEATURE]" < feature.js
```

## Recipe 3: Code Review Workflow

**Goal:** Thorough code review with multiple perspectives

```bash
# 1. Quick quality check
claude -p "Quality check (1-10) with issues:" < code.js

# 2. Security review
claude -p "Security review (vulnerability check):" < code.js

# 3. Performance analysis
claude -p "Performance analysis and bottlenecks:" < code.js

# 4. Refactoring suggestions
claude -p "Refactoring plan with implementation:" < code.js
```

## Recipe 4: Documentation Generation

**Goal:** Create complete documentation suite

```bash
# 1. README
claude -p "Generate comprehensive README" > README.md

# 2. API Documentation
claude -p "Generate API documentation from code" < src/api.js > docs/API.md

# 3. Architecture documentation
claude -p "Document system architecture" > docs/ARCHITECTURE.md

# 4. Contributing guide
claude -p "Generate CONTRIBUTING guide" > CONTRIBUTING.md

# 5. Setup instructions
claude -p "Generate development setup instructions" > docs/SETUP.md
```

## Recipe 5: Debugging Session

**Goal:** Systematically debug and fix an issue

```bash
# 1. Problem exploration
claude
# Describe the issue and get initial hypotheses

# 2. Root cause analysis
# Continue conversation with more details

# 3. Solution research
# Ask about different fix approaches

# 4. Implementation
# Ask Claude to write the fix

# 5. Validation
# Ask about testing the fix
```

## Recipe 6: Learning New Technology

**Goal:** Learn a new tool/framework quickly

```bash
# 1. Concepts overview
claude "Explain [TECHNOLOGY] for a [SKILL] developer"

# 2. Core features
claude "What are the 5 most important features of [TECHNOLOGY]?"

# 3. Getting started
claude "Quick start guide for [TECHNOLOGY]"

# 4. Common patterns
claude "Show common usage patterns for [TECHNOLOGY]"

# 5. Best practices
claude "Best practices for [TECHNOLOGY]"

# 6. Real example
claude "Build a real example using [TECHNOLOGY]"
```

## Recipe 7: Refactoring Project

**Goal:** Improve code quality systematically

```bash
# 1. Analyze current state
claude -p "Code quality assessment:" --add-dir ./src

# 2. Plan improvements
claude "Create a refactoring roadmap for this project"

# 3. Priority tasks
claude "List refactoring tasks by priority and impact"

# 4. Implement changes
# Work through refactoring tasks with Claude

# 5. Validate
claude "Validate refactoring didn't break functionality"
```

## Recipe 8: Performance Optimization

**Goal:** Identify and fix performance issues

```bash
# 1. Profile analysis
claude -p "Analyze performance bottlenecks:" < profile_data.txt

# 2. Optimization plan
claude "Create optimization plan for these bottlenecks"

# 3. Implement optimizations
claude --permission-mode plan "Optimize this code"

# 4. Benchmark before/after
# Run performance tests and compare

# 5. Document changes
claude -p "Document performance improvements"
```

## Recipe 9: Test-Driven Development

**Goal:** Write tests first, then implementation

```bash
# 1. Requirements to tests
claude -p "Create Jest tests for: [FEATURE]" > feature.test.js

# 2. Implement to pass tests
claude --permission-mode plan "Implement code to pass these tests" < feature.test.js

# 3. Refactor while passing
claude --permission-mode plan "Refactor while maintaining all tests passing"

# 4. Add edge cases
claude "Add more test cases for edge cases"
```

## Recipe 10: Multi-File Feature

**Goal:** Build a feature across multiple files

```bash
# 1. Architecture planning
claude "Design architecture for: [FEATURE]"

# 2. Generate all files
claude -p "Generate API route file" > routes/feature.js
claude -p "Generate database model" > models/Feature.js
claude -p "Generate controller" > controllers/FeatureController.js

# 3. Generate tests
claude -p "Generate tests for:" < routes/feature.js > tests/feature.test.js

# 4. Integration check
claude "Ensure all files integrate properly"

# 5. Documentation
claude -p "Document the implementation" > docs/FEATURE.md
```

## Recipe 11: Bug Fix Workflow

**Goal:** Fix a bug completely and prevent regression

```bash
# 1. Reproduce and document
# Create a test case that fails

# 2. Root cause analysis
claude "Help me debug this failing test"

# 3. Implement fix
claude --permission-mode plan "Fix this bug"

# 4. Add regression test
# Ensure the test now passes

# 5. Broader impact
claude "Check if this bug pattern exists elsewhere"
```

## Recipe 12: Code Migration

**Goal:** Migrate code from one approach to another

```bash
# 1. Analysis
claude "Analyze migration from [OLD] to [NEW]"

# 2. Plan
claude "Create migration plan with steps"

# 3. Validation strategy
claude "How should we validate the migration?"

# 4. Implementation
# Work through migration steps

# 5. Verification
claude "Verify migration is complete and correct"
```

## Recipe 13: Security Hardening

**Goal:** Improve security of an application

```bash
# 1. Security audit
claude -p "Security audit of this codebase" --add-dir ./src

# 2. Vulnerability identification
claude "List security vulnerabilities and severity"

# 3. Fix planning
claude "Create fix plan for each vulnerability"

# 4. Implementation
# Fix vulnerabilities with Claude's help

# 5. Verification
claude "Verify security improvements"
```

## Recipe 14: API Design

**Goal:** Design a clean REST or GraphQL API

```bash
# 1. Requirements gathering
claude "What endpoints do we need for: [FEATURE]?"

# 2. API design
claude "Design REST API for: [FEATURE]"

# 3. Error handling
claude "Design error handling and response codes"

# 4. Documentation
claude -p "Generate OpenAPI/Swagger documentation"

# 5. Implementation
claude "Generate API implementation"
```

## Recipe 15: Onboarding New Developer

**Goal:** Help new developer understand codebase

```bash
# For new developer or yourself:

# 1. Overview
claude -p "Describe this project architecture" --add-dir ./

# 2. Key files
claude "What are the most important files and why?"

# 3. Getting started
claude "How should a new developer set up and start?"

# 4. Code walkthrough
claude "Walk through: [KEY FEATURE]"

# 5. Common tasks
claude "What are common development tasks and how to do them?"
```

## Quick Recipes

### Generate and Format
```bash
claude -p "Generate component" | prettier --stdin
```

### Batch Processing
```bash
for file in src/*.js; do
  claude -p "Lint: $file" < "$file"
done
```

### Compare Approaches
```bash
claude -p "Approach 1: [OPTION 1]"
claude -p "Approach 2: [OPTION 2]"
claude -p "Which approach is better and why?"
```

### Quick Templates
```bash
# Code
claude -p "Generate [LANGUAGE] code for [TASK]"

# Docs
claude -p "Generate documentation for [CODE]"

# Review
claude -p "Review [CODE] for [CONCERN]"

# Learn
claude "Teach me about [TOPIC]"

# Debug
claude "Help me debug: [ISSUE]"
```

## Tips for Recipes

1. **Combine steps** - Some steps can be parallelized
2. **Adapt to needs** - These are templates, modify as needed
3. **Use sessions** - Save long workflows for later
4. **Verify output** - Always check generated code
5. **Iterate** - Use follow-up prompts to refine
6. **Document** - Keep notes on effective recipes

## Automation

Convert recipes to scripts:

```bash
#!/bin/bash
# feature-workflow.sh

feature_name=$1

echo "1. Creating tests..."
claude -p "Create tests for: $feature_name" > "$feature_name.test.js"

echo "2. Implementing feature..."
claude --permission-mode plan "Implement: $feature_name"

echo "3. Generating docs..."
claude -p "Generate docs for: $feature_name" > "$feature_name.md"

echo "4. Code review..."
claude -p "Review implementation" < "$feature_name.js"

echo "Done!"
```

Use it:
```bash
./feature-workflow.sh "user-authentication"
```

---

**Pro Tip:** Build your own recipe library for your specific workflow!
