module {{namespace_module}}
  module Errors
    class Presenter
      include Shogun::Presenter
      include Errors

      def id
        source.id
      end

      def context
        source.context
      end
    end
  end
end
