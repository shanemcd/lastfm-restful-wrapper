module Lastfm
  class Base

    attr_accessor :attrs
    alias :to_hash :attrs

    def self.inherited(base)
      base.instance_eval do

        def methods_without_auth(*attrs)
          attrs.each do |attr|
            define_singleton_method(attr) do |specifier|
              build_url "#{self.to_s.split("::")[1].downcase}.#{attr}", specifier
            end
          end
        end

      end
    end

    def initialize(attrs={})
      @attrs = attrs.dup
    end

  end
end