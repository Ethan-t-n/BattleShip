require 'rspec'
require './lib/ship'


RSpec.describe Ship do
  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)

    expect(ship).to be_instance_of(Ship)
  end



  it 'has a name' do
    cruiser = Ship.new("Cruiser")

    expect(Ship.name).to eq("Cruiser")
  end



  it 'has a length' do
    cruiser = Ship.new("3")

    expect(Ship.length).to eq("3")
  end



  it 'has health' do
    cruiser = Ship.new("3")

    expect(Ship.health).to eq("3")
  end











end
