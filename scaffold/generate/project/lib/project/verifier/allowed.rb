module Shogun
  module Verifier
    class Allowed

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
          "unallowed" => @data.reject(&method(:allowed?))
        }
      end

      private def allowed?(item)
        @list.include?(item)
      end
    end
  end
end
