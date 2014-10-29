module Shogun
  module Authorizer
    def denied?
      !allowed?
    end
  end
end
