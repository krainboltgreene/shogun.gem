require "codeclimate-test-reporter"

CodeClimate::TestReporter.start

require "pry"
require "rspec"
require_relative File.join("..", "lib", "{{project_as_token}}")

RSpec.configure do |let|
  # Exit the spec after the first failure
  let.fail_fast = true

  # Only run a specific file, using the ENV variable
  # Example: FILE=spec/blankgem/version_spec.rb bundle exec rake spec
  let.pattern = ENV["FILE"]

  # Show the slowest examples in the suite
  let.profile_examples = true

  # Colorize the output
  let.color = true

  # Output as a document string
  let.default_formatter = "doc"
end
