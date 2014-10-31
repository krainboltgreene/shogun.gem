module Shogun
  module Server
    def serve
      @rack.use(Rack::Log, @logger)
      @rack.use(Rack::Runtime)
      @rack.use(ActiveRecord::ConnectionAdapters::ConnectionManagement)
      @rack.use(ActiveRecord::QueryCache)
      @rack.use(Rack::Chunker)
      @rack.use(Rack::AcceptSetter, accept_types)
      @rack.use(Rack::ContentLengthSetter)
      @rack.use(Rack::AuthenticationBearer, &bearer)
      @rack.use(Rack::BodyDeserializer, deserialization_map)
      @rack.use(Rack::BodySerializer, serialization_map, default_serializer)
      @rack.use(Rack::Protection::RemoteReferrer)
      @rack.use(Rack::Protection::HttpOrigin)
      @rack.use(Rack::Protection::EscapedParams)
      @rack.use(Rack::Protection::XSSHeader)
      @rack.use(Rack::Protection::FrameOptions)
      @rack.use(Rack::Protection::PathTraversal)
      @rack.use(Rack::Protection::IPSpoofing)
      @rack.run(Shogun::Dispatch.new(logger: @logger, &endpoints))
    end

    private def endpoints
      self.class.const_get("ENDPOINTS")
    end

    private def deserialization_map
      self.class.const_get("DESERIALIZATION_MAP")
    end

    private def bearer
      self.class.const_get("BEARER")
    end

    private def serialization_map
      self.class.const_get("SERIALIZATION_MAP")
    end

    private def default_serializer
      self.class.const_get("DEFAULT_SERIALIZER")
    end

    private def accept_types
      self.class.const_get("ACCEPT_TYPES")
    end
  end
end
