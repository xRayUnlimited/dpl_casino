require_relative 'player'
class Slots
  attr_accessor :casino, :player

  def initialize (player, casino)
    @player = player
    @casino = casino
    print `clear`
    puts "Welcome to my slot machine."
    place_bet
  end

  def place_bet
    enough
    run_slots
  end

def run_slots
  puts "==========================="
  puts "Match numbers to win"
  option1 = rand(1..9)
  option2 = rand(1..9)
  option3 = rand(1..9)
  puts option1
  puts option2
  puts option3

  if option1 == option2 && option2 == option3
    puts "You Win"
    @player.adding (@bet)
  elsif option1 == option2
    puts "You Win"
    @player.addinghalf (@bet)
  elsif option2 == option3
    puts "You Win"
    @player.addinghalf (@bet)
  elsif option1 == option3
    puts "You Win"
    @player.addinghalf (@bet)
  else
    puts "You lose"
    @player.subtracting (@bet)
  end

  #ask to play again or exit
  puts "Do you want to play again y / n"
  answer = gets.strip.downcase
  if answer == 'y'
print `clear`
    place_bet
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
