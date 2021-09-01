require 'rspec'
require './lib/game'

describe 'Game' do
  describe '#initialize' do
    it 'stores generated code at @code' do
      code_new = "rrbb"
      master_code = Game.new(code_new)

      expect(master_code.code).to eq("rrbb")
    end

    it 'creates an empty array at @guesses' do
      code_new = "RRBB"
      master_code = Game.new(code_new)

      expect(master_code.guesses).to eq([])
    end
  end

  # describe '#store_guesses' do
    # it 'stores guesses' do
    #   code_new = "rrbb"
    #   master_code = Game.new(code_new)
    #   master_code.store_guesses("guess1")
    #   master_code.store_guesses("guess2")
    #
    #   expect(master_code.guesses).to eq(["guess1", "guess2"])
    # end
  # end

  describe '#guesser' do
    it '' do

    end
  end

  describe '#answer' do
    it 'returns the code if player cheats' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("c")

      expect(master_code.answer).to eq(master_code.code)
    end

    it 'returns too short if the guess is less than four' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("rrr")

      expect(master_code.answer).to eq("Too short!")
    end

    it 'returns too long if the guess is more than four' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("rrrrr")

      expect(master_code.answer).to eq("Too long!")
    end

    it 'returns a string of correct elements and positions if guess is incorrect' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("rrrr")

      expect(master_code.answer).to eq(master_code.result_output)
    end

    it 'quits if the code is guessed correctly' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("rrbb")

      expect(master_code.answer).to eq(master_code.quit)
    end
  end

  # describe '#result_output' do
  #   it 'returns a string of correct elements and positions' do
  #
  #   end
  # end

  describe '#correct_guess' do
    it 'outputs quit if called' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("rrbb")
      master_code.answer

      expect(master_code.correct_guess).to eq(master_code.quit)
    end
  end

  describe '#checker' do
    it 'returns 0 if no colors match the code' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("gggg")
      master_code.answer

      expect(master_code.checker).to eq(0)
    end

    it 'returns 1 if one color matches the code' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("ggbg")
      master_code.answer

      expect(master_code.checker).to eq(1)
    end

    it 'returns 2 if two color matches the code' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("grbg")
      master_code.answer

      expect(master_code.checker).to eq(2)
    end

    it 'returns 3 if three color matches the code' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("rrbg")
      master_code.answer

      expect(master_code.checker).to eq(3)
    end
  end

  describe '#in_common' do
    it 'returns 0 colors in common' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("gggg")
      master_code.answer

      expect(master_code.in_common).to eq(0)
    end

    it 'returns 1 colors in common' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("gbgg")
      master_code.answer

      expect(master_code.in_common).to eq(1)
    end

    it 'returns 2 colors in common' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("bgrg")
      master_code.answer

      expect(master_code.in_common).to eq(2)
    end

    it 'returns 3 colors in common' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("bbrg")
      master_code.answer

      expect(master_code.in_common).to eq(3)
    end

    it 'returns 4 colors in common' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("rbrb")
      master_code.answer

      expect(master_code.in_common).to eq(4)
    end
  end

  describe '#quit' do
    it 'sets guess equal to q' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      master_code.quit

      expect(master_code.guess).to eq("q")
    end
  end
end
