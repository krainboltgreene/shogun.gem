module {{namepsace_module}}
  module {{resource_module}}
    module Create
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
