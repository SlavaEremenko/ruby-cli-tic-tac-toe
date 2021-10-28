class Game
	attr_accessor :players

	# Initializes board and players
	def initialize
		@board = Board.new

		player_1_symbol = ask_first_players_symbol
		player_2_symbol = player_1_symbol == :x ? :o : :x
		
		@players = [
			Player.new(player_1_symbol, self),
			Player.new(player_2_symbol, self)
		]
	end

	# Asks for and returns first player's preferred symbol (X or O)
	# and displays error messages until they've selected one
	def ask_first_players_symbol
		msg = "Welcome to tic-tac-toe."

		loop do
			print "#{msg} Do you want to be X or O? "
			input = gets.chomp
			if ['X', 'O'].include?(input.upcase)
				return input.downcase.to_sym
			else
				msg = "#{input} is not a valid input."
			end
		end
	end

	# Starts main game loop
	def play
	end
end