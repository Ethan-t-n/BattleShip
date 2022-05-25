class Player
    attr_reader :game_board, :ships
    def initialize
        @game_board = Board.new
        @ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
    end

    #####Couldn't get the method below to work in time to be able to finish
    #####this class

    # def user_input
    #     @ships.each do |ship|
    #         input = gets.chomp.upcase.split(" ")
    #         if @game_board.valid_placement?(ship, input) == true
    #             @game_board.place(ship, input)
    #         else 
    #            p "Hey broski, that placement is invalid."
    #            p "Your coordinates must be same length as your ship" 
    #            p "Your ship can't be diagnal or skip places!"
    #            p "Try again"
    #            user_input
    #         end 
    #     end
    # end

end