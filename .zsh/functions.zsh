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
