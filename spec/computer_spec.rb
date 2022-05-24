require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/computer'
require 'pry'


RSpec.describe Computer do
  before :each do
    @computer = Computer.new
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'exists and has attributes' do
      expect(@computer).to be_a Computer
      expect(@computer.game_board).to be_a Board
  end

  it 'can take choose a random cell' do
    expect(@computer.random_ship_placement).to be_a Cell
  end
end