require "minitest/autorun"
require "player.rb"

class PlayerTest < Minitest::Test
  def setup
    @board = Board.new
    @player = Player.new(:x, @board)
  end

  def test_move_input_validation
    refute @player.valid_move_format?("123")
    assert @player.valid_move_format?("0,2")
  end
end
