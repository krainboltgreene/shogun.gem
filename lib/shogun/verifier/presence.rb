module Shogun
  module Verifier
    class Presence
      def initialize(name:, data:)
        @data = data
        @name = name
      end

      def valid?
        if @data.is_a?(String)
          @data.split("").any?
        else
          !@data.nil?
        end
      end

      def id
        "#{@name}_not_present"
      end

      def context
        nil
      end
    end
  end
end
