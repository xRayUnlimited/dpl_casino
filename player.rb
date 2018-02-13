class Player
  attr_accessor :name, :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

def self.add(amount)
  @wallet += amount
  puts "You have $#{@wallet} in your wallet."
end

def self.subtract(amount)
  @awallet -= amount
  puts "You have $#{@wallet} in your wallet."
end

end
