# This is the most important part!
export PS1="🍔 "


alias vi="vim"
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"


export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export HOMEBREW_NO_AUTO_UPDATE=1

# Workaround for Ruby+macOS security/runtime issue
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export PLAYDATE_SDK_PATH=/usr/local

[ -f ~/.zshrc.host ] && source ~/.zshrc.host
[ -f ~/.secrets ] && source ~/.secrets
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(mise activate zsh)"

# Completions
source <(jj util completion zsh)
