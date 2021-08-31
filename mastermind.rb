require './lib/code_generator'
require './lib/instructions'
require './lib/game'

print "Welcome to MASTERMIND

"
puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

answer = ""
generator = CodeGenerator.new
mastercode = generator.creator
newgame = Game.new(mastercode)

until answer == "q"
  print "> "
  answer = gets.chomp.to_s
  if answer == "i"
    instructions
    print '

'
    p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  elsif answer == "p"
    print "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.

"
    newgame.guesser
  end
end
