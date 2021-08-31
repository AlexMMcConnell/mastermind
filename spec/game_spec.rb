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
    it 'stores guesses' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      master_code.store_guesses("guess1")
      master_code.store_guesses("guess2")

      expect(master_code.guesses).to eq(["guess1", "guess2"])
    end
  end

  describe '#guesser' do
  end

  describe '#answer' do
  end

  describe '#in_common' do
    it 'returns the number split_guesscode and split_mastercode share' do
      code_new = "rrbb"
      master_code = Game.new(code_new)

      master_code.answer
  end
end
