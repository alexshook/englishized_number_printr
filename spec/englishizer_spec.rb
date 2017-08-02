require_relative '../englishizer'

describe Englishizer do
  describe "LIMIT" do
    it "should be 1 million" do
      expect(Englishizer::LIMIT).to eq(1_000_000)
    end
  end

  let(:englishizer) { Englishizer.new([]) }

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

      context "when the number is 1,001" do
        before { stub_const("Englishizer::LIMIT", 1002) }

        it "is one thousand one" do
          expect do
            englishizer.englishize(1001)
          end.to output("one thousand one\n").to_stdout
        end
      end

      context "when the number is 1,010" do
        before { stub_const("Englishizer::LIMIT", 1_011) }

        it "is one thousand ten" do
          expect do
            englishizer.englishize(1_010)
          end.to output("one thousand ten\n").to_stdout
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

      context "when the number is 1,101" do
        before { stub_const("Englishizer::LIMIT", 1102) }
        it "is one thousand one hundred one" do
          expect do
            englishizer.englishize(1101)
          end.to output("one thousand one hundred one\n").to_stdout
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

    describe "numbers between 100,000 and 200,000" do
      context "when the number is 100,000" do
        before { stub_const("Englishizer::LIMIT", 100_001) }

        it "is one hundred thousand" do
          expect do
            englishizer.englishize(100_000)
          end.to output("one hundred thousand\n").to_stdout
        end
      end

      context "when the number is 101,001" do
        before { stub_const("Englishizer::LIMIT", 101_002) }

        it "is one hundred thousand one thousand one" do
          expect do
            englishizer.englishize(101_001)
          end.to output("one hundred thousand one thousand one\n").to_stdout
        end
      end

      context "when the number is 100,011" do
        before { stub_const("Englishizer::LIMIT", 100_012) }

        it "is one hundred thousand eleven" do
          expect do
            englishizer.englishize(100_011)
          end.to output("one hundred thousand eleven\n").to_stdout
        end
      end

      context "when the number is 101,010" do
        before { stub_const("Englishizer::LIMIT", 101_011) }

        it "is one hund ten" do
          expect do
            englishizer.englishize(101_010)
          end.to output("one hundred thousand one thousand ten\n").to_stdout
        end
      end

      context "when the number is 101,101" do
        before { stub_const("Englishizer::LIMIT", 101_102) }

        it "is one hundred thousand one thousand one hundred one" do
          expect do
            englishizer.englishize(101_101)
          end.to output("one hundred thousand one thousand one hundred one\n").to_stdout
        end
      end

      context "when the number is 110,000" do
        before { stub_const("Englishizer::LIMIT", 110_001) }

        it "is one hundred ten thousand" do
          expect do
            englishizer.englishize(110_000)
          end.to output("one hundred ten thousand\n").to_stdout
        end
      end
    end

    describe "numbers between 200,001 and 999,999" do
      context "when the number is 901,101" do
        before { stub_const("Englishizer::LIMIT", 901_102) }

        it "is nine hundred thousand one thousand one hundred one" do
          expect do
            englishizer.englishize(901_101)
          end.to output("nine hundred thousand one thousand one hundred one\n").to_stdout
        end
      end
    end

    context "when the number is 1_000_000" do
      before { stub_const("Englishizer::LIMIT", 1_000_000) }

      it "is one million" do
        expect do
          englishizer.englishize(1_000_000)
        end.to output("one million\n").to_stdout
      end
    end
  end
end
