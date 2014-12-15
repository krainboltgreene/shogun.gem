require "spec_helper"

describe Shogun::Server do
  let("described_class") do
    Class.new { include Shogun::Server }
  end

  let("server") do
    described_class.new
  end

  describe "#serve" do
    let("serve") do
      server.serve
    end
  end
end
