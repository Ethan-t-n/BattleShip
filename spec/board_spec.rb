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
    expect(@board.valid_length?(@cruiser, ["A1", "A2"])).to be false
    expect(@board.valid_length?(@cruiser, ["A1", "A2", "A3"])).to be true
  end

  it 'valid_placement? uses valid_length? to validate length' do
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to be false
    expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to be false
  end

  it 'uses ship present evaluater to return array of true false' do
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)

    expect(@board.ship_present_evaluater(@cruiser, ["A1", "A2","A3"])).to eq ([false,false,false])

    @board.cells["A2"].place_ship(@submarine)

    expect(@board.ship_present_evaluater(@submarine, ["A2", "A3", "A4"])).to eq [true,false,false]
  end

  it 'checks if ships are present' do
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)

    expect(@board.ship_present?(@cruiser, ["A1", "A2"])).to be false
    expect(@board.ship_present?(@submarine, ["A2", "A3", "A4"])).to be false
  end

  it 'returns true if a ship is present' do
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)

    @board.cells["A2"].place_ship(@submarine)

    expect(@board.cells["A2"].ship).to eq(@submarine)
    expect(@board.ship_present?(@cruiser, ["A1", "A2"])).to be true
    expect(@board.ship_present?(@submarine, ["A2", "A3", "A4"])).to be true
  end

  it 'creates rows for array' do
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    expect(@board.rows(@cruiser, ["A1", "A2", "A4"])).to eq [1, 2, 4]
    expect(@board.rows(@submarine, ["A1", "C1"])).to eq [1, 1]
  end

  it 'creates collumns for array' do
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    expect(@board.collumns(@cruiser, ["A1", "A2", "A4"])).to eq ["A", "A", "A"]
    expect(@board.collumns(@submarine, ["A1", "C1"])).to eq ["A", "C"]
  end

  it 'validates consecutive coordinates' do
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    expect(@board.consecutive_coordinates?(@cruiser, ["A1", "A2", "A3"])).to eq true
    expect(@board.consecutive_coordinates?(@submarine, ["A1", "A3"])).to eq false
    expect(@board.consecutive_coordinates?(@cruiser, ["B3", "C3", "D3"])).to eq true
    expect(@board.consecutive_coordinates?(@submarine, ["A3", "D3"])).to eq false

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

  it 'places ship in a cell on the board' do
    @cruiser = Ship.new("Cruiser", 3)
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @cell_1 = @board.cells["A1"]
    @cell_2 = @board.cells["A2"]
    @cell_3 = @board.cells["A3"]
    expect(@cell_1.ship).to eq @cruiser
    expect(@cell_2.ship).to eq @cruiser
    expect(@cell_3.ship).to eq @cruiser
    expect(@cell_3.ship == @cell_2.ship).to eq true

  end

  it 'does not overlap' do
    @cruiser = Ship.new("Cruiser", 3)
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to be true
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to be false
  end

  it 'can render a board ' do
    @cruiser = Ship.new("Cruiser", 3)
    @board.place(@cruiser, ["A1", "A2", "A3"]) 
    @expected = "  1 2 3 4 \n" +
    "A #{@board.cells["A1"].render} #{@board.cells["A2"].render} #{@board.cells["A3"].render} #{@board.cells["A4"].render} \n" +
    "B #{@board.cells["B1"].render} #{@board.cells["B2"].render} #{@board.cells["B3"].render} #{@board.cells["B4"].render} \n" +
    "C #{@board.cells["C1"].render} #{@board.cells["C2"].render} #{@board.cells["C3"].render} #{@board.cells["C4"].render} \n" +
    "D #{@board.cells["D1"].render} #{@board.cells["D2"].render} #{@board.cells["D3"].render} #{@board.cells["D4"].render} \n" 

    expect(@board.render).to be_a String
    expect(@board.render).to eq(@expected)
  end

  it 'can render a board if revealed == true' do
    @cruiser = Ship.new("Cruiser", 3)
    @board.place(@cruiser, ["A1", "A2", "A3"]) 
    @expected = "  1 2 3 4 \n" +
    "A #{@board.cells["A1"].render(true)} #{@board.cells["A2"].render(true)} #{@board.cells["A3"].render(true)} #{@board.cells["A4"].render(true)} \n" +
    "B #{@board.cells["B1"].render(true)} #{@board.cells["B2"].render(true)} #{@board.cells["B3"].render(true)} #{@board.cells["B4"].render(true)} \n" +
    "C #{@board.cells["C1"].render(true)} #{@board.cells["C2"].render(true)} #{@board.cells["C3"].render(true)} #{@board.cells["C4"].render(true)} \n" +
    "D #{@board.cells["D1"].render(true)} #{@board.cells["D2"].render(true)} #{@board.cells["D3"].render(true)} #{@board.cells["D4"].render(true)} \n" 


    expect(@board.render(true)).to be_a String
    expect(@board.render(true)).to eq(@expected)
  end

  it 'board shows when ships are hit' do
    @cruiser = Ship.new("Cruiser", 3)

    @board.place(@cruiser, ["A1", "A2", "A3"]) 

    @board.cells["A1"].fire_upon

    @expected = "  1 2 3 4 \n" +
    "A #{@board.cells["A1"].render} #{@board.cells["A2"].render} #{@board.cells["A3"].render} #{@board.cells["A4"].render} \n" +
    "B #{@board.cells["B1"].render} #{@board.cells["B2"].render} #{@board.cells["B3"].render} #{@board.cells["B4"].render} \n" +
    "C #{@board.cells["C1"].render} #{@board.cells["C2"].render} #{@board.cells["C3"].render} #{@board.cells["C4"].render} \n" +
    "D #{@board.cells["D1"].render} #{@board.cells["D2"].render} #{@board.cells["D3"].render} #{@board.cells["D4"].render} \n" 

    # use code below to verify
    # puts @board.render

    expect(@board.render).to be_a String
    expect(@board.render).to eq(@expected)
  end

  it 'board shows when shots fired are a miss' do
    @cruiser = Ship.new("Cruiser", 3)

    @board.place(@cruiser, ["A1", "A2", "A3"]) 

    @board.cells["D1"].fire_upon

    @expected = "  1 2 3 4 \n" +
    "A #{@board.cells["A1"].render} #{@board.cells["A2"].render} #{@board.cells["A3"].render} #{@board.cells["A4"].render} \n" +
    "B #{@board.cells["B1"].render} #{@board.cells["B2"].render} #{@board.cells["B3"].render} #{@board.cells["B4"].render} \n" +
    "C #{@board.cells["C1"].render} #{@board.cells["C2"].render} #{@board.cells["C3"].render} #{@board.cells["C4"].render} \n" +
    "D #{@board.cells["D1"].render} #{@board.cells["D2"].render} #{@board.cells["D3"].render} #{@board.cells["D4"].render} \n" 
    # use code below to verify
    # puts @board.render

    expect(@board.render).to be_a String
    expect(@board.render).to eq(@expected)
  end

  it 'board shows when shots fired sink the ship' do
    @cruiser = Ship.new("Cruiser", 3)

    @board.place(@cruiser, ["A1", "A2", "A3"]) 

    @board.cells["A1"].fire_upon
    @board.cells["A2"].fire_upon
    @board.cells["A3"].fire_upon

    @expected = "  1 2 3 4 \n" +
    "A #{@board.cells["A1"].render} #{@board.cells["A2"].render} #{@board.cells["A3"].render} #{@board.cells["A4"].render} \n" +
    "B #{@board.cells["B1"].render} #{@board.cells["B2"].render} #{@board.cells["B3"].render} #{@board.cells["B4"].render} \n" +
    "C #{@board.cells["C1"].render} #{@board.cells["C2"].render} #{@board.cells["C3"].render} #{@board.cells["C4"].render} \n" +
    "D #{@board.cells["D1"].render} #{@board.cells["D2"].render} #{@board.cells["D3"].render} #{@board.cells["D4"].render} \n" 

    # use code below to verify
    # puts @board.render

    expect(@board.render).to be_a String
    expect(@board.render).to eq(@expected)
  end

  it 'board shows when ship placement' do
    @cruiser = Ship.new("Cruiser", 3)

    @board.place(@cruiser, ["A1", "A2", "A3"]) 

    @board.cells["A1"].fire_upon

    @expected = "  1 2 3 4 \n" +
    "A #{@board.cells["A1"].render(true)} #{@board.cells["A2"].render(true)} #{@board.cells["A3"].render(true)} #{@board.cells["A4"].render(true)} \n" +
    "B #{@board.cells["B1"].render(true)} #{@board.cells["B2"].render(true)} #{@board.cells["B3"].render(true)} #{@board.cells["B4"].render(true)} \n" +
    "C #{@board.cells["C1"].render(true)} #{@board.cells["C2"].render(true)} #{@board.cells["C3"].render(true)} #{@board.cells["C4"].render(true)} \n" +
    "D #{@board.cells["D1"].render(true)} #{@board.cells["D2"].render(true)} #{@board.cells["D3"].render(true)} #{@board.cells["D4"].render(true)} \n" 

    # use code below to verify
    # puts @board.render(true)

    expect(@board.render(true)).to be_a String
    expect(@board.render(true)).to eq(@expected)
  end























































end
