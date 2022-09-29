class Game
  def start
    board = Board.new
    board.create_board

    players = []
    player1 = Player.new("player1")
    player2 = Player.new("player2")
    players.push(player1, player2)
    
    players.cycle(1) do |player|
      board.play_turn(player.cell(board.gameboard))
      board.print_gameboard
      # check_win_condition

      # if game_over
      #   break
      # end
    end
  end

  # def check_win_condition
  # end
end

class Board
  attr_accessor :gameboard

  def create_board
    @gameboard = Array.new(3) { Array.new([' ', ' ', ' ']) }
  end

  def play_turn(array)
    @gameboard[array[0]][array[1]] = 'X'
    # gameboard[array[0]][array[1]] = 'O'
  end

  def print_gameboard
    @gameboard.each_with_index do |row, index|
      puts row.to_s
      puts "\n" unless index == gameboard.length - 1
    end
  end
end

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def cell(cells)
    arr = []
      loop do
        puts "#{name}'s turn. Enter your row number:"
        x = gets.to_i
        puts "#{name}'s turn. Enter your column number:"
        y = gets.to_i
    
        if !x.between?(0, 2) || !y.between?(0, 2)
          puts 'Out of range'
        elsif cells[x][y] != ' '
          puts 'Choose another spot'
        else
          arr.push(x)
          arr.push(y)
          break
        end
      end
      arr
  end
end

# Start the game
game = Game.new
game.start
