class Player
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

def addinghalf(amount)
  @amount = amount.to_i
  @wallet += @amount/2
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

end
