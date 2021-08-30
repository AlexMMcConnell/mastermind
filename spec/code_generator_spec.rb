require 'rspec'
require './lib/code_generator'

describe 'CodeGenerator' do
  describe '#shuffler' do
    it 'creates an array of shuffled colors in letter format' do
      generate = CodeGenerator.new
      generate.shuffler

      expect(generate.shuffler).to be_a(Array)
    end
  end

  describe '#creator' do
    it 'is a string' do
      generate = CodeGenerator.new
      generate.creator

      expect(generate.creator).to be_a(String)
    end

    it 'is four characters long for beginner difficulty' do
      generate = CodeGenerator.new
      generate.creator

      expect(generate.creator.length).to be(4)
    end
  end
end
