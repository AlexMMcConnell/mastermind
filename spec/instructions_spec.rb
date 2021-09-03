require 'rspec'
require './lib/instructions'

describe 'Text' do
  describe '#instructions' do
    it 'outputs instructions for playing Mastermind' do
      text = Text.new

      expect(text.instructions).to be_nil
    end
  end
end
