You are operating inside a Claude Code training repository.

Your job is to bootstrap, generate, and maintain a developer training system
for the currently installed Claude CLI.

Follow the phases below carefully.

==================================================
PHASE 1 — Workspace Inspection
==================================================

Inspect the repository structure.

Expected directories:

prompts/
workspace/
workspace/cli_reference/
workspace/system_info/
training/
training/tutorials/
training/labs/
training/cheatsheets/
training/release_notes/

If any directories are missing, create them.

Do not delete existing training documentation.

==================================================
PHASE 2 — Determine Installed Claude Version
==================================================

Claude CLI is already running, so installation exists.

Determine the installed version using:

claude --version

Record the version number in:

workspace/system_info/claude_version.txt

Also record the current timestamp in:

workspace/system_info/bootstrap_time.txt

==================================================
PHASE 3 — Collect CLI Capability Data
==================================================

Collect CLI help output so the system can learn available commands.

Run commands such as:

claude --help
claude help

Capture the output.

Save results to:

workspace/cli_reference/claude_help.txt

If the help file already exists:

compare it with the new output.

If differences exist, mark that the CLI capabilities have changed.

==================================================
PHASE 4 — Capture System Context
==================================================

Record basic environment information.

Capture and store:

Operating system
Date
Shell environment

Save this information in:

workspace/system_info/system_info.txt

==================================================
PHASE 5 — Detect Existing Training
==================================================

Inspect the training directory.

If training documentation does not exist,
this repository must generate a complete tutorial system.

If training documentation already exists,
prepare to check whether it requires updates.

==================================================
PHASE 6 — Determine Documented Version
==================================================

If the training directory contains documentation,
attempt to determine the Claude version it was written for.

Look for version references in:

training/overview.md
training/commands.md
training/release_notes/

If the installed version differs from the documented version,
mark the training as needing an update.

==================================================
PHASE 7 — Generate Training Documentation (If Missing)
==================================================

If training documentation is missing,
generate a complete developer learning system.

Create the following files:

training/overview.md
training/commands.md
training/workflows.md

Create the following directories:

training/tutorials/
training/labs/
training/cheatsheets/
training/release_notes/

Populate documentation with:

• explanations of Claude CLI capabilities
• command references
• real usage examples
• developer workflows
• best practices
• troubleshooting guidance

Create tutorials including:

01_getting_started.md
02_understanding_commands.md
03_repository_analysis.md
04_automation_workflows.md
05_power_user_features.md

Create hands-on labs including:

lab1_cli_exploration.md
lab2_prompt_engineering.md
lab3_code_analysis.md
lab4_workflow_automation.md

Create cheat sheets including:

commands_cheatsheet.md
prompt_patterns.md
workflow_recipes.md

==================================================
PHASE 8 — Update Training Documentation (If Needed)
==================================================

If training already exists but the installed Claude version
is newer than the documented version:

Re-examine CLI capabilities.

Detect:

• new commands
• changed flags
• removed features
• workflow improvements

Update the documentation accordingly.

Create a release note:

training/release_notes/<version>.md

Summarize what changed and how it affects developer workflows.

==================================================
PHASE 9 — Build a Learning Path
==================================================

Ensure the training materials form a progressive learning path.

Beginner Level

• CLI basics
• prompts
• reading repositories

Intermediate Level

• repository analysis
• generating code
• debugging assistance

Advanced Level

• automation workflows
• documentation generation
• large codebase analysis

==================================================
PHASE 10 — Provide Final Summary
==================================================

After the bootstrap process completes,
display a summary including:

• installed Claude CLI version
• whether training was generated or updated
• where the documentation is located

Then provide suggested next steps such as:

1. Read training/overview.md
2. Complete tutorials in training/tutorials/
3. Attempt labs in training/labs/
4. Use cheat sheets in training/cheatsheets/

==================================================
GOAL
==================================================

This repository should function as a self-maintaining
training environment for Claude CLI.

A developer should be able to:

clone the repository
run the bootstrap script
and receive up-to-date training documentation automatically.
