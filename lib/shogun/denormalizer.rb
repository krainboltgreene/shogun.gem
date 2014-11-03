module Shogun
  module Denormalizer
    META_KEY = "meta"
    LINKS_KEY = "links"
    LINKED_KEY = "linked"

    def initialize(object:, fields:)
      @object = object
      @fields = fields
      @meta = object.meta
      @links = object.links
      @linked = object.linked
    end

    def as_document
      {
        namespace => document,
        meta_key => @meta,
        links_key => @links,
        linked_key => @linked
      }
    end

    private def document
      if @fields.one?
        @object.public_send(@fields.first)
      else
        @fields.inject({}) do |hash, field|
          hash.merge(field => @object.public_send(mapping[field]))
        end
      end
    end

    private def namespace
      self.class.const_get("NAMESPACE")
    end

    private def meta_key
      self.class.const_get("META_KEY")
    end

    private def links_key
      self.class.const_get("LINKS_KEY")
    end

    private def linked_key
      self.class.const_get("LINKED_KEY")
    end

    private def mapping
      self.class.const_get("MAPPING")
    end
  end
end
