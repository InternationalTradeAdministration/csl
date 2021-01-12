# frozen_string_literal: true

describe ScreeningList::Consolidated, type: :model do
  describe ".index_names" do
    subject { described_class.index_names(sources) }

    let(:all_index_names) do
      %w(cap dpl dtc el fse isn meu plc sdn ssi uvl)
    end

    context "with one source" do
      context "which is included in the list of models" do
        let(:sources) { ["SDN"] }
        it { is_expected.to eq ["sdn"] }
      end

      context "which is not included in the list of models" do
        let(:sources) { ["Foo"] }
        it { is_expected.to eq all_index_names }
      end
    end

    context "with multiple sources" do
      context "all of which are included in the list of models" do
        let(:sources) { %w(SDN FSE DTC) }
        it do
          is_expected.to eq ["dtc", "fse", "sdn"]
        end
      end

      context "some of which are included in the list of models" do
        let(:sources) { %w(Foo Bar DTC) }
        it { is_expected.to eq ["dtc"] }
      end

      context "some of which are included in the list of models" do
        let(:sources) { %w(Foo Bar) }
        it { is_expected.to eq all_index_names }
      end
    end
  end
end
