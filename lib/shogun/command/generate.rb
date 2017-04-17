module Shogun
  module Command
    module Generate
      private def gem_directory
        Gem::Specification.find_by_name("shogun").gem_dir
      end

      private def current_directory
        Dir.pwd
      end

      require_relative "generate/project"
    end
  end
end
