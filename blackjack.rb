require_relative 'player'
require_relative 'card'
require_relative 'deck'
require_relative 'wallet'

class Blackjack
  attr_accessor :player, :deck, :card
  def initialize(player)
    @player = player
    @cards = Deck.new
    @player_hand = []
    @dealer_hand = []
    puts "Let's play Blackjack, #{player.name}!"
    puts "Select 1 to get started."
    menu
  end

  def menu
    puts "======================"
    puts "1) Play blackjack"
    puts "2) Exit"
    puts "======================"
    choice = gets.strip.to_i
    if choice == 1
      place_bet
    end
  end

  def place_bet
    puts "Current wallet: $#{@player.wallet.amount}"
    puts "Place your bet: "
    @bet = gets.strip.to_f
    print `clear`
    puts "Current bet: $#{@bet}"

    @player_card1 = @cards.cards.sample
    @player_card2 = @cards.cards.sample
    @player_hand << @player_card1
    @player_hand << @player_card2

    @dealer_card1 = @cards.cards.sample
    @dealer_card2 = @cards.cards.sample
    @dealer_hand << @dealer_card1
    @dealer_hand << @dealer_card2

    puts "Your hand: "
    puts " "
    @player_hand.each do |card|
      puts "#{card.rank} - #{card.suit}"
    end
    puts " "
    puts "Dealer shows: "
    puts " "
    puts "#{@dealer_card1.rank} - #{@dealer_card1.suit}"
    puts "Hit or stay?"
    puts " "
    puts "1) Hit"
    puts "2) Stay"
    selection = gets.strip.to_i
    case selection
      when 1
        hit
      when 2
        end_hand
      else
        puts "please try again"
        menu
    end
  end

  
  def hit
    print `clear`
    puts "Current bet: $#{@bet}"
    puts "hit"
    @player_card3 = @cards.cards.sample
    @player_hand << @player_card3
    @player_hand.each do |card|
      puts "#{card.rank} - #{card.suit}"
    end
    puts "Dealer has: "
    puts "#{@dealer_card1.rank} - #{@dealer_card1.suit}"
    puts ""
    puts "Hit or stay?"
    puts "1) Hit"
    puts "2) Stay"
    selection = gets.strip.to_i
    case selection
      when 1
        hit
      when 2
        end_hand
      else
        puts "please try again"
        menu
    end
  end

  def end_hand
    @player_total = 0
    @player_hand.each do |card|
      if card.rank == "J" || card.rank == "Q" || card.rank == "K"
        card.rank = 10
      end
      if card.rank == 'A'
        puts "Ace -- 1 or 11?"
        puts "1) 1"
        puts "2) 11"
        selection = gets.strip.to_i
        case selection
          when 1
            card.rank = 1
          when 2
            card.rank = 11
          else
            puts "please try again"
            menu
        end
      end
      @player_total += card.rank.to_i
    end

    puts "Your total score: "
    puts " "
    puts @player_total
    puts " "
    puts "Dealer total: "
    @dealer_total = 0
    @dealer_hand.each do |card|
      puts "#{card.rank} - #{card.suit}"
      if card.rank == "J" || card.rank == "Q" || card.rank == "K"
        card.rank = 10
      end
      if card.rank == "A"
        card.rank = 11
      end
      @dealer_total += card.rank.to_i
    end
    print @dealer_total
    puts ""

    if @player_total == 21
      puts "You win!"
      @player.wallet.amount += @bet*2
      puts "Wallet: $#{@player.wallet.amount}."
    elsif @player_total > 21
      puts "You bust!"
      puts "Loser!"
      @player.wallet.amount -= @bet
    elsif @dealer_total > @player_total
      puts "You lose!"
      @player.wallet.amount -= @bet
      puts "Wallet: $#{@player.wallet.amount}."
    elsif @player_total > @dealer_total
      puts "You win!"
      @player.wallet.amount += @bet*2
      puts "Wallet: $#{@player.wallet.amount}."
    end
    Blackjack.new(player)
  end

end