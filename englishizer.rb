require_relative 'mapping'

class Englishizer
  include Mapping

  LIMIT = 1_000_000

  attr_reader :lower, :upper

  def initialize(argv)
    lower_upper = argv.flatten.map(&:to_i)

    @lower = lower_upper[0] || 1
    @upper = lower_upper[1] || LIMIT
  end

  def englishize(num=@lower)
    return if limit_reached?(num)

    digits = num.digits

    englishized_words = []
    digits.each_with_index do |digit, index|
      if teens_case?(digit, index)
        handle_teens_case(digits, digit, index, englishized_words)
      else
        if hundreds_case?(digits, digit, index, englishized_words)
          add_englishized(SPECIAL_CARDINALS[:hundred], englishized_words)
        elsif thousands_case?(digits, index, englishized_words)
          add_englishized(SPECIAL_CARDINALS[:thousand], englishized_words)
        end

        englishized_words.unshift(INDEX_MAPPING[index][digit])
      end
    end

    puts englishized_number(englishized_words)

    increment_number(num)
  end

  private

  def limit_reached?(num)
    if num >= @upper + 1 || num >= LIMIT
      puts "one million" if num == 1_000_000
      true
    else
      false
    end
  end

  def handle_teens_case(digits, digit, index, englishized_words)
    englishized_words.shift
    add_englishized(TEENS[digits[index - 1]], englishized_words)
  end

  def teens_case?(digit, index)
    teens_index?(index) && ((index[1] || index[4]) && digit == 1)
  end

  def teens_index?(index)
    index == 1 || index == 4
  end

  def hundreds_case?(digits, digit, index, englishized_words)
    hundreds_index?(index) && digits[index] != 0
  end

  def hundreds_index?(index)
    index == 2 || index == 5
  end

  def thousands_case?(digits, index, englishized_words)
    return false if thousand_already_exists?(englishized_words)

    index == 3 ||
      (index == 4 && digits[4] == 0) &&
      will_not_add_duplicate_thousand?(digits)
  end

  def thousand_already_exists?(englishized_words)
    englishized_words.compact[0] == SPECIAL_CARDINALS[:thousand]
  end

  def will_not_add_duplicate_thousand?(digits)
    digits[0..digits[digits.size - 1]].reduce(:+) != 0
  end

  def add_englishized(mapping_value, englishized_words)
    englishized_words.unshift(mapping_value)
  end

  def englishized_number(englishized_words)
    englishized_words.compact.flatten.join(" ")
  end

  def increment_number(num)
    next_num = num += 1
    englishize(next_num)
  end
end
