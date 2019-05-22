require './lib/journey.rb'

class Oystercard
  LIMIT = 90
  MINIMUM = 1
  MINIMUM_FARE = 1.5
  PENALTY_FARE = 6
  attr_reader :balance, :history, :journey

  def initialize(balance=0)
    @balance = balance
    @history = []
  end

  def top_up(amount)
    raise "limit is £#{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(station, journey=Journey.new)
    raise "not enough funds" if @balance < MINIMUM
    @journey = journey
    @history << { tap_in_station: station, tap_out_station: nil }
  end

  def touch_out(station)
    @history.last[:tap_out_station] = station
    @journey.end_journey
  end

  def fare
    @history.last[:tap_in_station] == nil || @history.last[:tap_out_station] == nil ? deduct(PENALTY_FARE) : deduct(MINIMUM_FARE)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
