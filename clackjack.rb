require_relative "rcard"
require_relative "rdeck"
require_relative "rhand"
require 'pry'

class Clackjack
attr_accessor :casino, :player

def initialize (player, casino)
  @player = player
  @casino = casino
  print `clear`
  puts "Hello and welcome to BlackJack"
  bjack
end

def bjack
  print `clear`
deck = Deck.new

player_cards = deck.deal(2)
dealer_cards = deck.deal(2)

player_hand = Hand.new(player_cards)
dealer_hand = Hand.new(dealer_cards)

enough
puts "Press [Enter] to Deal "
input = gets.chomp

puts "Players Cards: "
puts "#{player_cards[0].rank}#{player_cards[0].suit}"
puts "#{player_cards[1].rank}#{player_cards[1].suit}"
puts
puts "Score: #{player_hand.calculate_hand}"
puts

dealer_score = dealer_hand.calculate_hand
  while player_hand.calculate_hand < 21
    print "Type (Y or N) to Hit : "
    user_choice = gets.chomp

    if user_choice.upcase == "Y"
      new_hand = deck.deal(1)
      player_cards += new_hand
      player_hand = Hand.new(player_cards)
      puts
      puts "Player draws a #{player_cards[2].rank}#{player_cards[2].suit}"
      puts "Player Score: #{player_hand.calculate_hand}"
      puts
    elsif user_choice.upcase == "N"
      break
    else
      puts "Invalid Selection"
    end
  end

  if player_hand.calculate_hand < 22 && dealer_score < 17
      new_hand = deck.deal(1)
      dealer_cards += new_hand
      dealer_hand = Hand.new(dealer_cards)
      puts
      puts "Dealer Hits"
      puts
      # binding.pry
      if dealer_hand.cards.size == 3
        puts "Dealer's Hand:"
        puts "#{dealer_cards[0].rank}#{dealer_cards[0].suit}"
        puts "#{dealer_cards[1].rank}#{dealer_cards[1].suit}"
        puts "#{dealer_cards[2].rank}#{dealer_cards[2].suit}"
        puts
      end
    end

player_score = player_hand.calculate_hand
dealer_score = dealer_hand.calculate_hand

  puts "Results:"
  if player_score > 21
    puts "Player loses - You busted!"
    @player.subtracting (@bet)
    again
  elsif player_score > dealer_score
    puts "Player: #{player_score}"
    puts "Dealer: #{dealer_score}"
    puts
    puts "Player Wins!"
    @player.adding (@bet)
    again
  elsif dealer_score > 21
    puts "Dealer BUST - Player Wins"
    @player.adding (@bet)
    again
  elsif player_score == dealer_score
    puts "DRAW!"
    puts @player.wallet
    again
  else dealer_score > player_score
    puts "Player: #{player_score}"
    puts "Dealer: #{dealer_score}"
    puts
    puts "Dealer Wins!"
    @player.subtracting (@bet)
    again

  end
end

def again
  puts "do you want to play again?"
  answer = gets.strip.downcase
  case answer
  when "yes"
    bjack
  when "y"
    bjack
  else
   @casino.menu
 end
end
def enough
  puts "How much do you want to bet?"
  @bet = gets.to_i
    if @bet < @player.wallet
    puts ""
     else
       puts "You don't have enough to bet that much."
       enough
    end
      puts""
  end

end
