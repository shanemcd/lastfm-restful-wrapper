##Last.fm Restful API Wrapper

Experiments with the Last.fm API. Using Faraday for HTTP requests.

###Usage:
    Lastfm.configure do |config|
      config.api_key = ENV['LASTFM_KEY']
      config.api_secret = ENV['LASTFM_SECRET']
    end

    Lastfm::Artist.getsimilar("Heartless Bastards")

Authentication:

    Lastfm::Auth.get_token
    Lastfm::Auth.get_session