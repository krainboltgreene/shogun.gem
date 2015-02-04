module {{namespace_module}}
  module Sessions
    module Create
      class Authorizer
        include Shogun::Authorizer
        include Sessions

        def initialize(resource:, password:)
          @resource = resource
          @password = password
        end

        def allowed?
          @resource.password == password
        end
      end
    end
  end
end
