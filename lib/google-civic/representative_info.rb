module Google
  module Civic
    class RepresentativeInfo < Representation

      def self.for_address(address, client)
        representative_info_from_response response(address, client)
      end

      def divisions
        @divisions ||= self["divisions"].keys.map do |key|
          division_rep = self["divisions"].fetch(key).merge(id: key)
          Division.new(division_rep, @root_scope)
        end
      end

      def offices
        @offices ||= self["offices"].keys.map do |key|
          office_rep = self["offices"].fetch(key).merge(id: key)
          Office.new(office_rep, @root_scope)
        end
      end

      private

      def self.representative_info_from_response(response)
        RepresentativeInfo.new(response.body)
      end

      def self.response(address, client)
        client.request(:representative_info, address: address)
      end
    end
  end
end
