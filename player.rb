class Player
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

    
  end