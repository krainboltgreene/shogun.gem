module {{namespace_module}}
  module Sessions
    module Create
      require_relative "create/control"
      require_relative "create/authorizer"
      require_relative "create/denormalizer"
      require_relative "create/normalizer"
      require_relative "create/validator"
    end
  end
end
