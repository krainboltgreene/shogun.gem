module {{namespace_module}}
  module Errors
    class Denormalizer
      include Shogun::Denormalizer
      include Errors

      def initialize(object:)
        @object = object
        @meta = object.meta
        @links = object.links
        @linked = object.linked
      end

      private def document
        @object.map do |object|
          {
            "id" => object.id,
            "context" => object.context
          }
        end
      end
    end
  end
end
