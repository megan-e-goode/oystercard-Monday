class Oystercard
  LIMIT = 90
  attr_reader :balance

  def initialize(balance=0)
    @balance = balance
  end

  def top_up(amount)
    raise "limit is £#{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
end
