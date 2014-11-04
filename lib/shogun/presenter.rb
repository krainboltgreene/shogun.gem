module Shogun
  module Presenter
    def initialize(resource:, includes: [], meta: {}, links: {}, linked: {})
      @source = resource
      @includes = includes
      @meta = meta
      @links = links
      @linked = linked
    end

    def href
      [host, namespace, id].join("/")
    end

    def meta
      @meta
    end

    def linked
      @linked
    end

    def links
      @links.tap do |hash|
        includes.each do |name|
          case association(name).macro
          when :has_many
            hash.store(name, source.public_send(name).pluck(:id))
          when :belongs_to
            hash.store(name, source.public_send(association(name).foreign_key))
          when :has_one
            hash.store(name, source.public_send(name).pluck(:id))
          end
        end
      end
    end

    private def host
      ENV["API_HOST"]
    end

    private def namespace
      self.class.const_get("NAMESPACE")
    end

    private def association(name)
      source.class.reflections[name.to_sym]
    end

    private def source
      @source
    end

    private def includes
      @includes
    end
  end
end
