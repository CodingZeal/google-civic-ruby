require "faraday"
require "faraday_middleware"
require "delegate"

module Google
  module Civic
    class Connection < SimpleDelegator

      attr_writer :base_url

      def initialize(opts={})
        self.base_url = opts.fetch(:base_url, "")
        super(resource)
      end

      private

      attr_reader :base_url

      def establish!
        @resource = Faraday.new(base_url) do |builder|
          builder.request :json
          builder.request :url_encoded
          builder.use FaradayMiddleware::ParseJson
          builder.adapter  Faraday.default_adapter
        end
      end

      def resource
        @resource or establish!
      end
    end
  end
end
