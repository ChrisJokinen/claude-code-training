# claude-code-training
self-building training repo

# Claude Code Training Generator

This repository generates a full developer tutorial for Claude Code based on the currently installed version.

## Setup

Clone the repository:

git clone https://github.com/YOURNAME/claude-code-training.git

Enter the directory:

cd claude-code-training

Run the environment collector:

./scripts/collect_cli_info.sh

Start Claude:

claude

Then paste the prompt from:

TRAINING_PROMPT.md

Claude will generate the full training documentation in the /training directory.

## Updating Training After CLI Updates

Run:

./scripts/check_updates.sh

Then start Claude and paste:

UPDATE_PROMPT.md

Claude will update the documentation.
