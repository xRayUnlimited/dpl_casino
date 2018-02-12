require_relative "card"
require_relative "deck"
require_relative "hand"

class Blackjack
deck = Deck.new

player_cards = deck.deal(2)
dealer_cards = deck.deal(2)

player_hand = Hand.new(player_cards)
dealer_hand = Hand.new(dealer_cards)

puts "Hello and welcome to BlackJack"
puts "Press Enter to Deal "
input = gets.chomp

puts "Players Cards: "
puts "#{player_cards[0].rank}#{player_cards[0].suit}"
puts "#{player_cards[1].rank}#{player_cards[1].suit}"
puts ""
puts "Score: #{player_hand.calculate_hand}"
puts ""

dealer_score = dealer_hand.calculate_hand
  while player_hand.calculate_hand < 21
    print "Type y/n to Hit : "
    user_choice = gets.chomp.downcase

    if user_choice == "y"
      new_hand = deck.deal(1)
      player_cards += new_hand
      player_hand = Hand.new(player_cards)
      puts
      puts "You drew a #{player_cards[2].rank}#{player_cards[2].suit}"
      puts "Your score: #{player_hand.calculate_hand}"
      puts
    elsif user_choice.downcase == "n"
      break
    else
      puts "Try again"
    end
  end

  if player_hand.calculate_hand < 22 && dealer_score < 17
      new_hand = deck.deal(1)
      dealer_cards += new_hand
      dealer_hand = Hand.new(dealer_cards)
      puts
      puts "Dealer Hits"
      puts
      if dealer_hand.cards.size == 3
        puts "Dealer's Hand:"
        puts " #{dealer_cards[0].rank}#{dealer_cards[0].suit}"
        puts " #{dealer_cards[1].rank}#{dealer_cards[1].suit}"
        puts " #{dealer_cards[2].rank}#{dealer_cards[2].suit}"
        puts
      end
    end

player_score = player_hand.calculate_hand
dealer_score = dealer_hand.calculate_hand

  puts "Results:"
  if player_score > 21
    puts "Player loses -  YOU BUST!"
  elsif player_score > dealer_score
    puts "Player: #{player_score}"
    puts "Dealer: #{dealer_score}"
    puts
    puts "Player Wins!"
  elsif dealer_score > 21
    puts "Dealer BUST - Player Wins"
    puts "YOU WIN!"
  elsif player_score == dealer_score
    puts "DRAW!"
  else dealer_score > player_score
    puts "Player: #{player_score}"
    puts "Dealer: #{dealer_score}"
    puts
    puts "Dealer Wins!"
  end
end

Blackjack