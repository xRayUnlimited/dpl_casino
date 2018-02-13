require_relative 'clackjack'
require_relative 'player'
#require_relative 'slots'
#require_relative 'high_low'
#require_relative 'rockpaperscissors'
#require_relative 'wallet'


class Casino
  attr_reader :player

  def initialize
    @player = Player.new
    menu
  end

  def menu
    puts "================"
    puts "Select a game"
    puts "1) Slots"
    puts "2) High Low"
    puts "3) Black Jack"
    puts "4) Rock Paper Scissors"
    puts "5) Exit casino"
    puts "==================="
    enter_game(gets.to_i)
  end

  def enter_game(choice)
    case choice
      when 1
        Slots.new(@player, self)
      when 2
        puts "High Low under construction"
        Highlow.new
      when 3
        puts "Blackjack"
        Blackjack.new
      when 4
        puts "Rock Paper Scissors"
        Rps.new()
      when 5
        puts "Goodbye"
        exit
      else
        puts "Invalid Choice"
        menu
    end
  end
end

Casino.new


