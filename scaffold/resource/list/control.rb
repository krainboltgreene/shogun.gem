module {{namespace_module}}
  module {{resource_module}}
    module List
      class Control
        include Shogun::Control
        include {{resource_module}}

        def initialize(payload:)
          @normalizer = Normalizer.new(raw: payload.to_hash)
          @validator = Validator.new(data: @normalizer)

          if @validator.valid?
            @models = Model.limit(@normalizer.limit).where(@normalizer.filters).includes(@normalizer.includes)
            @presenters = Shogun::Presenters.new(resources: @models, cast: Presenter, includes: @normalizer.includes, meta: @normalizer.as_meta)
            @denormalizer = Denormalizer.new(object: @presenters, fields: @normalizer.fields)
            @status = OK
          else
            @presenters = Shogun::Presenters.new(resources: @validator.invalids, cast: Errors::Presenter)
            @denormalizer = Errors::Denormalizer.new(object: @presenters)
            @status = UNPROCESSABLE_ENTITY
          end
        end
      end
    end
  end
end
