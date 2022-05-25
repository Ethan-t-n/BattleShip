class GamePlay
    attr_reader :computer, :player
    def initialize
        @computer = Computer.new
        @player = Player.new
    end

    def welcome_message
        puts "Welcome to BATTLESHIP"
        puts "Press p to play. Press q to quit."
        input = gets.chomp.downcase
        if input == "p"
          start
        elsif input == "q"
           puts "Sorry you're too lame to play, press the red X and go away."
        else # any other input
           puts "Hey man, that wasn't even an option, Try again."
            welcome_message
        end
    end

    def place_ship
        #call on player method to place ships
        #call on computer method to place random ships
    end

    def end_game
        # evaluate requirements for end of the game
        # When all either the computer ships are sunk or
        # player ships are sunk. It will print out who won and lost
        # and ask if the player wants to play again.
    end

    def play
        #call on place_ship
        #
        #until either all either the computer or player ships are sunk
        #go back and forthe between player and computer turns
        #
        #call on end_game
    end

end
