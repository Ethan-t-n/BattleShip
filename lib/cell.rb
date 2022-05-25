require 'pry'
require_relative 'ship'

class Cell
  attr_reader :coordinate, :ship, :fired
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired = false
  end


  def empty?
    if @ship == nil
      true
    else
      false
    end

  end

  def place_ship(ship)
    @ship = ship
  end


  def fired_upon?
    @fired
  end


  def fire_upon
   @fired = true
   if empty? == false
    ship.hit
   end
  end

  def render(revealed = false)
    if fired_upon? == true
      if empty? == true
        revealed = true
        return "M"
      elsif ship.sunk? == true
        revealed = true
        return "X"
      else
        revealed = true
        return "H"
      end
    else
      if revealed == true && empty? == false
        return "S"
      else
        return "."
      end
    end
  end

end

#Attempt 2
# def render(revealed = false)
#   if revealed == false
#       if fired_upon? == true && ship.sunk? == false && empty? == false
#         "H"
#       elsif fired_upon? == true && empty? == false && ship.sunk? == true
#         "X"
#       elsif fired_upon? == true && empty? == true
#         "M"
#       else
#         "."
#       end
#   else # revealed == true
#     if empty? == false
#       "S"
#     else
#       "."
#     end
#   end
# end

#Attempt 1 
# def fired_upon?
#   if empty? == true

#     if ship.health == ship.length
#       false
#     else
#       true
#     end
#   else # empty? == true
#     false
#   end
# end

#attempt 3
# def render(revealed = false)
#   if revealed == true
#     if empty? == false
#       "S"
#     else # empty? == false
#       "."
#     end
#   else # revealed == false
#     if empty? == false # && fired_upon? == true
#       if fired_upon? == true
#         if sunk? == true
#           "X"
#         else #sunk? == false
#           "H"
#         end
#       end
#     elsif empty? == true # && fired_upon? == true
#       if fired_upon? == true
#         "M"
#       else #fired_upon? == false
#         "."
#       end
#     end
#   end
# end