module {{project_as_atom}}
  module Verifier
    require_relative "verifier/allowed"
    require_relative "verifier/match"
    require_relative "verifier/presence"
    require_relative "verifier/range"
    require_relative "verifier/uniqueness"
  end
end
