# ruby-cli-tic-tac-toe
Sample command line TicTacToe application for TankFarm.io

# Rough pseudocode logic
Create a nil-filled 3x3 matrix<br />
Ask whether the first player wants to be X or O<br />
	if input if neither - display a message and ask again<br />
Start main game loop<br />
	clear the terminal<br />
	render current game state<br />
	if win/draw conditions are met:<br />
		display result of the game<br />
		exit<br />
	prompt current player for their move in a loop until a valid move is entered<br />
		prompt current player for their move with a message "#{error}Player #{@current_player.mark.to_s.upcase}, please enter your move: "<br />
		check if input == "s"<br />
			erase error message and skip iteration<br />
		check if input == "q"<br />
			display a thank you for playing message<br />
			quit the game<br />
		check if input is two comma separated numbers<br />
			set error if not and skip iteration<br />
		check coordinates are within bounds<br />
			set error if not and skip iteration<br />
		check that the space is not occupied<br />
			set error if not and skip iteration<br />
	mark the spot<br />

# Design
Create 3 classes: Game, Board and Player<br />
Game class will:<br />
	initialize game and players<br />
	ask for first player's symbol<br />
	start main game loop<br />
Board class will:<br />
	initialize board state matrix<br />
	render current game state<br />
	check winning conditions<br />
	check draw condition<br />
	check if coordinates are valid<br />
	mark a spot<br />
<br />
Player class will:<br />
	store player's symbol<br />
	prompt current player for their move<br />
	check if move inputs are valid<br />