# Conventions and Standards

Documentation for coding standards and conventions.

## Available Guides

- **[Formula Conventions](formula-conventions.md)** - Standards for writing Homebrew formulas

## Key Principles

1. **Clarity** - Formulas should be easy to read and understand
2. **Consistency** - Follow Homebrew's established patterns
3. **Completeness** - Include proper tests and documentation
4. **Compliance** - Pass `brew audit --strict` before committing

Always audit formulas before committing:
```bash
just audit <formula-name>
```
