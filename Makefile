DOTFILES := $(shell pwd)
UNAME := $(shell uname)

# Symlink pattern: creates ~/.zshrc from zshrc
$(HOME)/.%: %
	@echo "Linking $< to $@"
	@ln -sf $(DOTFILES)/$< $@

# Config subdirectory pattern: creates ~/.config/mise/config.toml from config/mise/config.toml
$(HOME)/.config/%: config/%
	@echo "Linking $< to $@"
	@mkdir -p $(dir $@)
	@ln -sf $(DOTFILES)/$< $@

# Individual targets
zsh: $(HOME)/.zshrc
git: $(HOME)/.gitconfig $(HOME)/.gitignore
tmux: $(HOME)/.tmux.conf
vim: $(HOME)/.vimrc.bundles
mise: $(HOME)/.config/mise/config.toml

# Optional configs (only if they exist)
ghostty:
	@if [ -f config/ghostty/config ]; then \
		echo "Linking config/ghostty/config to $(HOME)/.config/ghostty/config"; \
		mkdir -p $(HOME)/.config/ghostty; \
		ln -sf $(DOTFILES)/config/ghostty/config $(HOME)/.config/ghostty/config; \
	else \
		echo "Skipping ghostty (config not found)"; \
	fi

# Bin scripts
bin:
	@echo "Linking bin scripts"
	@mkdir -p $(HOME)/.local/bin
	@for script in $(DOTFILES)/bin/*; do \
		ln -sf $$script $(HOME)/.local/bin/$$(basename $$script); \
	done

# Main targets
base: zsh git tmux vim
tools: mise ghostty
all: base tools bin
	@echo "✓ All dotfiles installed"

# Cleanup (remove symlinks)
clean:
	@echo "Removing dotfile symlinks"
	@rm -f $(HOME)/.zshrc $(HOME)/.gitconfig $(HOME)/.tmux.conf $(HOME)/.vimrc.bundles
	@rm -f $(HOME)/.config/mise/config.toml $(HOME)/.config/ghostty/config

.PHONY: all base tools bin clean zsh git tmux vim mise ghostty
