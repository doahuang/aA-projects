require_relative 'piece'

class Board
  def initialize
    @grid = Array.new(8){ Array.new(8){ NullPiece.instance } }
    test_piece
  end

  def test_piece
    rook = [ [0,0], [0,7], [7,0], [7,7] ]
    rook.each do |pos|
      self[pos] = Rook.new(pos, self, :black) if pos.first == 0
      self[pos] = Rook.new(pos, self, :white) if pos.first == 7
    end

    bishop = [ [0,2], [0,5], [7,2], [7,5] ]
    bishop.each do |pos|
      self[pos] = Bishop.new(pos, self, :black) if pos.first == 0
      self[pos] = Bishop.new(pos, self, :white) if pos.first == 7
    end


    pos = [0,3]
    self[pos] = Queen.new(pos, self, :black)
    pos = [7,3]
    self[pos] = Queen.new(pos, self, :white)
    pos = [0,1]
    self[pos] = Knight.new(pos, self, :black)
    pos = [0,6]
    self[pos] = Knight.new(pos, self, :black)
    pos = [7,1]
    self[pos] = Knight.new(pos, self, :white)
    pos = [7,6]
    self[pos] = Knight.new(pos, self, :white)
    pos = [0,4]
    self[pos] = King.new(pos, self, :black)
    pos = [7,4]
    self[pos] = King.new(pos, self, :white)

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
    unless valid_move?(start_pos, end_pos)
      raise ArgumentError.new("Can not move to that position")
    end
    update_board(start_pos, end_pos)
    update_piece(end_pos)
  end

  def update_board(start_pos, end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.instance
  end

  def update_piece(pos)
    self[pos].set_pos(pos)
  end

  def null_piece?(pos)
    self[pos].is_a?(NullPiece) ? true : false
  end

  def in_range?(pos)
    pos.all?{ |coord| coord.between?(0, 7) }
  end

  def valid_move?(start_pos, end_pos)
    curr_piece = self[start_pos]
    good_moves = curr_piece.moves
    in_range?(end_pos) && good_moves.include?(end_pos)
  end

  # def to_s
  #   puts "   " + (0...board.size).to_a.join(" ").colorize(:red)
  #   board.each_with_index do |row, rowno|
  #     puts "#{rowno}  ".colorize(:red) + row.map { |piece| piece.is_a?(NullPiece) ? "_" : "X".colorize(:blue) }.join(' ')
  #   end
  #
  #   Display.new(self)
  # end

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

  private
  attr_reader :grid
end
