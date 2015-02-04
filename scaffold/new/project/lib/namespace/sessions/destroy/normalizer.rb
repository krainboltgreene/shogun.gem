module {{namespace_module}}
  module Sessions
    module Destroy
      class Normalizer
        include Shogun::Normalizer
        include Sessions

        def initialize(raw:)
          if raw["rack.authentication"] && raw["rack.authentication"]["sessions"]
            @id = raw["rack.authentication"]["sessions"]["id"]
          end
        end

        def id
          @id
        end
      end
    end
  end
end
