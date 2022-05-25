# BattleShip

The specifications give you some classes to help you start breaking this problem down, but you will also have to create some additional classes and methods to build an Object Oriented solution to this problem. This means that there should be very little code outside of a class and you are using your classes to create objects that interact in some way.

Additionally, this project will require you to use Test Driven Development for all methods that do not rely on user input. very few methods should rely on user input.

You and your partner are expected to commit frequently and use Pull Requests. Make sure you are doing this frequently throughout the project.

This program should run by running the following code from the commandline:

`ruby runner.rb`

The classes included in this program are as follows:

- Cell
- Ship
- Board
- Player
- Runner 
- Computer
- game_play 

# Cell 
The cell class essentially creates the "hidden" spaces. It also creates methods for placing a ship, asking if the ship has been fired upon, and asking if they space is empty

# Ship 
The ship class creates the ship piece, the health of the ship, and the length of the ship. 

# Board 
The board initalizes all the cells and places them onto the board, that way we can give the cells coordinates to place or fire the ships. 

# Player 
This file allows the player to get the board and place the ship before we start the game

# Runner
This file calls start which should call on our welcome message. After the welcome message, it should call our play and end game method.

# Computer 
The computer class has the computer look through all the cells on the board in order to find a valid place to put down its' ship

# game_play 
This file should implement all the other files in order to run/start the game. 

