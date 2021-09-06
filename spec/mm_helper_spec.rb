require './lib/code_generator'
require './lib/instructions'
require './lib/game'
require './lib/mm_helper'
require 'pry'


describe 'Helper' do
  describe '#intro' do
    it 'introduces the game' do
      text = Text.new
      helper = Helper.new(text)
      allow(helper).to receive(:gets).and_return("play")

      expect(helper.intro).to eq("play")
    end
  end
end
