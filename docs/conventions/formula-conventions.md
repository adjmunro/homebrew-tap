# Formula Conventions

Standards and best practices for writing formulas in this tap.

## Formula Structure

### Required Elements

Every formula must include:

```ruby
class Myapp < Formula
  desc "One-line description (80 chars max)"
  homepage "https://project-homepage.com"
  url "https://download.url/v1.0.0.tar.gz"
  sha256 "shasum_here"
  license "MIT"  # or appropriate license

  def install
    # Installation logic
  end

  test do
    # Test logic
  end
end
```

### Naming Conventions

- **File name**: lowercase, hyphens for multi-word (e.g., `web-tags.rb`)
- **Class name**: PascalCase matching the product (e.g., `WebTags`)
- **Formula name**: matches file name (e.g., `web-tags`)

## Description Guidelines

- Keep under 80 characters
- Don't start with "A" or "The"
- Be specific and concise
- Don't include the project name

**Good**: "Git-synced browser bookmark tagging extension"
**Bad**: "A tool for tagging bookmarks in your browser"

## Dependencies

### Build dependencies
```ruby
depends_on "go" => :build
depends_on "rust" => :build
```

### Runtime dependencies
```ruby
depends_on "node"
depends_on "python@3.11"
```

### Optional dependencies
```ruby
depends_on "redis" => :optional
```

## Installation Patterns

### Binary installation
```ruby
def install
  bin.install "myapp"
end
```

### Built from source
```ruby
def install
  system "make", "PREFIX=#{prefix}", "install"
end
```

### Multiple files
```ruby
def install
  bin.install "myapp"
  man1.install "docs/myapp.1"
  (etc/"myapp").install "config.example.yml" => "config.yml"
  prefix.install "lib"
end
```

## Testing

Always include a test block:

```ruby
test do
  # Version check is minimum
  system "#{bin}/myapp", "--version"

  # Better: functional test
  output = shell_output("#{bin}/myapp --test")
  assert_match "expected output", output
end
```

## Documentation

### Caveats
Show important post-install information:

```ruby
def caveats
  <<~EOS
    To complete installation:
      1. Run setup: myapp setup
      2. Configure: edit #{etc}/myapp/config.yml
  EOS
end
```

### Service definitions (for daemons)
```ruby
service do
  run [opt_bin/"myapp", "serve"]
  keep_alive true
  log_path var/"log/myapp.log"
  error_log_path var/"log/myapp.log"
end
```

## Style Guide

### Indentation
- Use 2 spaces
- No tabs

### Method order
```ruby
class Myapp < Formula
  desc ""
  homepage ""
  url ""
  sha256 ""
  license ""

  depends_on "dependency"

  def install
  end

  def caveats
  end

  test do
  end
end
```

### String quotes
- Use double quotes for strings
- Use single quotes for shell commands

### Line length
- Keep lines under 100 characters
- Break long method chains

## Common Patterns

### Platform-specific installation
```ruby
def install
  if OS.mac?
    bin.install "myapp-darwin"
  elsif OS.linux?
    bin.install "myapp-linux"
  end
end
```

### Version extraction
```ruby
version = Language::Python.major_minor_version "python3"
```

### Resource installation (for additional files)
```ruby
resource "config" do
  url "https://example.com/config.tar.gz"
  sha256 "shasum"
end

def install
  resource("config").stage do
    (etc/"myapp").install "config.yml"
  end
  bin.install "myapp"
end
```

## Audit Compliance

Before committing, ensure formula passes:

```bash
brew audit --strict --online ./Formula/myapp.rb
```

Common audit failures:
- Missing homepage
- Invalid URL
- Wrong SHA256
- Missing test block
- Description too long
- Incorrect license format

## Resources

- [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Formula Class Documentation](https://rubydoc.brew.sh/Formula)
- [Acceptable Licenses](https://docs.brew.sh/License-Guidelines)
