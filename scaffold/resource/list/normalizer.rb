module {{namespace_module}}
  module {{resource_module}}
    module List
      class Normalizer
        include Shogun::Normalizer
        include {{resource_module}}

        METADATA = %w|limit filters includes fields|
        LIST_DELIMITER = /\s*,\s*/
        DEFAULT_FIELD = "id"
        AUTOMATIC_FIELDS = %w|id href meta links linked|

        def initialize(raw:)
          @limit = raw["limit"]
          @filters = raw["filter"]
          @includes = raw["include"]
          @fields = raw["fields"]
        end

        def limit
          Integer(@limit) rescue 10
        end

        def filters
          if @filters.is_a?(Hash)
            @filters
          else
            Hash.new
          end
        end

        def includes
          case @includes
          when String
            @includes.split(LIST_DELIMITER)
          when Array
            @includes
          else
            Array.new
          end
        end

        def fields
          case
          when @fields.is_a?(Array)
            @fields + AUTOMATIC_FIELDS
          when @fields.is_a?(String) && @fields.match(LIST_DELIMITER)
            @fields.split(LIST_DELIMITER) + AUTOMATIC_FIELDS
          when @fields.is_a?(String)
            [@fields.strip] + AUTOMATIC_FIELDS
          else
            [DEFAULT_FIELD]
          end.uniq
        end
      end
    end
  end
end
