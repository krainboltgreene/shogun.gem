module {{namespace_module}}
  module {{resource_module}}
    module Update
      class Validator
        include {{resource_module}}
        include Shogun::Validator

        def initialize(data:)
          @verifiers = []
        end
      end
    end
  end
end
