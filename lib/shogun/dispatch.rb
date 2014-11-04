module Shogun
  class Dispatch
    PATH_KEY = "REQUEST_PATH"
    METHOD_KEY = "REQUEST_METHOD"
    NO_MATCH = -> { // }

    require_relative "dispatch/route"
    require_relative "dispatch/payload"
    require_relative "dispatch/lookup"

    attr_reader :routes
    private :routes

    attr_reader :payload
    private :payload

    attr_reader :lookup
    private :lookup

    attr_reader :route
    private :route

    def initialize(logger:)
      @routes = {}
      @logger = logger
      yield(self)
    end

    def call(state)
      @state = state

      lookup = Lookup.new(routes: routes, verb: state[METHOD_KEY], path: state[PATH_KEY])

      payload = Payload.new(state: state, lookup: lookup)

      route = lookup.to_route

      control = route.control.new(payload: payload)

      @logger.debug(self.class) do
        "Request `#{lookup.request}` handled by `#{route.control}`"
      end

      control.to_a.tap do |response|
        @logger.debug(self.class) do
          "Response `#{response[0]}` with `#{response[2]}`"
        end
      end
    end

    def push(route:)
      routes[route.as_key] = route
    end

    private def stack
      @stack
    end

    private def state
      @state
    end

    private def headers
      @headers
    end

    private def status
      @status
    end

    private def body
      @body
    end
  end
end
