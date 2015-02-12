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
            scope.copy(file: "gitignore", as: ".gitignore", context: context)
            scope.copy(file: ".rspec", context: context)
            scope.copy(file: ".env", context: context)
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
            scope.create(directory: scope.destination("config"))
            scope.within(source: "config", destination: "config") do |scope|
              scope.copy(file: "puma.rb", context: context)
            end
            scope.create(directory: scope.destination("lib"))
            scope.within(source: "lib", destination: "lib") do |scope|
              scope.copy(file: "namespace.rb", as: "#{namespace}.rb", context: context)
              scope.create(directory: scope.destination(namespace))
              scope.within(source: "namespace", destination: namespace) do |scope|
                scope.copy(file: "server.rb", context: context)
                scope.copy(file: "accounts.rb", context: context)
                scope.create(directory: scope.destination("accounts"))
                scope.within(source: "accounts", destination: "accounts") do |scope|
                  scope.copy(file: "create.rb", context: context)
                  scope.create(directory: scope.destination("create"))
                  scope.within(source: "create", destination: "create") do |scope|
                    scope.copy(file: "control.rb", context: context)
                    scope.copy(file: "denormalizer.rb", context: context)
                    scope.copy(file: "normalizer.rb", context: context)
                    scope.copy(file: "validator.rb", context: context)
                  end
                  scope.copy(file: "destroy.rb", context: context)
                  scope.create(directory: scope.destination("destroy"))
                  scope.within(source: "destroy", destination: "destroy") do |scope|
                    scope.copy(file: "authorizer.rb", context: context)
                    scope.copy(file: "control.rb", context: context)
                    scope.copy(file: "denormalizer.rb", context: context)
                    scope.copy(file: "normalizer.rb", context: context)
                    scope.copy(file: "validator.rb", context: context)
                  end
                  scope.copy(file: "list.rb", context: context)
                  scope.create(directory: scope.destination("list"))
                  scope.within(source: "list", destination: "list") do |scope|
                    scope.copy(file: "control.rb", context: context)
                    scope.copy(file: "denormalizer.rb", context: context)
                    scope.copy(file: "normalizer.rb", context: context)
                    scope.copy(file: "validator.rb", context: context)
                  end
                  scope.copy(file: "show.rb", context: context)
                  scope.create(directory: scope.destination("show"))
                  scope.within(source: "show", destination: "show") do |scope|
                    scope.copy(file: "control.rb", context: context)
                    scope.copy(file: "denormalizer.rb", context: context)
                    scope.copy(file: "normalizer.rb", context: context)
                    scope.copy(file: "validator.rb", context: context)
                  end
                  scope.copy(file: "update.rb", context: context)
                  scope.create(directory: scope.destination("update"))
                  scope.within(source: "update", destination: "update") do |scope|
                    scope.copy(file: "authorizer.rb", context: context)
                    scope.copy(file: "control.rb", context: context)
                    scope.copy(file: "denormalizer.rb", context: context)
                    scope.copy(file: "normalizer.rb", context: context)
                    scope.copy(file: "validator.rb", context: context)
                  end
                  scope.copy(file: "endpoint.rb", context: context)
                  scope.copy(file: "null.rb", context: context)
                  scope.copy(file: "presenter.rb", context: context)
                  scope.copy(file: "model.rb", context: context)
                end
                scope.copy(file: "sessions.rb", context: context)
                scope.create(directory: scope.destination("sessions"))
                scope.within(source: "sessions", destination: "sessions") do |scope|
                  scope.copy(file: "create.rb", context: context)
                  scope.create(directory: scope.destination("create"))
                  scope.within(source: "create", destination: "create") do |scope|
                    scope.copy(file: "authorizer.rb", context: context)
                    scope.copy(file: "control.rb", context: context)
                    scope.copy(file: "denormalizer.rb", context: context)
                    scope.copy(file: "normalizer.rb", context: context)
                    scope.copy(file: "validator.rb", context: context)
                  end
                  scope.copy(file: "destroy.rb", context: context)
                  scope.create(directory: scope.destination("destroy"))
                  scope.within(source: "destroy", destination: "destroy") do |scope|
                    scope.copy(file: "control.rb", context: context)
                    scope.copy(file: "denormalizer.rb", context: context)
                    scope.copy(file: "normalizer.rb", context: context)
                    scope.copy(file: "validator.rb", context: context)
                  end
                  scope.copy(file: "endpoint.rb", context: context)
                  scope.copy(file: "presenter.rb", context: context)
                  scope.copy(file: "model.rb", context: context)
                end
                scope.copy(file: "errors.rb", context: context)
                scope.create(directory: scope.destination("errors"))
                scope.within(source: "errors", destination: "errors") do |scope|
                  scope.copy(file: "denormalizer.rb", context: context)
                  scope.copy(file: "presenter.rb", context: context)
                end
              end
            end
            scope.create(directory: scope.destination("spec"))
            scope.within(source: "spec", destination: "spec") do |scope|
              scope.copy(file: "spec_helper.rb", context: context)
              scope.create(directory: scope.destination("lib"))

            end
          end
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
