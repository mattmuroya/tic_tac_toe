class Player
  attr_reader :name

  def initialize
    print 'Please enter your name: '
    @name = gets.chomp
    @token = 'X'
  end
end
