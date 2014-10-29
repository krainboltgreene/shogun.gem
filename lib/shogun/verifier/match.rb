module Shogun
  module Verifier
    class Match
      def initialize(data:, name:, comparison:)
        @data = data
        @name = name
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
        "#{@name}_does_not_match"
      end

      def context
        if @comparison.is_a?(Regexp)
          {
            "pattern" => @comparison
          }
        end
      end
    end
  end
end
