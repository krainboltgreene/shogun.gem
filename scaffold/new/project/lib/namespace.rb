require "logger"
require "scrawl"
require "bcrypt"
require "pg"
require "active_record"
require "moneta"
require "adamantium"
require "memoizable"
require "shogun"
require "envied"
require "dotenv"

Dotenv.load
ENVied.require

module {{namespace_module}}
  ROM.tap do |rom|
    rom.setup(:memory)
    require_relative "{{namespace}}/errors"
    require_relative "{{namespace}}/accounts"
    require_relative "{{namespace}}/sessions"
  end.finalize

  def self.logger(io: STDOUT, level: ::Logger.const_get(ENV["APPLICATION_LOG_LEVEL"]))
    @logger ||= ::Logger.new(STDOUT).tap do |log|
      log.level = level
      log.formatter = ->(level, stamp, name, message) do
        Scrawl.new(level: level, time: stamp.to_datetime.rfc3339, name: name, message: message.strip).inspect + "\n"
      end
    end
  end
end
