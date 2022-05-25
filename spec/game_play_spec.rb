require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game_play'
require './lib/computer'
require 'pry'


RSpec.describe GamePlay do
  before :each do
    @game_play = GamePlay.new
  end

  it 'exists and has attributes' do
      expect(@game_play).to be_a GamePlay
      expect(@game_play.computer).to be_a Computer
  end

end