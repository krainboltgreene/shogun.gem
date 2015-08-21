module {{name_as_module}}
  module Accounts
    module List
      class Validator
        include Accounts
        include Shogun::Validator

        INCLUDES_ALLOWED = %w||
        FIELDS_ALLOWED = %w|updated_at destroyed_at href created_at name email username signature id meta links linked|
        FILTERS_ALLOWED = %w|username signature created_at name|
        LIMIT_RANGE = 1..100

        def initialize(data:)
          @verifiers = [
            Shogun::Verifier::Range.new(data: data.limit, name: "limit", range: LIMIT_RANGE),
            Shogun::Verifier::Allowed.new(data: data.filters.keys, name: "filters", list: FILTERS_ALLOWED),
            Shogun::Verifier::Allowed.new(data: data.includes, name: "includes", list: INCLUDES_ALLOWED),
            Shogun::Verifier::Allowed.new(data: data.fields, name: "fields", list: FIELDS_ALLOWED)
          ]
        end
      end
    end
  end
end
