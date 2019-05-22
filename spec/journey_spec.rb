require 'journey'
describe Journey do

  let(:journey) { Journey.new }

  let(:oyster) { double(:oystercard, :top_up => 4)}

  it 'new journeys are all in journey' do
    expect(journey.in_journey).to eq(true)
  end

  it 'can end a journey' do
    expect(journey.end_journey).to eq(false)
  end

  # it 'can start a journey with an entry_station' do
  #   subject.top_up(4)
  #   subject.touch_in("Moorgate")
  #   expect(subject.in_journey?).to be true
  # end

  # it 'can end a journey' do
  #   subject.top_up(20)
  #   subject.touch_in("b")
  #   subject.touch_out("a")
  #   expect(subject.in_journey?).to be false
  # end
  #
  # it 'can tell if we are currently in journey' do
  #   subject.top_up(10)
  #   subject.touch_in("Moorgate")
  #   expect(subject.in_journey?).to eq(true)
  # end

end
