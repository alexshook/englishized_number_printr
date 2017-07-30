require_relative '../englishize'

describe Englishize do
  describe "LIMIT" do
    it "should be 1 million" do
      expect(Englishize::LIMIT).to eq(1_000_000)
    end
  end
end
