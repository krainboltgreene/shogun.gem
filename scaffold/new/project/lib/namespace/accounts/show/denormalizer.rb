module {{namespace_module}}
  module Accounts
    module Show
      class Denormalizer
        include Accounts
        include Shogun::Denormalizer

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
      end
    end
  end
end
