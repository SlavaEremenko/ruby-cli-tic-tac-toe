class Board
	attr_accessor :board

	# Initializes a nil-filled 3x3 matrix representing board state
	def initialize
		@board = Array.new(3) { Array.new(3) }
	end

	# Renders board in terminal
	def render
		@board.each.with_index do |row, y|
			row.each.with_index do |item, x|
				chr = item.nil? ? " " : item
				print " #{chr} "
				print "|" unless x == row.size - 1
			end
			print "\n-----------\n" unless y == @board.size - 1
		end
	end

	# Checks victory conditions
	# Returns winning player's symbol, or false if nobody won
	def victory?
		# Loop over all Nx1 lines in the board
		[*@board, *columns, *diagonals].each do |line|
			return :x if line.all?(:x)
			return :o if line.all?(:o)
		end

		false
	end

	# Returns boolean signifying whether draw condition is met
	def draw?
		!victory? && @board.flatten.compact.size == 9
	end

	# Check if a set of coordinates is valid for this board
	def valid_board_coordinates?(x, y)
		x > 0 && y > 0 && x < 3 && y < 3
	end

	# Place a symbol on the board
	def place_symbol(x, y, symbol)
		@board[x][y] = symbol
	end

	# Returns an array of columns of the board
	def columns
		@board.transpose
	end

	# Returns an array with two diagonals of the board
	def diagonals
		[
			[@board[0][0], @board[1][1], @board[2][2]],
			[@board[0][2], @board[1][1], @board[2][0]]
		]
	end
end
