require "spec_helper"

describe Gemgate::GemFiles do
  it "adds a gem using storage" do
    gem = double("gem")
    gem.should_receive(:filename) { "foobar-0.0.1.gem" }
    gem.should_receive(:data) { "data" }

    storage = double("storage")
    storage.should_receive(:create).with("gems/foobar-0.0.1.gem", "data")

    subject.storage = storage

    subject.add(gem)
  end
end
