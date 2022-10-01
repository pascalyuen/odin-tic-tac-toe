class Game
  attr_accessor :game_over

  def start
    @game_over = false
    @winning_player = nil

    board = Board.new
    board.create_board

    players = []
    player1 = Player.new("player1")
    player2 = Player.new("player2")
    players.push(player1, player2)
    
    players.cycle(nil) do |player|
      player.play_turn(board.gameboard, player.cell(board.gameboard))
      board.print_gameboard
      check_win_condition(board.gameboard)

      if @game_over
        puts "Game over. #{@winning_player} wins!"
        break
      end
    end
  end

  def check_win_condition(wholeboard)
    # Check each row of the board
    wholeboard.each do |row|
      if row.uniq.count == 1 && row.uniq[0] != ' '
        @game_over = true

        case row.uniq[0]
        when 'X'
          @winning_player = 'player1'
        when 'O'
          @winning_player = 'player2'
        end
      end
    end

    # Check each column of the board
    wholeboard.transpose.each do |column|
      if column.uniq.count == 1 && column.uniq[0] != ' '
        @game_over = true

        case column.uniq[0]
        when 'X'
          @winning_player = 'player1'
        when 'O'
          @winning_player = 'player2'
        end
      end
    end
  end
end

class Board
  attr_accessor :gameboard

  def create_board
    @gameboard = Array.new(3) { Array.new([' ', ' ', ' ']) }
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

  def play_turn(cells, array)
    if name == 'player1'
      cells[array[0]][array[1]] = 'X'
    else
      cells[array[0]][array[1]] = 'O'
    end
  end

  def cell(wholeboard)
    arr = []
      loop do
        puts "#{name}'s turn. Enter your row number:"
        x = gets.to_i
        puts "#{name}'s turn. Enter your column number:"
        y = gets.to_i
    
        if !x.between?(0, 2) || !y.between?(0, 2)
          puts 'Out of range'
        elsif wholeboard[x][y] != ' '
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
