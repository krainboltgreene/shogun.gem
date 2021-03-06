module {{namespace_module}}
  module {{resource_module}}
    module Show
      class Validator
        include {{resource_module}}
        include Shogun::Validator

        ID_MATCH = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
        FIELDS_ALLOWED = %w|id created_at updated_at destroyed_at href|

        def initialize(data:)
          @verifiers = [
            Shogun::Verifier::Presence.new(data: data.id, name: "id"),
            Shogun::Verifier::Match.new(data: data.id, name: "id", comparison: ID_MATCH),
            Shogun::Verifier::Allowed.new(data: data.fields, name: "fields", list: FIELDS_ALLOWED)
          ]
        end
      end
    end
  end
end
