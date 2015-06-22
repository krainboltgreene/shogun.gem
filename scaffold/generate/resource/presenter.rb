module {{namespace_module}}
  module {{resource_module}}
    class Presenter < ROM::Mapper
      include {{resource_module}}
      include Shogun::Presenter

      register_as :presenter
      relation NAMESPACE
      model Relation

      attribute :id
      attribute :href
      attribute :meta
      attribute :links
      attribute :linked
      attribute :created_at do |created_at|
        source.to_datetime.rfc3339
      end
      attribute :updated_at do |updated_at|
        source.to_datetime.rfc3339
      end
      attribute :destroyed_at do |destroyed_at|
        source.to_datetime.rfc3339 if source
      end

      def initialize(resource:, includes: [], meta: {}, links: {}, linked: {})
        super(resource)
        @source = resource
        @includes = includes
        @meta = meta
        @links = links
        @linked = linked
      end
    end
  end
end
