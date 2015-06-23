module {{namespace_module}}
  module {{resource_module}}
    module Destroy
      class Validator
        include {{resource_module}}
        include Shogun::Validator

        ID_MATCH = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/

        def initialize(data:)
          @verifiers = [
            Shogun::Verifier::Presence.new(data: data.id, name: "id"),
            Shogun::Verifier::Match.new(data: data.id, name: "id", comparison: ID_MATCH),
            Shogun::Verifier::Presence.new(data: data.session, name: "session")
          ]
        end
      end
    end
  end
end
