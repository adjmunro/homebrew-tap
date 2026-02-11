# Tap Usage

How users install and use formulas from this tap.

## Installing the Tap

Users add this tap to their Homebrew:

```bash
brew tap adjmunro/tap
```

Or with full URL:
```bash
brew tap adjmunro/tap https://github.com/adjmunro/homebrew-tap
```

## Installing Formulas

Once tapped, formulas can be installed by name:

```bash
brew install webtags
```

Or with the full tap name:
```bash
brew install adjmunro/tap/webtags
```

## Upgrading Formulas

Users upgrade formulas like any other Homebrew package:

```bash
brew update
brew upgrade webtags
```

## Listing Installed Formulas

Show formulas installed from this tap:

```bash
brew list --formula | grep adjmunro/tap
```

## Uninstalling

Remove a formula:
```bash
brew uninstall webtags
```

Remove the tap:
```bash
brew untap adjmunro/tap
```

## Troubleshooting

### Formula not found
```bash
# Update tap
brew update

# Try full name
brew install adjmunro/tap/webtags
```

### Installation fails
```bash
# Try verbose mode
brew install --verbose webtags

# Check formula audit
brew audit adjmunro/tap/webtags
```

### Conflicts with other taps
```bash
# Use full tap/formula name
brew install adjmunro/tap/webtags
```
