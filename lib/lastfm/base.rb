module Lastfm
  class Base

    attr_accessor :attrs
    alias :to_hash :attrs

    ## Method generation
    # Lastfm::Artist.method("Dr. Dog")
    def self.artist_methods_without_auth(*attrs)
      attrs.each do |attr|
        define_singleton_method attr do |artist|
          build_url "artist.#{attr}", artist
        end
      end
    end

    def initialize(attrs={})
      @attrs = attrs.dup
    end

  end
end