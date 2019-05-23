require './lib/journey_log.rb'
require './lib/journey.rb'

describe JourneyLog do
let(:journeylog) { JourneyLog.new(journey_double_class) }
let(:journey_double_class) { double(:journey, :new => journey) }
let(:journey) { double(:journey, :begin => true) }

  it 'initializes with a class of Journey' do
    expect(journeylog.journey).to eq(journey)
  end

  it 'can tell journey to begin' do
    expect(journey).to receive(:begin)
    journeylog.start_journey
  end
end
