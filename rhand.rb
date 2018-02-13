require_relative 'rdeck'
require_relative 'rcard'
require 'pry'

class Hand
  attr_reader :cards
  attr_accessor :player_cards

  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    sum = 0
    @cards.each do |card|
      if card.face_card?
        sum += 10
      elsif card.ace_card?
        if sum <= 10
          sum += 11
        else
          sum += 1
        end
      else
        sum += card.rank.to_i
      end
    end
    sum
  end
end