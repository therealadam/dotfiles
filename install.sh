#!/usr/bin/env bash
set -e

echo "🍔 Setting up dotfiles..."

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

# Symlink dotfiles
echo "Symlinking dotfiles..."
make all

# Install mise runtimes
if command -v mise &> /dev/null; then
  echo "Installing mise runtimes..."
  mise install
fi

echo "✓ Setup complete! Restart your shell or run: source ~/.zshrc"
