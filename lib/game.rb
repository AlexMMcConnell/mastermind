require 'pry'
require 'time'

class Game
attr_reader :code,
            :guesses,
            :guess

  def initialize(code)
    @code = code
    @guesses = []
    @guess = ""
    @starttime = Time.now
  end

  def store_guesses
    @guesses << @guess
  end

  def game_runner
    until @guess == "quit"
      p "What's your guess?"
      print "> "
      if @guess != "quit"
        user_response
      end
    end

    true # for testing
  end

  def user_response
    @guess = gets.chomp.to_s.downcase
    if @guess == "c"
      p code
    elsif @guess == "q"
      exit
    elsif @guess == "h"
      history
      p "-------------------------"
    elsif @guess.length < @code.length
      p "Too short!"
    elsif @guess.length > @code.length
      p "Too long!"
    else
      store_guesses
      response_output
    end
  end

  def response_output
    if @guess == code
      correct_guess
    elsif @guesses.count == 1
      puts "'#{@guess.upcase}' has #{elements_in_common} of the correct
elements with #{position_checker} in the correct positions. You've taken
1 guess"
    else
      puts "'#{@guess.upcase}' has #{elements_in_common} of the correct
elements with #{position_checker} in the correct positions. You've taken
#{@guesses.count} guesses."
    end
  end

  def correct_guess
    end_timer
    if @guesses.count == 1
      puts "Congratulations! You guessed the sequence '#{@guess.upcase}'

in 1 guess over #{end_timer}. Do you want to (p)lay again or (q)uit?"
    else
      puts "Congratulations! You guessed the sequence '#{@guess.upcase}'

in #{guesses.count} guesses over #{end_timer}.cDo you want to (p)lay again

or (q)uit?"
    end
    quit
  end

  def position_checker #this will check the guess and see if it is correct!
    split_mastercode = code.split("")
    split_guesscode = @guess.split("")
    shared = 0
    split_mastercode.zip(split_guesscode).each do |master, guess|
      if master == guess
        shared += 1
      end
    end
    shared
  end

  def elements_in_common
    split_mastercode = code.split("")
    split_guesscode = @guess.split("")
    split_mastercode.find_all do |master|
      duplicate_position = split_guesscode.index(master)
      if duplicate_position != nil
        split_guesscode.delete_at(duplicate_position)
      end
    end
    @code.length - split_guesscode.length
  end

  def quit
    @guess = "quit"
  end

  def end_timer
    endtime = Time.now
    elapsed_time = (endtime - @starttime).to_i
    minutes = (elapsed_time / 60).to_i
    seconds = elapsed_time - minutes * 60
    "#{minutes} minutes and #{seconds} seconds"
  end

  def history
    p "Guess History:"
    @guesses.each do |guess|
      p guess.upcase
    end
  end
end
