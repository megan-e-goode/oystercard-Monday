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
    allow(journey).to receive(:in_journey).and_return(false)
    expect(journey).to receive(:end)
    journeylog.end_journey("Kings Cross")
  end

  it 'initializes an empty history' do
    expect(journeylog.history).to eq([])
  end

  it 'can add entry_station to history' do
    journeylog.start_journey("Kings Cross")
    expect(journeylog.history.length).to eq(1)
  end

  it 'can add exit_station to history' do
    allow(journey).to receive(:in_journey).and_return(true)
    journeylog.start_journey("Kings Cross")
    journeylog.end_journey("Kings Cross")

    expect(journeylog.history.length).to eq(1)
  end

  it 'can add the correct stations for a journey' do
    allow(journey).to receive(:in_journey).and_return(true)
    journeylog.start_journey("Kings Cross")
    journeylog.end_journey("Barbican")

    expect(journeylog.history).to include({entry: "Kings Cross", exit: "Barbican"})
  end
end
