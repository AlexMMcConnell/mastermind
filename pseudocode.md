# MASTERMIND

+ Initial welcome
+ Options to Play (p), read instructions (i), or quit (q)
+ Generate a sequence with four elements. (red, green, yellow, and blue)
+ Tell player that sequence has been generated, tell them how to guess (including format!), what options are available, and that they can quit (q) at any time.
  + Start running time once the output finishes
  + Player can cheat (c) if they wish, but this option is not blatantly given to them.
  + User input shorter/longer than given code, inform user that it is an invalid guess, then repeat previous instructions.
+ If sequence is guessed correctly:
  + Output endgame flow
+ Else
  + Inform number of guesses of correct color (element), and number in correct position
+ Loop until sequence guessed correctly
+ Endgame flow: Congratulations, you guessed correctly, guessed over x time, guessed in x guesses
  + Play again (p) or quit (q)

# LEVEL TWO

+ Multiple difficulties
  + Beginner - already built, but must be defined as beginner
  + Intermediate - Five colors (new color: orange) with six characters
  + Expert - Six colors (new color: purple) with eight characters
+ Record Tracking/Top 10
  + Save game info after gathering user-inputted name
  + Output top 10 info in format: Lowest guesses, then lowest time
  + Determine average time for solve
+ Package and Polish
  + Command line wrapper: just type mastermind without executing the runner file from ruby
+ Other ideas along the way?
  + History? (show previously made guesses + results)
  + Make the gameplay and interface prettier!
  + Two player mode?
  + Guess limits for varying difficulties?
  + ???????
