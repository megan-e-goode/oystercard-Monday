require 'journey'

class Oystercard
  LIMIT = 90
  MINIMUM = 1
  MINIMUM_FARE = 1.5
  attr_reader :balance, :entry_station, :history, :journey

  def initialize(balance=0)
    @balance = balance
    @entry_station = nil
    @history = []
  end

  def top_up(amount)
    raise "limit is £#{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(station, journey=Journey.new)
    raise "not enough funds" if @balance < MINIMUM
    @entry_station  = station
    @journey = journey
    @history << { tap_in_station: station, tap_out_station: nil }
  end

  def touch_out(fare=MINIMUM_FARE, station)
    deduct(fare)
    @entry_station = nil
    @history.last[:tap_out_station] = station
  end

  # def in_journey?
  #   @entry_station != nil
  # end

  private

  def deduct(amount)
    @balance -= amount
  end

end
