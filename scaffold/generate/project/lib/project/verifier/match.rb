module Shogun
  module Verifier
    class Match
      KEY_NAME = "pattern"

      def initialize(field:, data:, comparison:)
        @field = field
        @data = data
        @comparison = comparison
      end

      def valid?
        if @comparison.is_a?(Regexp)
          @data =~ @comparison
        else
          @data == @comparison || @comparison == @data
        end
      end

      def id
        "#{@field}_does_not_match"
      end

      def context
        if @comparison.is_a?(Regexp)
          {
            KEY_NAME => @comparison
          }
        end
      end
    end
  end
end
