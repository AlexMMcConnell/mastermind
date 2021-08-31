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
