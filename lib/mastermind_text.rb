class MastermindText
  def warm_welcome
    print "Welcome to Mastermind, a game built by Alex McConnell and Micha Bernhard!

    "
  end

  def instructions # outputs instructions for playing Mastermind into terminal
    print "Instructions for Mastermind:

"
    print "Mastermind is a game where you attempt to guess the code that the Mastermind, \nor keyholder, has given. You have to enter colors that match up with the code \nthat the keyholder has determined using single letters for each color:

"
  # if branch for game types later
    print " r for red, g for green, b for blue, and y for yellow

"
    puts "You guess in a four letter format (rgby, for instance), and the game will \ngive you a response detailing how many of your guesses were of the correct \ncolor, and which were in the correct position. Once you have guessed the full \ncode correctly, you will have won the game!"
  end

  def beginner_sequence
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, \n(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. Use \n(h)istory to see your guess history."
  end

  def intermediate_sequence
    puts "I have generated an intermediate sequence with six elements made up of: (r)ed, \n(g)reen, (b)lue, (y)ellow, and (o)range. Use (q)uit at any time to end the \ngame. Use (h)istory to see your guess history."
  end

  def advanced_sequence
    puts "I have generated an advanced sequence with eight elements made up of: (r)ed, \n(g)reen, (b)lue, (y)ellow, (o)range, and (p)urple. Use (q)uit at any time to \nend the game. Use (h)istory to see your guess history."
  end

  def main_menu
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print "> "
  end

  def take_a_guess
    puts "What's your guess?"
    print "> "
  end

  def game_abort
    print "Game has been aborted. Are you sure you want to (q)uit?
> "
  end

  def select_difficulty
    print "What difficulty would you like to play on: (b)eginner, (i)ntermediate, or \n(a)dvanced? You can return to the main menu with (q)uit at any time.
> "
  end
end
