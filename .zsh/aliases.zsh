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
alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

# Editing
alias e="vim"

# Git
alias g='git'
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gcb='nocorrect g cb'
alias hpr="hub pull-request"

# Network debugging
alias traffic='sudo tcpdump -XS -i'
alias httpflow='sudo tcpflow -c port 80'
alias tcplisteners="lsof -i -P | grep LISTEN"

# Stuff
alias xmlpretty="xmllint --format -f"
alias freq='cut -f1 -d" " ~/.zsh_history | sort | uniq -c | sort -nr | head -n 30'

# tmux
alias tn="tmux new -s"
alias ta="tmux attach"
alias tl="tmux ls"
alias tacc="tmux -CC attach"

# Ruby
alias be="bundle exec"
alias rspec="nocorrect rspec"
alias spring="nocorrect spring"
