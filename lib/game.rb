class Game
  attr_accessor :players, :current_player

  # Initializes board and players
  def initialize
    @board = Board.new

    player_1_symbol = ask_first_players_symbol
    player_2_symbol = player_1_symbol == :x ? :o : :x
    
    @players = [
      Player.new(player_1_symbol, @board),
      Player.new(player_2_symbol, @board)
    ]

    @current_player = @players[0]
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

  # Runs the main game loop
  def play
    loop do
      # Render the board
      @board.render

      # End game if game ending conditions are met
      end_game_if_draw_or_victory

      # Prompt current_player for their move
      x, y = @current_player.prompt_move

      # Place a symbol on board
      @board.place_symbol(x, y, @current_player.symbol)

      # Switch players
      @current_player = @players[@current_player == @players[0] ? 1 : 0]
    end
  end

  def end_game_if_draw_or_victory
    # Check draw condition
    if @board.draw?
      puts "Draw! Thanks you for playing..."
      exit
    end

    # Check draw condition
    player_victory = @board.victory?
    if player_victory
      puts "Player with #{player_victory.upcase} won! Thanks you for playing..."
      exit
    end
  end
end
