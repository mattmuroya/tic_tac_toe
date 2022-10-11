require_relative 'game.rb'
require_relative 'player.rb'

print 'Please enter your name: '

game = Game.new(Player.new(gets.chomp, 'X'))
game.play
