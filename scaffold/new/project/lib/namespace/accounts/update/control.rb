module {{namespace_module}}
  module Accounts
    module Update
      class Control
        include Accounts
        include Shogun::Control

        def initialize(payload:)
          @normalizer = Normalizer.new(raw: payload.to_hash)
          @validator = Validator.new(data: @normalizer)

          if @validator.valid?
            @session = Sessions::Model.find_by(id: @normalizer.session)
            @model = Model.find_by(id: @normalizer.id)
            @authorizer = Authorizer.new(requester: @session, resource: @model)

            case
            when @model && @authorizer.allowed?
              @model.update(@normalizer.to_hash)
              @presenter = Presenter.new(resource: @model, meta: @normalizer.as_meta)
              @denormalizer = Denormalizer.new(object: @presenter)
              @status = OK
            when @model && @authorizer.denied?
              @status = UNAUTHORIZED
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
