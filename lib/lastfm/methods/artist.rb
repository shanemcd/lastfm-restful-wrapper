require File.join(Dir.pwd, '/lastfm/base.rb')
require File.join(Dir.pwd, '/lastfm/request.rb')

module Lastfm
  class Artist < Lastfm::Base
    include Lastfm::Request

    artist_methods_without_auth :getsimilar, :getinfo, :getshouts, :gettags, :gettoptags

    class << self

      def build_url(method, artist)
        Lastfm::Request.get(method, artist)
      end

    end
  end
end