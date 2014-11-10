begin
  require 'pry'
  Pry.start
  exit
rescue LoadError
  puts "Sadly, pry could not be loaded."
end

