module Shogun
  class Database
    URL_NAME = "DATABASE_URL"
    TIMEZONE_NAME = "DATABASE_TIMEZONE"
    REAP_FREQUENCY_NAME = "DATABASE_REAP_FREQUENCY"
    POOL_NAME = "DATABASE_POOL"
    TIMEOUT_NAME = "DATABASE_TIMEOUT"
    URL = ENV[URL_NAME]
    TIMEZONE = ENV[TIMEZONE_NAME]
    REAP_FREQUENCY = ENV[REAP_FREQUENCY_NAME]
    POOL = ENV[POOL_NAME]
    TIMEOUT = ENV[TIMEOUT_NAME]
    DEFAULT_TIMEOUT = 20
    DEFAULT_REAP_FREQUENCY = 15
    DEFAULT_POOL = 10
    DEFAULT_TIMEZONE = "utc"
    CONFIGURATION = {
      "reaping_frequency" => Integer(REAP_FREQUENCY || DEFAULT_REAP_FREQUENCY),
      "pool" => Integer(POOL || DEFAULT_POOL),
      "connect_timeout" => Integer(TIMEOUT || DEFAULT_TIMEOUT)
    }

    def self.connection
      ActiveRecord::Base.connection
    end

    def self.create!(logger:)
      new(logger: logger).tap do
        connection.enable_extension("uuid-ossp")
        ActiveRecord::Base.descendants.each(&:create!)
      end
    end

    def initialize(logger:)
      @logger = logger
      ActiveRecord::Base.time_zone_aware_attributes = true
      ActiveRecord::Base.default_timezone = (timezone || default_timezone).to_sym
      ActiveRecord::Base.logger = @logger
      ActiveRecord::LogSubscriber.logger = @logger
      ActiveRecord::LogSubscriber.colorize_logging = false
      ActiveRecord::Base.establish_connection(uri)
    end

    private def url
      self.class.const_get("URL")
    end

    private def uri
      "#{url}?#{query}"
    end

    private def query
      configuration.to_query
    end

    private def configuration
      self.class.const_get("CONFIGURATION")
    end

    private def timezone
      self.class.const_get("TIMEZONE")
    end

    private def default_timezone
      self.class.const_get("DEFAULT_TIMEZONE")
    end
  end
end
