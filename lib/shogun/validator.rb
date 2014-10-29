module Shogun
  module Validator
    def valid?
      verifiers.all?(&:valid?)
    end

    def to_array
      verifiers.reject(&:valid?)
    end

    private def verifiers
      @verifiers
    end
  end
end
