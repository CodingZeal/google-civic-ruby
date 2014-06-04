require "multi_json"
require "hashie"

module Google
  module Civic
    class Election < Hashie::Trash
      include Hashie::Extensions::Dash::IndifferentAccess

      property :id, required: true
      property :name, required: true
      property :election_day, from: :electionDay, required: true
    end
  end
end