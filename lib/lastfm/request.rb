require 'faraday'
require 'faraday_middleware'

module Lastfm
  module Request
    @connection ||=Faraday.new(:url => 'http://ws.audioscrobbler.com') do |builder|
      builder.use Faraday::Request::UrlEncoded   
      builder.use Faraday::Adapter::NetHttp
      builder.use Faraday::Response::ParseJson
      builder.use Faraday::Response::Logger
    end

    class << self

      def get(method, specifier)
        @connection.get do |req|
          req.url '/2.0/'
          req.params['method'] = method
          # Change this to be whatever API method is called
          req.params[method.split(".")[0]] = specifier
          req.params['api_key'] = Lastfm.api_key
          req.params['format'] = 'json'
        end
      end

      def get_authed
        response = @connection.get do |req|
          req.url '/2.0/'
          req.params['method'] = "auth.gettoken"
          req.params['api_key'] = Lastfm.api_key
          req.params['format'] = "json"
        end
      end

      def get_session(key, token, signature)
        response = @connection.get do |req|
          req.url '/2.0/'
          req.params['method'] = "auth.getSession"
          req.params['api_key'] = key
          req.params['token'] = token
          req.params['api_sig'] = signature
          req.params['format'] = "json"
        end
      end

    end
  end
end