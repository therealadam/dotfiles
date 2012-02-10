# Lifted from oh-my-zsh
# Rails 3 aliases, backwards-compatible with Rails 2.

function _rails_command () {
  if [ -e "script/server" ]; then
    ruby script/$@
  else
    ruby script/rails $@
  fi
}

alias rc='_rails_command console'
alias rd='_rails_command destroy'
alias rdbc='_rails_command dbconsole'
alias rdbm='rake db:migrate db:test:clone'
alias rg='_rails_command generate'
alias rr='_rails_command runner'
alias rs='_rails_command server'
alias rsd='_rails_command server --debugger'
alias rlog='tail -f log/development.log'
alias rdb='rake db:migrate'
alias rdbr='rake db:rollback'

