module Google
  module Civic
    class Official < Representation
      def address
      end

      def addresses
        @__addresses ||= self["address"].map { |address| Address.new(address) }
      end

      def channels
        @__channels ||= self["channels"].map { |channel| channel_class.new(channel) }
      end

      private

      def channel_class
        Object.const_get("Google::Civic::#{channel.fetch("type")}")
      end
    end
  end
end
