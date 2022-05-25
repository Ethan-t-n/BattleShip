require 'pry'

class Computer
    attr_reader :game_board, :ships
    def initialize
        @game_board = Board.new
        @ships = []
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

    def take_turn(ship)
        coordinates = coordinates(ship)
        if @game_board.valid_placement?(ship, coordinates) == false
            take_turn(ship)
        else
            @game_board.place(ship, coordinates)
        end
    end
end