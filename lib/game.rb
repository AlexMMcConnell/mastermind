class Game
attr_reader :code,
            :guesses,
            :guess,
            :text

  def initialize(code) # creates an instance of the game with a code, starts a timer
    @code = code
    @guesses = []
    @guess = ""
    @starttime = Time.now
    @text = MastermindText.new
  end

  def store_guesses # stores user's guesses
    @guesses << @guess
  end

  def game_runner # loops until game finishes
    until @guess == "leave"
      text.take_a_guess
      if @guess != "leave"
        user_response
      end
    end

    true # for testing
  end

  def user_response # processes user's guesses and checks against expected responses
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

  def guess_options # helper method for user response
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

  def response_output # gives information on the given guess
    if @guess == code
      correct_guess
    elsif @guesses.count == 1
      puts "'#{@guess.upcase}' has #{elements_in_common} of the correct elements with #{position_checker} in the correct positions. You've \ntaken 1 guess"
    else
      puts "'#{@guess.upcase}' has #{elements_in_common} of the correct elements with #{position_checker} in the correct positions. You've \ntaken #{@guesses.count} guesses."
    end
  end

  def correct_guess # ends the game outputs game information
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

  def position_checker # checks the guess and returns the number of colors in the correct position
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

  def elements_in_common # checks the guess and returns the number of colors in common with the master code
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

  def quit # quits the game
    @guess = "leave"
  end

  def end_timer # stops the timer and returns amount of time that passed
    endtime = Time.now
    elapsed_time = (endtime - @starttime).to_i
    minutes = (elapsed_time / 60).to_i
    seconds = elapsed_time - minutes * 60
    "#{minutes} minutes \nand #{seconds} seconds"
  end

  def history # prints guess history
    p "Guess History:"
    @guesses.each do |guess|
      p guess.upcase
    end
  end
end
