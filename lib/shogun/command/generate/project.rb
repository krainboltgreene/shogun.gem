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
            arc.create(directory: project_as_token)
            require "pry"
            binding.pry
            arc.within(source: "project/", destination: project_as_token) do |arc|
              arc.copy(file: "gitignore", as: ".gitignore")
              arc.copy(file: "test-environment", as: ".test-environment", context: context)
              arc.copy(file: "development-environment", as: ".development-environment", context: context)
              arc.copy(file: "slugignore", as: ".slugignore")
              arc.copy(file: "travis.yml", as: ".travis.yml")
              arc.copy(file: "docker-compose.yml", context: context)
              arc.copy(file: "Envfile")
              arc.copy(file: "Dockerfile", context: context)
              arc.copy(file: "Gemfile")
              arc.copy(file: "Rakefile")
              arc.copy(file: "LICENSE", context: context)
              arc.copy(file: "README.md")

              arc.create(directory: "lib/") do |arc|
                arc.copy(file: "project.rb", as: "#{project_as_token}.rb", context: context)
                arc.create(directory: project_as_token)
                arc.within(source: "project", destination: project_as_token) do |arc|
                  arc.copy(file: "server.rb", context: context)

                  arc.within(directory: "config") do |arc|
                    arc.copy(file: "puma.rb", context: context)
                    arc.copy(file: "rack.rb", context: context)
                  end
                end
              end

              arc.create(directory: "spec/") do |arc|
                arc.copy(file: "spec_helper.rb", context: context)
                arc.copy(directory: "lib/")
              end
            end
          end
        end

        private def context
          {
            project_as_token: project_as_token,
            project_as_namespace: project_as_namespace,
            project_as_constant: project_as_constant,
            author: author
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

        private def project_as_token
          project.underscore
        end

        private def project_as_constant
          project.underscore.upcase
        end

        private def project_as_namespace
          project.classify
        end

        private def author
          `git config --global --get user.name`
        end
      end
    end
  end
end
