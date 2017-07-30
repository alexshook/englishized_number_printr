class Englishizer
  LIMIT = 1_000_000

  def englishize(num=1)
    return if limit_reached?(num)

  end

  private

  def limit_reached?(num)
    if num == 1_000_000
      puts "one million"      
      true
    else
      false
    end
  end
end
