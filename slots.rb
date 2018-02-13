require_relative 'player'
class Slots
  attr_accessor :casino, :player

  def initialize (player, casino)
    @player = player
    @casino = casino
    print `clear`
    puts "Welcome to my slot machine."
    puts ""
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
    puts ""
    puts "You Win BIG"
    @player.adding (@bet*2)
  elsif option1 == option2
    puts ''
    puts "You win your money back"
    puts "You still have #{@player.wallet} remaining"
  elsif option2 == option3
    puts ''
    puts "You win your money back"
    puts "You still have #{@player.wallet} remaining"
  elsif option1 == option3
    puts ''
    puts "You win your money back"
    puts "You still have #{@player.wallet} remaining"
  else
    puts ""
    puts "You lose"
    @player.subtracting (@bet)
  end

  #ask to play again or exit
  puts ""
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
    if @bet < @player.wallet && @bet > 0
    puts ""
     else
       puts ""
       puts "Try again"
       puts ''
       puts "You have $#{@player.wallet}"
       enough
    end
      puts""
  end


end
