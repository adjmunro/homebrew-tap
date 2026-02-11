# Development Workflows

Documentation for development tools and workflows.

## Available Guides

- **[Git Workflow](git-workflow.md)** - Branching strategy, commits, and worktrees
- **[Project Commands](project-commands.md)** - Complete `just` command reference

## Quick Start

```bash
# Show all available commands
just

# Create a worktree for parallel development
just wt-create feature/new-formula

# List all worktrees
just wt-list

# Setup CLAUDE.md symlinks
just reagent
```
