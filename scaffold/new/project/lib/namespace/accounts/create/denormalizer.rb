module {{namespace_module}}
  module Accounts
    module Create
      class Denormalizer
        include Shogun::Denormalizer
        include Accounts

        MAPPING = {
          "id" => "id",
          "signature" => "signature",
          "username" => "username",
          "email" => "email",
          "name" => "name",
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
