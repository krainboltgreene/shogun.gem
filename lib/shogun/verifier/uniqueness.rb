module Shogun
  module Verifier
    class Uniqueness
      def initialize(data:, name:, list: [])
        @data = data
        @name = name
        @list = list || []
      end

      def valid?
        !@list.include?(@data)
      end

      def id
        "#{@name}_not_unique"
      end

      def context
        nil
      end
    end
  end
end
