module Shogun
  class Dispatch
    class Route
      require_relative "route/null"

      attr_reader :control

      def initialize(namespace:, verb:, matcher:, control:)
        @namespace = namespace
        @verb = verb
        @matcher = matcher
        @control = control
      end

      def as_key
        if expression? then Regexp.new("^#{verb} /#{path}$") else "#{verb} /#{path}" end
      end

      private def path
        @path ||= [@namespace, @matcher].compact.join("/")
      end

      private def verb
        @verb.to_s.upcase
      end

      private def expression?
        [@namespace, @matcher].any? do |item|
          item.is_a?(Regexp)
        end
      end
    end
  end
end
