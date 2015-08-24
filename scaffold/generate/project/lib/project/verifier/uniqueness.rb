module Shogun
  module Verifier
    class Uniqueness

      def initialize(field:, data:, list: Hamster::EmptyVector)
        @field = field
        @data = data
        @list = list || Hamster::EmptyVector
      end

      def valid?
        !@list.include?(@data)
      end

      def id
        "#{@field}_not_unique"
      end

      def context
        nil
      end
    end
  end
end
