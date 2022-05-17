require 'pry'
require './lib/ship'


RSpec.describe Ship do
  before :each do
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'exists' do
    expect(@cruiser).to be_instance_of(Ship)
  end

  it 'has attributes' do

    expect(@cruiser.name).to eq("Cruiser")
    expect(@cruiser.length).to eq(3)
    expect(@cruiser.health).to eq(3)
  end

  it 'isnt sunk initially' do
    expect(@cruiser.sunk?).to be false
  end


end