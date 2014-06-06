require "spec_helper"

module Google::Civic
  describe Election do
    subject { Election.new(response) }
    let(:response) { MultiJson.load(load_fixture("elections"))["elections"][0] }

    its(:id)          { should_not be_nil }
    its(:name)        { should_not be_nil }
    its(:electionDay) { should_not be_nil }
  end
end
