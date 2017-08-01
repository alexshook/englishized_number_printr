module Mapping
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
    4 => "forty",
    5 => "fifty",
    6 => "sixty",
    7 => "seventy",
    8 => "eighty",
    9 => "ninety"
  }

  SPECIAL_CARDINALS = {
    hundred: "hundred",
    thousand: "thousand"
  }

  INDEX_MAPPING = {
    0 => ONES,
    1 => TENS,
    2 => ONES,
    3 => ONES,
    4 => TENS,
    5 => ONES
  }
end