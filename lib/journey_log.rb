class JourneyLog
  attr_reader :journey, :history, :current

  def initialize(journey_class=Journey)
    @journey = journey_class.new
    @current = { entry: nil, exit: nil }
    @history = []
  end

  def start_journey(station)
    @journey.begin
    @current[:entry] = station
    @history << @current
  end

  def end_journey(station)
    current_journey unless @journey.in_journey
    @current[:exit] = station
    @history.pop
    @history << @current
    @journey.end
  end

  def journeys
    @history
  end

  def nil?
    @current.has_value? nil
  end

  private
  def current_journey
    @current = { entry: nil, exit: nil } unless @journey.in_journey
    @current
  end

end
