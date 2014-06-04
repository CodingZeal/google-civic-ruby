require "spec_helper"

module Google
  module Civic
    describe Requester do
      it "includes the Router" do
        expect(described_class.ancestors).to include Router
      end
    end
  end
end