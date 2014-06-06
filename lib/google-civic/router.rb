module Google
  module Civic
    module Router

      BASE_URL  = "https://www.googleapis.com"
      BASE_PATH = "/civicinfo/v1"

      ROUTES    = {
        elections: {
          method: :get,
          path:   "/elections"
        },

        representative_info: {
          method: :post,
          path:   "/representatives/lookup"
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
    end
  end
end