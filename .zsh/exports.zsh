# grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# pager
export PAGER=less
export LC_CTYPE=en_US.UTF-8

# the greatest environment variable of all time
export EDITOR="/usr/bin/vim"

# I put stuff in odd-ish places
export PATH=/usr/local/bin:$PATH # My custom stuff
export PATH=`brew --prefix`/bin:`brew --prefix`/sbin:$PATH # Homebrew
export PATH=~/Develop/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

export MANPATH=$MANPATH:/usr/local/man:`brew --prefix`/share/man

# export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home

export CDPATH=.:~/Develop/:~/Desktop/:/Volumes/NextUpdate

# export ARCHFLAGS='-arch x86_64'

