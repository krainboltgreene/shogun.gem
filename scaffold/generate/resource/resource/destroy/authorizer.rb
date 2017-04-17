module {{name_as_module}}
  module {{resource_module}}
    module Destroy
      class Authorizer
        include {{resource_module}}
        include Shogun::Authorizer

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
