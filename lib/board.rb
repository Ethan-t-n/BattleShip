require 'pry'

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
      #  binding.pry
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
    present = []
    coordinates.each do |coordinate|
      if @cells[coordinate].empty? == true
        present << false
        next
      else
        present << true
      end
    end
    if present.include?('true')
      true
    else
      false
    end
  end

  def consecutive_coordinates?(ship, coordinates) #check for valid row coordinates, rename this method appropriately
    rows_numbers = []
    collumns_letters = []
    coordinates.each do |coordinate|
      parts = coordinate.split("")
      collumns_letters << coordinate[0].ord
      rows_numbers << coordinate[1].to_i
    end
  #  rows_numbers.each_cons(coordinates.length) do |num|
    range = (rows_numbers.min)..(rows_numbers.max)
    consecutive_array = range.to_a
    if rows_numbers != consecutive_array
      false
    else
      true
    end
  end










end
