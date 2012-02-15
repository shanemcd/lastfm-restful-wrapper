require_relative '../request.rb'
# require_relative '../base.rb'

module Lastfm
  class Artist #< Lastfm::Base
    include Lastfm::Request

    class << self

      def build_url(method, artist)
        Lastfm::Request.get("/2.0/?method=artist.#{method}&artist=#{artist}&format=json&api_key=#{Lastfm.api_key}")
      end

      def get_similar(artist)
        build_url "getsimilar", artist
      end

    end
  end
end