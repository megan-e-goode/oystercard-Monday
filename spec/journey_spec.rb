require 'journey'

describe Journey do

  let(:journey) { Journey.new }

  it 'new journeys are all in journey' do
    expect(journey.begin).to eq(true)
  end

  it 'can end a journey' do
    expect(journey.end).to eq(false)
  end

end
