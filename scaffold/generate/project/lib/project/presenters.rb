module {{project_as_namespace}}
  class Presenters
    include Enumerable

    def initialize(resources:, cast:, includes: Hamster::EmptyVector, meta: Hamster::EmptyHash, links: Hamster::Hash, linked: Hamster::Hash)
      @cast = @cast
      @resources = resources
      @sources = @resources.map do |resource|
        cast.new(resource: resource, includes: includes)
      end
      @includes = includes
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
      @links.inject() do |hash|
        includes.each do |relationship|
          hash.store(template_name(NAMESPACE, relationship), template_path(namespace, relationship))
        end
      end
    end

    private def includes
      @includes
    end

    private def template_name(namespace, relationship)
      "#{namespace}.#{relationship}"
    end

    private def template_path(namespace, relationship)
      [host, relationship, "{#{namespace}.#{relationship}}"].join("/")
    end
  end
end
