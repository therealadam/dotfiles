# This is the most important part!
export PS1="🍔 "

# PATH modifications
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# Environment variables
export HOMEBREW_NO_AUTO_UPDATE=1

# Minimal aliases
alias vi="vim"
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias reload="source ~/.zshrc"
alias g='git'
alias ..='cd ..'

# Tool activation and completions
eval "$(mise activate zsh)"
autoload -Uz compinit && compinit
source <(jj util completion zsh)

# Conditional sourcing
[ -f ~/.secrets ] && source ~/.secrets
