require_relative '../request.rb'
require_relative '../base.rb'

module Lastfm
  class Artist < Lastfm::Base
    include Lastfm::Request

    class << self

      def build_url(method, artist)
        Lastfm::Request.get(method, artist)
      end

      def get_similar(artist)
        build_url "artist.getsimilar", artist
      end

      

    end
  end
end