module {{namespace_module}}
  module Accounts
    module Update
      class Normalizer
        include Shogun::Normalizer
        include Accounts

        METADATA = %w|id|
        ATTRIBUTES = %w|signature name email username|

        def initialize(raw:)
          @id = raw["id"]

          if raw["rack.authentication"] && raw["rack.authentication"]["sessions"]
            @session = raw["rack.authentication"]["sessions"]["id"]
          end

          if raw[NAMESPACE]
            @signature = raw[namespace]["signature"]
            @name = raw[namespace]["name"]
            @email = raw[namespace]["email"]
            @username = raw[namespace]["username"]
          end
        end

        def id
          @id
        end

        def session
          @session
        end

        def signature
          @signature.strip if @signature.is_a?(String)
        end

        def name
          @name.strip if @name.is_a?(String)
        end

        def email
          @email.strip if @email.is_a?(String)
        end

        def username
          @username.strip if @username.is_a?(String)
        end
      end
    end
  end
end
