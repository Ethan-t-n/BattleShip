require './lib/board'
require './lib/ship'
require './lib/cell'
require 'pry'


RSpec.describe Board do
  before :each do
    @board = Board.new
  end


  it 'exists' do
    expect(@board).to be_a(Board)
  end


  it "has cells" do
    expect(@board.cells).to be_a(Hash)
    expect(@board.cells.keys.length).to eq(16)
    expect(@board.cells.values.length).to eq(16)
  end


  it 'validates coordinates' do
    expect(@board.valid_coordinate?("A1")).to be true
    expect(@board.valid_coordinate?("D4")).to be true
    expect(@board.valid_coordinate?("A5")).to be false
    expect(@board.valid_coordinate?("E1")).to be false
    expect(@board.valid_coordinate?("A22")).to be false
  end


  it 'validates length' do #come back to this
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to be false
    expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to be false
  end

  it 'validates consecutive' do
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    expect(@board.consecutive_coordinates?(@cruiser, ["A1", "A2", "A4"])).to be false
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to be false
    expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to be false
    expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to be false
    expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to be false

  end




















































end
