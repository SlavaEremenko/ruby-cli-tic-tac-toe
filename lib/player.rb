class Player
	attr_accessor :symbol

	# Initializes the player with their symbol and current_board
	def initialize(symbol, board)
		@symbol = symbol
		@board = board
	end

	# Promps current player for their move and displays warnings
	# until they've selected a valid move, or:
	# 	"s" - to display current state of the board
	# 	"q" - to quit the game early
	def prompt_move
	end

	# Validates whether textual move input is in a valid format (format: "x,y")
	def valid_move_format?(input)
		input =~ /^\d,\d$/
	end
end
