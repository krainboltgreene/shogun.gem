require "dotenv"
require "envied"

require "pg"
require "rom"

require "oj"
require "jwt"

require "shogun"

Dotenv.load
ENVied.require
ROM.setup(:memory)

module Shogun
  require_relative "shogun/control"
  require_relative "shogun/presenters"
  require_relative "shogun/verifier"
end
