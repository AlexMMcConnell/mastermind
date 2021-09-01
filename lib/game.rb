require 'pry'
require 'time'

class Game
attr_reader :code,
            :guesses,
            :guess,
            :minutes,
            :seconds,
            :t

  def initialize(code)
    @code = code
    @guesses = []
    @guess = ""
    @minutes = 0
    @seconds = 0
    @t = 0
  end

  def store_guesses
    @guesses << @guess
  end

  def guesser
    @t = Time.now
    until @guess == "quit"
      p "What's your guess?"
      print "> "
      if @guess != "quit"
        answer
      end
    end
    return true # for testing
  end

  def answer
    @guess = gets.chomp.to_s.downcase
      if @guess == "c"
        p @code
      elsif @guess == "q"
        exit
      elsif @guess.length < 4
        p "Too short!"
      elsif @guess.length > 4
        p "Too long!"
      else
        store_guesses
        result_output
      end
  end

  def result_output
    if @guess == @code
      correct_guess
    elsif @guesses.count == 1
      puts "'#{@guess.upcase}' has #{in_common} of the correct elements with #{checker} in the correct positions
  You've taken 1 guess"
    else
      puts "'#{@guess.upcase}' has #{in_common} of the correct elements with #{checker} in the correct positions
  You've taken #{@guesses.count} guesses"
    end
  end

  def correct_guess
    # end_time
    if @guesses.count == 1
      puts "Congratulations! You guessed the sequence '#{@guess.upcase}' in 1 guess over #{@minutes} minutes, #{@seconds} seconds.

  Do you want to (p)lay again or (q)uit?"
    else
      puts "Congratulations! You guessed the sequence '#{@guess.upcase}' in #{guesses.count} guesses over #{@minutes} minutes, #{@seconds} seconds.

  Do you want to (p)lay again or (q)uit?"
    end
    quit
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
    return shared
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

  def quit
    @guess = "quit"
  end

  def end_time
    t2 = Time.now
    elapsed_time = (t2 - t).to_i
    @minutes = (elapsed_time / 60).to_i
    @seconds = (elapsed_time - @minutes * 60).to_i
  end
end
