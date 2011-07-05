require 'httparty'
require 'json'
require 'cgi'

require File.join(File.expand_path(File.dirname(__FILE__)), 'badfruit', 'base')
require File.join(File.expand_path(File.dirname(__FILE__)), 'badfruit', 'Movies', 'movies')
require File.join(File.expand_path(File.dirname(__FILE__)), 'badfruit', 'Movies', 'movie')
require File.join(File.expand_path(File.dirname(__FILE__)), 'badfruit', 'Reviews', 'review')
require File.join(File.expand_path(File.dirname(__FILE__)), 'badfruit', 'Actors', 'actor')
require File.join(File.expand_path(File.dirname(__FILE__)), 'badfruit', 'Lists', 'lists')
require File.join(File.expand_path(File.dirname(__FILE__)), 'badfruit', 'Posters', 'posters')
require File.join(File.expand_path(File.dirname(__FILE__)), 'badfruit', 'Scores', 'scores')

module BadFruit
  def self.new(apikey)
    BadFruit::Base.new(apikey)
  end
end