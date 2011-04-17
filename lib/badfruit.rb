require 'httparty'
require 'JSON'
require 'cgi'

require File.join(File.expand_path(File.dirname(__FILE__) + '/badfruit/base'))
require File.join(File.expand_path(File.dirname(__FILE__) + '/badfruit/lists'))
require File.join(File.expand_path(File.dirname(__FILE__) + '/badfruit/Movies/movies'))
require File.join(File.expand_path(File.dirname(__FILE__) + '/badfruit/Movies/movie'))
require File.join(File.expand_path(File.dirname(__FILE__) + '/badfruit/Reviews/review'))
require File.join(File.expand_path(File.dirname(__FILE__) + '/badfruit/Actors/actor'))

module BadFruit
  VERSION = "0.0.1"
  
  def self.new(apikey)
    BadFruit::Base.new(apikey)
  end
end