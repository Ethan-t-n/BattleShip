require 'pry'

class GamePlay
    attr_reader :game_board
    def initialize
        @game_board = Board.new
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

    def start

    end
    
end
