require 'rspec'
require './lib/mastermind_text'

describe 'MastermindText' do
  describe '#instructions' do
    it 'outputs instructions for playing Mastermind' do
      text = MastermindText.new

      expect(text.instructions).to be_nil
    end
  end
end
