# ruby-cli-tic-tac-toe
Sample command line TicTacToe application for TankFarm.io

# Rough pseudocode logic
```
Create a nil-filled 3x3 matrix
Ask whether the first player wants to be X or O
	if input if neither - display a message and ask again
Start main game loop
	clear the terminal
	render current game state
	if win/draw conditions are met:
		display result of the game
		exit
	loop until a valid move is entered
		prompt current player for their move with a message "#{error}Player #{@current_player.mark.to_s.upcase}, please enter your move: "
		check if input == "s"
			erase error message and skip iteration
		check if input == "q"
			display a thank you for playing message
			quit the game
		check if input is two comma separated numbers
			set error if not and skip iteration
		check coordinates are within bounds
			set error if not and skip iteration
		check that the space is not occupied
			set error if not and skip iteration
	mark the spot
```

# Design
```
Create 3 classes: Game, Board and Player
Game class will:
	initialize game and players
	ask for first player's symbol
	start main game loop
Board class will:
	initialize board state matrix
	render current game state
	check winning conditions
	check draw condition
	check if a set of coordinates is valid for this board (allowing for future extension of the board to NxN size)
	check if the spot is not already taken
	place a symbol

Player class will:
	store player's symbol
	prompt current player for their move
	check if move inputs are valid
```