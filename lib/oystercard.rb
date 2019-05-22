require './lib/journey.rb'

class Oystercard
  LIMIT = 90
  MINIMUM = 1
  MINIMUM_FARE = 1.5
  PENALTY_FARE = 6
  attr_reader :balance, :history, :journey

  def initialize(balance=0, journey=Journey.new)
    @balance = balance
    @history = []
    @journey = journey
  end

  def top_up(amount)
    raise "limit is £#{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(station)
    raise "not enough funds" if @balance < MINIMUM
    @history << { tap_in_station: station, tap_out_station: nil }
    @journey.begin
  end

  def touch_out(station)
    @history.last[:tap_out_station] = station
    @journey.end
  end

  def fare
    @history.last[:tap_in_station] == nil || @history.last[:tap_out_station] == nil ? deduct(PENALTY_FARE) : deduct(MINIMUM_FARE)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
