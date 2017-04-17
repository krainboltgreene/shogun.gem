module {{name_as_module}}
  module Sessions
    module Destroy
      class Validator
        include Shogun::Validator
        include Sessions

        def initialize(data:)
          @verifiers = [
            Shogun::Verifier::Presence.new(data: data.id, name: "id")
          ]
        end
      end
    end
  end
end
