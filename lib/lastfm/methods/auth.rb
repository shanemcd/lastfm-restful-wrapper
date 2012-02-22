require File.join(Dir.pwd, '/lastfm/base.rb')
require File.join(Dir.pwd, '/lastfm/request.rb')

require 'launchy'

module Lastfm
  class Auth < Lastfm::Base
    include Lastfm::Request

    class << self

      def make_signature(key, token, secret)
        Digest::MD5.hexdigest("api_key#{key}methodauth.getSessiontoken#{token}#{secret}")
      end

      def get_token
        response = Lastfm::Request.get_authed
        @token = response.body['token']
        Launchy.open("http://www.last.fm/api/auth/?api_key=#{Lastfm.api_key}&token=#{@token}")
        return @token
      end

      def get_session
        key = Lastfm.api_key
        secret = Lastfm.api_secret
        signature = make_signature(key, @token, secret)
        Lastfm::Request.get_session(key, @token, signature)
      end       
    end
  end
end