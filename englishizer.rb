class Englishizer
  LIMIT = 1_000_000

  ONES = {
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

  TEENS = {
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

  TENS = {
    2 => "twenty",
    3 => "thirty",
    4 => "fourty",
    5 => "fifty",
    6 => "sixty",
    7 => "seventy",
    8 => "eighty",
    9 => "ninety"
  }

  INDEX_MAPPING = {
    0 => ONES,
    1 => TENS,
    2 => ONES,
    3 => ONES,
    4 => TENS,
    5 => ONES
  }

  SPECIAL_CARDINALS = {
    hundred: "hundred",
    thousand: "thousand"
  }

  def englishize(num=1)
    return if limit_reached?(num)
    digits = num.digits

    englishized_words = []
    digits.each_with_index do |digit, index|
      teens_case = handle_teens_case?(digit, index) ? true : false

      if teens_case && (index == 1 || index == 4)
        englishized_words.shift
        englishized_words.unshift(TEENS[digits[index - 1]])
      else
        if (index == 2 || index == 5) && digits[0..index].reduce(:+) != 0
          englishized_words.unshift(SPECIAL_CARDINALS[:hundred])
        end

        if index == 3
          englishized_words.unshift(SPECIAL_CARDINALS[:thousand])
        end

        englishized_words.unshift(INDEX_MAPPING[index][digit])
      end
    end

    puts englishized_words.compact.flatten.join(" ")

    next_num = num += 1
    englishize(next_num)
  end

  private

  def limit_reached?(num)
    if num == LIMIT
      puts "one million" if num == 1_000_000
      true
    else
      false
    end
  end

  def handle_teens_case?(digit, index)
    (index[1] || index[4]) && digit == 1
  end
end
