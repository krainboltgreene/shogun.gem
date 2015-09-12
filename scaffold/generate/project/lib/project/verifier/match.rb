module {{project_as_module}}
  module Verifier
    class Match
      CONTEXT_KEY_NAME = "pattern".freeze

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
            CONTEXT_KEY_NAME => @comparison
          }
        end
      end
    end
  end
end
