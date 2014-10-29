module Shogun
  module Normalizer
    def to_hash
      attributes.inject({}) do |hash, attribute|
        if public_send(attribute)
          hash.merge(attribute => public_send(attribute))
        else
          hash
        end
      end
    end

    def as_meta
      metadata.inject({}) do |hash, meta|
        if public_send(meta)
          hash.merge(meta => public_send(meta))
        else
          hash
        end
      end
    end

    private def attributes
      self.class.const_get("ATTRIBUTES")
    end

    private def metadata
      self.class.const_get("METADATA")
    end
  end
end
