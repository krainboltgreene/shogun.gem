module {{namespace_module}}
  module {{resource_module}}
    module Destroy
      require_relative "destroy/control"
      require_relative "destroy/authorizer"
      require_relative "destroy/denormalizer"
      require_relative "destroy/normalizer"
      require_relative "destroy/validator"
    end
  end
end
