module {{name_as_module}}
  module Accounts
    module Show
      class Normalizer
        include Accounts
        include Shogun::Normalizer

        METADATA = %w|id fields|
        LIST_DELIMITER = /\s*,\s*/
        DEFAULT_FIELDS = %w|updated_at destroyed_at href created_at name email username signature id|
        AUTOMATIC_FIELDS = %w|id href|

        def initialize(raw:)
          @id = raw["id"]
          @fields = raw["fields"]
        end

        def id
          @id
        end

        def fields
          case
          when @fields.is_a?(String) && @fields.match(LIST_DELIMITER)
            @fields.split(LIST_DELIMITER) + AUTOMATIC_FIELDS
          when @fields.is_a?(Array)
            @fields + AUTOMATIC_FIELDS
          when @fields.is_a?(String)
            [@fields.strip] + AUTOMATIC_FIELDS
          else
            DEFAULT_FIELDS
          end.uniq
        end
      end
    end
  end
end
