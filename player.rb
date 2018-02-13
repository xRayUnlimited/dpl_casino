class Player
<<<<<<< HEAD
  attr_accessor :name, :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

def adding(amount)
  @amount = amount.to_i
  @wallet += @amount
  puts "You have $#{@wallet} in your wallet."
end

def subtracting(amount)
  @amount = amount.to_i
  @wallet -= @amount
  puts "You have $#{@wallet} in your wallet."
end

def total
@wallet
end
=======
    attr_accessor :name, :wallet
  
    def initialize
      puts "Welcome to the Ruby Casino!"
      puts "Enter name:"
      @name = gets.strip
      puts "Enter dollar amount: "
      amount = gets.to_f
      if amount > 0
      @wallet = Wallet.new(amount)
      else
        puts "Invalid Input"
        Player.new
      end
    end
>>>>>>> master

    
  end