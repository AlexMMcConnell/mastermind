require './lib/code_generator'
require './lib/mastermind_text'
require './lib/game'
require './lib/mm_helper'
require 'pry'

text = MastermindText.new
helper = MastermindHelper.new(text)

helper.game_start
