module Google
  module Civic
    class Requester
      include Router

      def initialize(connection, request_params={})
        @connection = connection
        @connection.base_url = BASE_URL
        @request_params = request_params
      end

      def request(kind, params={})
        @connection.send method_for(kind) do |request|
          request.url path_for(kind), @request_params.merge(params)
        end
      end
    end
  end
end