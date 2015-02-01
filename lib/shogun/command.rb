require "architecture/dsl"
require "active_support/all"
require "shogun"

module Shogun
  class Command
    require_relative "command/resource"

    def initialize(namespace, command, *parameters)
      @namespace = namespace
      @command = command
      @parameters = parameters

      case @command
      when "resource" then
        ::Shogun::Command::Resource.new(@namespace, *@parameters)
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
