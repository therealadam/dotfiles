# Dotfiles

Personal macOS development environment configuration.

## Features

- **Simple setup**: Single command to symlink all dotfiles
- **Homebrew integration**: Brewfile for package management
- **Mise**: Runtime version management (Go, Node, Ruby, Python, Deno) and task automation
- **Custom tools**: MCP server for Bear notes integration
- **Shell customization**: Zsh with 🍔 prompt

## Quick Start

### Fresh Machine Setup

1. **Clone this repository**:
   ```bash
   git clone https://github.com/therealadam/dotfiles ~/.dotfiles
   ```

2. **Run setup**:
   ```bash
   cd ~/.dotfiles
   mise run setup
   ```

That's it! Your dotfiles are now symlinked to your home directory.

### What Gets Installed

The `mise run setup` command creates symlinks for:
- Shell configuration (`.zshrc`)
- Git configuration (`.gitconfig`, `.gitignore`)
- Vim configuration (`.vimrc.bundles`, `.ideavimrc`)
- Tmux configuration (`.tmux.conf`)
- Ruby/Rails tools (`.pryrc`, `.railsrc`, `.rspec`)
- Mise configuration (`~/.config/mise/`)
- Utility scripts (`~/.local/bin/`)
- Claude Code configuration (`~/.claude/`)

Existing files are automatically backed up to `~/.dotfiles-backup-TIMESTAMP/`.

## Bootstrap Script

For a complete fresh machine setup using [thoughtbot/laptop](https://github.com/thoughtbot/laptop):

```bash
# Install laptop script first
# Then run the laptop customization
./laptop
```

The `laptop` script will:
- Install Homebrew packages from `Brewfile`
- Set up dotfiles via `mise run setup`
- Clean up after installation

## Common Tasks

All tasks are managed by Mise.

### List available tasks
```bash
mise tasks
```

### Set up/update dotfiles
```bash
mise run setup
```

### Backup existing dotfiles
```bash
mise run backup
```

### Find unmanaged dotfiles
```bash
mise run unmanaged
```

### Test setup in a different directory
```bash
# Create test directory
mkdir -p /tmp/dotfiles-test

# Run setup to that directory
TARGET_DIR=/tmp/dotfiles-test mise run setup

# Verify the symlinks
ls -la /tmp/dotfiles-test
```

### Update Homebrew packages
```bash
cd ~/.dotfiles
brew bundle install
```

### Update development runtimes
```bash
mise install
mise use go@latest node@latest ruby@3 python@latest
```

## Structure

- `bin/` - Utility scripts
- `claude/` - Claude Code configuration (agents, commands, settings)
- `config/mise/config.toml` - Mise configuration (tools, tasks)
- `Brewfile` - Homebrew package list
- Individual dotfiles (`zshrc`, `gitconfig`, `tmux.conf`, etc.)

## Notes

- The setup expects `~/.dotfiles` as the repository location
- Host-specific secrets can be placed in `~/.secrets` (sourced by zshrc)
- Host-specific zsh config can be placed in `~/.zshrc.host` (sourced by zshrc)
- FZF integration available if `~/.fzf.zsh` exists

## Mise Tasks

This dotfiles setup uses Mise for both runtime version management and task automation. Tasks are defined in `config/mise/config.toml`.

Available tasks:
- `setup` - Create symlinks for all dotfiles (with automatic backup)
- `backup` - Backup existing dotfiles without creating symlinks
- `unmanaged` - Find dotfiles in home directory not managed by this repository

All tasks support the `TARGET_DIR` environment variable to specify a custom directory:
```bash
# Backup from a custom location
TARGET_DIR=/tmp/test mise run backup

# Setup to a custom location (useful for testing)
TARGET_DIR=/tmp/test mise run setup
```

See the [Mise documentation](https://mise.jdx.dev/tasks/toml-tasks.html) for more information.
