# Create an empty gameboard
gameboard = Array.new(3) {Array.new([" ", " ", " "])}

class Players
end

class Player1
end

class Player2
end

# Print out the gameboard
gameboard.each_with_index do |row, index|
  puts "#{row}"
  puts "\n" unless index == gameboard.length - 1
end