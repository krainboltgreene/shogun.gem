module Shogun
  class Command
    class New
      include Architecture

      BLANK_AUTHOR = "ORGANIZATION"

      def initialize(namespace, *parameters)
        @namespace = namespace
        @parameters = parameters
      end

      def execute
        architecture(source: scaffold_directory, destination: current_directory) do |architect|
          architect.create(directory: architect.destination(namespace))
          architect.within(source: "project", destination: namespace) do |scope|
            scope.copy(file: ".gitignore", context: context)
            scope.copy(file: ".rspec", context: context)
            scope.copy(file: ".ruby-gemset", context: context)
            scope.copy(file: ".ruby-version", context: context)
            scope.copy(file: ".slugignore", context: context)
            scope.copy(file: ".travis.yml", context: context)
            scope.copy(file: "config.ru", context: context)
            scope.copy(file: "Envfile", context: context)
            scope.copy(file: "Gemfile", context: context)
            scope.copy(file: "LICENSE", context: context)
            scope.copy(file: "Procfile", context: context)
            scope.copy(file: "Rakefile", context: context)
            scope.copy(file: "README.md", context: context)
            setup_config(scope)
          end
        end
      end

      private def seupt_config(architect)
        architect.create(directory: "config")
        architect.within(source: "config", destination: "config") do |scope|
          scope.copy(file: )
        end
      end

      private def subresource(architect, name)
        architect.copy(file: "#{name}.rb", context: context)
        architect.create(directory: architect.destination(name))
        architect.within(source: name, destination: name) do |scope|
          scope.copy(file: "authorizer.rb", context: context)
          scope.copy(file: "control.rb", context: context)
          scope.copy(file: "denormalizer.rb", context: context)
          scope.copy(file: "normalizer.rb", context: context)
          scope.copy(file: "validator.rb", context: context)
        end
      end

      private def scaffold_directory
        File.join(gem_directory, "scaffold", "new")
      end

      private def resource_directory
        destination(@parameters.first)
      end

      private def gem_directory
        Gem::Specification.find_by_name("shogun").gem_dir
      end

      private def current_directory
        Dir.pwd
      end

      private def context
        {
          namespace_module: namespace_module,
          namespace: namespace,
          author: author
        }
      end

      private def namespace_module
        @namespace.camelcase
      end

      private def namespace
        @namespace.downcase
      end

      private def author
        ENV["SHOGUN_AUTHOR"] || BLANK_AUTHOR
      end
    end
  end
end
