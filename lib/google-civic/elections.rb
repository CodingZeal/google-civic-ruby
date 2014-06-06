module Google
  module Civic
    module Elections

      class InvalidZipcode < Exception; end

      class << self

        def for_zipcode(zipcode, client)
          raise InvalidZipcode if not zipcode?(zipcode)
          elections_from_response collection(zipcode, client)
        end

        private

        def elections_from_response(response)
          response.body.fetch("elections").map do |election|
            Election.new(election)
          end
        end

        def collection(zipcode, client)
          client.request(:elections, zipcode: zipcode)
        end

        def zipcode?(zipcode)
          zipcode =~ /\A\d{5}(?:[-\s]\d{4})?\z/
        end
      end
    end
  end
end