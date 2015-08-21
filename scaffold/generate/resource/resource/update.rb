module {{name_as_module}}
  module {{resource_module}}
    module Update
      require_relative "update/authorizer"
      require_relative "update/control"
      require_relative "update/denormalizer"
      require_relative "update/normalizer"
      require_relative "update/validator"
    end
  end
end
