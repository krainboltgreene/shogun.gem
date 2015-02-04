module {{namespace_module}}
  module Sessions
    module Create
      class Normalizer
        include Shogun::Normalizer
        include Sessions

        ATTRIBUTES = %w|account|

        def initialize(raw:)
          if raw[namespace]
            @key = raw[namespace]["key"]
            @secret = raw[namespace]["secret"]
          end
        end

        def key
          @key.strip if @key.is_a?(String)
        end

        def secret
          @secret
        end

        def account
          Accounts::Model.find_by(email: key) || Accounts::Model.find_by(username: key) || Accounts::Null.new
        end
      end
    end
  end
end
