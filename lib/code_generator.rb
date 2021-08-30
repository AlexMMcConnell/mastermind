class CodeGenerator
  def shuffler
    #eventually create an if/else branch for intermediate/expert difficulty
    beginner_init_code = "RRRRBBBBGGGGYYYY"
    beginner_init_code.split("").shuffle
  end

  def creator
    shuffled_code = shuffler
    mastercode = shuffled_code[0..3]
    mastercode.flatten.join
  end
end
