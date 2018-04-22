require_relative 'card'

class Board
  attr_reader :grid, :grid_size
  def initialize(grid_size = 2)
    @grid_size = (grid_size.even? ? grid_size : 2)
    @grid = Array.new(grid_size){ Array.new(grid_size) }
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def reveal(pos)
    card = self[pos]
    card.reveal if card.face == 'down'
  end

  def valid_move?(pos)
    self[pos].face == 'down' 
  end

  def populate
    values = []
    ((grid_size ** 2)/2).times do |i|
      values << i + 1
    end
    values += values

    grid_size.times do |row|
      grid_size.times do |col|
        pos = [row, col]
        value = values.shuffle!.pop
        self[pos] = Card.new(value)
      end
    end

  end

  def render
    #show grid, values of cards, unknown values known as "?"
    result = grid.map do |row|
      row.map { |card| card.face == 'up' ? card.value : '?' }.join(" ")
    end
    puts "    " + (0...grid_size).to_a.join(" ")
    result.each_with_index do |row, rowno|
      puts "#{rowno} | #{row}"
    end
  end

  def won?
    grid.flatten.all? {|card| card.face == 'up'}
  end

end
