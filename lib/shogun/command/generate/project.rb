module Shogun
  module Command
    module Generate
      class Project
        include Architecture
        include Generate

        def initialize(project:, options:)
          @project = project
          @options = options

          architecture(source: source, destination: destination) do |arc|
            arc.create(directory: project)
            arc.within(source: "project/", destination: project) do |arc|
              arc.copy(file: "gitignore", as: ".gitignore")
              arc.copy(file: "rspec", as: ".rspec")
              arc.copy(file: "env", as: ".env", context: context)
              arc.copy(file: "ruby-gemset", as: ".ruby-gemset", context: context)
              arc.copy(file: "ruby-version", as: ".ruby-version")
              arc.copy(file: "slugignore", as: ".slugignore")
              arc.copy(file: "travis.yml", as: ".travis.yml")
              arc.copy(file: "Envfile")
              arc.copy(file: "Gemfile")
              arc.copy(file: "LICENSE")
              arc.copy(file: "Procfile")
              arc.copy(file: "Rakefile")
              arc.copy(file: "README.md")

              arc.create(directory: "config/") do |arc|
                arc.copy(file: "puma.rb")
              end

              arc.create(directory: "lib/") do |arc|
                arc.copy(file: "shogun.rb")
                arc.copy(directory: "shogun/")
              end
            end
          end
        end

        private def context
          {
            project: project
          }
        end

        private def source
          File.join(gem_directory, "scaffold", "generate")
        end

        private def destination
          File.join(current_directory)
        end

        private def project
          @project
        end
      end
    end
  end
end
