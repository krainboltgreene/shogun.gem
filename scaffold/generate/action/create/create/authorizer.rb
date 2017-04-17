module {{name_as_module}}
  module {{resource_as_module}}
    module Create
      class Authorizer

        def initialize(requester:, resource:)
          if requester
            @requester = requester.account
          end
          @resource = resource
        end

        def allowed?
          @requester == @resource
        end

        def denied?
          !allowed?
        end
      end
    end
  end
end
