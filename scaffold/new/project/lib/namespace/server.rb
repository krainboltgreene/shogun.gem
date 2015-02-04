require "oj"
require "jwt"

module {{namespace_module}}
  class Server
    include Shogun::Server

    VERSION = "1.0.0"
    ORIGIN_WHITELIST = [ENV["CLIENT_HOST"]]
    DESERIALIZATION_MAP = {
      "*/*" => Oj,
      "application/vnd.{{namespace}}+json; version=#{VERSION}" => Oj,
      "application/json" => Oj
    }
    SERIALIZATION_MAP = {
      "application/vnd.{{namespace}}+json; version=#{VERSION}" => Oj
    }
    DEFAULT_SERIALIZER = Oj
    ACCEPT_TYPES = [
      "application/vnd.{{namespace}}+json; version=#{VERSION}",
      "application/json"
    ]
    ENDPOINTS = ->(router) do
      Accounts::Endpoint.new(router: router)
      Sessions::Endpoint.new(router: router)
    end
    BEARER = ->(token) do
      begin
        JWT.decode(token, ENV["APPLICATION_SESSION_SECRET"]).first
      rescue JWT::DecodeError
        {}
      end
    end
    CORS = ->(policy) do
      policy.allow do
        origins(ENV["SERVER_HOST"], ENV["CLIENT_HOST"])
        resource("*", headers: :any, methods: [:get, :post, :patch, :post, :delete, :options, :head])
      end
    end

    def initialize(rack:, logger:)
      @rack = rack
      @logger = logger

      ActiveSupport::Cache::Store.logger = logger

      Oj.default_options = {
        mode: :object
      }

      serve
    end
  end
end
