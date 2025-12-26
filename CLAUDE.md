# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository that manages macOS development environment configuration. The setup is built around Mise for both runtime version management and task automation, with Homebrew for package management.

## Key Architecture Components

### Simple Symlink-based Management
- Dotfiles are symlinked from `~/.dotfiles` to home directory
- Setup managed via Mise task: `mise run setup`
- No external dependencies on other dotfile repositories
- Automatic backup of existing files before symlinking

### Single Repository Design
- All configurations are self-contained in this repository
- No base/override pattern - each dotfile is complete and standalone
- Host-specific configurations can be sourced optionally (`.zshrc.host`, `.secrets`)

### Development Environment Stack
- **Runtime Management**: Mise (`config/mise/config.toml`) manages Go, Node, Ruby, Python, Deno versions
- **Task Automation**: Mise tasks for setup and maintenance operations
- **Package Management**: Homebrew with `Brewfile` for system dependencies and applications
- **Shell**: Zsh with custom prompt (`🍔 `) and PATH modifications
- **Custom Tooling**: Python-based MCP server for Bear notes integration (`bin/ak-mcp.py`)

## Common Commands

### Initial Setup/Bootstrap
```bash
# Clone repository
git clone https://github.com/therealadam/dotfiles ~/.dotfiles
cd ~/.dotfiles

# Set up dotfiles (creates symlinks)
mise run setup

# Install Homebrew packages
brew bundle install
```

### Daily Operations
```bash
# List available tasks
mise tasks

# Re-link all dotfiles after changes
mise run setup

# Find unmanaged dotfiles
mise run unmanaged

# Install/update Homebrew packages
brew bundle install --file ~/.dotfiles/Brewfile

# Update development runtimes
mise install
mise use go@latest node@latest ruby@3 python@latest
```

### MCP Server
```bash
# Run Bear notes MCP server
~/.dotfiles/bin/ak-mcp.py

# The server requires uv and provides Bear database querying functionality
```

## File Structure Patterns

- **Dotfiles**: Files in root directory without leading dot (e.g., `zshrc`, `gitconfig`) are symlinked to `~/.*`
- **Host-specific**: Optional files `~/.zshrc.host` and `~/.secrets` are sourced if they exist
- **Binary scripts**: `bin/` contains executable utilities with various languages
- **Configuration**: `config/` holds application-specific configurations (mise, etc.)
- **Claude Code**: `claude/` contains agents, commands, and settings for Claude Code

## Important Environment Variables

- `HOMEBREW_NO_AUTO_UPDATE=1` - Prevents automatic Homebrew updates
- `OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES` - Ruby macOS compatibility workaround
- `PLAYDATE_SDK_PATH=/usr/local` - Playdate development SDK location
- Multiple PATH additions for local binaries, Cargo, ICU4C tools

## Development Workflow Notes

- Changes to dotfiles require `mise run setup` to re-symlink (though most already symlinked)
- Brewfile changes need `brew bundle install` to apply
- Mise configuration changes auto-apply via shell activation
- The setup expects `~/.dotfiles` as the working directory for the cloned repository
- Justfile exists as a convenience wrapper around mise tasks

## Mise Tasks

Tasks are defined in `config/mise/config.toml`:

- `setup` - Create symlinks for all dotfiles (with automatic backup)
- `unmanaged` - Find dotfiles in home directory not managed by this repository

Run `mise tasks` to see all available tasks.
