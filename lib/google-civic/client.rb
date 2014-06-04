module Google
  module Civic
    class Client
      def initialize(api_key, connection)
        @api_key    = api_key
        @connection = connection
      end

      def elections(zipcode)
        Elections.for_zipcode(zipcode, self)
      end

      def voter_info(address)
        VoterInfo.for_address(address, self)
      end

      def request(*args)
        @request       ||= {}
        @request[args] ||= Requester.new(connection, { key: api_key }).request(*args)
      end

      private

      def connection
        @connection or raise "Connection not established"
      end

      def api_key
        @api_key or raise "No Google API key defined"
      end
    end
  end
end

