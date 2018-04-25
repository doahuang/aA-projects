require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  def initialize(board = Board.new)
    @board = board
    @cursor = Cursor.new([0,0], board)
    @selected = nil
  end

  def render
    cursor_pos = cursor.cursor_pos

    board.show_grid.each_with_index do |row, i|
      puts " -- -- -- -- -- -- -- -- "
      row.each_with_index do |col, j|
        print "|"
        if [i, j] == cursor_pos
          print board[cursor_pos].to_s.colorize(background: :green)
        else
          print board[[i, j]].to_s
        end
        print "|" if j == 7
      end
      print "\n -- -- -- -- -- -- -- -- " if i == 7
      puts
    end

  end

  def play
    while true
      system('clear')
      render
      begin
        input = cursor.get_input
        if input # space/enter
          if board.null_piece?(input) # empty spot
            if selected  # if we picked up a piece before
              board.move_piece(selected, input)  # we move our piece here
            end
          else # there is a piece here
            @selected = input
            p board[input].moves
            sleep(1)
          end
        end
      rescue ArgumentError => e
        puts e.message
        sleep(1)
        # retry
      end
    end
  end

  private
  attr_reader :board, :cursor, :selected
end

display = Display.new
display.play
