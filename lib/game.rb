require 'pry'
require 'time'

class Game
attr_reader :code,
            :guesses,
            :guess,
            :text

  def initialize(code)
    @code = code
    @guesses = []
    @guess = ""
    @starttime = Time.now
    @text = MastermindText.new
  end

  def store_guesses
    @guesses << @guess
  end

  def game_runner
    until @guess == "leave"
      text.take_a_guess
      if @guess != "leave"
        user_response
      end
    end

    true # for testing
  end

  def user_response
    @guess = gets.chomp.to_s.downcase
    if guess_options != nil
      @guess
    elsif (@guess.length < @code.length)
      p "Too short!"
    elsif (@guess.length > @code.length)
      p "Too long!"
    else
      store_guesses
      response_output
    end
  end

  def guess_options
    if (@guess == "c") || (@guess == "cheat")
      p code
    elsif (@guess == "q") || (@guess == "quit")
      text.game_abort
      @guess = "leave"
    elsif (@guess == "h") || (@guess == "history")
      history
      p "-------------------------"
    else
    end
  end

  def response_output
    if @guess == code
      correct_guess
    elsif @guesses.count == 1
      puts "'#{@guess.upcase}' has #{elements_in_common} of the correct elements with #{position_checker} in the correct positions. You've taken 1 guess"
    else
      puts "'#{@guess.upcase}' has #{elements_in_common} of the correct elements with #{position_checker} in the correct positions. You've taken #{@guesses.count} guesses."
    end
  end

  def correct_guess
    end_timer
    if @guesses.count == 1
      print "Congratulations! You guessed the sequence '#{@guess.upcase}' in 1 guess over #{end_timer}. Do you want to (p)lay again or (q)uit?
> "
    else
      print "Congratulations! You guessed the sequence '#{@guess.upcase}' in #{guesses.count} guesses over #{end_timer}. Do you want to (p)lay again or (q)uit?
> "
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
    @guess = "leave"
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
