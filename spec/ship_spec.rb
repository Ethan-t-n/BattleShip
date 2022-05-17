require 'rspec'
require './lib/ship'


RSpec.describe Ship do
  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)
    sub = Ship.new("Sub", 2)
    expect(ship).to be_instance_of(Ship)
  end



  it 'has a name' do
    cruiser = Ship.new("Cruiser")
    sub = Ship.new("Sub")
    expect(Ship.name).to eq("Cruiser")
    expect(Ship.name).to eq("Sub")
  end



  it 'has a length' do
    cruiser = Ship.new(3)
    sub = Ship.new(2)
    expect(Ship.length).to eq(3)
  end



  it 'has health' do
    cruiser = Ship.new(3)
    sub = Ship.new(2)
    expect(Ship.health).to eq(3)
  end



  it 'sunk?' do
    cruiser = Ship.new(3)

    expect(Ship.sunk?).to be false
  end














end
