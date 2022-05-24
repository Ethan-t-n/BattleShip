require 'pry'

class Computer
    attr_reader :game_board
    def initialize
        @game_board = Board.new
    end

    def random_cell
        random_collumn = [1, 2, 3, 4]
        random_row = ["A", "B", "C", "D"]

        binding.pry
        cell_1 = game_board.cells["#{random_row.sample}#{random_collumn.sample}"]
    end

    def take_turn(ship)



        #place the ship in the valid_coordinate?
        #random_cell
        #valid_coordinate
        #valid_placement?
        #valid_length

        #until valid_length == ship.length


        # if random_cell == valid_placement? (ship, random_cell)
        #place a whole ship randomly
        #use valid_placement? method
        #use valid_coordinate? method
        #
    end


end