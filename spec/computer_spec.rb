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
      expect(@computer.ships).to be_a Array

  end

  it 'can take choose a random cell' do
    expect(@computer.random_cell).to be_a String
  end

  it 'once given a ship it can find random valid coordinates' do
    #Use a binding.pry to verify this assumption
    @computer.take_turn(@cruiser)
  end


end