module Shogun
  module Verifier
    class Range
      def initialize(name:, data:, range:)
        @data = data
        @name = name
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
        "#{@name}_was_out_of_range"
      end

      def context
        {
          "maximum" => @range.max,
          "minimum" => @range.min
        }
      end
    end
  end
end
