module {{namespace_module}}
  module {{resource_module}}
    module List
      class Denormalizer
        include {{resource_module}}
        include Shogun::Denormalizer

        MAPPING = {
          "id" => "id",
          "created_at" => "created_at",
          "destroyed_at" => "destroyed_at",
          "updated_at" => "updated_at",
          "href" => "href",
          LINKS_KEY => "links",
          META_KEY => "meta",
          LINKED_KEY => "linked"
        }

        private def document
          @object.map do |object|
            if @fields.one?
              object.public_send(@fields.first)
            else
              @fields.inject({}) do |hash, field|
                hash.merge(field => object.public_send(mapping[field]))
              end
            end
          end
        end
      end
    end
  end
end
