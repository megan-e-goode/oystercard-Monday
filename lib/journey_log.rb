class JourneyLog
  attr_reader :journey, :history

  def initialize(journey_class=Journey)
    @journey = journey_class.new
    @history = []
  end

  def start_journey(station)
    @journey.begin
    @history << { tap_in_station: station, tap_out_station: nil }
  end

  def end_journey
    @journey.end
  end
end
