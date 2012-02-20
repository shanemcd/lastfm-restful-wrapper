require 'faraday'
require 'faraday_middleware'

module Lastfm
  module Request
    @connection ||=Faraday.new(:url => 'http://ws.audioscrobbler.com') do |builder|
      builder.use Faraday::Request::UrlEncoded   
      builder.use Faraday::Adapter::NetHttp
      builder.use Faraday::Response::ParseJson
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
    end
  end
end