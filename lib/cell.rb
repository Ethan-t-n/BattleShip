require 'pry'

class Cell
  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
  end


  def empty?
    if @ship  == nil
      true
    else
      false
    end

  end
  #check this later
  def place_ship(ship)
    @ship = ship

  end


  def fired_upon?
    if ship.health == ship.length
      false
    else
      true
    end
  end


  def fire_upon
    ship.hit
  end













end
