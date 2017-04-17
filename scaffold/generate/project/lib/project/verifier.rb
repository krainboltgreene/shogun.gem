module {{project_as_namespace}}
  module Verifier
    require_relative "verifier/allowed"
    require_relative "verifier/match"
    require_relative "verifier/presence"
    require_relative "verifier/range"
    require_relative "verifier/uniqueness"
  end
end
