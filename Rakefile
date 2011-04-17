require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('badfruit', '0.0.5') do |p|
  p.description     = "Interface with the Rotten Tomatoes API"
  p.url             = "http://www.github.com/brianmichel/badfruit"
  p.author          = "Brian Michel"
  p.email           = "brian.michel@gmail.com"
  p.runtime_dependencies = ["json", "httparty"]
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext } 