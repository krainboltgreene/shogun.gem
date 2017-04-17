module {{name_as_module}}
  module Sessions
    module Create
      class Denormalizer
        include Shogun::Denormalizer
        include Sessions

        MAPPING = {
          "token" => "token",
          "accounts" => "accounts",
          "created_at" => "created_at",
          "accounts" => "accounts"
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
