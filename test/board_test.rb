require "minitest/autorun"
require "board.rb"

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
  end

  def test_places_a_symbol
    @board.place_symbol(2,1, :x)
    @board.place_symbol(1,2, :o)
    assert_equal :x, @board.board[1][2], "Should place O"
    assert_equal :o, @board.board[2][1], "Should place X"
  end

  def test_columns
    @board.board = [
      [:x, :o, :x],
      [:x, :o, :x],
      [:o, :x, nil]
    ]
    assert_equal [[:x, :x, :o], [:o, :o, :x], [:x, :x, nil]], @board.columns, "Should return all columns"
  end

  def test_diagonals
    @board.board = [
      [:x, :o, :x],
      [:x, :o, :x],
      [:o, :x, nil]
    ]
    assert_equal [[:x, :o, nil], [:x, :o, :o]], @board.diagonals, "Should return two diagonals"
  end

  def test_draw_condition
    refute @board.draw?, "Should not be draw by default"
    # 8 spots filled in (no victory)
    @board.board = [
      [:x, :o, :x],
      [:x, :o, :x],
      [:o, :x, nil]
    ]
    refute @board.draw?, "Should not be draw with 8 out of 9 spots filled without victory conditions met"
    @board.place_symbol(2,2, :o)
    assert @board.draw?, "Should be draw with all spots filled without victory conditions met"
    @board.place_symbol(2,2, :x)
    refute @board.draw?, "Should not be draw with victory conditions met"
  end

  def test_victory_conditions
    @board.board = [
      [:x, :o, :x],
      [:x, :o, :x],
      [:o, :x, nil]
    ]
    refute @board.victory?, "Should not return victory if victory conditions are not met"
    @board.board = [
      [:x, :o, :x],
      [:x, :o, :x],
      [:o, :x, :x]
    ]
    assert_equal :x, @board.victory?, "Should return victory for X if there are three X in line vertically"
    @board.board = [
      [:x, :o, :x],
      [:x, :x, :o],
      [:o, :o, :o]
    ]
    assert_equal :o, @board.victory?, "Should return victory for O if there are three O in line horizontally"
    @board.board = [
      [:x, :o, :x],
      [:x, :x, :o],
      [:o, :o, :x]
    ]
    assert_equal :x, @board.victory?, "Should return victory for X if there are three X in line diagonally from top left to bottom right"
    @board.board = [
      [:x, :o, :o],
      [:x, :o, :o],
      [:o, :x, :o]
    ]
    assert_equal :o, @board.victory?, "Should return victory for O if there are three O in line diagonally from bottom left to top right"
  end

  def test_board_coordinates_validation
    refute @board.valid_board_coordinates?(-1, 2), "Should return false for a negative coordinate"
    refute @board.valid_board_coordinates?(3, 2), "Should return false for out of bound coordinate"
    assert @board.valid_board_coordinates?(1, 0), "Should return true for valid coordinates"
  end

  def test_board_rendering
    @board.board = [
      [:x, :o, :x],
      [:x, nil, :o],
      [nil, :o, :x]
    ]

    out, = capture_io do
      @board.render
    end

    assert_equal %Q( x | o | x 
-----------
 x |   | o 
-----------
   | o | x \n), out, "Should render board state correctly"
  end

  def test_spot_availability
    @board.board = [
      [:x, :o, :x],
      [:x, nil, :o],
      [nil, :o, :x]
    ]
    refute @board.spot_available?(2, 0), "Should return false for unavailable spot"
    assert @board.spot_available?(1, 1), "Should return true for an empty spot"
  end
end
