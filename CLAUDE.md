# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository that manages macOS development environment configuration. The setup is built around Mise tasks for dotfile linking, Homebrew for package management, and Mise for runtime version management.

## Key Architecture Components

### Mise-based Dotfile Management
- Dotfiles are symlinked via mise tasks defined in `mise.toml`
- `dotfiles:link:all` runs all link subtasks
- `dotfiles:link:base` links shell, git, and tmux configs to `$HOME`
- `dotfiles:link:tools` links configs under `$HOME/.config/`
- `dotfiles:link:bin` links all scripts in `bin/` to `$HOME/.local/bin/`

### Configuration System
- Single-layer configuration owned entirely by this repo
- Secret files sourced conditionally (`.secrets`)

### Development Environment Stack
- **Runtime Management**: Mise (`config/mise/config.toml`) manages Go, Node, Ruby, Python, Deno versions
- **Package Management**: Homebrew with `Brewfile` for system dependencies and applications
- **Shell**: Zsh with custom prompt (`🍔 `) and PATH modifications
- **Custom Tooling**: Python-based MCP server for Bear notes integration (`bin/ak-mcp.py`)

## Common Commands

### Initial Setup/Bootstrap
```bash
# Bootstrap new machine
git clone [this-repo] ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

### Daily Operations
```bash
# Re-link all dotfiles after changes
mise run dotfiles:link:all

# Link only bin scripts (e.g. after adding a new script)
mise run dotfiles:link:bin

# Install/update Homebrew packages
brew bundle install

# Update development runtimes
mise install
mise use go@latest node@latest ruby@3 python@latest
```

### MCP Server
```bash
# Run Bear notes MCP server
./bin/ak-mcp.py

# The server requires uv and provides Bear database querying functionality
```

## File Structure Patterns

- **Binary scripts**: `bin/` contains executable utilities; all are symlinked to `~/.local/bin/`
- **Configuration**: `config/` holds application-specific configurations (mise, ghostty, nvim, etc.)

## Important Environment Variables

- `HOMEBREW_NO_AUTO_UPDATE=1` - Prevents automatic Homebrew updates
- `OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES` - Ruby macOS compatibility workaround
- `PLAYDATE_SDK_PATH=/usr/local` - Playdate development SDK location
- Multiple PATH additions for local binaries, Cargo, ICU4C tools

## Development Workflow Notes

- Changes to dotfiles require `mise run dotfiles:link:all` to re-symlink
- New scripts added to `bin/` are picked up automatically by `dotfiles:link:bin`
- Brewfile changes need `brew bundle install` to apply
- Mise configuration changes auto-apply via shell activation
