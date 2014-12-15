require "spec_helper"

describe Shogun::Validator do
  let("described_class") do
    Class.new { include Shogun::Validator }
  end

  let("validator") do
    described_class.new
  end

  let("verifier_a") do
    instance_double("Verifier")
  end

  let("verifier_b") do
    instance_double("Verifier")
  end

  let("verifiers") do
    [verifier_a, verifier_b]
  end

  before("each") do
    allow(verifier_a).to receive("valid?").and_return(true)
    allow(verifier_b).to receive("valid?").and_return(true)
    allow(validator).to receive("verifiers").and_return(verifiers)
  end

  describe "#invalids" do
    let("invalids") do
      validator.invalids
    end

    context "if all verifiers are valid" do
      it "returns an empty array" do
        expect(invalids).to eq([])
      end
    end

    context "if some verifiers are invalid" do
      before("each") do
        allow(verifier_b).to receive("valid?").and_return(false)
      end

      it "returns the invalid verifiers" do
        expect(invalids).to include(verifier_b)
      end
    end
  end

  describe "#valid?" do
    let("valid?") do
      validator.valid?
    end

    context "if all verifiers are valid" do
      it "returns true" do
        expect(valid?).to be(true)
      end
    end

    context "if some verifiers are invalid" do
      before("each") do
        allow(verifier_b).to receive("valid?").and_return(false)
      end

      it "returns false" do
        expect(valid?).to be(false)
      end
    end
  end
end
