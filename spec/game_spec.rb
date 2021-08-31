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

  describe '#store_guesses' do
    xit 'stores guesses' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      master_code.store_guesses("guess1")
      master_code.store_guesses("guess2")

      expect(master_code.guesses).to eq(["guess1", "guess2"])
    end
  end

  describe '#checker' do

  end

  describe '#answer' do

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
end
