module Shogun
  class Command
    class Database
      def initialize(namespace, command, *parameters)
        @namespace = namespace
        @command = command
        @parameters = parameters

        require File.join(Dir.pwd, "lib", @namespace)
      end

      def execute
        case @command
          when "create" then
            ::Shogun::Database.create!(logger: Logger.new(STDOUT))
          when "console" then
            ::Shogun::Database.new(logger: Logger.new(STDOUT))
            binding.pry
        end
      end
    end
  end
end
