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

## Managing Dotfiles

Link all dotfiles or specific components using mise tasks:
```bash
mise run dotfiles:link:all    # Link everything
mise run dotfiles:link:base   # Just zsh, git, tmux, vim
mise run dotfiles:link:tools  # Just mise and ghostty configs
mise run dotfiles:link:bin    # Just bin scripts
mise run dotfiles:clean       # Remove all symlinks

# List all available tasks
mise tasks
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
- **No RCM dependency** - Mise tasks for symlink management
- **Single repository** - No external dependencies
- **Minimal git alias** - Just `g='git'` to keep it simple
- **Navigation shortcuts** - `..`, `...`, `....` for quick directory traversal
- **Mise tasks** - Runtime version management + dotfile management
- **Conservative** - Minimal aliases, easy to understand
