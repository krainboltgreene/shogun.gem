module Shogun
  class Presenters
    include Enumerable

    def initialize(resources:, cast:, includes: [], meta: {}, links: {}, linked: {})
      @cast = @cast
      @sources = resources.map do |resource|
        cast.new(resource: resource, includes: includes)
      end
      @meta = meta
      @links = links
      @linked = linked
    end

    def each(&block)
      @sources.each(&block)
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
          hash.store("#{namespace}.#{name}", [host, name, "{#{namespace}.#{name}}"].join("/"))
        end
      end
    end

    private def namespace
      @cast.const_get("NAMESPACE")
    end
  end
end
