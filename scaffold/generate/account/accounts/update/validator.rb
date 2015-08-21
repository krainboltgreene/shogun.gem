module {{name_as_module}}
  module Accounts
    module Update
      class Validator
        include Accounts
        include Shogun::Validator

        ID_MATCH = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
        EMAIL_MATCH = /^[^@\s]+@([^@\s]+\.)+[^@\s]+$/
        SIGNATURE_RANGE = 2..64
        USERNAME_MATCH = /^\S*$/
        USERNAME_RANGE = 2..64

        def initialize(data:)
          @verifiers = [
            Shogun::Verifier::Presence.new(data: data.id, name: "id"),
            Shogun::Verifier::Match.new(data: data.id, name: "id", comparison: ID_MATCH),
            Shogun::Verifier::Presence.new(data: data.session, name: "session")
          ]

          if data.name
            @verifiers << Shogun::Verifier::Presence.new(data: data.name, name: "name")
          end

          if data.email
            @verifiers << Shogun::Verifier::Presence.new(data: data.email, name: "email")
            @verifiers << Shogun::Verifier::Match.new(data: data.email, name: "email", comparison: EMAIL_MATCH)
            @verifiers << Shogun::Verifier::Uniqueness.new(data: data.email, name: "email", list: Model.pluck(:email))
          end

          if data.signature
            @verifiers << Shogun::Verifier::Presence.new(data: data.signature, name: "signature")
            @verifiers << Shogun::Verifier::Range.new(data: data.signature, name: "signature", range: SIGNATURE_RANGE)
            @verifiers << Shogun::Verifier::Uniqueness.new(data: data.signature, name: "signature", list: Model.pluck(:signature))
          end

          if data.username
            @verifiers << Shogun::Verifier::Match.new(data: data.username, name: "username", comparison:  USERNAME_MATCH)
            @verifiers << Shogun::Verifier::Range.new(data: data.username, name: "username", range: USERNAME_RANGE)
            @verifiers << Shogun::Verifier::Presence.new(data: data.username, name: "username")
            @verifiers << Shogun::Verifier::Uniqueness.new(data: data.username, name: "username", list: Model.pluck(:username))
          end
        end
      end
    end
  end
end
