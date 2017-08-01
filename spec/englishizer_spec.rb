require_relative '../englishizer'

describe Englishizer do
  describe "LIMIT" do
    it "should be 1 million" do
      expect(Englishizer::LIMIT).to eq(1_000_000)
    end
  end

  describe "ONES" do
    it "should map 1-9 to English equivalents" do
      expect(Englishizer::ONES).to eq(
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
      expect(Englishizer::TEENS).to eq(
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
      expect(Englishizer::TENS).to eq(
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
      expect(Englishizer::INDEX_MAPPING).to eq(
        {
          0 => Englishizer::ONES,
          1 => Englishizer::TENS,
          2 => Englishizer::ONES,
          3 => Englishizer::ONES,
          4 => Englishizer::TENS,
          5 => Englishizer::ONES
        }
      )
    end
  end

  let(:englishizer) { Englishizer.new }

  describe "englishize" do
    describe "numbers less than 10" do
      context "when the number is 1" do

        before { stub_const("Englishizer::LIMIT", 2) }

        it "is one" do
          expect { englishizer.englishize(1) }.to output("one\n").to_stdout
        end
      end

      context "when the number is 10" do
        before { stub_const("Englishizer::LIMIT", 11) }

        it "is ten" do
          expect { englishizer.englishize(10) }.to output("ten\n").to_stdout
        end
      end
    end

    describe "numbers between 11 and 19" do
      context "when the number is 11" do
        before { stub_const("Englishizer::LIMIT", 12) }

        it "is eleven" do
          expect { englishizer.englishize(11) }.to output("eleven\n").to_stdout
        end
      end
    end

    describe "numbers between 20 and 99" do
      context "when the number is 20" do
        before { stub_const("Englishizer::LIMIT", 21) }

        it "is twenty" do
          expect { englishizer.englishize(20) }.to output("twenty\n").to_stdout
        end
      end

      context "when the number is 21" do
        before { stub_const("Englishizer::LIMIT", 22) }

        it "is twenty one" do
          expect do
            englishizer.englishize(21)
          end.to output("twenty one\n").to_stdout
        end
      end
    end

    describe "numbers between 100 and 200" do
      context "when the number is 100" do
        before { stub_const("Englishizer::LIMIT", 101) }

        it "is one hundred" do
          expect do
            englishizer.englishize(100)
          end.to output("one hundred\n").to_stdout
        end
      end
    end

    describe "numbers between 1000 and 2000" do
      context "when the number is 1000" do
        before { stub_const("Englishizer::LIMIT", 1001) }

        it "is one thousand" do
          expect do
            englishizer.englishize(1000)
          end.to output("one thousand\n").to_stdout
        end
      end

      context "when the number is 1100" do
        before { stub_const("Englishizer::LIMIT", 1101) }

        it "is one thousand one hundred" do
          expect do
            englishizer.englishize(1100)
          end.to output("one thousand one hundred\n").to_stdout
        end
      end
    end

    describe "numbers between 10,000 and 20,000" do
      context "when the number is 10,000" do
        before { stub_const("Englishizer::LIMIT", 10_001) }

        it "is ten thousand" do
          expect do
            englishizer.englishize(10_000)
          end.to output("ten thousand\n").to_stdout
        end
      end

      context "when the number is 11,000" do
        before { stub_const("Englishizer::LIMIT", 11_001) }

        it "is eleven thousand" do
          expect do
            englishizer.englishize(11_000)
          end.to output("eleven thousand\n").to_stdout
        end
      end
    end

    context "whent the number is 1_000_000" do
      before { stub_const("Englishizer::LIMIT", 1_000_000) }

        it "is one million" do
          expect do
            englishizer.englishize(1_000_000)
          end.to output("one million\n").to_stdout
        end
    end
  end
end
