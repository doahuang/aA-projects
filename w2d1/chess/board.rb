require_relative 'piece'
# require 'colorize'

class Board
  def initialize
    @grid = Array.new(8){ Array.new(8){ NullPiece.new } }
  end
  
  def [](pos)
    x, y = pos
    grid[x][y]
  end
  
  def []=(pos, value)
    x, y = pos
    grid[x][y] = value
  end
  
  def show_grid
    grid
  end
  
  def move_piece(start_pos, end_pos)
    if null_piece?(start_pos)
      raise ArgumentError.new("There is no piece at the start position") 
    end
    if valid_pos?(end_pos)
      raise ArgumentError.new("Can not move to that position")
    end
    update_piece(start_pos, end_pos)
  end
  
  def update_piece(start_pos, end_pos)
    curr_piece = self[start_pos]
    self[start_pos] = NullPiece.new
    self[end_pos] = curr_piece
  end
  
  def null_piece?(pos)
    curr_piece = self[pos]
    if curr_piece.is_a?(NullPiece)
      true
    else
      false
    end
  end
  
  def valid_pos?(pos)
    pos.none?{ |coord| coord.between?(0, 7) }
  end
  
  def inspect
    "#{grid}"
  end
  
  # def to_s
  #   puts "   " + (0...board.size).to_a.join(" ").colorize(:red)
  #   board.each_with_index do |row, rowno|
  #     puts "#{rowno}  ".colorize(:red) + row.map { |piece| piece.is_a?(NullPiece) ? "_" : "X".colorize(:blue) }.join(' ')
  #   end 
  # 
  #   Display.new(self)
  # end
  
  private
  attr_reader :grid
end

# load 'board.rb'
# board = Board.new
# while true
#   puts board
#   puts 'enter your start position'
#   input1 = gets.chomp.split(',').map(&:to_i)
#   puts 'enter your end position'
#   input2 = gets.chomp.split(',').map(&:to_i)
#   board.move_piece(input1, input2)
#   system('clear')
# end