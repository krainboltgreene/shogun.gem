module {{name_as_module}}
  module Sessions
    module Destroy
      class Denormalizer
        include Shogun::Denormalizer
        include Sessions

        MAPPING = {
          "token" => "token",
          "created_at" => "created_at",
          "destroyed_at" => "destroyed_at"
        }

        def initialize(object:)
          @object = object
          @meta = object.meta
          @links = object.links
          @linked = object.linked
        end

        private def document
          mapping.inject({}) do |hash, (field, name)|
            hash.merge(field => @object.public_send(name))
          end
        end
      end
    end
  end
end
