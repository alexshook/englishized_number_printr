require_relative '../englishizer'

describe Englishizer do
  describe "LIMIT" do
    it "should be 1 million" do
      expect(Englishizer::LIMIT).to eq(1_000_000)
    end
  end

  describe "englishize" do
    describe "numbers less than 10" do
      context "when the number is 1" do
        let(:englishizer) { Englishizer.new }

        before { stub_const("LIMIT", 2) }

        it "is one" do
          expect(englishizer.englishize).to eq("one")
        end
      end

      context "when the number is 10" do

      end
    end

    describe "numbers between 11 and 19" do
      context "when the number is 11" do

      end
    end

    describe "numbers between 100 and 200" do
      context "when the number is 100" do

      end
    end

    context "whent the number is 1_000_000" do

    end
  end
end
