class Journey
attr_reader :in_journey

  def initialize
    @in_journey = true
  end

  def end_journey
    @in_journey = false
  end


end
