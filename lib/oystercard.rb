class Oystercard
  LIMIT = 90
  MINIMUM = 1
  MINIMUM_FARE = 1.5
  attr_reader :balance, :journey, :entry_station

  def initialize(balance=0)
    @balance = balance
    @journey = false
    @entry_station = []
  end

  def top_up(amount)
    raise "limit is £#{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(station)
    raise "not enough funds" if @balance < MINIMUM
    @journey = true
    @entry_station << station
  end

  def touch_out(fare=MINIMUM_FARE)
    @journey = false
    deduct(fare)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
