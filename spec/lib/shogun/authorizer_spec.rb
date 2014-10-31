require "spec_helper"

describe Shogun::Authorizer do
  let(:authorizer_klass) do
    class ExampleAuthorizer
      include Shogun::Authorizer
    end
  end
  let(:authorizer) { authorizer_klass.new }

  describe "#denied?" do
    let(:denied?) { authorizer.denied? }

    context "if #allowed? is true" do
      it "returns false" do
        allow(authorizer).to receive(:allowed?).and_return(true)
        expect(denied?).to be(false)
      end
    end

    context "if #allowed? is false" do
      it "returns true" do
        allow(authorizer).to receive(:allowed?).and_return(false)
        expect(denied?).to be(true)
      end
    end
  end
end
