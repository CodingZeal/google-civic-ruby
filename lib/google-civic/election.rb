require "multi_json"
require "hashie"

module Google
  module Civic
    class Election < Hashie::Dash
      include Hashie::Extensions::Dash::IndifferentAccess

      property :id, required: true
      property :name, required: true
      property :electionDay, required: true
    end
  end
end
