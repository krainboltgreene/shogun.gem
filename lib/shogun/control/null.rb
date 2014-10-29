module Shogun
  module Control
    class Null
      include Shogun::Control

      def initialize(payload:)
        # Don't bother with anything here
      end

      def to_a
        [NOT_FOUND, {}, ""]
      end
    end
  end
end
