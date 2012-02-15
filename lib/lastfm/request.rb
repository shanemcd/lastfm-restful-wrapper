require 'faraday'
require 'faraday_middleware'

module Lastfm
  module Request
    @connection ||=Faraday.new(:url => 'http://ws.audioscrobbler.com') do |builder|
      builder.use Faraday::Request::UrlEncoded
      builder.use Faraday::Response::Logger     
      builder.use Faraday::Adapter::NetHttp
      builder.use Faraday::Response::ParseJson
    end

    class << self

      def get(method, artist)
        @connection.get do |req|
          req.url '/2.0/'
          req.params['method'] = method
          req.params['artist'] = artist
          req.params['format'] = 'json'
          req.params['api_key'] = Lastfm.api_key
        end
      end
    end
  end
end