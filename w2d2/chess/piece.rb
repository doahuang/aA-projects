require 'singleton'

class Piece

  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  def to_s

  end

  def set_pos(pos)
    @pos = pos
  end

  def get_pos
    pos
  end

  private
  attr_reader :pos, :board, :color
end

module SlidingPiece
  def moves
    potential_move = []
    move_dirs.each do |arr| # 1,0
      (1..7).each do |i|
        x = pos.first + arr.first * i
        y = pos.last + arr.last * i
        break if !board.null_piece?([x, y])
        # ** change to next dir if outbound or piece block
        next if !board.in_range?([x, y])
        potential_move << [x, y]
      end
    end
    potential_move
    # potential_move.select{ |arr| board.null_piece?(arr) }

  end

  def move_dirs
    raise 'debug this cuz whatever class called this module does not overwrite me'
  end
end


module SteppingPiece
  def moves
    # call move_diffs, add to cur_pos, update
    potential_move = move_diffs.map{ |arr| [arr.first + pos.first, arr.last + pos.last ] }
    potential_move.select{ |arr| board.in_range?(arr) }
  end

  def move_diffs
    raise 'yo debug'
  end
end


class Rook < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    super
  end

  def move_dirs
    horizontal_dirs = [[-1, 0], [1, 0]]
    vertical_dirs = [[0,-1], [0, 1]]
    horizontal_dirs + vertical_dirs
  end

  def to_s
    color == :white ? " ♖" : " ♜"
  end
end

class Bishop < Piece
  include SlidingPiece
  def initialize(pos, board, color)
    super
  end

  def move_dirs
    descend_diag = [[-1, -1], [1, 1]]
    ascend_diag = [[-1, 1], [1, -1]]
    descend_diag + ascend_diag
  end

  def to_s
    color == :white ? " ♗" : " ♝"
  end
end

class Queen < Piece
  include SlidingPiece
  def initialize(pos, board, color)
    super
  end

  def move_dirs
    horizontal_dirs = [[-1, 0], [1, 0]]
    vertical_dirs = [[0,-1], [0, 1]]
    descend_diag = [[-1, -1], [1, 1]]
    ascend_diag = [[-1, 1], [1, -1]]
    horizontal_dirs + vertical_dirs + descend_diag + horizontal_dirs
  end

  def to_s
    color == :white ? " ♕" : " ♛"
  end
end

class Knight < Piece
  include SteppingPiece
  def initialize(pos, board, color)
    super
  end

  def move_diffs
    [ [-2, 1], [-2, -1], [-1, -2], [-1, 2], [1, 2], [1, -2], [2, 1], [2, -1] ]
  end

  def to_s
    color == :white ? " ♘" : " ♞"
  end
end

class King < Piece
  include SteppingPiece
  def initialize(pos, board, color)
    super
  end

  def move_diffs
    horizontal_dirs = [[-1, 0], [1, 0]]
    vertical_dirs = [[0,-1], [0, 1]]
    descend_diag = [[-1, -1], [1, 1]]
    ascend_diag = [[-1, 1], [1, -1]]
    horizontal_dirs + vertical_dirs + descend_diag + ascend_diag
  end

  def to_s
    color == :white ? " ♔" : " ♚"
  end
end



class NullPiece < Piece
  include Singleton

  def initialize #no args
    @color = :nullcolor
  end

  def to_s
    "  "
  end

end
