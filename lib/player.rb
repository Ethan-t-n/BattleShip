require 'pry'

class Player
    attr_reader :game_board, :ships
    def initialize
        @game_board = Board.new
        @ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
    end

    def user_input
    # input = gets.chomp
    # if input == 
    end

end