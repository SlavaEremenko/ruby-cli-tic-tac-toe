class Board
	attr_accessor :board
	
	# Initializes a nil-filled 3x3 matrix representing board state
	def initialize
		@board = Array.new(3) { Array.new(3) }
	end

	# Renders board in terminal
	def render
	end

	# Checks victory conditions
	# Returns winning player's symbol, or false if nobody won
	def victory?
	end

	# Returns boolean signifying whether draw condition is met
	def draw?
	end

	# Check if a set of coordinates is valid for this board (allowing for future extension of the board to arbitrary size)
	def valid_board_coordinates?(x, y)
	end

	# Place a symbol on the board
	def place_symbol(x, y, symbol)
	end
end