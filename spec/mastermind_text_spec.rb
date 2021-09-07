require 'rspec'
require './lib/instructions'

describe 'MastermindText' do
  describe '#instructions' do
    it 'outputs instructions for playing Mastermind' do
      text = MastermindText.new

      expect(text.instructions).to be_nil
    end
  end
end
