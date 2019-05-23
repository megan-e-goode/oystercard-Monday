require './lib/journey_log.rb'
require './lib/journey.rb'

describe JourneyLog do
let(:journeylog) { JourneyLog.new(journey_double_class) }
let(:journey_double_class) { double(:journey, :new => journey) }
let(:journey) { double(:journey, :begin => true, :end => false) }

  it 'initializes with a class of Journey' do
    expect(journeylog.journey).to eq(journey)
  end

  it 'can tell journey to begin' do
    expect(journey).to receive(:begin)
    journeylog.start_journey("Kings Cross")
  end

  it 'can tell journey to end' do
    expect(journey).to receive(:end)
    journeylog.end_journey
  end

  it 'initializes an empty history' do
    expect(journeylog.history).to eq([])
  end

  it 'can add entry_station to history' do
    journeylog.start_journey("Kings Cross")
    expect(journeylog.history.length).to eq(1)
  end
end
