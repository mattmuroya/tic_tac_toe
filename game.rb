class Game
  WIN_CONDITIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ]

  def initialize(player)
    @board = Array.new(9)
    @player = player
    @computer = Player.new('Computer', 'O')
    @current_player = @player
    @number_of_plays = 0
  end

  def play
    redraw
    while true
      get_move
      @number_of_plays += 1
      redraw
      if win?
        puts "#{@current_player.name wins!}"
        break
      elsif @number_of_plays == 9
        puts "It's a tie!"
        break
      else
        switch_current_player
      end
    end
  end

  def get_move
    if @current_player == @player
      move_valid = false
      until move_valid
        print 'Choose a numbered space: '
        i = gets.chomp.to_i
        if i.between?(1, 9) && @board[i - 1] == nil
          move_valid = true
        else
          puts 'Please try again.'
        end
      end
      @board[i - 1] = @current_player.token
    elsif @current_player == @computer
      random_available =
        @board.each_index.select { |i| @board[i] == nil }.sample
      @board[random_available] = @current_player.token
      puts "#{@current_player.name} picked space ##{random_available + 1}."
    end
  end

  def win?
    played_spaces =
      @board.each_index.select { |i| @board[i] == @current_player.token }
    WIN_CONDITIONS.each do |win_condition|
      return true if (win_condition - played_spaces).empty?
    end
    false
  end

  def switch_current_player
    @current_player = @current_player == @player ? @computer : @player
  end

  def redraw
    puts "\n"
    puts '     |     |     '
    puts "  #{@board[0] || '1'}  |  #{@board[1] || '2'}  |  #{@board[2] || '3'}  "
    puts '_____|_____|_____'
    puts '     |     |     '
    puts "  #{@board[3] || '4'}  |  #{@board[4] || '5'}  |  #{@board[5] || '6'}  "
    puts '_____|_____|_____'
    puts '     |     |     '
    puts "  #{@board[6] || '7'}  |  #{@board[7] || '8'}  |  #{@board[8] || '9'}  "
    puts '     |     |     '
    puts "\n"
  end
end
