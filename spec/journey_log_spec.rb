require './lib/journey_log.rb'
require './lib/journey.rb'

describe JourneyLog do
  it 'initializes with a class of Journey' do
    journeylog = JourneyLog.new
    expect(journeylog.journey).to be_an_instance_of(Journey)
  end
end
