module Shogun
  module Verifier
    class Allowed
      def initialize(name:, data:, list: [])
        @data = data
        @name = name
        @list = list || []
      end

      def valid?
        @data.all?(&method(:allowed?))
      end

      def id
        "#{@name}_not_allowed"
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
