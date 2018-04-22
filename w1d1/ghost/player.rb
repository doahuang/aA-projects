class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    puts "#{name}, your turn!"
    puts 'choose a letter:'
    letter = gets.chomp
  end


end
