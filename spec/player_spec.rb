require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/computer'
require './lib/player'
require 'pry'


RSpec.describe Player do
    before :each do
        @player = Player.new
        @computer = Computer.new
        @submarine = Ship.new("Submarine", 2)
        @cruiser = Ship.new("Cruiser", 3)
    end

    it 'exists and has attributes' do
        expect(@player).to be_a Player
        expect(@player.game_board).to be_a Board
        expect(@player.ships).to be_a Array
    end

end