module {{namespace_module}}
  module {{resource_module}}
    module Show
      class Denormalizer
        include Shogun::Denormalizer
        include {{resource_module}}

        MAPPING = {
          "id" => "id",
          "created_at" => "created_at",
          "destroyed_at" => "destroyed_at",
          "updated_at" => "updated_at",
          "href" => "href"
        }
      end
    end
  end
end
