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
fpath=($ZSH/completion $fpath)

# Use .localrc for system-specific settings
[[ -f ~/.localrc ]] && .  ~/.localrc

# Let RVM do its thing
unsetopt auto_name_dirs # Fix unwanted rvm var expansion
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Autojump is wholly great
if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

eval "$(rbenv init -)"
