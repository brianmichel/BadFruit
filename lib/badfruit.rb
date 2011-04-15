require 'httparty'
require 'JSON'
require 'cgi'

require File.join(File.expand_path(File.dirname(__FILE__) + '/badfruit/base'))
require File.join(File.expand_path(File.dirname(__FILE__) + '/badfruit/lists'))
require File.join(File.expand_path(File.dirname(__FILE__) + '/badfruit/movies'))

module Badfruit
  VERSION = "0.0.1"
  
  def self.new()
    BadFruit::Base.new
  end
end