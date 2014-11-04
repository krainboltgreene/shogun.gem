module Shogun
  class Presenters
    include Enumerable

    def initialize(resources:, cast:, includes: [], meta: {}, links: {}, linked: {})
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
      @links
    end
  end
end
