module {{name_as_module}}
  module Accounts
    module Create
      class Validator
        include Accounts
        include Shogun::Validator

        EMAIL_MATCH = /^[^@\s]+@([^@\s]+\.)+[^@\s]+$/
        PASSWORD_RANGE = 8..1024
        SIGNATURE_RANGE = 2..64
        USERNAME_MATCH = /^\S*$/
        USERNAME_RANGE = 2..64

        def initialize(data:)
          @verifiers = [
            Shogun::Verifier::Presence.new(data: data.email, name: "email"),
            Shogun::Verifier::Match.new(data: data.email, name: "email", comparison: EMAIL_MATCH),
            Shogun::Verifier::Uniqueness.new(data: data.email, name: "email", list: Model.pluck(:email)),
            Shogun::Verifier::Presence.new(data: data.name, name: "name"),
            Shogun::Verifier::Presence.new(data: data.password, name: "password"),
            Shogun::Verifier::Range.new(data: data.password, name: "password", range: PASSWORD_RANGE),
            Shogun::Verifier::Presence.new(data: data.signature, name: "signature"),
            Shogun::Verifier::Range.new(data: data.signature, name: "signature", range: SIGNATURE_RANGE),
            Shogun::Verifier::Uniqueness.new(data: data.signature, name: "signature", list: Model.pluck(:signature)),
            Shogun::Verifier::Match.new(data: data.username, name: "username", comparison: USERNAME_MATCH),
            Shogun::Verifier::Range.new(data: data.username, name: "username", range: USERNAME_RANGE),
            Shogun::Verifier::Presence.new(data: data.username, name: "username"),
            Shogun::Verifier::Uniqueness.new(data: data.username, name: "username", list: Model.pluck(:username))
          ]
        end
      end
    end
  end
end
