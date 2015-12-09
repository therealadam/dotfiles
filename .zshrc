# zsh config root
export ZSH=~/.zsh/

# All of this is cargo-culted from oh-my-zsh. It's fine!
source $ZSH/git.zsh
source $ZSH/theme.zsh
source $ZSH/completion.zsh
source $ZSH/correction.zsh
source $ZSH/history.zsh
source $ZSH/vi.zsh
source $ZSH/termtitle.zsh

# Bits of my own, lazy invention
source $ZSH/aliases.zsh
source $ZSH/options.zsh
source $ZSH/functions.zsh
source $ZSH/exports.zsh
source $ZSH/rails.zsh
source $ZSH/keys.zsh

# Load completion functions
fpath=($ZSH/completion $fpath /Users/adam/Develop/homebrew/share/zsh/site-functions)

# Use .localrc for system-specific settings
[[ -f ~/.localrc ]] && .  ~/.localrc

# Autojump is wholly great
if [ -f `brew --prefix`/etc/autojump.sh ]; then
  . `brew --prefix`/etc/autojump.sh
fi

# SO HAX
which rbenv > /dev/null 2>& 1&& eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Load direnv
eval "$(direnv hook zsh)"
