module {{namespace_module}}
  module {{resource_module}}
    module Destroy
      class Authorizer
        include Shogun::Authorizer
        include {{resource_module}}

        def initialize(requester:, resource:)
          if requester
            @requester = requester.account
          end
          @resource = resource
        end

        def allowed?
          @requester == @resource
        end
      end
    end
  end
end
