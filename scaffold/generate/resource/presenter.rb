module {{namespace_module}}
  module {{resource_module}}
    class Presenter
      include {{resource_module}}
      include Shogun::Presenter

      def id
        source.id
      end

      def created_at
        source.created_at.to_datetime.rfc3339
      end

      def updated_at
        source.updated_at.to_datetime.rfc3339
      end

      def destroyed_at
        source.destroyed_at.to_datetime.rfc3339 if source.destroyed_at
      end
    end
  end
end
