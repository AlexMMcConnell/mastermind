require 'rspec'
require './lib/code_generator'

describe 'CodeGenerator' do
  describe '#shuffler' do
    it 'generates an array' do
      generate = CodeGenerator.new("beginner")

      expect(generate.shuffler).to be_a(Array)
    end

    it 'generates a 16 long array to randomize from if beginner' do
      generate = CodeGenerator.new("beginner")

      expect(generate.shuffler.length).to eq(16)
    end

    it 'generates a 30 long array to randomize from if intermediate' do
      generate = CodeGenerator.new("intermediate")

      expect(generate.shuffler.length).to eq(30)
    end

    it 'generates a 48 long array to randomize from if advanced' do
      generate = CodeGenerator.new("advanced")

      expect(generate.shuffler.length).to eq(48)
    end
  end

  describe '#creator' do
    it 'is a string' do
      generate = CodeGenerator.new("intermediate")
      generate.creator

      expect(generate.creator).to be_a(String)
    end

    it 'is four characters long for beginner difficulty' do
      generate = CodeGenerator.new("beginner")

      expect(generate.code_length).to eq(4)
    end
    it 'is six characters long for intermediate difficulty' do
      generate = CodeGenerator.new("intermediate")

      expect(generate.code_length).to eq(6)
    end
    it 'is eight characters long for advanced difficulty' do
      generate = CodeGenerator.new("advanced")

      expect(generate.code_length).to eq(8)
    end
    it 'is an empty array if invalid input' do
      generate = CodeGenerator.new("sfdaw")

      expect(generate.code_length).to eq(0)
    end
  end
end
