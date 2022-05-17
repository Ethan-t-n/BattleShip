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



























end
