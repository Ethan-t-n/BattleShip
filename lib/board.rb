class Board
  attr_reader :cells
  def initialize
    @cells = {
      "A1" => Cell.new("A1"), "A2" => Cell.new("A2"), "A3" => Cell.new("A3"), "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"), "B2" => Cell.new("B2"), "B3" => Cell.new("B3"), "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"), "C2" => Cell.new("C2"), "C3" => Cell.new("C3"), "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"), "D2" => Cell.new("D2"), "D3" => Cell.new("D3"), "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end


  def valid_placement?(ship, coordinates)
    if valid_length?(ship, coordinates) == true && ship_present?(ship, coordinates) == true && consecutive_coordinates?(ship, coordinates) == true
      false
    elsif valid_length?(ship, coordinates) == false && ship_present?(ship, coordinates) == true && consecutive_coordinates?(ship, coordinates) == false
      false
    elsif valid_length?(ship, coordinates) == false && ship_present?(ship, coordinates) == false && consecutive_coordinates?(ship, coordinates) == false
      false
    elsif valid_length?(ship, coordinates) == false && ship_present?(ship, coordinates) == true && consecutive_coordinates?(ship, coordinates) == false
      false
    elsif valid_length?(ship, coordinates) == true && ship_present?(ship, coordinates) == false && consecutive_coordinates?(ship, coordinates) == false
      false
    elsif valid_length?(ship, coordinates) == true && ship_present?(ship, coordinates) == true && consecutive_coordinates?(ship, coordinates) == false
      false
    elsif valid_length?(ship, coordinates) == false && ship_present?(ship, coordinates) == false && consecutive_coordinates?(ship, coordinates) == true
      false
    elsif valid_length?(ship, coordinates) == false && ship_present?(ship, coordinates) == true && consecutive_coordinates?(ship, coordinates) == true
      false
    else #valid_length?(ship, coordinates) == true && ship_present?(ship, coordinates) == false && consecutive_coordinates?(ship, coordinates) == true
      true
    end

  end

  def valid_length?(ship, coordinates)
    if coordinates.count == ship.length
      true
    else
      false
    end
  end

  def ship_present?(ship, coordinates)
   if ship_present_evaluater(ship, coordinates).include?(true)
      return true
    else
      return false
    end
  end

  def ship_present_evaluater(ship, coordinates)
    coordinates.map do |coordinate|
      if @cells[coordinate].empty? == true
       false
      else
        true
      end
    end
  end

  def rows(ship, coordinates)
    rows_numbers = []
    coordinates.each do |coordinate|
      parts = coordinate.split("")
      rows_numbers << coordinate[1].to_i
    end
    return rows_numbers
  end

  def collumns(ship, coordinates)
    collumns_letters = []
    coordinates.each do |coordinate|
      parts = coordinate.chr
      collumns_letters << parts
    end
    return collumns_letters
  end

  def consecutive_coordinates?(ship, coordinates) #check for valid row coordinates, rename this method appropriately
    collumn_range = collumns(ship, coordinates).min..collumns(ship, coordinates).max
    row_range = rows(ship, coordinates).min..rows(ship, coordinates).max
    consecutive_rows = row_range.to_a
    consecutive_collumns = collumn_range.to_a
    if collumns(ship, coordinates).uniq.length == 1 && consecutive_rows == rows(ship, coordinates)
      return true
    elsif rows(ship, coordinates).uniq.length == 1 && collumns(ship, coordinates) == consecutive_collumns
      return true
    else
      return false
    end
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates) == true
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end

    end
  end

  def render(revealed = false)
    if revealed == false
      return "  1 2 3 4 \n" +
      "A #{cells["A1"].render} #{cells["A2"].render} #{cells["A3"].render} #{cells["A4"].render} \n" +
      "B #{cells["B1"].render} #{cells["B2"].render} #{cells["B3"].render} #{cells["B4"].render} \n" +
      "C #{cells["C1"].render} #{cells["C2"].render} #{cells["C3"].render} #{cells["C4"].render} \n" +
      "D #{cells["D1"].render} #{cells["D2"].render} #{cells["D3"].render} #{cells["D4"].render} \n" 

    else #revealed == true
      return "  1 2 3 4 \n" +
      "A #{cells["A1"].render(true)} #{cells["A2"].render(true)} #{cells["A3"].render(true)} #{cells["A4"].render(true)} \n" +
      "B #{cells["B1"].render(true)} #{cells["B2"].render(true)} #{cells["B3"].render(true)} #{cells["B4"].render(true)} \n" +
      "C #{cells["C1"].render(true)} #{cells["C2"].render(true)} #{cells["C3"].render(true)} #{cells["C4"].render(true)} \n" +
      "D #{cells["D1"].render(true)} #{cells["D2"].render(true)} #{cells["D3"].render(true)} #{cells["D4"].render(true)} \n" 
    end
  end
end
