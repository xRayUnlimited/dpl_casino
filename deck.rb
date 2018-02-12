require_relative 'card'

class Deck

  attr_accessor :cards

  def initialize
    @cards = []
    @suits = %w(♦ ♣ ♠ ♥)
    @rank = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  end

  def build_deck
    cards = []
    suits.each do |suit|
      ranks.each do |rank|
        cards << Card.new(rank, suit)
      end
    end
    cards.shuffle!
  end

  def generate_deck
    @suits.each do |suit|
      @ranks.size.times do |i|
        # Ternary Operator
        color = (suit == '♣' || suit == '♠') ? 'Black' : 'Red' 
        @cards << Card.new(@ranks[i], suit, color)
      end
    end
  end

  def deal(num)
    cards.pop(num)
  end
end