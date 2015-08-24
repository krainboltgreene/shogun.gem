module {{project_as_module}}
  module Server
    VERSION = "1.0.0"

    def initialize(rack:, logger:)
      ActiveSupport::Cache::Store.logger = logger

      Oj.default_options = {
        mode: :object
      }

      ROM.finalize

      rack.use(Rack::Log, logger)

      rack.use(Rack::Runtime)

      rack.use(Rack::Protection::HttpOrigin, origin_whitelist: [ENV["CLIENT_HOST"]])

      rack.use(Rack::Protection::EscapedParams)

      rack.use(Rack::Protection::XSSHeader)

      rack.use(Rack::Protection::FrameOptions)

      rack.use(Rack::Protection::PathTraversal)

      rack.use(Rack::Protection::IPSpoofing)

      rack.use(Rack::Chunker)

      rack.use(Rack::AcceptSetter, [
        "application/vnd.{{project_as_atom}}+json; version=#{VERSION}",
        "application/json"
      ])

      rack.use(Rack::ContentLengthSetter)

      rack.use(Rack::AuthenticationBearer) do |token|
        begin
          JWT.decode(token, ENV["APPLICATION_SESSION_SECRET"]).first
        rescue JWT::DecodeError
          Hamster::EmptyHash
        end
      end

      rack.use(Rack::Cors) do |policy|
        policy.allow do
          origins(ENV["SERVER_HOST"], ENV["CLIENT_HOST"])
          resource("*", headers: :any, methods: [:get, :post, :patch, :post, :delete, :options, :head])
        end
      end

      rack.use(Rack::BodyDeserializer, {
        "*/*" => Oj,
        "application/vnd.{{project_as_atom}}+json; version=#{VERSION}" => Oj,
        "application/json" => Oj
      })

      rack.use(Rack::BodySerializer, {
        "application/vnd.{{project_as_atom}}+json; version=#{VERSION}" => Oj
      }, Oj)

      rack.run(Shogun::Dispatch.new(logger: logger) do |router|
        Accounts::Endpoint.new(router: router)
        Sessions::Endpoint.new(router: router)
      end
    end
  end
end
