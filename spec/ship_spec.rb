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

  it 'affects health when hit' do
    @cruiser.hit

    expect(@cruiser.health).to eq 2
  end

  it 'sinks' do
    @cruiser.hit
    @cruiser.hit

    expect(@cruiser.health).to eq 1

    @cruiser.hit

    expect(@cruiser.sunk?).to eq true
  end

end
