# Releasing

Process for releasing new versions of formulas.

## Release Checklist

### 1. Prepare the Release

1. Tag the release in the upstream project:
   ```bash
   git tag -a v1.2.3 -m "Release version 1.2.3"
   git push origin v1.2.3
   ```

2. Generate release tarball and get SHA256:
   ```bash
   # GitHub automatically creates release tarballs
   # Download and compute SHA256
   curl -L https://github.com/user/project/archive/v1.2.3.tar.gz -o project-1.2.3.tar.gz
   shasum -a 256 project-1.2.3.tar.gz
   ```

### 2. Update the Formula

Edit `Formula/myapp.rb`:

```ruby
class Myapp < Formula
  url "https://github.com/user/myapp/archive/v1.2.3.tar.gz"
  sha256 "new_sha256_here"
  # ... rest of formula
end
```

### 3. Test the Update

```bash
# Test installation
just test-formula myapp

# Run formula tests
brew test myapp

# Audit for issues
just audit myapp
```

### 4. Commit and Push

```bash
git add Formula/myapp.rb
git commit -m "myapp: update to 1.2.3"
git push origin master
```

### 5. Notify Users

Users can upgrade with:
```bash
brew update
brew upgrade myapp
```

## Version Bumps

### Major version (breaking changes)
- Update formula class name if needed
- Update dependencies if API changed
- Document breaking changes in commit message

### Minor version (new features)
- Straightforward version bump
- Test new features work as expected

### Patch version (bug fixes)
- Quick version bump
- Verify fix is included

## Bottle Building (Optional)

For faster installations, you can build bottles:

```bash
brew install --build-bottle ./Formula/myapp.rb
brew bottle myapp
```

Then update the formula with bottle DSL.

## Troubleshooting

### SHA256 mismatch
- Re-download the tarball
- Verify the URL is correct
- Check GitHub release tags

### Build failures
- Test locally first with `--verbose --debug`
- Check for new dependencies
- Verify build instructions haven't changed
