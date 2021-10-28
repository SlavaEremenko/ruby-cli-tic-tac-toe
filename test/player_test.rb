require "minitest/autorun"
require "player.rb"

class PlayerTest < Minitest::Test
  def setup
    @board = Board.new
    @player = Player.new(:x, @board)

    # Mock user input
    $stdin = StringIO.new
  end

  def teardown
    $stdin = STDIN
  end

  def test_move_input_validation
    refute @player.valid_move_format?("123")
    assert @player.valid_move_format?("0,2")
  end

  def test_early_exit
    $stdin.puts "q"
    $stdin.rewind

    out, = capture_io do
      assert_raises SystemExit, "Should exit the game if player types in 'q' as a move" do
        @player.prompt_move
      end
    end

    assert_equal "X - Make your move: Thank you for playing! Exiting...\n", out, "Should display a thank you message upon exit"
  end

  def test_player_move_prompt
    @board.board = [
      [:x, :o, :x],
      [:x, nil, :o],
      [nil, :o, :x]
    ]
    $stdin.puts "s"
    $stdin.puts "1,1"
    $stdin.rewind

    board_rendered = false
    @board.stub :render, ->{ board_rendered = true } do
      @player.prompt_move
    end
    assert board_rendered, "Should render the board when player types 's' as a move"

    $stdin = StringIO.new
    $stdin.puts "asd" # Try invalid input
    $stdin.puts "1,1"
    $stdin.rewind
    out, = capture_io { @player.prompt_move }
    assert_equal "X - Make your move: Sorry, your move format is invalid. (should be: x,y) X - Make your move: ", out, "Should display an invalid move error message"

    $stdin = StringIO.new
    $stdin.puts "1,9" # Try out of bounds input
    $stdin.puts "1,1"
    $stdin.rewind
    out, = capture_io { @player.prompt_move }
    assert_equal "X - Make your move: Sorry, your coordinates are out of bounds. X - Make your move: ", out, "Should display an out of bounds error message"

    $stdin = StringIO.new
    $stdin.puts "0,0" # Try a spot that's already taken
    $stdin.puts "1,1"
    $stdin.rewind
    out, = capture_io { @player.prompt_move }
    assert_equal "X - Make your move: Sorry, this spot is already taken. X - Make your move: ", out, "Should display a spot taken error message"

    $stdin = StringIO.new
    $stdin.puts "1,1"
    $stdin.rewind
    x, y = @player.prompt_move
    assert_equal [1, 1], [x, y], "Should return correct move coordinates as integers"
  end
end
