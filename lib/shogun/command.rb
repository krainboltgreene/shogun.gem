require "architecture/dsl"
require "active_support/all"
require "shogun"

module Shogun
  class Command
    require_relative "command/new"
    require_relative "command/generate"
    require_relative "command/database"

    def initialize(namespace, command, *parameters)
      @namespace = namespace
      @command = command
      @parameters = parameters
    end

    def execute
      case @command
      when "new" then
        ::Shogun::Command::New.new(@namespace, *@parameters)
      when "generate-resource" then
        ::Shogun::Command::Generate::Resource.new(@namespace, *@parameters)
      when "database" then
        ::Shogun::Command::Database.new(@namespace, *@parameters)
      when "console" then
        binding.pry
      end.execute
    end
  end
end
