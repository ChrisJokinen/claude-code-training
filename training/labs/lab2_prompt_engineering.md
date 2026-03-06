# Lab 2: Prompt Engineering

## Overview
Learn how to craft effective prompts that get better results from Claude.

**Time:** 45-60 minutes
**Difficulty:** Beginner to Intermediate
**Prerequisites:** Lab 1 completed

## Part 1: Prompt Structure (15 minutes)

### Good vs Bad Prompts

**Bad Prompt:**
```
Write code
```

**Good Prompt:**
```
Write a Python function named 'calculate_fibonacci' that takes an integer n and returns the nth Fibonacci number. Use recursion with memoization for efficiency.
```

### Exercise 1.1: Vague vs Specific

```bash
# Vague prompt
claude -p "Tell me about Python"

# Specific prompt
claude -p "List 5 key features of Python that make it good for data science"
```

**Compare the results:**
- Which answer is more useful?
- Which took less reading to understand?

### Exercise 1.2: Add Context

```bash
# Without context
claude -p "How do I fix this error?"

# With context
claude -p "How do I fix this Node.js error: 'Cannot find module express'? I'm building a REST API."
```

**Better prompts include:**
- What you're trying to do
- What error or problem you have
- What you've already tried
- Your constraints or requirements

### Exercise 1.3: Request Format

```bash
# Specify output format
claude -p "Generate a bullet list of 5 JavaScript best practices"

# Specify code format
claude -p "Write a React component as JSX that displays a button"

# Specify structure
claude -p "Write a haiku about programming"
```

## Part 2: Iterative Refinement (15 minutes)

### Exercise 2.1: Iterative Conversation

```bash
claude
```

Conversation flow:
```
You: Generate a React component for a login form
(Claude generates basic component)

You: Make it include form validation
(Claude adds validation)

You: Add styling with Tailwind CSS
(Claude adds styles)

You: Add success and error messages
(Claude adds messages)

You: Export it as a TypeScript component
(Claude updates to TypeScript)
```

**Key insight:** Use interactive mode to refine incrementally!

### Exercise 2.2: Role-Based Prompting

```bash
claude -p --system-prompt "You are a senior Python developer with 20 years of experience" \
  "What are the most important Python skills for a junior developer to learn?"

claude -p --system-prompt "You are a creative fiction writer" \
  "Write a short story about a robot learning to feel emotions"

claude -p --system-prompt "You are a product manager" \
  "What features should a note-taking app have?"
```

**Observations:**
- How does the system prompt change the response?
- When would you use system prompts?

## Part 3: Code-Specific Prompting (15 minutes)

### Exercise 3.1: Code Generation with Context

```bash
# Poor code prompt
claude -p "Generate a sorting function"

# Better code prompt
claude -p "Generate a Python function that sorts a list of dictionaries by a specified key, in ascending order"

# Best code prompt
claude -p "Generate a Python function that:
- Takes a list of dictionaries and a key name as parameters
- Sorts by that key in ascending order
- Returns the sorted list
- Include docstring and type hints
- Use list comprehension where appropriate"
```

### Exercise 3.2: Code Review Prompts

```bash
claude << 'EOF'
Review this code and identify:
1. Potential bugs
2. Performance issues
3. Style improvements
4. Security concerns

Code to review:
function getUserData(userId) {
  const users = [
    { id: 1, name: 'Alice', password: 'password123' },
    { id: 2, name: 'Bob', password: 'secret456' }
  ];
  for (let i = 0; i < users.length; i++) {
    if (users[i].id == userId) {
      return users[i];
    }
  }
  return null;
}
EOF
```

### Exercise 3.3: Explanation Prompts

```bash
claude -p "Explain this code in simple terms:

function flatten(arr) {
  return arr.reduce((acc, val) =>
    Array.isArray(val) ? acc.concat(flatten(val)) : acc.concat(val), []);
}"

claude -p "Explain what this regular expression does:
/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$/"
```

## Part 4: Problem-Solving Prompts (15 minutes)

### Exercise 4.1: Structured Problem Solving

