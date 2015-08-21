#!/usr/bin/env ruby -wKU

require File.expand_path(File.join("..", "lib", "{{namespace}}"), __FILE__)
require File.expand_path(File.join("..", "lib", "{{namespace}}", "server"), __FILE__)

{{namespace_as_module}}::Server.new(rack: self, logger: {{project_as_module}}.logger)
