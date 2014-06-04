require "spec_helper"

module Google
  module Civic
    describe Client do
      include_context "a connection to the client"

      describe "#request" do
        subject { client.request(request_type, request_params) }
        let(:zipcode) { "12345" }
        let(:request_type) { :elections }
        let(:request_params) { Hash[ zipcode: zipcode ] }

        it { expect(subject).to be_a_kind_of Faraday::Response }
      end
    end
  end
end