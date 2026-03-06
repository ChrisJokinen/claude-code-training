# Prompt Patterns & Templates

## Code Generation

### Function Template
```
Write a [LANGUAGE] function that:
- [REQUIREMENT 1]
- [REQUIREMENT 2]
- [REQUIREMENT 3]

Include:
- [SPECIFIC FEATURES]
- Error handling for [EDGE CASES]
- [DOCUMENTATION TYPE] documentation
```

**Example:**
```
Write a Python function that:
- Takes a list of dictionaries
- Filters by a key-value pair
- Returns matching items

Include:
- Type hints
- Docstring
- Example usage
- Error handling for empty lists
```

### Component Template
```
Generate a [FRAMEWORK] component that:
- [PURPOSE]
- [VISUAL REQUIREMENTS]
- [INTERACTION REQUIREMENTS]

Use:
- [STYLING APPROACH]
- [STATE MANAGEMENT]
- [BEST PRACTICES]

Include:
- Props documentation
- Usage example
- Accessibility features
```

### API Endpoint Template
```
Design/generate a [METHOD] endpoint that:
- [PURPOSE]
- [INPUT REQUIREMENTS]
- [OUTPUT REQUIREMENTS]

Should handle:
- [ERROR CASES]
- [VALIDATION RULES]
- [SECURITY CONCERNS]

Include:
- Request/response examples
- Error responses
- Documentation
```

## Code Review

### Security Review Template
```
Review this code for security issues:

[CODE]

Check for:
- Authentication/authorization flaws
- Data validation issues
- SQL injection risks
- XSS vulnerabilities
- Insecure crypto
- API key exposure
- Access control problems

For each issue:
1. Severity (critical/high/medium/low)
2. Specific vulnerability
3. How to fix
```

### Performance Review Template
```
Analyze this code for performance:

[CODE]

Check:
- Algorithm complexity
- Database queries
- Network calls
- Memory usage
- Caching opportunities
- Bottlenecks

Rate current performance: 1-10
Improvement potential: 1-10
```

### Code Quality Template
```
Review for code quality:

[CODE]

Evaluate:
- Readability (1-10)
- Maintainability (1-10)
- Testability (1-10)
- Style consistency (1-10)

Issues found:
- [Priority 1]
- [Priority 2]

Suggestions:
- Best practices
- Patterns to use
- Anti-patterns to avoid
```

## Documentation

### API Documentation Template
```
Generate API documentation for:

[CODE/ENDPOINTS]

Include:
- Endpoint descriptions
- Request/response examples
- Parameter documentation
- Error codes
- Authentication requirements
- Rate limiting
- Usage examples

Format: [MARKDOWN/OPENAPI/etc]
```

### Code Documentation Template
```
Generate documentation for:

[CODE FILE]

Include:
- File purpose
- Main classes/functions
- Key algorithms
- Usage examples
- Dependencies
- Configuration

Format: [MARKDOWN/DOCSTRING/etc]

Audience: [DEVELOPERS/USERS/etc]
```

### Project README Template
```
Generate a README for [PROJECT]:

[PROJECT DESCRIPTION]

Include sections:
- Overview (1-2 sentences)
- Features list
- Installation steps
- Quick start example
- Usage documentation
- API reference
- Contributing guidelines
- License

Format: Markdown with good structure
```

## Learning & Explanation

### Concept Explanation Template
```
Explain [CONCEPT] to someone with [SKILL LEVEL]:

1. Simple overview (1-2 sentences)
2. Key concepts (bullet points)
3. Why it matters
4. Common use cases
5. Example code/usage
6. Common mistakes
7. Next steps to learn more
```

**Example:**
```
Explain async/await to a JavaScript beginner:

1. Simple overview
2. Key concepts
3. Why async/await matters
4. When to use it
5. Code examples
6. Common mistakes
7. Practice resources
```

### Tutorial Template
```
Create a tutorial on [TOPIC]:

Include:
- Prerequisites
- Learning objectives
- Step-by-step instructions
- Code examples for each step
- Common pitfalls
- Practice exercises
- Key takeaways
- Next learning paths

Audience: [BEGINNER/INTERMEDIATE/ADVANCED]
```

### Troubleshooting Template
```
Help me debug [ISSUE]:

Problem: [DESCRIPTION]
Error message: [FULL ERROR]
Code: [RELEVANT CODE]
I've tried: [WHAT YOU'VE ATTEMPTED]
Context: [ADDITIONAL INFO]

Help me:
1. Understand the root cause
2. Identify the fix
3. Implement the solution
4. Prevent future issues
```

## Problem Solving

