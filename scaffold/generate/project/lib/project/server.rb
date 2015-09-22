module {{project_as_namespace}}
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

      origin_whitelist = [
        ENVied.CLIENT_HOST, ENVied.SERVER_HOST
      ]
      rack.use(Rack::Protection::HttpOrigin, origin_whitelist: origin_whitelist)

      rack.use(Rack::Protection::EscapedParams)

      rack.use(Rack::Protection::XSSHeader)

      rack.use(Rack::Protection::FrameOptions)

      rack.use(Rack::Protection::PathTraversal)

      rack.use(Rack::Protection::IPSpoofing)

      rack.use(Rack::Chunker)

      accepts = [
        "application/vnd.{{project_as_token}}+json; version=#{ENVied.API_VERSION}",
        "application/json"
      ]
      rack.use(Rack::AcceptSetter, accepts)

      rack.use(Rack::ContentLengthSetter)

      rack.use(Rack::AuthenticationBearer) do |token|
        begin
          JWT.decode(token, ENVied.APPLICATION_SESSION_SECRET).first
        rescue JWT::DecodeError
          Hamster::EmptyHash
        end
      end

      rack.use(Rack::Cors) do |policy|
        policy.allow do
          origins(ENVied.SERVER_HOST, ENVied.CLIENT_HOST)
          resource("*", headers: :any, methods: [:get, :post, :patch, :post, :delete, :options, :head])
        end
      end

      deserializers = {
        "*/*" => Oj,
        "application/vnd.{{project_as_token}}+json; version=#{ENVied.API_VERSION}" => Oj,
        "application/json" => Oj
      }
      rack.use(Rack::BodyDeserializer, deserializers)

      serializers = {
        "application/vnd.{{project_as_token}}+json; version=#{ENVied.API_VERSION}" => Oj
      }
      rack.use(Rack::BodySerializer, serializers, Oj)

      rack.run(Shogun::Dispatch.new(logger: logger) do |router|
        Accounts::Endpoint.new(router: router)
        Sessions::Endpoint.new(router: router)
      end)
    end
  end
end
