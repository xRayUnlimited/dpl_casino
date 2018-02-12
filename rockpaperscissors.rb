# Class Rps
# attr_reader :player, :casino
#
# def initialize(player, casino)
#   @player = player
#   @casino = casino
# end
require 'pry'
def playrps
  print `clear`
  puts "choose your throw"
  puts ""
  puts ""
  puts "Rock"
  puts "Paper"
  puts "Scissors"
  puts ""
  throws
end

def throws

  throw = gets.strip.downcase
  case
    when throw == "rock"
      @rockend.sample.call
    when throw == "paper"
      @paperend.sample.call
    when throw == "scissors"
      @scissorsend.sample.call
  else
    `say "Cheater"`
    playrps
end
end

rocklose = lambda {
  `say "paper beats Rock, you lose"`
  puts "Paper beats Rock"
  puts "You Lose"
  puts ""
  playagain
}


rocktie = lambda {
  `say tie game`
  puts "Rock Ties Rock"
  playagain
}

rockwin = lambda {
  `say "Rock Beats Scissors, You Win!"`
  puts "Rock Beats Scissors"
  puts "You Win!"
  playagain
}

@rockend = [rocklose, rocklose, rocktie, rocktie, rockwin]

paperlose = lambda {
  `say "scissors beats paper, you lose"`
  puts "scissors beats paper"
  puts "You Lose"
  puts ""
  playagain
}


papertie = lambda {
  `say tie game`
  puts "Paper Ties Paper"
  playagain
}

paperwin = lambda {
  `say "Paper Beats Rock, You Win!"`
  puts "Paper Beats Rock"
  puts "You Win!"
  playagain
}

@paperend = [paperlose, paperlose, papertie, papertie, paperwin]

  scissorslose = lambda {
    `say "Rock beats Scissors, you lose"`
    puts "Rock beats Scissors"
    puts "You Lose"
    puts ""
    playagain
  }


  scissorstie = lambda {
    `say tie game`
    puts "Scissors Ties Scissors"
    playagain
  }

  scissorswin = lambda {
    `say "scissors beats paper, You Win!"`
    puts "Scissors beats Paper!"
    puts "You Win!"
    playagain
  }

  @scissorsend = [scissorslose, scissorslose, scissorstie, scissorstie, scissorswin]

def playagain
  puts ""
  puts "want to play again?"
  answer = gets.strip.downcase
  case answer
  when "yes"
    playrps
  when "y"
    playrps
  else

  end
end


playrps
