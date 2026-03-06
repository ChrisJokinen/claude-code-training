#!/usr/bin/env bash

echo "===================================="
echo "Claude Code Training Bootstrap"
echo "===================================="
echo ""

# Check if Claude CLI exists
if ! command -v claude &> /dev/null
then
    echo "Claude CLI is not installed."
    echo ""
    echo "Install instructions:"
    echo ""
    echo "1. Install Node.js (if not already installed)"
    echo "   https://nodejs.org"
    echo ""
    echo "2. Install Claude Code CLI"
    echo ""
    echo "   npm install -g @anthropic-ai/claude-code"
    echo ""
    echo "3. Verify installation"
    echo ""
    echo "   claude --version"
    echo ""
    echo "After installing, run this script again."
    echo ""
    exit 1
fi

echo "Claude CLI detected:"
claude --version
echo ""

echo "Launching Claude..."
echo ""

claude <<EOF
Read prompts/bootstrap_prompt.md and execute all instructions.
EOF
