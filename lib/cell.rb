require 'pry'

class Cell
  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
  end


  def empty?
    if @ship == nil
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
    binding.pry
    if ship.health == ship.length
      false
    else
      true
    end
  end


  def fire_upon
    ship.hit
  end

  def render(revealed = false)
    if revealed == false
        if fired_upon? == true && ship.sunk? == false && empty? == false
          p "H"
        elsif fired_upon? == true && empty? == false && ship.sunk? == true
          p "X"
        elsif fired_upon? == true && empty? == true
          p "M"
        else
          p "."
        end
    else # revealed == true
      p "S"
    end
  end

end


# def render(revealed = false)
#   if fired_upon? == true
#     if empty? == true
#       return "M"
#     elsif ship.sunk? == true
#       return "X"
#     else
#       return "H"
#     end
#   else
#     if revealed == true && empty? == false
#       return "S"
#     else
#       return "."
#     end
#   end
# end
