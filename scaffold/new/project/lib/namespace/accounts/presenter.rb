module {{namespace_module}}
  module Accounts
    class Presenter
      include Accounts
      include Shogun::Presenter

      def id
        source.id
      end

      def signature
        source.signature
      end

      def username
        source.username
      end

      def email
        source.email
      end

      def name
        source.name
      end

      def created_at
        source.created_at.to_datetime.rfc3339
      end

      def updated_at
        source.updated_at.to_datetime.rfc3339 if source.updated_at
      end

      def destroyed_at
        source.destroyed_at.to_datetime.rfc3339 if source.destroyed_at
      end
    end
  end
end
