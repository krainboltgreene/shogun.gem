module {{project_as_namespace}}
  module Verifier
    class Allowed
      CONTEXT_KEY_NAME = "unallowed".freeze

      def initialize(field:, data:, list: Hamster::EmptyVector)
        @field = field
        @data = data
        @list = list || Hamster::EmptyVector
      end

      def valid?
        @data.all?(&method(:allowed?))
      end

      def id
        "#{@field}_not_allowed"
      end

      def context
        {
          KEY_NAME => @data.reject(&method(:allowed?))
        }
      end

      private def allowed?(item)
        @list.include?(item)
      end
    end
  end
end
