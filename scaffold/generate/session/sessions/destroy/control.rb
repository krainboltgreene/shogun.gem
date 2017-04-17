module {{name_as_module}}
  module Sessions
    module Destroy
      class Control
        include Shogun::Control
        include Sessions

        def initialize(payload:)
          @normalizer = Normalizer.new(raw: payload.to_hash)
          @validator = Validator.new(data: @normalizer)

          if @validator.valid?
            @model = Model.find_by(id: @normalizer.id)

            if @model
              @model.destroy
              @presenter = Presenter.new(resource: @model)
              @denormalizer = Denormalizer.new(object: @presenter)
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
