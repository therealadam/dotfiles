# vim
Pry.config.editor = "atom"

# Toys methods
# Stealed from https://gist.github.com/807492
class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end

begin
  include Rails::ConsoleMethods
  puts "Loaded Rails helpers"
rescue
end

local = Pathname.new(".pry-local.rb")
if local.exist?
  load local.to_s
  puts "Loaded #{local}"
end
