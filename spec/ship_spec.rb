require 'rspec'
require './lib/ship'


RSpec.describe Ship do
  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)
    expect(ship).to be_instance_of(Ship)
  end



  it 'has a name' do
    cruiser = Ship.new("Cruiser", 3)
    expect(Ship.name).to eq("Cruiser")
  end



  it 'has a length' do
    cruiser = Ship.new("Cruiser", 3)
    expect(Ship.length).to eq(3)
  end



  it 'has health' do
    cruiser = Ship.new("Cruiser", 3)
    expect(Ship.health).to eq(3)
  end



  it 'sunk?' do
    cruiser = Ship.new("Cruiser", 3)

    expect(Ship.sunk?).to be false
  end



  it 'hit' do
   cruiser = Ship.new("Cruiser", 3)
   cruiser.hit

   expect(cruiser.health).to eq(2)
 end

 it 'will sink' do
   cruiser = Ship.new("Cruiser", 3)
   cruiser.hit


   expect(cruiser.health).to eq(2)
   expect(cruiser.sunk?).to be false


   cruiser.hit


   expect(cruiser.health).to eq(1)
   expect(cruiser.sunk?).to be false


   cruiser.hit


   expect(cruiser.health).to eq(0)
   expect(cruiser.sunk?).to be true

 end



end
