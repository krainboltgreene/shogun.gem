module {{project_as_namespace}}
  module Verifier
    class Range
      CONTEXT_MAXIMUM_KEY_NAME = "maximum".freeze
      CONTEXT_MINIMUM_KEY_NAME = "minimum".freeze

      def initialize(field:, data:, range:)
        @field = field
        @data = data
        @range = range
      end

      def valid?
        if @data.is_a?(String)
          @range.cover?(@data.size)
        else
          @range.cover?(@data)
        end
      end

      def id
        "#{@field}_was_out_of_range"
      end

      def context
        {
          CONTEXT_MAXIMUM_KEY_NAME => @range.max,
          CONTEXT_MINIMUM_KEY_NAME => @range.min
        }
      end
    end
  end
end
