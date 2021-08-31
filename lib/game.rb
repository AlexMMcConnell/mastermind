class Game
attr_reader :code,
            :guesses,
            :guess

  def initialize(code)
    @code = code
    @guesses = []
    @guess = ""
  end

  def store_guesses(guess)
    @guesses << guess
  end

  def guesser
    until @guess == @code
      p "What's your guess?"
      print "> "
      answer
      if @guess == "q"
        break
      end
    end
  gamedone = true # for testing
  return true #     for testing
  end

  def answer
    @guess = gets.chomp.to_s.downcase
      if @guess == "c"
        p @code
      elsif @guess.length < 4
        p "Too short!"
      elsif @guess.length > 4
        p "Too long!"
      else
        checker
        store_guesses(guess)
      end
  end

  def checker #this will check the guess and see if it is correct!
  end
end
