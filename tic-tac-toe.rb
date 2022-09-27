# Create an empty gameboard
$gameboard = Array.new(3) {Array.new([" ", " ", " "])}

def game
  puts "Player 1's turn. Enter your x coodinates:"
  x = gets.to_i
  puts "Player 1's turn. Enter your y coodinates:"
  y = gets.to_i
  play_turn(x, y)
  print_gameboard
end

def play_turn(x, y)
  if $gameboard[x][y] == " "
    $gameboard[x][y] = "X"
  end
end

# Print out the gameboard
def print_gameboard
  $gameboard.each_with_index do |row, index|
    puts "#{row}"
    puts "\n" unless index == $gameboard.length - 1
  end
end

game