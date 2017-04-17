module {{project_as_module}}
  module {{resource_as_module}}
    module Create
      class Control
        EMPTY_HEADER = {}
        EMPTY_BODY = ""

        def initialize(payload:)
          @normalizer = Normalizer.new(raw: payload.to_hash)
          @validator = Validator.new(data: @normalizer)

          if @validator.valid?
            @model = Model.create(@normalizer.to_hash)

            @presenter = Presenter.new(resource: @model)
            @denormalizer = Denormalizer.new(object: @presenter)
            @status = OK
          else
            @presenters = {{project_as_module}}::Presenters.new(resources: @validator.invalids, cast: Errors::Presenter)
            @denormalizer = Errors::Denormalizer.new(object: @presenters)
            @status = UNPROCESSABLE_ENTITY
          end
        end

        def to_a
          [status, headers, body]
        end

        private def status
          @status || Control::INTERNAL_SERVER_ERROR
        end

        private def headers
          @headers || EMPTY_HEADER
        end

        private def body
          if @denormalizer then @denormalizer.as_document else EMPTY_BODY end
        end
      end
    end
  end
end
