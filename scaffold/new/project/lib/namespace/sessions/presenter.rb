module {{namespace_module}}
  module Sessions
    class Presenter
      include Shogun::Presenter
      include Sessions

      ALGORITHM = "HS512"

      def token
        JWT.encode(payload, secret, ALGORITHM)
      end

      def accounts
        {
          "id" => source.account_id
        }
      end

      def created_at
        source.created_at.to_datetime.rfc3339
      end

      def destroyed_at
        source.destroyed_at.to_datetime.rfc3339 if source.destroyed_at
      end

      private def secret
        ENV["APPLICATION_SESSION_SECRET"]
      end

      private def payload
        {
          "sessions" => {
            "id" => source.id
          }
        }
      end
    end
  end
end
