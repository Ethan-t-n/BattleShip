require './lib/ship'
require './lib/cell'
require 'pry'


RSpec.describe Cell do
  before :each do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'exists' do
    expect(@cell).to be_a(Cell)
  end


  it 'has attributes' do
    expect(@cell.coordinate).to eq("B4")
    expect(@cell.ship).to eq(nil)
  end


  it 'will be empty' do
    expect(@cell.empty?).to eq true
  end


  it 'puts cruiser on a cell' do
    @cell.place_ship(@cruiser)
    expect(@cell.ship).to eq @cruiser
    expect(@cell.empty?).to eq false
  end

  it 'has been fired on boolean' do
    @cell.place_ship(@cruiser)
    expect(@cell.fired_upon?).to eq false
  end



  it 'has fired on' do
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    expect(@cell.ship.health).to eq 2
    expect(@cell.fired_upon?).to eq true
  end



  it 'renders a cell' do
    @cell_1 = Cell.new("B4")
    expect(@cell_1.render).to eq(".")
  end



  it 'renders a miss' do
    @cell_1 = Cell.new("B4")
    @cell_1.fire_upon
    expect(@cell_1.render).to eq("M")
  end



  it 'renders a ship' do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(@cruiser)
    expect(@cell.render).to eq(".")
    expect(@cell.render(true)).to eq("S")
  end



  it 'renders a hit' do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    expect(@cell.render).to eq("H")
  end



  it 'renders a sunk ship' do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    @cruiser.hit
    expect(@cell.render).to eq("H")
    @cruiser.hit
    expect(@cell.render).to eq("X")
  end
end
