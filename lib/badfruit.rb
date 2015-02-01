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

#
# Module BadFruit provides a set of classes and functions for interacting with the Rotten Tomatoes API.
#
module BadFruit
  #
  # Create a new instance of the BadFruit API client.
  #
  # @param [String] apikey The API key to use in the client.
  #
  # @return [BadFruit::Base] A newly instantiated BadFruit API Client.
  # 
  def self.new(apikey)
    BadFruit::Base.new(apikey)
  end
end
