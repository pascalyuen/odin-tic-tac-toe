# Create an empty gameboard
$gameboard = Array.new(3) { Array.new([' ', ' ', ' ']) }
$player = 1

def game
  3.times do
    play_turn(coordinates)
    print_gameboard
  end
end

# Get the row and column number from the user and return them
def coordinates
  arr = []

  loop do
    puts "Player #{$player}'s turn. Enter your row number:"
    x = gets.to_i
    puts "Player #{$player}'s turn. Enter your column number:"
    y = gets.to_i

    if !x.between?(0, 2) || y.between?(0, 2)
      puts 'Out of range'
    elsif $gameboard[x][y] != ' '
      puts 'Choose another spot'
    else
      arr.push(x)
      arr.push(y)
      break
    end
  end

  arr
end

# Mark the symbol on the gameboard
def play_turn(array)
  if $player == 1
    $gameboard[array[0]][array[1]] = 'X'
    $player = 2
  else
    $gameboard[array[0]][array[1]] = 'O'
    $player = 1
  end

  check_win_condition
end

def check_win_condition
end

# Print out the gameboard
def print_gameboard
  $gameboard.each_with_index do |row, index|
    puts row.to_s
    puts "\n" unless index == $gameboard.length - 1
  end
end

game
