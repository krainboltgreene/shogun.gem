require "spec_helper"

describe Shogun::VERSION do
  it "should be a string" do
    expect(Shogun::VERSION).to be_kind_of(String)
  end
end
