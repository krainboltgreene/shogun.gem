module {{namespace_module}}
  module Accounts
    module Destroy
      class Validator
        include Shogun::Validator
        include Accounts

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
