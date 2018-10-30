require_relative "piece"

class Board
  attr_reader :grid 
  
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    
    pawns_black = %w{ ♟ ♟ ♟ ♟ ♟ ♟ ♟ ♟ }
    pawns_white = %w{ ♙ ♙ ♙ ♙ ♙ ♙ ♙ ♙ }
    pieces_black = %w{ ♜ ♞ ♝ ♛ ♚ ♝ ♞ ♜ }
    pieces_white = %w{ ♖ ♘ ♗ ♕ ♔ ♗ ♘ ♖ }

    @grid[0], @grid[1] = pieces_white, pawns_white
    @grid[6], @grid[7] = pawns_black, pieces_black
  end  
  
  def valid_pos?(pos)
    pos[0].between?(0, 7) && pos[1].between?(0, 7)  
  end
  
  def display
    p @grid 
  end
  
  def [](pos)
    row, col = pos 
    @grid[row][col] 
  end 
  
  def []=(pos, mark)
    row, col = pos 
    @grid[row][col] = mark
  end 
    
  def move_piece(start_pos, end_pos)
    raise Error if self[start_pos].nil?
    raise Error if !valid_pos?(end_pos) || !valid_pos?(start_pos)
    
    piece = self[start_pos]
    self[end_pos] = piece
    self[start_pos] = nil  
  end 
end 

# if __FILE__ == $PROGRAM_NAME
#   board = Board.new 
# 