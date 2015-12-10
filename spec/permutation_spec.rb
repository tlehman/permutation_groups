require 'spec_helper'

describe Permutation do
  let(:matrix) { [[1,2,3,4,5],
                  [3,1,2,5,4]] }
  let(:row) { [3,1,2,5,4] }

  describe "#initialize" do
    it "requires all elements be unique" do
      expect { described_class.new([1,1,2]) }.to raise_error(Permutation::NotBijectionError)
    end
  end

  describe "#matrix_form" do
    subject { described_class.new(row).matrix_form }
    it { is_expected.to eq(matrix) }
  end

  describe "#cycle_form" do
    subject { described_class.new(row).cycle_form }
    it { is_expected.to eq("(1 3 2)(4 5)") }

    context "when permutation is trivial" do
      subject { described_class.new(row.sort).cycle_form }
      it { is_expected.to eq("()") }
    end
  end

end
