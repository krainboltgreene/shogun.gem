module {{namespace_module}}
  module Accounts
    NAMESPACE = "accounts"

    require_relative "accounts/create"
    require_relative "accounts/destroy"
    require_relative "accounts/endpoint"
    require_relative "accounts/list"
    require_relative "accounts/model"
    require_relative "accounts/null"
    require_relative "accounts/presenter"
    require_relative "accounts/show"
    require_relative "accounts/update"
  end
end
