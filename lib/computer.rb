require 'pry'

class Computer
    attr_reader :game_board, :ships
    def initialize
        @game_board = Board.new
        @ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
        @placed_ships = []

    end

    def add_ship(ship)
        
    end

    def random_cell
        random_collumn = [1, 2, 3, 4]
        random_row = ["A", "B", "C", "D"]
        "#{random_row.sample}#{random_collumn.sample}"
    end

    def coordinates(ship)
        coordinate_array = []
        until coordinate_array.length == ship.length
            coordinate_array << random_cell
        end
       coordinate_array
    end

    def valid_coor(ship)
        coords = coordinates(ship)
        valid_coords =[]

        if @game_board.valid_placement?(ship, coords) != true
            valid_coor(ship)
        else #@game_board.valid_placement?(ship, valid) == true
            return valid_coords = coords
        end
    end
    
    
    def place
        @ships.each do |ship|
            @game_board.place(ship, valid_coor(ship))
        end
   end
end