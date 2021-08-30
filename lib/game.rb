class Game
attr_reader :code,
            :guesses

  def initialize(code)
    @code = code
    @guesses = []
  end
end
