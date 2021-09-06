require './lib/code_generator'
require './lib/instructions'
require './lib/game'
require './lib/mm_helper'
require 'pry'


describe 'Helper' do
  describe '#initialize' do
    it 'is an instance of Helper' do
      text = Text.new
      helper = Helper.new(text)

      expect(helper).to be_a(Helper)
    end

    it 'creates a text instance variable' do
      text = Text.new
      helper = Helper.new(text)

      expect(helper.text).to be(text)
    end
  end

  describe '#intro' do
    it 'introduces the game' do
      text = Text.new
      helper = Helper.new(text)

      expect(helper.intro).to eq(text.main_menu)
    end
  end

  describe '#answer_loop' do
    it 'runs answer options' do
      text = Text.new
      helper = Helper.new(text)
      allow(helper).to receive(:gets).and_return("q")
      helper.intro

      expect(helper.answer_loop).to be true
    end
  end

  describe '#print_instructions' do
    it 'prints instructions' do
      text = Text.new
      helper = Helper.new(text)

      expect(helper.print_instructions).to eq(text.main_menu)
    end
  end

  describe '#difficulty_loop' do
    it 'returns difficulty level' do
      text = Text.new
      helper = Helper.new(text)
      allow(helper).to receive(:gets).and_return("b")

      expect(helper.difficulty_loop).to be true
    end
  end

  describe '#difficulty_selector' do
    it 'selects the beginner difficulty' do
      text = Text.new
      helper = Helper.new(text)
      allow(helper).to receive(:gets).and_return("b")

      expect(helper.difficulty_selector).to eq("b")
    end

    it 'selects the intermediate difficulty' do
      text = Text.new
      helper = Helper.new(text)
      allow(helper).to receive(:gets).and_return("i")

      expect(helper.difficulty_selector).to eq("i")
    end

    it 'selects the advanced difficulty' do
      text = Text.new
      helper = Helper.new(text)
      allow(helper).to receive(:gets).and_return("a")

      expect(helper.difficulty_selector).to eq("a")
    end

    it 'returns invalid input' do
      text = Text.new
      helper = Helper.new(text)
      allow(helper).to receive(:gets).and_return("l")

      expect(helper.difficulty_selector).to eq("invalid")
    end
  end

  describe '#answer_options' do
    it 'prints the instructions' do
      text = Text.new
      helper = Helper.new(text)
      allow(helper).to receive(:gets).and_return("i")

      expect(helper.answer_options).to eq(text.instructions)
    end

    it 'returns invalid input' do
      text = Text.new
      helper = Helper.new(text)
      allow(helper).to receive(:gets).and_return("leradg")

      expect(helper.answer_options).to eq(text.main_menu)
    end
  end
end
