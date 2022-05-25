require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game_play'
require 'pry'

game_play = GamePlay.new
player = Player.new

## this method doesn't work yet the code isn't finished
game_play.play