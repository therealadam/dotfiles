# vim
Pry.config.editor = "atom"

begin
  include Rails::ConsoleMethods
  puts "[AK] Loaded: Rails helpers"
rescue
end

require 'pathname'

local = Pathname.new(".pry-local.rb")
if local.exist?
  load local.to_s
  puts "[AK] Loaded: #{local}"
end

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'

  puts "[AK] PryByeBug: (c)ontinue, (s)tep, (n)ext, (f)inish"
end
