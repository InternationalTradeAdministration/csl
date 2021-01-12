# frozen_string_literal: true

describe "Searchable" do
  include_context "all CSL fixture data"
  describe "#fetch_all" do
    subject { ScreeningList::Consolidated.fetch_all }

    it "returns the correct number of documents" do
      expect(subject).to be_a(Hash)

      hits = subject[:hits]

      expect(hits.count).to eq(61)
      expect(hits.first[:_source]).to be_a(Hash)

      # Sorted correctly?
      expected = ["150th Aircraft Repair Plant (ARZ) (Kaliningrad)", "ABELAIRAS, AMANCIO J.", "ABRISHAMI, ELHAM", "ACE, IAN", "ADT ANALOG AND DIGITAL TECHNIK", "AGNESE, ANDREE", "AK TRANSNEFT OAO", "Abdul Qadeer Khan", "Academy of Business Security", "Advent International Limited"]
      expect(hits.first(10).map { |h| h[:sort] }.flatten).to eq expected
    end

    it "response includes metadata" do
      expect(subject.keys).to include(:search_performed_at)
      expect(subject[:search_performed_at]).to be_within(2).of(DateTime.now.utc)

      expect(subject.keys).to match_array([:total, :hits, :offset, :search_performed_at, :sources_used])
    end
  end
end
