module Google
  module Civic
    module Router

      BASE_URL  = "https://www.googleapis.com"
      BASE_PATH = "/civicinfo/v1"
      ROUTES    = {
        elections: {
          method: :get,
          path: "/elections",
          klass: Election
        }
      }

      private

      def route_map_for(kind)
        ROUTES.fetch(kind)
      end

      def method_for(kind)
        route_map_for(kind).fetch(:method)
      end

      def path_for(kind)
        [BASE_PATH, route_map_for(kind).fetch(:path)].join('')
      end

      def klass_for(kind)
        route_map_for(kind).fetch(:klass)
      end
      alias :class_for :klass_for
    end
  end
end