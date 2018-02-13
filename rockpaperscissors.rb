require_relative 'player'

class Rockpaperscissors
attr_accessor :casino, :player

def initialize (player, casino)
  @player = player
  @casino = casino
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


rocklose = lambda {
  # `say "paper beats Rock, you lose"`
  puts "Paper beats Rock"
  puts "You Lose"
  @player.subtracting (@bet)
  puts ""
  playagain
}


rocktie = lambda {
  # `say tie game`
  puts "Rock Ties Rock"
  playagain
}

rockwin = lambda {
  # `say "Rock Beats Scissors, You Win!"`
  puts "Rock Beats Scissors"
  puts "You Win!"
  @player.adding (@bet)
  playagain
}

rockend = [rocklose, rocklose, rocktie, rocktie, rockwin]

paperlose = lambda {
  # `say "scissors beats paper, you lose"`
  puts "scissors beats paper"
  puts "You Lose"
  @player.subtracting (@bet)
  puts ""
  playagain
}


papertie = lambda {
  # `say tie game`
  puts "Paper Ties Paper"
  playagain
}

paperwin = lambda {
  # `say "Paper Beats Rock, You Win!"`
  puts "Paper Beats Rock"
  puts "You Win!"
  @player.adding (@bet)
  playagain
}

paperend = [paperlose, paperlose, papertie, papertie, paperwin]

  scissorslose = lambda {
    # `say "Rock beats Scissors, you lose"`
    puts "Rock beats Scissors"
    puts "You Lose"
    @player.subtracting (@bet)
    puts ""
    playagain
  }


  scissorstie = lambda {
    # `say tie game`
    puts "Scissors Ties Scissors"
    playagain
  }

  scissorswin = lambda {
    # `say "scissors beats paper, You Win!"`
    puts "Scissors beats Paper!"
    puts "You Win!"
    @player.adding (@bet)
    playagain
  }

  scissorsend = [scissorslose, scissorslose, scissorstie, scissorstie, scissorswin]

  throw = gets.strip.downcase
  case
    when throw == "rock"
      rockend.sample.call
    when throw == "paper"
      paperend.sample.call
    when throw == "scissors"
      scissorsend.sample.call
    when throw == "lobby"
      @casino.menu
  else
    `say "Cheater"`
    playrps

end
end

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
