require "minitest/autorun"
require 'player.rb'

class PlayerTest < Minitest::Test
  def setup
    @player = Player.new
  end
end
