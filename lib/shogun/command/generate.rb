module Shogun
  class Command
    module Generate

      private def gem_directory
        Gem::Specification.find_by_name("shogun").gem_dir
      end

      private def current_directory
        Dir.pwd
      end

      private def namespace_module
        @namespace.camelcase
      end

      private def namespace
        @namespace.downcase
      end

      private def namespace_directory
        File.join(current_directory, "lib", @namespace)
      end

      require_relative "generate/resource"
    end
  end
end
