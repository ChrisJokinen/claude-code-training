# Lab 3: Code Analysis

## Overview
Learn to use Claude for effective code analysis, from small functions to entire repositories.

**Time:** 60-90 minutes
**Difficulty:** Intermediate
**Prerequisites:** Labs 1-2 completed

## Setup

Create a test project with sample code:

```bash
mkdir -p ~/lab3-code-analysis
cd ~/lab3-code-analysis

# Create some sample code files
cat > calculator.js << 'EOF'
function add(a, b) {
  return a + b;
}

function multiply(a, b) {
  return a * b;
}

function divide(a, b) {
  if (b == 0) {
    return "error";
  }
  return a / b;
}
EOF

cat > user_api.py << 'EOF'
import requests

def get_user(user_id):
    response = requests.get(f"https://api.example.com/users/{user_id}")
    data = response.json()
    print(data)
    return data

def create_user(name, password):
    user_data = {"name": name, "password": password}
    requests.post("https://api.example.com/users", json=user_data)
EOF
```

## Part 1: Function Analysis (20 minutes)

### Exercise 1.1: Analyze Single Functions

```bash
# Analyze the add function
claude -p "Analyze this function for issues:
$(head -3 calculator.js)"
```

### Exercise 1.2: Function Quality Review

```bash
# Check all functions
claude -p "Review all functions in this file for:
- Bugs
- Security issues
- Edge cases
- Performance
- Best practices

$(cat calculator.js)"
```

**Document your findings:**
- What issues were found?
- Which are critical?
- Which are improvements vs bugs?

### Exercise 1.3: Suggest Improvements

```bash
claude << 'EOF'
Improve this code for production use:

$(cat calculator.js)

Include:
1. Error handling
2. Input validation
3. JSDoc comments
4. Better variable names
5. Type safety (if applicable)
EOF
```

## Part 2: File Analysis (20 minutes)

### Exercise 2.1: Security Analysis

```bash
claude -p "Security review of this Python code:
$(cat user_api.py)

Identify:
1. Security vulnerabilities
2. How to fix each issue
3. Best practices violated"
```

**Critical questions:**
- What security issues exist?
- Why is storing passwords in JSON dangerous?
- How should authentication work?

### Exercise 2.2: API Design Review

```bash
claude << 'EOF'
Review this API client for:
- Error handling
- Documentation
- Robustness
- Best practices

$(cat user_api.py)

Provide:
1. What's wrong
2. What's good
3. Improved version
EOF
```

### Exercise 2.3: Code Quality Metrics

```bash
claude -p "Analyze the code quality of:
$(cat user_api.py)

Rate on scale 1-10:
- Readability
- Maintainability
- Security
- Performance
- Testing readiness

Explain each rating."
```

## Part 3: Repository Analysis (25 minutes)

### Exercise 3.1: Project Overview

In the lab3 directory:

```bash
claude -p "What does this project do?
$(ls -la)
$(find . -type f -name '*.js' -o -name '*.py')"
```

### Exercise 3.2: Architecture Understanding

```bash
claude -p "Analyze the architecture of this project:
- What are the main components?
- How do they interact?
- What patterns are used?

Files:
$(find . -type f \( -name '*.js' -o -name '*.py' \))"
```

### Exercise 3.3: Generate Documentation

```bash
claude -p "Generate documentation for this codebase:
- README section
- Module overview
- API documentation
- Setup instructions

Project:
$(cat calculator.js)
$(cat user_api.py)"
```

## Part 4: Refactoring Analysis (20 minutes)

### Exercise 4.1: Identify Refactoring Opportunities

```bash
claude -p "What should be refactored in this code?

$(cat calculator.js)

Prioritize by:
1. Impact on code quality
2. Effort to implement
3. Current issues"
```

### Exercise 4.2: Refactoring Plan

```bash
claude << 'EOF'
Create a refactoring plan for this code:

$(cat user_api.py)

Plan should include:
1. Priority order
2. Why each change matters
3. Estimated effort
4. Risk of change
5. Testing strategy
EOF
```

