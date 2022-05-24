require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game_play'
require 'pry'


RSpec.describe GamePlay do
  before :each do
    @game_play = GamePlay.new
  end

  it 'exists and has attributes' do
      expect(@game_play).to be_a GamePlay
      expect(@game_play.game_board).to be_a Board
  end

end