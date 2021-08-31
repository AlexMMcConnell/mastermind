require "pry"

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
        in_common
        # equalizer
        # checker
        # store_guesses(guess)
      end
  end

  def checker #this will check the guess and see if it is correct!
    split_mastercode = @code.split("")
    split_guesscode = @guess.split("")
    shared = 0
    split_mastercode.zip(split_guesscode).each do |master, guess|
      if master == guess
        shared += 1
      end
    end
  end

  def in_common
    split_mastercode = @code.split("")
    split_guesscode = @guess.split("")
    split_mastercode.find_all do |master|
      duplicate_position = split_guesscode.index(master)
      if duplicate_position != nil
        split_guesscode.delete_at(duplicate_position)
      end
    end
    return 4 - split_guesscode.length
  end
end
