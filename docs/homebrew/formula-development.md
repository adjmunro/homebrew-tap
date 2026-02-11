# Formula Development

Guide for creating and testing Homebrew formulas in this tap.

## Creating a New Formula

1. Create a new file in `Formula/` directory:
   ```bash
   touch Formula/myapp.rb
   ```

2. Use Homebrew's formula template:
   ```ruby
   class Myapp < Formula
     desc "Description of your application"
     homepage "https://github.com/username/myapp"
     url "https://github.com/username/myapp/archive/v1.0.0.tar.gz"
     sha256 "shasum_of_tarball"
     license "MIT"

     def install
       # Installation logic
       bin.install "myapp"
     end

     test do
       # Test logic
       system "#{bin}/myapp", "--version"
     end
   end
   ```

## Testing Locally

### Install from source
```bash
just test-formula myapp
# or
brew install --build-from-source ./Formula/myapp.rb
```

### Audit for issues
```bash
just audit myapp
# or
brew audit --strict --online ./Formula/myapp.rb
```

### Run formula tests
```bash
brew test myapp
```

## Common Formula Patterns

### Binary-only installations
```ruby
def install
  bin.install "myapp"
  man1.install "myapp.1"
end
```

### Build from source
```ruby
depends_on "go" => :build

def install
  system "go", "build", *std_go_args(ldflags: "-s -w")
end
```

### Installation with configuration
```ruby
def install
  bin.install "myapp"
  (etc/"myapp").install "config.example.yml" => "config.yml"
end
```

## Debugging

### Verbose output
```bash
brew install --verbose --debug ./Formula/myapp.rb
```

### Interactive debugging
```bash
brew irb
```

## Resources

- [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Ruby API Documentation](https://rubydoc.brew.sh/Formula)
