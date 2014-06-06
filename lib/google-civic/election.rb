module Google
  module Civic
    class Election < Representation
      def election_day
        self["electionDay"]
      end
    end
  end
end
