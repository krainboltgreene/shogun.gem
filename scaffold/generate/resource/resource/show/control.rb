module {{namespace_module}}
  module {{resource_module}}
    module Show
      class Control
        include {{resource_module}}
        include Shogun::Control

        def initialize(payload:)
          @normalizer = Normalizer.new(raw: payload.to_hash)
          @validator = Validator.new(data: @normalizer)

          if @validator.valid?
            @model = Model.find_by(id: @normalizer.id)

            if @model
              @presenter = Presenter.new(resource: @model, meta: @normalizer.as_meta)
              @denormalizer = Denormalizer.new(object: @presenter, fields: @normalizer.fields)
              @status = OK
            else
              @status = NOT_FOUND
            end
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
