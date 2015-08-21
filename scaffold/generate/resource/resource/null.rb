module {{name_as_module}}
  module {{resource_module}}
    class Null
      attr_reader :attribute

      def initialize
        @attribute = nil
      end
    end
  end
end
