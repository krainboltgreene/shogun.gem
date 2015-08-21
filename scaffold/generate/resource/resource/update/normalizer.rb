module {{name_as_module}}
  module {{resource_module}}
    module Update
      class Normalizer
        include {{resource_module}}
        include Shogun::Normalizer

        METADATA = %w|id|
        ATTRIBUTES = %w|attirbute|

        def initialize(raw:)
          @id = raw["id"]

          if raw["rack.authentication"] && raw["rack.authentication"]["sessions"]
            @session = raw["rack.authentication"]["sessions"]["id"]
          end

          if raw[NAMESPACE]
            @attribute = raw[namespace]["attribute"]
          end
        end

        def id
          @id
        end

        def session
          @session
        end

        def attribute
          @attribute.strip if @attribute.is_a?(String)
        end
      end
    end
  end
end
