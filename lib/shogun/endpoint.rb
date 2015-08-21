module {{project_as_module}}
  module Endpoint
    private def route(verb:, matcher: nil, control:)
      Dispatch::Route.new(namespace: namespace, verb: verb, matcher: matcher, control: control)
    end

    private def namespace
      self.class.const_get("NAMESPACE")
    end
  end
end
