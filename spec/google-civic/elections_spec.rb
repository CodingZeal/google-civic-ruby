require "spec_helper"

module Google
  module Civic
    describe Elections do
      include_context "a connection to the client"

      describe ".for_zipcode" do
        subject { Elections.for_zipcode(zipcode, client) }

        context "with an invalid zipcode" do
          let(:zipcode) { "1234567890" }
          it { expect { subject }.to raise_error(Elections::InvalidZipcode) }
        end

        context "with a valid 9 digit zipcode" do
          let(:zipcode) { "12345-1234" }
          it { expect { subject }.not_to raise_error }
        end

        context "with a valid 5 digit zipcode" do
          let(:zipcode) { "12345" }
          it { expect(subject).to have(3).record }
          it { expect(subject.first).to be_a_kind_of Election }
        end
      end
    end
  end
end