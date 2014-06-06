require "faraday"
require "faraday_middleware"

module Google
  module Civic
    class Connection
      attr_writer :base_url

      def initialize(params={})
        @base_url = params.delete(:base_url)
        establish!
      end

      def get(*args, &block)
        resource.get(*args, &block)
      end

      def post(*args, &block)
        resource.post(*args, &block)
      end

      private

      def establish!
        @resource = Faraday.new(base_url) do |builder|
          builder.request :json
          builder.request :url_encoded
          builder.use FaradayMiddleware::ParseJson
          builder.adapter  Faraday.default_adapter
        end
      end

      def resource
        @resource or raise "Connection not established"
      end

      def base_url
        @base_url or ""
      end
    end
  end
end
