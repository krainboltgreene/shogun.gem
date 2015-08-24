#!/usr/bin/env ruby -wKU

require File.expand_path(File.join("..", "..", "lib", "{{namespace_as_atom}}"), __FILE__)
require File.expand_path(File.join("..", "..", "lib", "{{namespace_as_atom}}", "server"), __FILE__)

{{project_as_module}}::Server.new(rack: self, logger: {{project_as_module}}.logger)
