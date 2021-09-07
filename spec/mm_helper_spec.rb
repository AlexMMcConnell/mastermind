require './lib/code_generator'
require './lib/instructions'
require './lib/game'
require './lib/mm_helper'
require 'pry'


describe 'Helper' do
  describe '#initialize' do
    it 'is an instance of Helper' do
      helper = MastermindHelper.new

      expect(helper).to be_a(MastermindHelper)
    end
  end

  describe '#intro' do
    it 'introduces the game' do
      helper = MastermindHelper.new

      expect(helper.intro).to be nil
    end
  end

  describe '#answer_loop' do
    it 'runs answer options' do
      helper = MastermindHelper.new
      allow(helper).to receive(:gets).and_return("q")
      helper.intro

      expect(helper.answer_loop).to be true
    end
  end

  describe '#print_instructions' do
    it 'prints instructions' do
      helper = MastermindHelper.new

      expect(helper.print_instructions).to be nil
    end
  end

  describe '#difficulty_loop' do
    it 'returns difficulty level' do
      helper = MastermindHelper.new
      allow(helper).to receive(:gets).and_return("b")

      expect(helper.difficulty_loop).to be true
    end
  end

  describe '#difficulty_selector' do
    it 'selects the beginner difficulty' do
      helper = MastermindHelper.new
      allow(helper).to receive(:gets).and_return("b")

      expect(helper.difficulty_selector).to eq("b")
    end

    it 'selects the intermediate difficulty' do
      helper = MastermindHelper.new
      allow(helper).to receive(:gets).and_return("i")

      expect(helper.difficulty_selector).to eq("i")
    end

    it 'selects the advanced difficulty' do
      helper = MastermindHelper.new
      allow(helper).to receive(:gets).and_return("a")

      expect(helper.difficulty_selector).to eq("a")
    end

    it 'returns invalid input' do
      helper = MastermindHelper.new
      allow(helper).to receive(:gets).and_return("l")

      expect(helper.difficulty_selector).to eq("invalid")
    end
  end

  describe '#answer_options' do
    it 'prints the instructions' do
      helper = MastermindHelper.new
      allow(helper).to receive(:gets).and_return("i")

      expect(helper.answer_options).to be nil
    end

    it 'returns invalid input' do
      helper = MastermindHelper.new
      allow(helper).to receive(:gets).and_return("leradg")

      expect(helper.answer_options).to be nil
    end
  end
end
