#!/usr/bin/env ruby

lib = File.expand_path(File.join("..", "lib"), __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "shogun/version"

Gem::Specification.new do |spec|
  spec.name = "shogun"
  spec.version = Shogun::VERSION
  spec.authors = ["Kurtis Rainbolt-Greene"]
  spec.email = ["me@kurtisrainboltgreene.name"]
  spec.summary = %q{The core library for an HTTP API framework}
  spec.description = spec.summary
  spec.homepage = "http://krainboltgreene.github.io/shogun.gem"
  spec.license = "MIT"

  spec.files = Dir[File.join("lib", "**", "*")]
  spec.executables = Dir[File.join("bin", "**", "*")].map! { |f| f.gsub(/bin\//, "") }
  spec.test_files = Dir[File.join("test", "**", "*"), File.join("spec", "**", "*")]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "adamantium", "~> 0.2"
  spec.add_runtime_dependency "rack", "~> 1.5"
  spec.add_runtime_dependency "rack-protection", "~> 1.5"
  spec.add_runtime_dependency "rack-body_serializer", "~> 1.0"
  spec.add_runtime_dependency "rack-body_deserializer", "~> 1.0"
  spec.add_runtime_dependency "rack-authentication_bearer", "~> 1.0"
  spec.add_runtime_dependency "rack-accept_setter", "~> 1.0"
  spec.add_runtime_dependency "rack-chunker", "~> 1.0"
  spec.add_runtime_dependency "rack-content_length_setter", "~> 1.0"
  spec.add_runtime_dependency "rack-runtime", "~> 1.0"
  spec.add_runtime_dependency "rack-log", "~> 1.0"
  spec.add_runtime_dependency "scrawl", "~> 1.0"
  spec.add_runtime_dependency "rake", "~> 10.1"
  spec.add_runtime_dependency "activerecord", "~> 4.1"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.9"
  spec.add_development_dependency "pry-doc", "~> 0.6"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.4"
end
