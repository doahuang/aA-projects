require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  def initialize(board = Board.new)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end
  
  def render
    # cursor.get_input
    cursor_pos = cursor.cursor_pos
    # puts "#{board[cursor_pos]}".colorize(:red)
    
    board.show_grid.each_with_index do |row, i|
      # p row
      row.each_with_index do |col, j|
        if [i, j] == cursor_pos
          print board[cursor_pos].to_s.colorize(:red)
        else
          print board[cursor_pos].to_s
        end
      end
      
      puts
    end
    
  end
  
  private
  attr_reader :board, :cursor
end

display = Display.new
display.render