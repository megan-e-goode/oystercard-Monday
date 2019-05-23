require './lib/journey_log.rb'

class Oystercard
  LIMIT = 90
  MINIMUM = 1
  MINIMUM_FARE = 1.5
  PENALTY_FARE = 6
  attr_reader :balance, :history, :journey

  def initialize(journeylog=JourneyLog.new, balance=0)
    @balance = balance
    @journeylog = journeylog
  end

  def top_up(amount)
    raise "limit is £#{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(station)
    raise "not enough funds" if @balance < MINIMUM
    @journeylog.start_journey(station)
  end

  def touch_out(station)
    @journeylog.end_journey(station)
  end

  def fare
    @journeylog.nil? ? deduct(PENALTY_FARE) : deduct(MINIMUM_FARE)
    # This is not returning properly! (Maybe :( )
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
