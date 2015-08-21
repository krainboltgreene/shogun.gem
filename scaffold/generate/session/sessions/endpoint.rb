module {{name_as_module}}
  module Sessions
    class Endpoint
      include Shogun::Endpoint
      include Sessions

      def initialize(router:)
        router.push route: route(verb: :post, control: Create::Control)
        router.push route: route(verb: :delete, control: Destroy::Control)
      end
    end
  end
end
