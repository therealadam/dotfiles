# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository that manages macOS development environment configuration. The setup is built around RCM (RcM) for dotfile management, Homebrew for package management, and Mise for runtime version management.

## Key Architecture Components

### RCM-based Dotfile Management
- Uses RCM with `rcrc` configuration pointing to both this repo and thoughtbot/dotfiles
- Dotfiles are symlinked from `~/.dotfiles` and `~/.dotfiles-thoughtbot`
- `EXCLUDES` in rcrc prevents README and LICENSE files from being linked

### Multi-layered Configuration System
- Base configuration from thoughtbot/dotfiles
- Local overrides in this repository (e.g., `zshrc.local`, `gitconfig.local`)
- Host-specific configurations in `host-*` directories
- Secret files sourced conditionally (`.zshrc.host`, `.secrets`)

### Development Environment Stack
- **Runtime Management**: Mise (`config/mise/config.toml`) manages Go, Node, Ruby, Python, Deno versions
- **Package Management**: Homebrew with `Brewfile` for system dependencies and applications
- **Shell**: Zsh with custom prompt (`🍔 `) and PATH modifications
- **Custom Tooling**: Python-based MCP server for Bear notes integration (`bin/ak-mcp.py`)

## Common Commands

### Initial Setup/Bootstrap
```bash
# Bootstrap new machine (requires thoughtbot/laptop)
cd ~/Setup
git clone https://github.com/thoughtbot/dotfiles dotfiles-thoughtbot
git clone [this-repo] dotfiles
env RCRC=$HOME/Setup/dotfiles-thoughtbot/rcrc rcup
./laptop.local
```

### Daily Operations
```bash
# Re-link all dotfiles after changes
rcup

# Add new dotfile to RCM management
mkrc <existing-file>

# Install/update Homebrew packages
brew bundle install --file ~/Setup/dotfiles/Brewfile

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

- **Local overrides**: Files ending in `.local` extend base thoughtbot configurations
- **Host-specific**: `host-*` directories contain machine-specific configurations
- **Binary scripts**: `bin/` contains executable utilities with various languages
- **Configuration**: `config/` holds application-specific configurations (mise, etc.)

## Important Environment Variables

- `HOMEBREW_NO_AUTO_UPDATE=1` - Prevents automatic Homebrew updates
- `OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES` - Ruby macOS compatibility workaround
- `PLAYDATE_SDK_PATH=/usr/local` - Playdate development SDK location
- Multiple PATH additions for local binaries, Cargo, ICU4C tools

## Development Workflow Notes

- Changes to dotfiles require `rcup` to re-symlink
- Brewfile changes need `brew bundle install` to apply
- Mise configuration changes auto-apply via shell activation
- The setup expects `~/Setup` as the working directory for cloned repositories
