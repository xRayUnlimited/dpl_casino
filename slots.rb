class Slots
  def initialize
    puts "Welcome to my slot machine"
    place_bet
  end

  def place_bet
    puts "Type in the amount you would like to bet."
    bet = gets.to_i
    run_slots
  end

def run_slots
  puts "==============="
  puts "Match all 3 to win"
  option1 = rand(1..9)
  option2 = rand(1..9)
  option3 = rand(1..9)
  puts option1
  puts option2
  puts option3

  if option1 == option2 && option2 == option3
    puts "You Win"
  else
    puts "You lose"
  end
end




end

Slots.new


#elseif match 2 you win half the bet
#keep it playing
#exit
