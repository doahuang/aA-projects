class Card
  attr_reader :value
  attr_accessor :face

  def initialize(value)
    @value = value
    @face = "down"
  end

  def hide
    self.face = 'down'
  end

  def reveal
    self.face = "up"
    value
  end

  def to_s
    value
  end

  def ==(other_card)
    value == other_card.value
  end
end

# if __FILE__ == $PROGRAM_NAME
#   card = Card.new(1)
#   p card.reveal
#   p card.face
#   p card.hide
#   p card.face
# end
