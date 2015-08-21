module Shogun
  module {{namespace_as_module}}
    module Server
      VERSION = "1.0.0"

      ORIGIN_WHITELIST = Hamster::Vector.new([
        ENV["CLIENT_HOST"]
      ])

      DESERIALIZATION_MAP = Hamster::Hash.new({
        "*/*" => Oj,
        "application/vnd.{{namespace}}+json; version=#{VERSION}" => Oj,
        "application/json" => Oj
      })

      SERIALIZATION_MAP = Hamster::Hash.new({
        "application/vnd.{{namespace}}+json; version=#{VERSION}" => Oj
      })

      DEFAULT_SERIALIZER = Oj


      def initialize(rack:, logger:)
        ActiveSupport::Cache::Store.logger = logger

        Oj.default_options = {
          mode: :object
        }

        ROM.finalize

        rack.use(Rack::Log, logger)
        rack.use(Rack::Runtime)
        rack.use(Rack::Protection::HttpOrigin, origin_whitelist: ORIGIN_WHITELIST)
        rack.use(Rack::Protection::EscapedParams)
        rack.use(Rack::Protection::XSSHeader)
        rack.use(Rack::Protection::FrameOptions)
        rack.use(Rack::Protection::PathTraversal)
        rack.use(Rack::Protection::IPSpoofing)
        rack.use(Rack::Chunker)



        ACCEPT_TYPES = Hamster::Vector.new([
          "application/vnd.{{namespace}}+json; version=#{VERSION}",
          "application/json"
        ])
        rack.use(Rack::AcceptSetter, ACCEPT_TYPES)

        rack.use(Rack::ContentLengthSetter)

        rack.use(Rack::AuthenticationBearer) do |token|
          begin
            JWT.decode(token, ENV["APPLICATION_SESSION_SECRET"]).first
          rescue JWT::DecodeError
            Hamster::EmptyHash
          end
        end

        rack.use(Rack::BodyDeserializer, DESERIALIZATION_MAP)
        rack.use(Rack::BodySerializer, SERIALIZATION_MAP, DEFAULT_SERIALIZER)

        rack.use(Rack::Cors) do |policy|
          policy.allow do
            origins(ENV["SERVER_HOST"], ENV["CLIENT_HOST"])
            resource("*", headers: :any, methods: [:get, :post, :patch, :post, :delete, :options, :head])
          end
        end

        rack.run(Shogun::Dispatch.new(logger: logger) do |router|
          Accounts::Endpoint.new(router: router)
          Sessions::Endpoint.new(router: router)
        end
      end
    end
  end
end
