require './lib/code_generator'
require './lib/instructions'
require './lib/game'
require 'pry'

print "Welcome to MASTERMIND

"
puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

answer = ""
text = Text.new
difficulty = "invalid"

until answer == "q" || answer == "quit"
  print "> "
  answer = gets.chomp.to_s
  if answer == "i" || answer == "instructions"
    text.instructions
    print '

'
    p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  elsif answer == "p" || answer == "play"
    p "What difficulty would you like to play on: (b)eginner, (i)ntermediate, or (a)dvanced?"

      until difficulty != "invalid"
        difficulty = gets.chomp.to_s
        if difficulty == "beginner" || difficulty == "b"
          text.beginner_sequence
        elsif difficulty == "intermediate" || difficulty == "i"
          text.intermediate_sequence
        elsif difficulty == "advanced" || difficulty == "a"
          text.advanced_sequence
        elsif
          p "Invalid input"
          difficulty = "invalid"
        end
      end

      generator = CodeGenerator.new(difficulty)
      mastercode = generator.creator
      newgame = Game.new(mastercode)
      newgame.game_runner
  end
end
