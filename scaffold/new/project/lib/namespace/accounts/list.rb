module {{namespace_module}}
  module Accounts
    module List
      require_relative "list/control"
      require_relative "list/denormalizer"
      require_relative "list/normalizer"
      require_relative "list/validator"
    end
  end
end
