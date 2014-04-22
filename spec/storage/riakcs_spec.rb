require "spec_helper"

describe Gemgate::Storage::RiakCS do
  described_class_params = {
    "AWS_ACCESS_KEY_ID" => "foobar",
    "AWS_SECRET_ACCESS_KEY" => "foobar",
    "S3_BUCKET" => "gemgate-test",
    "S3_KEY_PREFIX" => "ultrasecure",
    "RIAKCS_HOST" => "http://foobar.com",
    "RIAKCS_PORT" => "8080"
  }

  subject { described_class.new(described_class_params) }

  it "has a host setup" do
    subject.host.should == "http://foobar.com"
  end

  it "should be a child object of Storage::S3" do
    subject.class.ancestors.should include(Gemgate::Storage::S3)
  end
end
