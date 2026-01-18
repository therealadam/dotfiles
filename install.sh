#!/usr/bin/env bash
set -e

echo "✨ Setting up dotfiles..."

# Install Homebrew if needed
if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install packages from Brewfile
if [ -f Brewfile ]; then
  echo "Installing Homebrew packages..."
  brew bundle install
fi

# Install mise runtimes first (needed for mise tasks)
if command -v mise &> /dev/null; then
  echo "Installing mise runtimes..."
  mise install
fi

# Symlink dotfiles using mise tasks
echo "Symlinking dotfiles..."
if command -v mise &> /dev/null; then
  mise run dotfiles:link:all
else
  echo "Warning: mise not found, skipping dotfile linking"
  echo "Install mise first, then run: mise run dotfiles:link:all"
fi

echo "✓ Setup complete! Restart your shell or run: source ~/.zshrc"
