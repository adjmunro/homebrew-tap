# Git Workflow

Git conventions and workflows for this repository.

## Branching Strategy

- `master` - Main branch, stable formulas only
- Feature branches - For developing new formulas or major updates
- Worktrees - For parallel development

## Commit Messages

Follow conventional commit style:

```
formula-name: brief description

Detailed explanation if needed.

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
```

### Examples

```
webtags: update to 1.2.3

Bump version with bug fixes and performance improvements.
```

```
Add new formula for myapp

Initial formula for myapp with basic installation.
```

## Git Worktrees

Use worktrees for parallel development without stashing changes.

### Create a worktree
```bash
just wt-create feature/new-formula
# or
just wtc feature/new-formula
```

This creates a new worktree at `../wt-feature-new-formula`.

### List worktrees
```bash
just wt-list
# or
just wtls
```

### Remove a worktree
```bash
just wt-remove ../wt-feature-new-formula
# or
just wtrm ../wt-feature-new-formula
```

### Manual worktree commands
```bash
# Create worktree
git worktree add -b feature/name ../wt-name

# List worktrees
git worktree list

# Remove worktree
git worktree remove ../wt-name
```

## Pull Requests

Not typically used for this personal tap, but if collaborating:

1. Create feature branch
2. Make changes
3. Test thoroughly
4. Create PR with description
5. Merge to master

## Tags

Tag releases when formulas reference specific versions:

```bash
git tag -a webtags-1.2.3 -m "WebTags formula for v1.2.3"
git push origin webtags-1.2.3
```

## Best Practices

- Test formulas before committing
- Audit formulas with `just audit <name>`
- Keep commits focused and atomic
- Write clear commit messages
- Don't commit sensitive information
