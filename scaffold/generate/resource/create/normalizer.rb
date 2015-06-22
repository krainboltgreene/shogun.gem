module {{namespace_module}}
  module {{resource_module}}
    module Create
      class Normalizer
        include {{resource_module}}
        include Shogun::Normalizer

        ATTRIBUTES = %w|attribute|

        def initialize(raw:)
          if raw[namespace]
            @attribute = raw[namespace]["attribute"]
          end
        end

        def attribute
          @attribute.strip if @attribute.is_a?(String)
        end
      end
    end
  end
end
