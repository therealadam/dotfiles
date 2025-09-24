# Dotfiles management commands

# Update thoughtbot dotfiles and refresh RCM links
pull-upstream:
    @echo "🔄 Updating thoughtbot dotfiles..."
    cd ~/Setup/dotfiles-thoughtbot && git pull
    @echo "🔗 Running rcup to refresh dotfile links..."
    rcup
    @echo "✅ thoughtbot dotfiles updated and RCM refreshed!"

# Add a file or directory to dotfiles management via RCM
add FILE:
    @echo "📁 Adding {{FILE}} to RCM management..."
    mkrc {{FILE}}
    @echo "🔗 Running rcup to create symlink..."
    rcup
    @echo "✅ {{FILE}} added to dotfiles!"

# Find dotfiles in ~ that aren't managed by RCM
unmanaged:
    #!/usr/bin/env bash
    set -euo pipefail
    find ~ -maxdepth 1 -name '.*' -type f | while read file; do
      if [ -L "$file" ]; then
        # Check if symlink points to dotfiles directories
        target=$(readlink "$file")
        if [[ "$target" != *"/.dotfiles"* ]] && [[ "$target" != *"/.dotfiles-thoughtbot"* ]]; then
          echo "$(basename "$file") (symlink to: $target)"
        fi
      else
        # Regular file, not managed
        echo "$(basename "$file")"
      fi
    done | sort
