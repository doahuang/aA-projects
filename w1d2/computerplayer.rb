require_relative 'board'

class ComputerPlayer
  attr_reader :board
  attr_accessor :known_cards, :matched_cards
  def initialize(board)
    @board = board
    @known_cards = Hash.new
    @matched_cards = Hash.new
  end

  def prompt
    print "computer is deciding..."
  end

  def get_input

    pos = [rand(board.grid_size), rand(board.grid_size)]
    while matched_cards[pos] || known_cards[pos]
      pos = [rand(board.grid_size), rand(board.grid_size)]
    end

    p pos

    #  if we found the saved_pos includes any pos matching
  end

  def receive_match(pos1, pos2)
    matched_cards[pos1] = board[pos1].value
    matched_cards[pos2] = board[pos2].value
  end

  def receive_revealed_card(pos1, pos2)
    known_cards[pos1] = board[pos1].value
    known_cards[pos2] = board[pos2].value
  end


end
