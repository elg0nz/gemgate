module Gemgate
  module Storage
    class RiakCS < S3
      class Error < StandardError; end

      def host
        return env!("RIAKCS_HOST")
      end

      private

      def fog
        Fog::Storage.new(
          :provider => "AWS",
          :aws_access_key_id => env!("AWS_ACCESS_KEY_ID"),
          :aws_secret_access_key => env!("AWS_SECRET_ACCESS_KEY"),
          :host => env!("RIAKCS_HOST"),
          :port => env!("RIAKCS_PORT")
        )
      end
    end
  end
end
