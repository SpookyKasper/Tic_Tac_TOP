# Algo Build a Tic Tac Toe Game
# Make a Board with empty slots
  # Create a nested array with 3 rows and 3 columns
# Create players that play "X" and "O"
  # Create a player class that initalize with name and symbol as instance variables
  # Give players a method to fill board with their symbols
# Create a game loop where each turn next player is asked where he wants to
  # play in the board
# check for victory or board full and exit loop
# Announce End of Game (Win or Pat)
class Player
  attr_accessor :times_played
  @@number_of_players = 0

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @times_played = 0
    @@number_of_players += 1
  end

  def play(board, row, column)
    if (1..3).include?(row) && (1..3).include?(column)
      if board[row - 1][column - 1] != nil
        puts "Sorry bro this slot is already taken!"
      else
        board[row - 1][column - 1] = @symbol
        @times_played += 1
      end
    else
      puts "There's only 3 rows and columns honey..."
      puts "Please type a number between 1 and 3"
    end
    board
  end
end

class Board
  attr_accessor :board

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @board = Array.new(rows){Array.new(columns)}
  end

  def display_board
    p @board.first
    p @board[1]
    p @board.last
  end
end

player1 = Player.new("Player1", "X")
player2 = Player.new("Player2", "O")
tic_board = Board.new(3,3)
keep_going = true

while(keep_going)
  tic_board.display_board
  if player1.times_played == player2.times_played
    puts "Hey Player1 which row do you wanna play ?"
    row = gets.to_i
    puts "And on which column ?"
    column = gets.to_i
    player1.play(tic_board.board, row, column)
  elsif player1.times_played > player2.times_played
    puts "Hey Player2 which row do you wanna play ?"
    row = gets.to_i
    puts "And on which column ?"
    column = gets.to_i
    player2.play(tic_board.board, row, column)
  end
  p tic_board.board.transpose
  tic_board.board.flatten.include?(nil) ? keep_going : keep_going = false
  tic_board.board.transpose.each do |col|
    if col.join == "XXX"
      puts "Player 1 wins!"
      tic_board.display_board
      keep_going = false
    elsif col.join == "OOO"
      puts "Player 2 wins!"
      tic_board.display_board
      keep_going = false
    end
  end
  tic_board.board.each do |row|
    if row.join == "XXX"
      puts "Player 1 wins!"
      tic_board.display_board
      keep_going = false
    elsif row.join == "OOO"
      puts "Player 2 wins!"
      tic_board.display_board
      keep_going = false
    end
  end
end

