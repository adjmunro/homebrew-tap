# Homebrew Tap - Project Commands
# Install `just` via Homebrew with `brew install just`
# Run `just` or `just --list` to see all available commands

# Default recipe - show help
default:
    @just --list

# Install the tap locally for testing
install-tap:
    brew tap adjmunro/tap file://$(pwd)

# Uninstall the tap
uninstall-tap:
    brew untap adjmunro/tap

# Test a formula locally
test-formula FORMULA:
    brew install --build-from-source ./Formula/{{FORMULA}}.rb

# Audit a formula for style and correctness
audit FORMULA:
    brew audit --strict --online ./Formula/{{FORMULA}}.rb

# Lint all formulas
lint:
    @for formula in Formula/*.rb; do \
        echo "Auditing $$formula..."; \
        brew audit --strict "$$formula" || true; \
    done

# List all formulas in this tap
list:
    @ls -1 Formula/*.rb 2>/dev/null | xargs -n1 basename | sed 's/\.rb$$//' || echo "No formulas found"

alias wtc := wt-create
# Create a new worktree
# Usage: just wt-create <branch-name> [path]
wt-create BRANCH PATH="":
    #!/usr/bin/env bash
    set -euo pipefail

    # Default path if not provided
    if [ -z "{{PATH}}" ]; then
        WORKTREE_PATH="../wt-$(basename {{BRANCH}})"
    else
        WORKTREE_PATH="{{PATH}}"
    fi

    echo "Creating worktree for branch '{{BRANCH}}' at '$WORKTREE_PATH'..."
    git worktree add -b "{{BRANCH}}" "$WORKTREE_PATH"

    echo ""
    echo "Copying worktree files to new worktree..."
    if [ -f "./scripts/copy-worktree-files.sh" ]; then
        ./scripts/copy-worktree-files.sh "$WORKTREE_PATH"
    fi

    echo ""
    echo "✓ Worktree setup complete!"
    echo "  cd $WORKTREE_PATH"

alias wtls := wt-list
# List all worktrees
wt-list:
    @git worktree list

alias wtrm := wt-remove
# Remove a worktree
wt-remove PATH:
    git worktree remove {{PATH}}

alias reagent := symlink-claude
# Setup CLAUDE.md symlinks to AGENTS.md files
symlink-claude:
    @./scripts/symlink-claude.sh

# Clean any build artifacts or caches
clean:
    @echo "Cleaning Homebrew cache..."
    @brew cleanup || true
