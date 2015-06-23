module {{namespace_module}}
  module {{resource_module}}
    module Create
      class Control
        include {{resource_module}}
        include Shogun::Control

        def initialize(payload:)
          @normalizer = Normalizer.new(raw: payload.to_hash)
          @validator = Validator.new(data: @normalizer)

          if @validator.valid?
            @model = Model.create(@normalizer.to_hash)

            @presenter = Presenter.new(resource: @model)
            @denormalizer = Denormalizer.new(object: @presenter)
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
