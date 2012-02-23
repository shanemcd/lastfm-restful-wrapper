require File.join(Dir.pwd, '/lastfm/base.rb')
require File.join(Dir.pwd, '/lastfm/request.rb')

module Lastfm
  class User < Lastfm::Base
    include Lastfm::Request

    methods_without_auth :getinfo, :getfriends, :get, :getlovedtracks

    class << self

      def build_url(method, user)
        Lastfm::Request.get(method, user)
      end

    end
  end
end