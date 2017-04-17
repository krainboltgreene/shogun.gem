#!/usr/bin/env ruby -wKU

require File.expand_path(File.join("..", "..", "lib", "{{project_as_token}}"), __FILE__)
require File.expand_path(File.join("..", "..", "lib", "{{project_as_token}}", "server"), __FILE__)

{{project_as_namespace}}::Server.new(rack: self, logger: {{project_as_namespace}}.logger)
