require "spec_helper"

module Google
  module Civic
    describe Division do
      subject { described_class.new(first_division, representation) }
      let(:representation) { MultiJson.load(load_fixture("representative_info")) }
      let(:first_division) {
        divisions = representation.fetch("divisions")
        divisions.keys.map do |key|
          divisions.fetch(key)
        end.select do |division|
          !division["officeIds"].nil? and !division["officeIds"].empty?
        end.first
      }

      it { expect(subject.name).to be_a_kind_of String }
      it { expect(subject.office_ids).to be_a_kind_of Array }
      it { expect(subject.offices.first).to be_a_kind_of Office }
    end
  end
end
