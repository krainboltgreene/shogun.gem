module {{namespace_module}}
  module {{resource_module}}
    class Endpoint
      include {{resource_module}}
      include Shogun::Endpoint

      def initialize(router:)
        router.push route: route(verb: :get, control: List::Control)
        router.push route: route(verb: :post, control: Create::Control)
        router.push route: route(verb: :get, matcher: /(?<id>.+)/, control: Show::Control)
        router.push route: route(verb: :patch, matcher: /(?<id>.+)/, control: Update::Control)
        router.push route: route(verb: :delete, matcher: /(?<id>.+)/, control: Destroy::Control)
      end
    end
  end
end
