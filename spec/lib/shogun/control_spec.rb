require "spec_helper"

describe Shogun::Control do
  let(:control_klass) do
    class ExampleControl
      include Shogun::Control
    end
  end
  let(:control) { control_klass.new }
  let(:status) { 200 }
  let(:headers) { { a: :b } }
  let(:body) { "foo" }

  before(:each) do
    allow(control).to receive(:status).and_return(status)
    allow(control).to receive(:headers).and_return(headers)
    allow(control).to receive(:body).and_return(body)
  end

  describe "#to_a" do
    let(:to_a) { control.to_a }

    it "returns an array with the status in first position" do
      expect(to_a[0]).to be(status)
    end

    it "returns an array with the headers in second position" do
      expect(to_a[1]).to be(headers)
    end

    it "returns an array with the body in third position" do
      expect(to_a[2]).to be(body)
    end
  end
end
