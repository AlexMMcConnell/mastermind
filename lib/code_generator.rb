class CodeGenerator
  attr_reader :difficulty

  def initialize(difficulty)
    @difficulty = difficulty
  end

  def shuffler
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

  def creator
    shuffled_code = shuffler
    if difficulty == "beginner" || difficulty == "b"
      mastercode = shuffled_code[0..3]
    elsif difficulty == "intermediate" || difficulty == "i"
      mastercode = shuffled_code[0..5]
    else difficulty == "advanced" || difficulty == "a"
      mastercode = shuffled_code[0..7]
    end
    mastercode.flatten.join
  end
end
