# Tic Tac Toe game

require 'Pry'

# 1. Come up with requirements or specifications, which will 
	# determine the scope.
# 2. Application logic ("pseudocode") --> not code, but what logical sequence
	# of actions need to be taken to fulfill requirements. 
# 3. Translation of those steps into code.
# 4. Run code to verify logic. 

# How do we execute a tic tac toe game? 

# Draw a board. 
# Assign player 1 to X. 
# Assign player 2 to O. 

# loop until a winner or all squares are taken. 
# 	player picks a square
# 	check for winner (saves into variable outside loop)
# 	computer picks a square
# 	check for winnner

# if there is a winner
# 	show the winner
# or else
# 	it is a tie


begin
def initialize_board
	b = {}
	(1..9).each {|position| b[position] = ' '}
	b
end

def draw_board(b)
	system('cls')
	puts "Hello. Welcome to Tic Tac Toe." 
	puts "This is a one-player game: you vs. the computer."
	puts "Note: You are X, computer is O." 
	puts " #{b[1]} | #{b[2]} | #{b[3]} "
  	puts "-----------"
  	puts " #{b[4]} | #{b[5]} | #{b[6]} "
  	puts "-----------"
  	puts " #{b[7]} | #{b[8]} | #{b[9]} "
end

def empty_positions(b)
	b.select { |k, v| v == " " }.keys
end

def player_picks_square(b)
	begin
	puts "Pick a square (positions 1-9)."
	position = gets.chomp.to_i
	end until empty_positions(b).include?(position)
	b[position] = 'X'
	
end

def computer_picks_square(b)
	position = empty_positions(b).sample
	b[position] = 'O'

end

def check_winner(b)
	winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
	winning_lines.each do |line|
		return "Player" if b.values_at(*line).count('X') == 3
    	return "Computer" if b.values_at(*line).count('O') == 3
    end
    nil
end

#board = {1 => '', 2 => '', 3 => ''...}
#board[8] = 'X'
#Keeping track of the state of the board

board = initialize_board
draw_board(board)

begin 
	player_picks_square(board)
	computer_picks_square(board)
	draw_board(board)
	winner = check_winner(board)
end until winner || empty_positions(board).empty?


if winner
	puts "#{winner} won!"
else
	puts "It's a tie!"
end

puts "Play again (Y/N)?"
y = gets.chomp.upcase

end until y == "N"
