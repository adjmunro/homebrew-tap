# Project Commands

Reference for all `just` commands available in this repository.

## Prerequisites

Install `just` command runner:
```bash
brew install just
```

## Command Reference

### Help and Discovery

```bash
just            # Show all available commands
just --list     # Same as above
```

### Homebrew Operations

#### Install tap locally
```bash
just install-tap
```
Adds this tap to your local Homebrew for testing.

#### Uninstall tap
```bash
just uninstall-tap
```
Removes this tap from your local Homebrew.

#### Test a formula
```bash
just test-formula webtags
```
Installs the formula from source for testing.

#### Audit a formula
```bash
just audit webtags
```
Runs Homebrew's audit tool to check for issues.

#### Lint all formulas
```bash
just lint
```
Audits all formulas in the tap.

#### List formulas
```bash
just list
```
Shows all available formulas in the tap.

### Git Worktree Commands

#### Create worktree
```bash
just wt-create feature/new-formula
just wtc feature/new-formula                    # Alias
just wt-create feature/name ../custom/path      # Custom path
```
Creates a new worktree with a new branch.

#### List worktrees
```bash
just wt-list
just wtls        # Alias
```
Shows all worktrees.

#### Remove worktree
```bash
just wt-remove ../wt-feature-new-formula
just wtrm ../wt-feature-new-formula      # Alias
```
Removes a worktree.

### Agent Support

#### Setup CLAUDE.md symlinks
```bash
just symlink-claude
just reagent             # Alias
```
Creates symlinks from AGENTS.md to CLAUDE.md files for agent support.

### Maintenance

#### Clean
```bash
just clean
```
Cleans Homebrew cache.

## Custom Commands

You can add custom commands to the `justfile`. Common patterns:

### Run a specific test
```bash
just test-formula myapp
```

### Batch operations
```bash
just lint  # Audits all formulas
```

## Tips

- Use tab completion in supported shells
- Combine commands with `&&` for workflows
- Check `justfile` for implementation details
- Add your own custom commands as needed
