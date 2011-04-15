require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('badfruit', '0.0.1') do |p|
  p.description     = "Interface with the Rotten Tomatoes API"
  p.url             = "http://www.github.com/brianmichel/badfruit"
  p.author          = "Brian Michel"
  p.email           = "brian.michel@gmail.com"
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext } 