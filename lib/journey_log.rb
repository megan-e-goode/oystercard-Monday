class JourneyLog
  attr_reader :journey, :history
  
  def initialize(journey_class=Journey)
    @journey = journey_class.new
    @history = []
  end

  def start_journey
    @journey.begin
  end

  def end_journey
    @journey.end
  end
end
