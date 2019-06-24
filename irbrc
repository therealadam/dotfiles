begin
  # require 'pry'
  # Pry.start
  # exit
rescue LoadError
  puts "Sadly, pry could not be loaded."
end

begin
  require "awesome_print"
rescue LoadError
  puts "Sadly, ap is not awesome"
end
