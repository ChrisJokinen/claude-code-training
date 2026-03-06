#!/bin/bash

echo "Current Claude version:"
claude --version

echo ""
echo "Checking for latest version..."

npm view @anthropic-ai/claude-code version 2>/dev/null

echo ""
echo "If a newer version exists, update using your installation method."
