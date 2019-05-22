require 'journey'

describe Journey do

  let(:journey) { Journey.new }

  it 'initializes not on a journey' do
    expect(journey.in_journey).to be(false)
  end

  it 'can start a journey' do
    expect(journey.begin).to eq(true)
  end

  it 'can end a journey' do
    expect(journey.end).to eq(false)
  end

end
