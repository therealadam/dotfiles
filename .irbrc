begin
  require 'pry'
  Pry.start
rescue LoadError
  puts "Sadly, pry could not be loaded."
end

exit
