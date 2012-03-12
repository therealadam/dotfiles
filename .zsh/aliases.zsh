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

# Network debugging
alias traffic='sudo tcpdump -XS -i'
alias httpflow='sudo tcpflow -c port 80'
alias rc='restclient'

# Gems
alias gemi='gem install'
alias gemun='gem uninstall'
alias gems='gem search'

# Servers
alias start_mysql="mysql.server start"
alias start_pgsql="pg_ctl -D /Users/adam/Develop/homebrew/var/postgres -l /Users/adam/Develop/homebrew/var/postgres/server.log start"
alias start_memcached="memcached"
alias start_redis="redis-server ~/Develop/homebrew/etc/redis.conf"
alias start_mongo="mongod run --config /Users/adam/Develop/homebrew/Cellar/mongodb/1.6.1-x86_64/mongod.conf"
alias start_cassandra="~/Develop/cassandra/bin/cassandra -f"

# Stuff
alias xmlpretty="xmllint --format -f"
alias t=todo.sh
