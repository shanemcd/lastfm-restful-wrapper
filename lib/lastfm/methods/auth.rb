require File.join(Dir.pwd, '/lastfm/base.rb')
require File.join(Dir.pwd, '/lastfm/request.rb')

require 'launchy'

module Lastfm
  class Auth < Lastfm::Base
    include Lastfm::Request

    class << self

      def build_url(method, artist)
        Lastfm::Request.get(method, artist)
      end

      def authorize
        response = Lastfm::Request.get_authed
        token = response['token']
        Launchy.open("http://www.last.fm/api/auth/?api_key=#{Lastfm.api_key}&token=#{token}")
      end
    end
  end
end