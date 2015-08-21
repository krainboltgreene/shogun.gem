module {{name_as_module}}
  module Accounts
    module Create
      class Normalizer
        include Accounts
        include Shogun::Normalizer

        ATTRIBUTES = %w|signature username name email password|

        def initialize(raw:)
          if raw[namespace]
            @signature = raw[namespace]["signature"]
            @name = raw[namespace]["name"]
            @email = raw[namespace]["email"]
            @username = raw[namespace]["username"]
            @password = raw[namespace]["password"]
          end
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

        def password
          @password
        end
      end
    end
  end
end
