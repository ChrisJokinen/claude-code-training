#!/bin/bash

echo "Starting Claude training bootstrap..."

claude <<EOF
Read BOOTSTRAP_PROMPT.md and execute the instructions.
EOF
