require './lib/code_generator'
require './lib/instructions'
require './lib/game'
require './lib/mm_helper'
require 'pry'

text = Text.new
helper = Helper.new(text)

helper.game_start
