require 'spec_helper'

describe SymmetricGroup do
  describe "#size" do
    subject { described_class.new(n).size }

    context "when n = 1" do
      let(:n) { 1 }
      it { is_expected.to eq(1) }
    end

    context "when n = 2" do
      let(:n) { 2 }
      it { is_expected.to eq(2) }
    end

    context "when n = 3" do
      let(:n) { 3 }
      it { is_expected.to eq(6) }  # 3! = 6
    end

    context "when n = 4" do
      let(:n) { 4 }
      it { is_expected.to eq(24) }  # 4! = 24
    end

    context "when n = 5" do
      let(:n) { 5 }
      it { is_expected.to eq(120) }  # 5! = 120
    end
  end

  describe "#to_s" do
    subject { described_class.new(n).to_s }

    context "when n = 1" do
      let(:n) { 1 }
      it { is_expected.to eq("{()}") }
    end

    context "when n = 2" do
      let(:n) { 2 }
      it { is_expected.to eq("{(), (1 2)}") }
    end

    context "when n = 3" do
      let(:n) { 3 }
      it { is_expected.to eq("{(), (2 3), (1 2), (1 2 3), (1 3 2), (1 3)}") }
    end

  end
end
