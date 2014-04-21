require "spec_helper"

describe Gemgate::Storage::RiakCS do
  described_class_params = {
    "AWS_ACCESS_KEY_ID" => "foobar",
    "AWS_SECRET_ACCESS_KEY" => "foobar",
    "S3_BUCKET" => "gemgate-test",
    "S3_KEY_PREFIX" => "ultrasecure"
  }
  subject { described_class.new(described_class_params) }

  it "creates a public file with the given path and body" do
    subject.create("foobar", "hello")

    remote_file = remote_directory.files.detect {|f| f.key == "ultrasecure/foobar" }
    remote_file.should_not be_nil

    remote_file.body.should == "hello"

    remote_file.public_url.should_not be_nil
  end

  def remote_directory
    fog.directories.get("gemgate-test")
  end
end
