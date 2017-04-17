module {{Shogun}}
  module Validator
    def valid?
      verifiers.all?(&:valid?)
    end

    def invalids
      verifiers.reject(&:valid?)
    end

    private def verifiers
      @verifiers
    end
  end
end
