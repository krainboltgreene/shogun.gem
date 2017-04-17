module {{name_as_module}}
  module {{resource_module}}
    module Destroy
      class Denormalizer
        include {{resource_module}}
        include Shogun::Denormalizer

        MAPPING = {
          "id" => "id",
          "created_at" => "created_at",
          "destroyed_at" => "destroyed_at",
          "updated_at" => "updated_at",
          "href" => "href"
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
