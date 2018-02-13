require_relative 'player'
class Rps
attr_accessor :player, :main

def initialize(player)
  @player = player
  playrps
end

def playrps
  print `clear`
  enough
  print `clear`
  puts "choose your throw"
  puts ""
  puts ""
  puts "Rock"
  puts "Paper"
  puts "Scissors"
  puts ""
  puts "or type 'lobby' to go back"
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
    when throw == "lobby"
      puts  "todo"
  else
    `say "Cheater"`
    playrps
end
end


rocklose = lambda {
  `say "paper beats Rock, you lose"`
  puts "Paper beats Rock"
  puts "You Lose"
  @player.wallet -= @bet
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
  @player.wallet += @bet
  playagain
}

@rockend = [rocklose, rocklose, rocktie, rocktie, rockwin]

paperlose = lambda {
  `say "scissors beats paper, you lose"`
  puts "scissors beats paper"
  puts "You Lose"
  @player.subtract(@bet)
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
  @player.add(@bet)
  playagain
}

@paperend = [paperlose, paperlose, papertie, papertie, paperwin]

  scissorslose = lambda {
    `say "Rock beats Scissors, you lose"`
    puts "Rock beats Scissors"
    puts "You Lose"
    @player.subtract(@bet)
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
    @player.add(@bet)
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
      puts ""
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
