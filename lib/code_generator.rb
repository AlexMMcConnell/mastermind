class CodeGenerator
  attr_reader :difficulty

  def initialize(difficulty) # creates an instance of code_generator with a difficulty
    @difficulty = difficulty
  end

  def shuffler # shuffles a string of potential colors
    if difficulty == "beginner" || difficulty == "b"
      beginner_init_code = "rrrrbbbbggggyyyy"
      beginner_init_code.split("").shuffle
    elsif difficulty == "intermediate" || difficulty == "i"
      intermediate_init_code = "rrrrrrbbbbbbggggggyyyyyyoooooo"
      intermediate_init_code.split("").shuffle
    elsif difficulty == "advanced" || difficulty == "a"
      advanced_init_code = "rrrrrrrrbbbbbbbbggggggggyyyyyyyyoooooooopppppppp"
      advanced_init_code.split("").shuffle
    end
  end

  def creator # generates master code based off of shuffled colors
    shuffled_code = shuffler
    if difficulty == "beginner" || difficulty == "b"
      mastercode = shuffled_code[0..3]
    elsif difficulty == "intermediate" || difficulty == "i"
      mastercode = shuffled_code[0..5]
    elsif difficulty == "advanced" || difficulty == "a"
      mastercode = shuffled_code[0..7]
    else
      mastercode = []
    end
    mastercode.flatten.join
  end

  def code_length # helper method for testing
    creator.length
  end
end
