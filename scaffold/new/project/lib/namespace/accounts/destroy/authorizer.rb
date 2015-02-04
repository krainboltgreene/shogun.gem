module {{namespace_module}}
  module Accounts
    module Destroy
      class Authorizer
        include Shogun::Authorizer
        include Accounts

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
