require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('badfruit', '1.0.0') do |p|
  p.description     = "Interface with the Rotten Tomatoes API"
  p.url             = "http://www.github.com/brianmichel/badfruit"
  p.author          = "Brian Michel"
  p.email           = "brian.michel@gmail.com"
  p.development_dependencies = ["cucumber"]
  p.runtime_dependencies = ["json", "httparty"]
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext } 