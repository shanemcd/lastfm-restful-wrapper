require "faraday"
require "faraday_middleware"

Dir[File.dirname(__FILE__) + '/lastfm/*.rb'].each do |file|
  require file
end

require_relative 'lastfm/methods/artist.rb'

module Lastfm
  extend Config
  class << self

  end
end