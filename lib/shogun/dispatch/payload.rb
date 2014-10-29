module Shogun
  class Dispatch
    class Payload
      QUERY_KEY = "rack.request.query_hash"

      def initialize(state:, lookup:)
        @body = state[Rack::BodyDeserializer::RACK_KEY] || {}
        @query = state[QUERY_KEY] || {}
        @uri = lookup.payload
        @sections = [state, @uri, @query, @body]
      end

      def to_hash
        @sections.inject(:merge)
      end
    end
  end
end
