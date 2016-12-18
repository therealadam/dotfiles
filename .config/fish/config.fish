set -g -x fish_greeting ""
set -g -x EDITOR 'nvim'

fish_vi_key_bindings

status --is-interactive; and . (rbenv init -|psub)

