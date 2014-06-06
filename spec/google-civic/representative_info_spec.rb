require "spec_helper"

module Google
  module Civic
    describe RepresentativeInfo do
      include_context "a connection to the client"
      let(:method) { :post }
      let(:kind) { "representative_info" }
      let(:path) { "representatives/lookup?key=#{api_key}&address=#{address}" }

      describe ".for_address" do
        subject { RepresentativeInfo.for_address(address, client) }
        let(:address) { "1263 Pacific Ave. Kansas City KS" }

        it { expect(subject.divisions).to have(8).record }
        it { expect(subject.offices).to have(19).record }
        it { expect(subject.officials).to have(20).record }
      end
    end
  end
end
