module {{namespace_module}}
  module Sessions
    module Destroy
      require_relative "destroy/control"
      require_relative "destroy/denormalizer"
      require_relative "destroy/normalizer"
      require_relative "destroy/validator"
    end
  end
end
