require 'spec_helper'

describe Permutation do
  let(:matrix) { [[1,2,3],
                  [1,3,2]] }
  let(:row) { [1,3,2] }

  describe "matrix" do
    subject { described_class.new(row).matrix }
    it { is_expected.to eq(matrix) }
  end

  describe "cycle" do
    subject { described_class.new(row).cycle }
    it { is_expected.to eq("(2 3)") }

    context "when permutation is trivial" do
      subject { described_class.new(row.sort).cycle }
      it { is_expected.to eq("()") }
    end
  end

end
