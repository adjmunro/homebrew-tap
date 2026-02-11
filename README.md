# Homebrew Tap

Personal Homebrew tap for custom formulas.

## For Users

### Installation

```bash
brew tap adjmunro/tap
```

### Available Formulas

- **webtags** - Git-synced browser bookmark tagging extension

Install with:
```bash
brew install webtags
```

See [Tap Usage](docs/homebrew/tap-usage.md) for more details.

## For Developers

- **[Formula Development](docs/homebrew/formula-development.md)** - Create and test formulas
- **[Releasing](docs/homebrew/releasing.md)** - Release new versions
- **[Project Commands](docs/development/project-commands.md)** - `just` command reference
- **[Git Workflow](docs/development/git-workflow.md)** - Branching and worktrees
- **[Formula Conventions](docs/conventions/formula-conventions.md)** - Writing standards

Quick start for development:
```bash
# Install just command runner
brew install just

# See all available commands
just

# Test a formula locally
just test-formula webtags
```

## License

MIT
