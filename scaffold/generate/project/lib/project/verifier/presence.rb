module Shogun
  module Verifier
    class Presence
      EMPTY_STRING = ""

      def initialize(field:, data:)
        @field = field
        @data = data
      end

      def valid?
        if @data.is_a?(String)
          @data.split(EMPTY_STRING).any?
        else
          !@data.nil?
        end
      end

      def id
        "#{@field}_not_present"
      end

      def context
        nil
      end
    end
  end
end
