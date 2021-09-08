class MastermindHelper
  attr_reader :text

  def initialize # creates a new instance of the mastermind helper
    @text = MastermindText.new
  end

  def intro # prints the introduction to the game
    text.warm_welcome
    answer = ""
    text.main_menu
  end

  def answer_loop # takes user input and determines which answer path to take
    @answer = gets.chomp.to_s
    until @answer == "q" || @answer == "quit" || @answer == "yes"
      answer_options
      @answer = gets.chomp.to_s
    end
    true # for testing
  end

  def print_instructions # prints the instructions, then returns to the main menu
    text.instructions
    text.main_menu
  end

  def difficulty_loop # loops until a valid difficulty is selected
    until difficulty_selector != "invalid"
      difficulty_selector
    end
    true #for testing
  end

  def difficulty_selector # selects a difficulty based on user input
    difficulty = gets.chomp.to_s
    if difficulty == "beginner" || difficulty == "b"
      text.beginner_sequence
    elsif difficulty == "intermediate" || difficulty == "i"
      text.intermediate_sequence
    elsif difficulty == "advanced" || difficulty == "a"
      text.advanced_sequence
    elsif difficulty == "quit" || difficulty == "q"
      @guess = "leave"
      difficulty = "invalid"
    else
      puts "Invalid input, returning to main menu."
      difficulty = "invalid"
    end
    difficulty
  end

  def instantiator # starts the game based on difficulty: if difficulty is invalid returns to main menu
    difficulty = difficulty_selector
    if difficulty != "invalid"
      generator = CodeGenerator.new(difficulty)
      mastercode = generator.creator
      newgame = Game.new(mastercode)
      newgame.game_runner
    else
      text.main_menu
    end
  end

  def answer_options # starts the logic loop of the main menu
    if @answer == "i" || @answer == "instructions"
      print_instructions
    elsif @answer == "p" || @answer == "play"
      text.select_difficulty
      instantiator
    elsif @answer == "no" || @answer == "n"
        text.main_menu
    elsif @answer == "q" || @answer == "quit" || @answer == "yes"
    else
      p "Invalid input."
      text.main_menu
    end
  end

  def game_start # starts the logic loop of the program using the answer loop
    intro
    answer_loop
  end
end
