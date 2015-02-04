require "architecture/dsl"
require "active_support/all"
require "shogun"

module Shogun
  class Command
    require_relative "command/new"
    require_relative "command/generate"

    def initialize(namespace, command, *parameters)
      @namespace = namespace
      @command = command
      @parameters = parameters
    end

    def execute
      case @command
      when "new" then
        ::Showgun::Command::New.new(@namespace, *@parameters).execute
      when "generate" then
        ::Shogun::Command::Generate.new(@namespace, *@parameters).execute
      when "database" then
        case ARGV.shift
        when "reset" then
          ::Shogun::Database.setup!(logger: Logger.new(STDOUT))
        when "console" then
          ::Shogun::Database.new(logger: Logger.new(STDOUT))
          binding.pry
        end
      when "console" then
        binding.pry
      end
    end
  end
end
