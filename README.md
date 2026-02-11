# Homebrew Tap

Personal Homebrew tap for various projects.

## Installation

```bash
brew tap adjmunro/tap https://github.com/adjmunro/homebrew-tap
```

## Available Formulas

### WebTags

Git-synced browser bookmark tagging extension with native messaging host.

```bash
brew install webtags
```

This installs:
- `webtags-host` - Native messaging host binary
- Native messaging manifests for Chrome/Firefox/Safari
- Setup scripts and documentation

After installation, follow the setup instructions to configure the browser extension.

## Updating Formulas

When releasing a new version:

1. Update the formula with new version and SHA256
2. Commit and push to the tap repository
3. Users can upgrade with `brew upgrade webtags`

## Formula Development

To test formulas locally:

```bash
brew install --build-from-source ./Formula/webtags.rb
```

## License

MIT