### Exercise 4.3: Implement Suggestions

```bash
# Get specific refactored code
claude -p "Refactor this code for:
- Better error handling
- Security
- Readability

Current code:
$(cat user_api.py)

Provide complete refactored version."

# Save the output
# claude -p ... > user_api_refactored.py
```

## Part 5: Advanced Analysis (25 minutes)

### Exercise 5.1: Complexity Analysis

```bash
claude -p "Analyze the algorithmic complexity:

$(cat calculator.js)

For each function:
1. Time complexity
2. Space complexity
3. Whether it matters for this use case
4. Optimization suggestions"
```

### Exercise 5.2: Testing Strategy

```bash
claude << 'EOF'
Create a testing strategy for this code:

$(cat calculator.js)

Include:
1. Unit tests (with examples)
2. Edge cases to test
3. Test framework recommendation
4. Coverage targets
5. Mocking strategy (if needed)
EOF
```

### Exercise 5.3: Performance Review

```bash
claude << 'EOF'
Performance analysis of this code:

$(cat user_api.py)

Analyze:
1. Network calls and efficiency
2. Data handling optimizations
3. Caching opportunities
4. Async/await usage
5. Bottlenecks

Suggest optimizations with priority.
EOF
```

## Part 6: Comparative Analysis (10 minutes)

### Exercise 6.1: Compare Approaches

```bash
claude << 'EOF'
Compare these two ways of structuring code:

Approach 1 (Functions):
$(head -10 calculator.js)

Approach 2 (Classes):
class Calculator {
  add(a, b) { return a + b; }
  multiply(a, b) { return a * b; }
}

Compare on:
- Readability
- Maintainability
- Testability
- Performance
- Team preference

Which should we use and why?
EOF
```

## Challenges

### Challenge 1: Full Repository Analysis
```bash
# Create or clone a real project
# Run comprehensive analysis:
# 1. What does it do?
# 2. Architecture review
# 3. Security audit
# 4. Code quality metrics
# 5. Refactoring opportunities
# 6. Testing gaps
# 7. Documentation needs
```

### Challenge 2: Before/After Comparison
```bash
# Pick a file from the lab
# Get the "before" analysis
# Refactor using Claude's suggestions
# Get the "after" analysis
# Compare improvements
```

### Challenge 3: Documentation Generation
```bash
# Analyze a file/project
# Generate: README, API docs, contribution guide
# Create a docs/ directory with your generated files
```

## Practical Applications

### Use Case 1: Code Review
```bash
# Review before merging PR
# Analyze for issues
# Generate feedback
```

### Use Case 2: Technical Onboarding
```bash
# Analyze codebase as new developer
# Understand architecture quickly
# Get explanations of patterns
```

### Use Case 3: Refactoring Initiative
```bash
# Analyze code debt
# Prioritize improvements
# Plan refactoring
# Validate new approaches
```

### Use Case 4: Security Audit
```bash
# Check for vulnerabilities
# Identify data protection issues
# Plan security improvements
```

## Analysis Checklist

When analyzing code, check:

- [ ] Bugs and issues
- [ ] Security vulnerabilities
- [ ] Error handling
- [ ] Edge cases
- [ ] Performance problems
- [ ] Code style violations
- [ ] Missing documentation
- [ ] Testing gaps
- [ ] Maintainability issues
- [ ] Architectural concerns

## Reflection Questions

1. **What patterns emerge** when analyzing code with Claude?
2. **How does analysis speed up** development vs manual review?
3. **What types of issues** does Claude find best?
4. **What might Claude miss** that humans catch?
5. **How can you verify** Claude's analysis is correct?

## Summary

In this lab, you:
- ✅ Analyzed functions for issues
- ✅ Reviewed file-level code quality
- ✅ Examined project architecture
- ✅ Planned refactoring work
- ✅ Generated documentation
- ✅ Evaluated performance and security

## Next Steps

- Complete Lab 4: Automation
- Use code analysis in real projects
- Build a code review checklist
- Create analysis workflows
