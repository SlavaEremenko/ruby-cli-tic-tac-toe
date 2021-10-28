require "minitest/autorun"
require "stringio"
require "game.rb"

class GameTest < Minitest::Test
  def setup
    # Mock user input
    $stdin = StringIO.new
  end

  def teardown
    $stdin = STDIN
  end
  
  def test_asks_for_first_players_symbol
    $stdin.puts "O"
    $stdin.rewind

    out, = capture_io do
      @game = Game.new
    end

    assert_equal "Welcome to tic-tac-toe. Do you want to be X or O? ", out, "Should ask for first player's symbol"
    assert_equal :o, @game.players[0].symbol, "Should correctly set first player's symbol to :x"
  end

  def test_main_game_loop_ending_in_draw
    sample_draw_inputs = %Q(x
0,0
1,0
2,0
1,1
0,1
0,2
2,1
2,2
1,2)

    $stdin.puts(sample_draw_inputs)
    $stdin.rewind
    
    out, = capture_io do
      assert_raises SystemExit, "Should exit the game when it ends in a draw" do
        @game = Game.new
        @game.play
      end
    end

    assert_match (/Draw/), out, "Should play the game and end in draw"
  end

  def test_main_game_loop_ending_in_victory
    sample_draw_inputs = %Q(O
0,0
1,0
2,0
0,1
1,1
2,1
0,2)

    $stdin.puts(sample_draw_inputs)
    $stdin.rewind
    
    out, = capture_io do
      assert_raises SystemExit, "Should exit the game when it ends in a victory" do
        @game = Game.new
        @game.play
      end
    end

    assert_match (/Player with O won/), out, "Should play the game and end in victory"
  end
end
