# This is the most important part!
export PS1="🍔 "

# PATH modifications
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Environment variables
export HOMEBREW_NO_AUTO_UPDATE=1
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES  # Workaround for Ruby+macOS
export PLAYDATE_SDK_PATH=/usr/local

# Minimal aliases
alias vi="vim"
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# Git shortcuts
alias g='git'

# Navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Tool activation and completions
eval "$(mise activate zsh)"
source <(jj util completion zsh)

# Conditional sourcing
[ -f ~/.secrets ] && source ~/.secrets
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
