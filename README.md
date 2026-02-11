# adjmunro/tap - Homebrew Tap

[![Homebrew](https://img.shields.io/badge/Homebrew-tap-orange)](https://github.com/adjmunro/homebrew-tap)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Personal Homebrew tap for custom formulas.

## For Users

### Quick Start

```bash
# Add tap and install
brew tap adjmunro/tap
brew install webtags
```

### Available Formulas

#### [WebTags](https://github.com/adjmunro/webtags) - Git-Synced Browser Bookmark Tagging

Transform your browser bookmarks into a powerful tagging system with automatic Git/GitHub synchronization.

**Features:**
- 🏷️ Hierarchical tag system
- 🔄 Cross-device sync via Git
- 🔒 Complete data sovereignty
- 🌐 Works with Chrome, Edge, Firefox, Zen, Brave, Safari
- ⚡ Fast binary installation (~2 seconds)

**Quick Setup:**
```bash
brew install webtags
curl -sSL https://raw.githubusercontent.com/adjmunro/webtags/master/scripts/setup-manifests.sh | bash
```

**Documentation:** [github.com/adjmunro/webtags](https://github.com/adjmunro/webtags)

---

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
