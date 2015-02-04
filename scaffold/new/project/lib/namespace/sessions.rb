module {{namespace_module}}
  module Sessions
    NAMESPACE = "sessions"

    require_relative "sessions/model"
    require_relative "sessions/endpoint"
    require_relative "sessions/presenter"
    require_relative "sessions/create"
    require_relative "sessions/destroy"
  end
end
