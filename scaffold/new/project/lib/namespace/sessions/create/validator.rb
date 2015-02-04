module {{namespace_module}}
  module Sessions
    module Create
      class Validator
        include Shogun::Validator
        include Sessions

        PASSWORD_RANGE = 8..1024

        def initialize(data:)
          @verifiers = [
            Shogun::Verifier::Presence.new(data: data.key, name: "key"),
            Shogun::Verifier::Presence.new(data: data.secret, name: "secret"),
            Shogun::Verifier::Range.new(data: data.secret, name: "secret", range: PASSWORD_RANGE),
            Shogun::Verifier::Match.new(data: data.secret, name: "secret", comparison: data.account.password)
          ]
        end
      end
    end
  end
end
