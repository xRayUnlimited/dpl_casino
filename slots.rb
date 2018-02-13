class Slots
  def initialize
    puts "Welcome to my slot machine."
    place_bet
  end

  def place_bet
    puts "Please type in the dollar amount you would like to bet."
    @bet = gets.to_i
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
    #TODO add @bet * 2 to wallet
  elsif option1 == option2
    puts "You Win"
    #TODO add @bet / 2 to wallet
  elsif option2 == option3
    puts "You Win"
    #TODO add @bet / 2 to wallet
  elsif option1 == option3
    puts "You Win"
    #TODO add @bet / 2 to wallet
  else
    puts "You lose"
  end

  #ask to play again or exit
  puts "Do you want to play again y / n"
  answer = gets.strip.downcase
  if awswer == 'y'
    place_bet
  else
    #TODO exit to main Casino
  end
    
end

end

Slots.new
