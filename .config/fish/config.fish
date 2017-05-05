set -g -x fish_greeting ""
set -g -x EDITOR 'nvim'

fish_vi_key_bindings

status --is-interactive; and . (rbenv init -|psub)

function byword -d "Open with Byword"
  open -a "Byword" $argv
end

function marked -d "Open with Marked"
  open -a "Marked" $argv
end

function ll
  # https://twitter.com/climagic/status/834084704345284609
  ls -lShra
end
