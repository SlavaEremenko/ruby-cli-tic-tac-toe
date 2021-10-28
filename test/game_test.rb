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
end
