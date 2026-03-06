Absolutely — the **README** should now reflect the new workflow with the bootstrap script and the prompt system. Here's a full updated version tailored to your repository:

---

# `README.md`


# Claude Code Training Repository

This repository provides a **self-bootstrapping, self-updating developer training system** for the installed Claude CLI.  
It automatically collects CLI information, detects version changes, and generates or updates comprehensive training documentation.

---

## Repository Structure

```

```bash
claude-code-training/
├─ README.md
├─ prompts/
│  └─ bootstrap_prompt.md       # Main bootstrap prompt
├─ scripts/
│  └─ start_training.sh         # Starts Claude and runs the bootstrap
├─ workspace/
│  ├─ cli_reference/            # CLI help outputs collected
│  └─ system_info/              # Installed version, OS info, timestamps
└─ training/
├─ overview.md               # Generated overview documentation
├─ commands.md               # Command reference
├─ workflows.md              # Workflow documentation
├─ tutorials/                # Step-by-step tutorials
├─ labs/                     # Hands-on exercises
├─ cheatsheets/              # Quick reference sheets
└─ release_notes/            # Version-specific notes
```


---

## Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/claude-code-training.git
cd claude-code-training
````

### 2. Start the bootstrap

```bash
./scripts/start_training.sh
```

The script will:

1. Verify that Claude CLI is installed
2. Print installation instructions if Claude CLI is missing
3. Launch Claude and instruct it to read `prompts/bootstrap_prompt.md`
4. Collect CLI information (help output, version, system info)
5. Generate or update training documentation in the `training/` folder

---

## Installation Instructions (if Claude CLI is missing)

1. Install Node.js (if not already installed):
   [https://nodejs.org](https://nodejs.org)

2. Install Claude CLI globally:

```bash
npm install -g @anthropic-ai/claude-code
```

3. Verify installation:

```bash
claude --version
```

4. Re-run the bootstrap script:

```bash
./scripts/start_training.sh
```

---

## Updating Training Documentation

When you upgrade Claude CLI:

1. Update Claude CLI to the latest version
2. Run the bootstrap script again:

```bash
./scripts/start_training.sh
```

Claude will:

* Detect new commands or changed functionality
* Update tutorials, cheat sheets, and release notes
* Keep the training fully synchronized with the installed CLI

---

## Using the Generated Training

* Overview: `training/overview.md`
* Command reference: `training/commands.md`
* Workflows: `training/workflows.md`
* Tutorials: `training/tutorials/`
* Hands-on labs: `training/labs/`
* Cheat sheets: `training/cheatsheets/`
* Release notes: `training/release_notes/`

**Recommended workflow:**

1. Start with `training/overview.md`
2. Progress through tutorials in order
3. Attempt labs to practice concepts
4. Reference cheat sheets as needed

---

## Advanced Tips

* Keep the `workspace/` folder in `.gitignore` (it contains local generated files)
* You can add additional prompts in `prompts/` for new features or workflows
* Claude can automatically detect new versions and update documentation if you re-run the bootstrap script

---

## Contributing

* Update prompts in the `prompts/` folder
* Add new tutorials, labs, or cheat sheets under `training/`
* Use the bootstrap script to regenerate documentation before committing
* Submit pull requests for review

---

## Goal

This repository is designed to provide a **self-maintaining, hands-on learning system** for Claude CLI, making it easy for developers to get up to speed and stay current with CLI updates.

````

