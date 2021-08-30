require 'rspec'
require './lib/game'

describe 'Game' do
  describe '#initialize' do
    it 'stores generated code at @code' do
      code_new = "RRBB"
      master_code = Game.new(code_new)

      expect(master_code.code).to eq("RRBB")
    end

    it 'creates an empty array at @guesses' do
      code_new = "RRBB"
      master_code = Game.new(code_new)

      expect(master_code.guesses).to eq([])
    end
  end
end
