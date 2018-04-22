require 'byebug'
require_relative 'player'

class Game
  attr_reader :players, :dictionary
  attr_accessor :fragment

  def initialize(players, dictionary = File.readlines('dictionary.txt'))
    @fragment = ""
    @dictionary = dictionary.map(&:chomp)
    @candidate_words = dictionary
    @current_player, @previous_player = players
  end

  def run


  end

  def play_round

    until over?
      display

      take_turn(@current_player)
      update_dictionary
      next_player!
    end

    losses
  end

  def display
    puts "dictionary size: #{dictionary.size}"
    puts "current fragment: #{fragment}"
  end

  def over?
    @candidate_words.include?(fragment)
  end

  # def win?
  #   @candidate_words.include?(fragment)
  # end

  def next_player!
    @current_player, @previous_player = @previous_player, @current_player
  end

  def take_turn(player)
    letter = player.guess
    until valid_play?(letter)
      letter = player.guess
    end
    # self.fragment += letter
    update_fragment(letter)
  end

  def update_fragment(letter)
    self.fragment += letter
  end

  def valid_play?(string)
    alphabet = ("a".."z").to_a
    str_check = alphabet.include?(string)
    new_fragment = fragment + string
    word_check = @candidate_words.any? { |word| word.include?(new_fragment) }
    puts str_check && word_check
    str_check && word_check
  end

  def update_dictionary
    @candidate_words.select! do |word|
      word[0...fragment.length] == fragment
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  player1 = Player.new("Player1")
  player2 = Player.new("Player2")

  game = Game.new([player1, player2])
  game.play_round
end
