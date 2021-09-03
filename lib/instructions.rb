class Text

  def instructions # outputs instructions for playing Mastermind into terminal
    print "Instructions for Mastermind:

"
    print "Mastermind is a game where you attempt to guess the code that the Mastermind
  or keyholder, has given. You have to enter colors that match up with the code
  that the keyholder has determined using single letters for each color:

"
  # if branch for game types later
    print " r for red, g for green, b for blue, and y for yellow

"
    print "You guess in a four letter format (rgby, for instance), and the game will
  give you a response detailing how many of your guesses were of the correct
  color, and which were in the correct position. Once you have guessed the
  full code correctly, you will have won the game!"
  end

  def beginner_sequence
    print "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
  end

  def intermediate_sequence
    print "I have generated an intermediate sequence with six elements made up of: (r)ed,
(g)reen, (b)lue, (y)ellow, and (o)range. Use (q)uit at any time to end the game."
  end

  def advanced_sequence
    print "I have generated an advanced sequence with eight elements made up of: (r)ed,
(g)reen, (b)lue, (y)ellow, (o)range, and (p)urple. Use (q)uit at any time to end
the game."
  end
end
