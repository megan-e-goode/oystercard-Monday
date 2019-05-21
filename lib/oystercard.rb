class Oystercard
  LIMIT = 90
  MINIMUM = 1
  MINIMUM_FARE = 1.5
  attr_reader :balance, :entry_station

  def initialize(balance=0)
    @balance = balance
    @entry_station = nil
  end

  def top_up(amount)
    raise "limit is £#{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(station)
    raise "not enough funds" if @balance < MINIMUM
    @entry_station  = station
  end

  def touch_out(fare=MINIMUM_FARE)
    deduct(fare)
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
