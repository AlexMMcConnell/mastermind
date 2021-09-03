require 'rspec'
require './lib/game'
require 'time'

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
      allow(master_code).to receive(:gets).and_return("rrrr")
      master_code.user_response
      allow(master_code).to receive(:gets).and_return("rrbb")
      master_code.user_response

      expect(master_code.guesses).to eq(["rrrr", "rrbb"])
    end
  end

  describe '#game_runner' do
    it 'stops running once guess = quit' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("quit")

      expect(master_code.game_runner).to eq(true)
    end

    it 'Starts a times when called' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("rrrr")
      allow(Time).to receive(:now).and_return("2021-08-18 16:37:20")

      expect(Time.now).to eq("2021-08-18 16:37:20")
    end
  end

  describe '#user_response' do
    it 'returns the code if player cheats' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("c")

      expect(master_code.user_response).to eq(master_code.code)
    end

    it 'returns too short if the guess is less than four' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("rrr")

      expect(master_code.user_response).to eq("Too short!")
    end

    it 'returns too long if the guess is more than four' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("rrrrr")

      expect(master_code.user_response).to eq("Too long!")
    end

    it 'returns a string of correct elements and positions if guess is incorrect' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("rrrr")

      expect(master_code.user_response).to eq(master_code.response_output)
    end

    it 'quits if the code is guessed correctly' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("rrbb")

      expect(master_code.user_response).to eq(master_code.quit)
    end
  end

 describe '#response_output' do
   it 'returns correct_guess if the guess is correct' do
     code_new = "rrbb"
     master_code = Game.new(code_new)
     allow(master_code).to receive(:gets).and_return("rrbb")
     master_code.user_response

     expect(master_code.guess).to eq(master_code.correct_guess)
   end

   it 'returns proper in common and position_checker results for 1 guess' do
     code_new = "rrbb"
     master_code = Game.new(code_new)
     allow(master_code).to receive(:gets).and_return("brrb")
     master_code.user_response

     expect(master_code.elements_in_common).to eq(4)
     expect(master_code.position_checker).to eq(2)
   end

   it 'returns proper in common and position_checker results for 2 guesses' do
     code_new = "rrbb"
     master_code = Game.new(code_new)
     allow(master_code).to receive(:gets).and_return("bbbb")
     master_code.user_response
     allow(master_code).to receive(:gets).and_return("rrby")
     master_code.user_response

     expect(master_code.elements_in_common).to eq(3)
     expect(master_code.position_checker).to eq(3)
     expect(master_code.guesses.count).to eq(2)
   end
 end

  describe '#correct_guess' do
    it 'outputs quit if called' do
      code_new = "rrbb"
      master_code = Game.new(code_new)

      expect(master_code.correct_guess).to eq(master_code.quit)
    end
  end

  describe '#position_checker' do
    it 'returns 0 if no colors match the code' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("gggg")
      master_code.user_response

      expect(master_code.position_checker).to eq(0)
    end

    it 'returns 1 if one color matches the code' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("ggbg")
      master_code.user_response

      expect(master_code.position_checker).to eq(1)
    end

    it 'returns 2 if two color matches the code' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("grbg")
      master_code.user_response

      expect(master_code.position_checker).to eq(2)
    end

    it 'returns 3 if three color matches the code' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("rrbg")
      master_code.user_response

      expect(master_code.position_checker).to eq(3)
    end
  end

  describe '#elements_in_common' do
    it 'returns 0 colors in common' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("gggg")
      master_code.user_response

      expect(master_code.elements_in_common).to eq(0)
    end

    it 'returns 1 colors in common' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("gbgg")
      master_code.user_response

      expect(master_code.elements_in_common).to eq(1)
    end

    it 'returns 2 colors in common' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("bgrg")
      master_code.user_response

      expect(master_code.elements_in_common).to eq(2)
    end

    it 'returns 3 colors in common' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("bbrg")
      master_code.user_response

      expect(master_code.elements_in_common).to eq(3)
    end

    it 'returns 4 colors in common' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      allow(master_code).to receive(:gets).and_return("rbrb")
      master_code.user_response

      expect(master_code.elements_in_common).to eq(4)
    end
  end

  describe '#quit' do
    it 'sets guess equal to quit' do
      code_new = "rrbb"
      master_code = Game.new(code_new)
      master_code.quit

      expect(master_code.guess).to eq("quit")
    end
  end

  describe '#end_timer' do

  end
end
