# Dotfiles

Personal macOS development environment configuration with the world's best prompt: 🍔

## Fresh Machine Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/therealadam/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. Run the installation script:
   ```bash
   ./install.sh
   ```

3. Restart your terminal

## Making Changes

1. Edit files directly in `~/.dotfiles/`
2. Changes to `zshrc` require reload: `source ~/.zshrc`
3. Changes to other configs are usually immediate or take effect on app restart

## Selective Installation

Install only specific components:
```bash
make zsh      # Just shell config
make git      # Just git config
make tmux     # Just tmux config
make vim      # Just vim config
make tools    # Just mise/ghostty
make bin      # Just bin scripts
make all      # Everything
```

## Structure

- `zshrc` - Shell configuration (🍔 prompt, aliases, PATH, environment)
- `gitconfig` - Git configuration and aliases
- `tmux.conf` - Tmux configuration (prefix: C-a)
- `vimrc.bundles` - Vim plugins
- `Brewfile` - Installed applications and tools
- `config/` - Application-specific configs
  - `config/mise/config.toml` - Runtime version management
  - `config/ghostty/config` - Terminal emulator config
- `bin/` - Custom scripts
- `claude/` - Claude Code configuration

## Key Features

- **🍔 Prompt** - The most important part
- **No RCM dependency** - Simple Makefile-based symlink management
- **Single repository** - No external dependencies
- **Git aliases** - Shortcuts for common git commands (g, gs, gd, gl, gco, gp, gr)
- **Mise** - Automatic runtime version management for Go, Node, Ruby, Python
- **Conservative** - Minimal aliases, easy to understand

## Future Additions

Based on usage patterns, you might want to add:
- `alias reload='source ~/.zshrc'`
- `alias ..='cd ..'`
- `alias virc='vim ~/.zshrc'`
