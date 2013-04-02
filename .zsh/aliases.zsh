alias ...='cd ../..'
alias -- -='cd -'
alias _='sudo'
alias history='fc -l 1'

alias ..='cd ..'
alias ...='cd ../..'

alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v'

# vi
alias vi="~/Applications/MacVim.app/Contents/MacOS/Vim"
alias vim="~/Applications/MacVim.app/Contents/MacOS/Vim"

# Editing
alias e="vim"

# Git
alias g='git'
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

# Network debugging
alias traffic='sudo tcpdump -XS -i'
alias httpflow='sudo tcpflow -c port 80'
alias tcplisteners="lsof -i -P | grep LISTEN"

# Gems
alias gemi='gem install'
alias gemun='gem uninstall'
alias gems='gem search'

# Servers
alias start_mysql="mysql.server start"
alias start_redis="redis-server ~/Develop/homebrew/etc/redis.conf"

# Stuff
alias xmlpretty="xmllint --format -f"
alias freq='cut -f1 -d" " ~/.zsh_history | sort | uniq -c | sort -nr | head -n 30'

# tmux
alias tn="tmux new -s $0"
alias ta="tmux attach"

# Ruby
alias be="bundle exec"
