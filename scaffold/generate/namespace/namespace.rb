module {{namespace_as_module}}
  require_relative "{{namespace}}/server"

  def self.logger(io: STDOUT, level: ::Logger.const_get(ENV["APPLICATION_LOG_LEVEL"]))
    @logger ||= ::Logger.new(STDOUT).tap do |log|
      log.level = level
      log.formatter = ->(level, stamp, name, message) do
        Scrawl.new(level: level, time: stamp.to_datetime.rfc3339, name: name, message: message.strip).inspect + "\n"
      end
    end
  end

  def self.store
    ROM.env
  end
end
