#!/usr/bin/env ruby
$LOAD_PATH << './lib'

require 'player.rb'
require 'board.rb'
require 'game.rb'

game = Game.new
game.play