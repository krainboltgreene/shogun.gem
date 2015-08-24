require "dotenv"
require "envied"

require "pg"
require "rom"

require "oj"
require "jwt"

module {{project_as_module}}
  Dotenv.load
  ENVied.require
  ROM.setup(:memory)

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

  require_relative "{{project_as_atom}}/server"
end
