#!/bin/bash

mkdir -p workspace/cli_reference
mkdir -p workspace/system_info

echo "Collecting Claude CLI information..."

claude --version > workspace/system_info/claude_version.txt 2>&1
claude --help > workspace/cli_reference/claude_help.txt 2>&1

echo "Collecting environment info..."

uname -a > workspace/system_info/system.txt
date > workspace/system_info/collection_time.txt

echo "Collection complete."
