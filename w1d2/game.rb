require_relative 'board'
require_relative 'card'
require_relative 'humanplayer'
require_relative 'computerplayer'
class Game
  attr_reader :board, :player

  def initialize(board = Board.new(2))
    @board = board
    board.populate
    @player = ComputerPlayer.new(board)
  end

  def play
    pos = []
    until over?
      render
      until pos.length == 2
        player.prompt
        pos << player.get_input
        if board.valid_move?(pos.last)
          board.reveal(pos.last)
          render
        else
          puts 'invalid move! try again!'
          pos.pop
        end
      end
      make_guess(pos.first, pos.last)
      pos = []

    end
    puts 'game over! you won!'
  end


  def make_guess(pos1, pos2)
    card1 = board[pos1]
    card2 = board[pos2]
    if card1 == card2
      player.receive_match(pos1, pos2)
    else
      player.receive_revealed_card(pos1, pos2)
      card1.hide
      card2.hide
    end
  end



  def over?
    board.won?
  end

  def render
    board.render
  end

end

if __FILE__ == $PROGRAM_NAME
  j = Game.new
  j.play
end
