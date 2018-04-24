class Piece
  def initialize
    # something
  end
  
  def to_s
    "X"
  end
  
  def inspect
    "#Piece"
  end
end


class NullPiece < Piece
  def to_s
    "O"
  end
  
  def inspect
    "#NullPiece"
  end
end