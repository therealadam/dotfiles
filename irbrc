begin
  require 'pry'
  Pry.start
  exit
rescue LoadError
  puts "Sadly, pry could not be loaded."
end

# TODO Conditionally enable Hirb

# TODO Conditionally load any customizations (e.g. shortcuts for loading my
# user)
