##Last.fm Restful API Wrapper

Experiments with the Last.fm API. Using Faraday for HTTP requests.

##To-do:
- Implement method generation for auth and non-auth api methods
- Everything

####Usage:
    Lastfm.configure do |config|
      config.api_key = ENV['LASTFM_KEY']
      config.api_secret = ENV['LASTFM_SECRET']
    end

    Lastfm::Artist.get_similar("Heartless Bastards")