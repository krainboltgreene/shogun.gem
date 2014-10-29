module Shogun
  class Dispatch
    class Lookup
      include Adamantium

      attr_reader :routes
      private :routes

      def initialize(routes:, verb:, path:)
        @routes = routes
        @verb = verb
        @path = path
      end

      def request
        "#{@verb} #{@path}"
      end
      memoize :request

      def payload
        if match.captures.any?
          match.names.zip(match.captures).to_h
        else
          {}
        end
      end
      memoize :payload

      def to_route
        regular || regexp || Route::Null.new
      end
      memoize :to_route

      private def regexp
        routes[pattern]
      end
      memoize :regexp

      private def regular
        routes[request]
      end
      memoize :regular

      private def match
        request.match(pattern)
      end
      memoize :match

      private def pattern
        routes.keys.detect(NO_MATCH) do |key|
          if key.is_a?(Regexp) then request =~ key else next end
        end
      end
      memoize :pattern
    end
  end
end
