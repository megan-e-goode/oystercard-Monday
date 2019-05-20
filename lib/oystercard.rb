class Oystercard
  LIMIT = 90
  MINIMUM = 1
  attr_reader :balance, :journey

  def initialize(balance=0)
    @balance = balance
    @journey = false
  end

  def top_up(amount)
    raise "limit is £#{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise "not enough funds" if @balance < MINIMUM
    @journey = true
  end

  def touch_out
    @journey = false
  end
end
