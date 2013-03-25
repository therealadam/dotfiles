# mkdir and cd to it
function mcd() {
  mkdir -p "$1" && cd "$1";
}

function zsh_stats() {
  history | awk '{print $2}' | sort | uniq -c | sort -rn | head
}

function notify() {
  growlnotify -s -m $1
  say $1
}

function pt() {
  papertrail -f -d 5 $_ | colortail -g papertrail
}

function tg() {
  tail -f $1 | grep $2
}

function grok() {
  search_path=$1
  pattern=$2
  tmp=`mktemp /tmp/grok.XXX`

  for i in `find $search_path -name "$2" -print`; do
    echo "##### $i #####\n" >> $tmp
    cat $i >> $tmp
  done

  vi -c 'set ft=ruby' $tmp
}

function writer() {
  file=$1

  open -a "iA Writer" $1
}

function marked() {
  file=$1

  open -a "Marked.app" $1
}
