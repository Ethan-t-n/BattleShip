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