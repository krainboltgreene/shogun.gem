require "spec_helper"

describe Shogun::Denormalizer do
  let(:denormalizer_klass) do
    class ExampleDenormalizer
      include Shogun::Denormalizer
    end
  end
  let(:denormalizer) { denormalizer_klass.new(object: presenter, fields: fields) }
  let(:namespace) { "accounts" }
  let(:presenter) { instance_double("Presenter") }
  let(:links) { { "a" => "b" } }
  let(:meta) { { "c" => "d" } }
  let(:linked) { { "e" => "f" } }
  let(:fields) { ["a", "b"] }
  let(:a) { "1" }
  let(:b) { "2" }
  let(:mapping) { { "a" => "a", "b" => "b"} }

  before(:each) do
    allow(presenter).to receive(:meta).and_return(meta)
    allow(presenter).to receive(:links).and_return(links)
    allow(presenter).to receive(:linked).and_return(linked)
    allow(presenter).to receive(:a).and_return(a)
    allow(presenter).to receive(:b).and_return(b)
    allow(denormalizer).to receive(:namespace).and_return(namespace)
    allow(denormalizer).to receive(:mapping).and_return(mapping)
  end

  describe "#as_document" do
    let(:as_document) { denormalizer.as_document }

    it "returns a hash" do
      expect(as_document).to be_a(Hash)
    end

    it "contains the meta key" do
      expect(as_document).to have_key(Shogun::Denormalizer::META_KEY)
    end

    it "contains the links key" do
      expect(as_document).to have_key(Shogun::Denormalizer::LINKS_KEY)
    end

    it "contains the linked key" do
      expect(as_document).to have_key(Shogun::Denormalizer::LINKED_KEY)
    end

    it "contains the namespace key" do
      expect(as_document).to have_key(namespace)
    end
  end
end
