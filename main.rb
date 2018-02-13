require_relative 'player'
require_relative 'slots'
require_relative 'blackjack'
require_relative 'rockpaperscissors'
# require_relative 'high_low'

class Casino
  attr_accessor :rockpaperscissors, :slots, :player, :blackjack

  def initialize
    print `clear`
    puts "Welcome to the Lucky Games Casino"
    puts ''
    puts "What's your name?"
    @client = gets.strip
    puts ""
    puts "Okay, #{@client}. What's your budget tonight?"
    purse = gets.to_i
    puts ""
    @player = Player.new(@client, purse)
    menu
  end

  def menu
    print `clear`
    puts "===LUCKY GAMES CASINO==="
    puts "Select a game, your remaining money is $#{@player.total}"
    puts "1) Slots"
    puts "2) Blackjack"
    puts "3) Rock Paper Scissors"
    puts "4) Leave Casino"
    puts "========================"
    enter_game(gets.to_i)
  end


  def enter_game(choice)
    case choice
      when 1
        Slots.new(@player, self)
      when 2
        Blackjack.new(@player, self)
      when 3
        Rockpaperscissors.new(@player, self)
      when 4
        puts "Take you $#{@player.wallet} and leave."
        exit
      else
        puts "Invalid Choice"
        menu
    end
  end
end

def returnmenu
  puts "1) Return to menu"
  puts "2) Quit"
  answers = gets.to_1
  case answers
  when 1
    menu
  else
    quit
  end
end

Casino.new