### Algorithm Design Template
```
Help me design an algorithm for:
[PROBLEM DESCRIPTION]

Constraints:
- [CONSTRAINT 1]
- [CONSTRAINT 2]
- [CONSTRAINT 3]

I need:
1. High-level approach
2. Step-by-step breakdown
3. Time/space complexity analysis
4. Pseudocode
5. Implementation in [LANGUAGE]
6. Test cases
7. Edge cases to handle
```

### Architecture Template
```
Help me design [SYSTEM] architecture:

Requirements:
- [FUNCTIONAL REQUIREMENT 1]
- [FUNCTIONAL REQUIREMENT 2]
- [NON-FUNCTIONAL REQUIREMENT]

Constraints:
- [SCALE]
- [TECHNOLOGY STACK]
- [TEAM SIZE]

Provide:
1. High-level architecture
2. Component breakdown
3. Data flow diagram
4. Technology choices with reasoning
5. Scaling strategy
6. Potential bottlenecks
7. Deployment approach
```

### Refactoring Template
```
Help me refactor [ASPECT]:

Current code:
[CODE]

Goals:
- [GOAL 1]
- [GOAL 2]
- [GOAL 3]

Constraints:
- [CONSTRAINT]

Provide:
1. Analysis of current code
2. Refactoring strategy
3. Step-by-step changes
4. Refactored code
5. Benefits of changes
6. Breaking changes (if any)
7. Testing strategy
```

## Requirements & Planning

### Feature Requirements Template
```
Define requirements for [FEATURE]:

User story: [AS A... I WANT... SO THAT...]

Acceptance criteria:
- [CRITERIA 1]
- [CRITERIA 2]
- [CRITERIA 3]

Edge cases:
- [EDGE CASE 1]
- [EDGE CASE 2]

Questions to clarify:
- [QUESTION 1]
- [QUESTION 2]

Help me:
1. Refine requirements
2. Identify edge cases
3. Plan implementation
4. Create test plan
```

### Project Planning Template
```
Help me plan [PROJECT]:

Description: [PROJECT OVERVIEW]
Timeline: [DEADLINE]
Team: [TEAM SIZE]
Scope: [WHAT'S INCLUDED]

Create a plan with:
1. Phases and milestones
2. Key deliverables
3. Technical approach
4. Risk analysis
5. Resource requirements
6. Success metrics
7. Timeline breakdown
```

## Testing

### Test Plan Template
```
Create a test plan for [FEATURE/COMPONENT]:

Functionality: [DESCRIPTION]

Include:
1. Unit tests (functions/methods)
   - Happy path
   - Edge cases
   - Error handling

2. Integration tests
   - Component interaction
   - Data flow
   - External dependencies

3. End-to-end tests
   - User workflows
   - Real scenarios
   - Cross-browser/platform

4. Test cases
   - Each with: name, steps, expected result

5. Coverage targets (%)

6. Mocking strategy
```

### Test Case Template
```
Generate test cases for: [FEATURE]

For each test:
- Name: [DESCRIPTIVE NAME]
- Setup: [INITIAL STATE]
- Steps: [NUMBERED STEPS]
- Expected: [EXPECTED RESULT]
- Preconditions: [IF ANY]
- Edge cases: [IF APPLICABLE]

Include:
- Happy path (normal scenarios)
- Error paths (expected errors)
- Edge cases (boundary conditions)
- Security scenarios (if applicable)
```

## Pattern Usage

### Using Templates Effectively

1. **Provide context first** - Background info helps
2. **Be specific** - Use [BRACKETS] for customization
3. **Ask progressively** - Start simple, add details
4. **Request format** - Specify output style
5. **Include constraints** - Time, tech stack, team size

### Customization

Replace [BRACKETED] items with your specifics:
- `[LANGUAGE]` → Python, JavaScript, Go, etc.
- `[FRAMEWORK]` → React, Vue, Django, etc.
- `[SKILL LEVEL]` → Beginner, Intermediate, Advanced
- `[CONTEXT]` → Your specific situation

### Combining Templates

```
Code generation + Documentation:
"Generate a Python function AND create API docs"

Review + Refactoring:
"Review this code AND suggest refactoring"

Testing + Implementation:
"Create tests first, then implementation"
```

## Tips for Better Results

1. **Be detailed** - More context = better results
2. **Provide examples** - Show what you mean
3. **Specify format** - JSON, Markdown, code, etc.
4. **Set constraints** - Budget, performance, etc.
5. **Ask for explanations** - Not just code
6. **Request multiple versions** - Compare approaches
7. **Use follow-ups** - Refine iteratively
8. **Verify output** - Review generated content

## Quick Template Access

```bash
# Store templates in a file
# Reference when writing prompts
# Adapt for your specific needs

# Common pattern: [Context] + [Template] + [Specific Details]
```

---

**Remember:** Templates are guides, customize them for your needs!
