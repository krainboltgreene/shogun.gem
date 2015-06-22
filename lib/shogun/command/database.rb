module Shogun
  class Command
    class Database
      def initialize(namespace, command, *parameters)
        @namespace = namespace
        @command = command
        @parameters = parameters

        require "envied"
        require "dotenv"
        Dotenv.load
        ENVied.require
        require File.join(Dir.pwd, "lib", @namespace)
      end

      def execute
        case @command
          when "create" then

          when "console" then

            binding.pry
        end
      end
    end
  end
end
