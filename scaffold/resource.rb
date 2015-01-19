module {{namespace_module}}
  module {{resource_module}}
    NAMESPACE = "{{resource}}"

    require_relative "{{resource}}/create"
    require_relative "{{resource}}/destroy"
    require_relative "{{resource}}/endpoint"
    require_relative "{{resource}}/list"
    require_relative "{{resource}}/model"
    require_relative "{{resource}}/null"
    require_relative "{{resource}}/presenter"
    require_relative "{{resource}}/show"
    require_relative "{{resource}}/update"
  end
end
