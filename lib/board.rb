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
# code below evaluates if the coordinate length is == the ship length
    if coordinates.count == ship.length
      true
    else
      false
    end

# code below evaluates if a ship is present in the cell
    coordinates.each do |coordinate|
      if !@cells[coordinate].empty? == false
        return false
      else
        true
      end
    end

# code below evaluates if the coordinates are consecutive
#if the difference between the range of numbers is > 1 its invalid
    rows_numbers = []
    collumns_letters = []
    coordinates.each do |coordinate|
      parts = coordinate.split("")
      collumns_letters << coordinate[0].ord
      rows_numbers << coordinate[1].to_i
    end
binding.pry

  end


  # def check_for_win
  #   if game_board[6..0][0..6] == x #checking from the last row to the last column = x
  #     x += 1 #adding to the value of x
  #   else game_board[6..0][0..6] != x #checkig from the last row to the last column not = x
  #     x -= 1 #subracting from the value of x
  #   end

  #   if x <= 0 # stopping the x-value from = 0 to prevent negative values
  #     x = 0 # when the x-value dips below zero we reset to zero
  #   end
  # end

























end
