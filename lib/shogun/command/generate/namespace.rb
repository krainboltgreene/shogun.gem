module Shogun
  module Command
    module Generate
      class Namespace
        include Architecture
        include Generate

        def initialize(project:, namespace:, options:)
          @project = project
          @namespace = namespace
          @options = options

          architecture(source: source, destination: destination) do |arc|
            arc.copy(file: "namespace.rb", as: "#{@namespace}.rb", context: context)
            arc.create(directory: @namespace)
            arc.within(source: "namespace", destination: @namespace) do |arc|
              arc.copy(file: "server.rb", context: context)
            end
          end
        end

        private def context
          {
            project: @project,
            name_as_module: @project.camelcase,
            namespace: @namespace,
            namespace_as_module: @namespace.camelcase
          }
        end

        private def source
          File.join(gem_directory, "scaffold", "generate", "namespace")
        end

        private def destination
          File.join(current_directory, "lib")
        end
      end
    end
  end
end
