

class HumanPlayer
  def initialize(name)
    @name = name

  end

  def prompt
    print 'pick a card at [row, col]: '

  end

  def get_input
    pos = gets.chomp.delete(' ').split(',').map(&:to_i)

  end

  def receive_match(*pos)
    puts "Match!"
  end

  def receive_revealed_card(*pos)
    puts "No Match!"
  end
end
