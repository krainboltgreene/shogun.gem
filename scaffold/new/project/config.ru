#!/usr/bin/env ruby -wKU
# encoding: utf-8

require File.expand_path(File.join("..", "lib", "{{namespace}}"), __FILE__)
require File.expand_path(File.join("..", "lib", "{{namespace}}", "server"), __FILE__)

Shogun::Database.new(logger: {{namespace_module}}.logger)
{{namespace_module}}::Server.new(rack: self, logger: {{namespace_module}}.logger)
