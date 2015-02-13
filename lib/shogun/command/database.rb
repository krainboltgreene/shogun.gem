module Shogun
  class Command
    class Database
      def initialize(namespace, command, *parameters)
        @namespace = namespace
        @command = command
        @parameters = parameters
      end

      def execute
        case @command
          when "reset" then
            ::Shogun::Database.setup!(logger: Logger.new(STDOUT))
          when "console" then
            ::Shogun::Database.new(logger: Logger.new(STDOUT))
            binding.pry
        end
      end
    end
  end
end
