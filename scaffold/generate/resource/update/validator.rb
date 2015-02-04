module {{namespace_module}}
  module {{resource_module}}
    module Update
      class Validator
        include Shogun::Validator
        include {{resource_module}}

        def initialize(data:)
          @verifiers = []
        end
      end
    end
  end
end
