You are operating inside a Claude Code training workspace.

Your task is to generate a complete developer training guide for the installed Claude CLI.

Use the following data sources as authoritative:

workspace/cli_reference/
workspace/system_info/

First determine:

• installed Claude version
• available CLI commands
• flags and options

If possible also detect whether a newer version of Claude CLI exists and provide upgrade guidance.

Then generate a full training documentation system.

Create documentation in the /training directory including:

overview.md
commands.md
workflows.md

Create subdirectories:

training/tutorials
training/labs
training/cheatsheets

Each section should include:

• explanations
• CLI examples
• best practices
• exercises

Structure the training for developers familiar with Linux, Docker, and Git.

The goal is to produce a practical hands-on learning system for Claude Code.
