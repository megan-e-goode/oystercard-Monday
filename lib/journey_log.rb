class JourneyLog
  attr_reader :journey, :history

  def initialize(journey_class=Journey)
    @journey = journey_class.new
    @history = []
  end

  def start_journey(station)
    @journey.begin
    @history << { entry: station, exit: nil }
  end

  def end_journey(station)
    @history << { entry: nil, exit: nil } unless @journey.in_journey
    @history.last[:exit] = station
    @journey.end
  end
end
