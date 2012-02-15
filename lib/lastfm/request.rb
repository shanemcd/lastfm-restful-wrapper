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

      def get(path)
        @connection.get(path)
      end
      
    end
  end
end