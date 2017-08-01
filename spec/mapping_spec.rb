require_relative '../mapping'

describe Mapping do
  describe "ONES" do
    it "should map 1-9 to English equivalents" do
      expect(Mapping::ONES).to eq(
        {
          0 => nil,
          1 => "one", 
          2 => "two",
          3 => "three",
          4 => "four",
          5 => "five",
          6 => "six",
          7 => "seven",
          8 => "eight",
          9 => "nine"
        }
      )
    end
  end

  describe "TEENS" do
    it "should map number keys to teens" do
      expect(Mapping::TEENS).to eq(
        {
          0 => "ten",
          1 => "eleven",
          2 => "twelve",
          3 => "thirteen",
          4 => "fourteen",
          5 => "fifteen",
          6 => "sixteen",
          7 => "seventeen",
          8 => "eighteen",
          9 => "nineteen"
        }
      )
    end
  end

  describe "TENS" do
    it "should map number keys to tens" do
      expect(Mapping::TENS).to eq(
        {
          2 => "twenty",
          3 => "thirty",
          4 => "fourty",
          5 => "fifty",
          6 => "sixty",
          7 => "seventy",
          8 => "eighty",
          9 => "ninety"
        }
      )
    end
  end

  describe "INDEX_MAPPING" do
    it "should map index numbers to englishized constant mappings" do
      expect(Mapping::INDEX_MAPPING).to eq(
        {
          0 => Mapping::ONES,
          1 => Mapping::TENS,
          2 => Mapping::ONES,
          3 => Mapping::ONES,
          4 => Mapping::TENS,
          5 => Mapping::ONES
        }
      )
    end
  end

  describe "SPECIAL_CARDINALS" do
    it "maps hundred and thousand to englishized values" do
      expect(Mapping::SPECIAL_CARDINALS).to eq(
        {
          hundred: "hundred",
          thousand: "thousand"
        }
      )
    end
  end
end
