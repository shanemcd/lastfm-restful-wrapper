module Lastfm
  module Config
    
    API_ROOT = "http://ws.audioscrobbler.com"

    DEFAULT_KEY = nil

    DEFAULT_SECRET = nil

    DEFAULT_CALLBACK = "http://localhost:9393/auth/lastfm/callback"

    CONFIGURATION_KEYS = [
      :api_key,
      :api_secret,
      :api_root,
      :auth_uri,
      :callback
    ]

    attr_accessor *CONFIGURATION_KEYS

    def self.extended(base)
      base.reset
    end

    ## Allows for configuration through a block
    # Lastfm.configure do |config|
    #   config.api_key = "1234567890"
    #   config.api_secret = "123456790"
    # end
    def configure
      yield self
      self
    end

    def options
      options = {}
      CONFIGURATION_KEYS.each { |k| options[k] = send(k) }
      options
    end

    def reset
      self.api_key = DEFAULT_KEY
      self.api_secret = DEFAULT_SECRET
      self.api_root = API_ROOT
      self.callback = DEFAULT_CALLBACK
    end
  end
end