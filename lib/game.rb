class Game
	# Initializes board and players
	def initialize
		@board = Board.new

		player_1_symbol = ask_first_players_symbol
		player_2_symbol = player_1_symbol == :x ? :o : :x
		
		@players = [
			Player.new(player_1_symbol, @board),
			Player.new(player_2_symbol, @board)
		]
	end

	# Asks for and returns first player's preferred symbol (X or O)
	# and displays error messages until they've selected one
	def ask_first_players_symbol
	end

	# Starts main game loop
	def play
	end
end