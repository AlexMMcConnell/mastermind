class Helper

  def initialize(text)
    @text = text
  end

  def intro
    print "Welcome to MASTERMIND

    "
    answer = ""
    @text.main_menu
    @answer = gets.chomp.to_s
  end

  def answer_loop
    until @answer == "q" || @answer == "quit" || @answer == "yes"
      answer_options
      @answer = gets.chomp.to_s
      if @answer != "q" || @answer != "quit" || @answer != "yes"
        @text.main_menu
      end
    end
  end

  def print_instructions
    @text.instructions
    @text.main_menu
  end

  def difficulty_loop
    until difficulty_selector != "invalid"
      difficulty_selector
    end
  end

  def difficulty_selector
    difficulty = gets.chomp.to_s
    if difficulty == "beginner" || difficulty == "b"
      @text.beginner_sequence
    elsif difficulty == "intermediate" || difficulty == "i"
      @text.intermediate_sequence
    elsif difficulty == "advanced" || difficulty == "a"
      @text.advanced_sequence
    else
      p "Invalid input"
      "invalid"
    end
    difficulty
  end

  def instantiator
    generator = CodeGenerator.new(difficulty_selector)
    mastercode = generator.creator
    newgame = Game.new(mastercode)
    newgame.game_runner
    difficulty = "invalid"
  end

  def answer_options
    if @answer == "i" || @answer == "instructions"
      print_instructions
    elsif @answer == "p" || @answer == "play"
      print "What difficulty would you like to play on: (b)eginner,
      (i)ntermediate, or (a)dvanced?
> "
      instantiator
    else
      p "Invalid input."
      @text.main_menu
    end
  end

  def game_start
    intro
    answer_loop
  end
end