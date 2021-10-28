class Player
  attr_accessor :symbol

  # Initializes the player with their symbol and current_board
  def initialize(symbol, board)
    @symbol = symbol
    @board = board
  end

  # Promps current player for their move and displays warnings
  # until they've selected a valid move, or:
  #   "s" - to display current state of the board
  #   "q" - to quit the game early
  def prompt_move
    msg = ""

    loop do
      print "#{msg}#{@symbol.upcase} - Make your move: "
      input = gets.chomp

      # Quit the game early
      if input == "q"
        puts "Thank you for playing! Exiting..."
        exit
      end

      # Display current state of the board
      if input == "s"
        @board.render
        next
      end     
      
      # Validate move format
      unless valid_move_format?(input)
        msg = "Sorry, your move format is invalid. (should be: x,y)\n"
        next
      end

      x, y = input.split(",").map(&:to_i)

      # Validate coordinates
      unless @board.valid_board_coordinates?(x, y)
        msg = "Sorry, your coordinates are out of bounds.\n"
        next
      end

      # Validate spot availability
      unless @board.spot_available?(x, y)
        msg = "Sorry, this spot is already taken.\n"
        next
      end

      return [x, y]
    end
  end

  # Validates whether textual move input is in a valid format (format: "x,y")
  def valid_move_format?(input)
    input =~ /^\d,\d$/
  end
end