```bash
claude << 'EOF'
Help me solve this problem:

Problem: I have a list of users and need to find all users over 18 years old who have admin access.

Current code:
const users = [
  { name: 'Alice', age: 25, isAdmin: true },
  { name: 'Bob', age: 17, isAdmin: false },
  { name: 'Charlie', age: 30, isAdmin: true }
];

What I've tried: A basic loop but it's slow

What I need: Efficient code using modern JavaScript

Please provide:
1. The best approach
2. Code example
3. Explanation of why this approach is good
EOF
```

### Exercise 4.2: Algorithm Prompts

```bash
claude << 'EOF'
Teach me about the quicksort algorithm:
1. How does it work? (high level)
2. What's the time complexity?
3. When should I use it vs other sorts?
4. Show me a Python implementation
EOF
```

### Exercise 4.3: Design Questions

```bash
claude << 'EOF'
I'm designing a URL shortening service. Help me:
1. Explain the architecture needed
2. What database schema would you use?
3. What are potential bottlenecks?
4. How would you handle scaling?

Constraints: Must handle 1M URLs, 10K requests/second
EOF
```

## Part 5: Prompt Templates (15 minutes)

### Exercise 5.1: Useful Prompt Templates

**Template 1: Code Generation**
```
Write a [language] [type] that:
- [requirement 1]
- [requirement 2]
- [requirement 3]

Include: [specific features]
Use: [specific patterns/libraries]
```

**Template 2: Debugging**
```
I'm getting this error: [error message]
Context: [what you're trying to do]
I've tried: [what you've attempted]
Code: [code snippet]
Help me: [specific help needed]
```

**Template 3: Learning**
```
Explain [topic] for someone with [skill level]:
1. Overview (brief)
2. Key concepts
3. Common use cases
4. Example code
5. Common mistakes to avoid
```

**Template 4: Code Review**
```
Review this code for:
- [concern 1]
- [concern 2]
- [concern 3]

Context: [what this code does]

Code:
[code snippet]
```

### Exercise 5.2: Use a Template

Pick one template above and write 2 prompts using it:

```bash
claude -p "Use Template 1 to generate a [something you want]"

claude -p "Use Template 3 to learn about [something new]"
```

## Challenges

### Challenge 1: Perfect Prompt
Write a prompt that gets Claude to:
- Generate a function
- With type hints
- With docstrings
- With examples
- With error handling

### Challenge 2: Iterative Improvement
Start a session and iteratively improve a component:
- Generate basic version
- Add feature 1
- Add feature 2
- Optimize
- Convert to TypeScript

### Challenge 3: Teaching
Write a prompt that teaches you something complex through:
- Simple explanation
- Multiple examples
- Visual descriptions
- Practice questions

## Reflection Questions

1. **Clarity**: How does being specific improve Claude's responses?
2. **Context**: Why is providing context so important?
3. **Format**: How much does specifying output format matter?
4. **Iteration**: Why is interactive mode good for refinement?
5. **Specialization**: When would system prompts help?

## Best Practices Summary

✅ **DO:**
- Be specific about requirements
- Provide context and examples
- State the desired output format
- Use interactive mode for refinement
- Ask follow-up questions
- Verify the output

❌ **DON'T:**
- Use vague language
- Assume Claude knows your context
- Ask multiple unrelated questions
- Skip details
- Use only print mode for complex tasks

## Common Prompt Patterns

| Goal | Pattern |
|------|---------|
| Generate code | "Write a [language] [type] that [requirements]" |
| Fix code | "Debug this error: [error] in [code]" |
| Learn topic | "Explain [topic] for [skill level]" |
| Review code | "Review for [concerns]" |
| Brainstorm | "List ideas for [problem]" |
| Refactor | "Improve [code] by [aspect]" |

## Summary

In this lab, you learned:
- ✅ Structure effective prompts
- ✅ Use context and examples
- ✅ Iterate in interactive mode
- ✅ Apply role-based prompting
- ✅ Use prompt templates
- ✅ Optimize code-specific prompts

## Next Steps

- Complete Lab 3: Code Analysis
- Practice writing prompts daily
- Build a personal prompt library
- Teach someone else prompt engineering
